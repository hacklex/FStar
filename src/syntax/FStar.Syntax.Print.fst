(*
   Copyright 2008-2014 Nikhil Swamy and Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)

module FStar.Syntax.Print
open FStar.Pervasives
open FStar.Compiler.Effect

open FStar
open FStar.Compiler
open FStar.Syntax
open FStar.Compiler.Util
open FStar.Syntax.Syntax
open FStar.Syntax.Subst
open FStar.Ident
open FStar.Const

module Errors     = FStar.Errors
module U          = FStar.Compiler.Util
module A          = FStar.Parser.AST
module Resugar    = FStar.Syntax.Resugar
module ToDocument = FStar.Parser.ToDocument
module Pp         = FStar.Pprint
module Unionfind  = FStar.Syntax.Unionfind
module C          = FStar.Parser.Const
module SU         = FStar.Syntax.Util

let rec delta_depth_to_string = function
    | Delta_constant_at_level i   -> "Delta_constant_at_level " ^ string_of_int i
    | Delta_equational_at_level i -> "Delta_equational_at_level " ^ string_of_int i
    | Delta_abstract d -> "Delta_abstract (" ^ delta_depth_to_string d ^ ")"

let sli (l:lident) : string =
    if Options.print_real_names()
    then string_of_lid l
    else string_of_id (ident_of_lid l)
//    Util.format3 "%s@{def=%s;use=%s}" s
//        (Range.string_of_range (Ident.range_of_lid l))
//        (Range.string_of_use_range (Ident.range_of_lid l))

let lid_to_string (l:lid) = sli l

// let fv_to_string fv = Printf.sprintf "%s@%A" (lid_to_string fv.fv_name.v) fv.fv_delta
let fv_to_string fv = lid_to_string fv.fv_name.v //^ "(@@" ^ delta_depth_to_string fv.fv_delta ^ ")"
let bv_to_string bv = (string_of_id bv.ppname) ^ "#" ^ (string_of_int bv.index)

let nm_to_string bv =
    if Options.print_real_names()
    then bv_to_string bv
    else (string_of_id bv.ppname)

let db_to_string bv = (string_of_id bv.ppname) ^ "@" ^ string_of_int bv.index

(* CH: This should later be shared with ocaml-codegen.fs and util.fs (is_primop and destruct_typ_as_formula) *)
let infix_prim_ops = [
    (C.op_Addition    , "+" );
    (C.op_Subtraction , "-" );
    (C.op_Multiply    , "*" );
    (C.op_Division    , "/" );
    (C.op_Eq          , "=" );
    (C.op_ColonEq     , ":=");
    (C.op_notEq       , "<>");
    (C.op_And         , "&&");
    (C.op_Or          , "||");
    (C.op_LTE         , "<=");
    (C.op_GTE         , ">=");
    (C.op_LT          , "<" );
    (C.op_GT          , ">" );
    (C.op_Modulus     , "mod");
    (C.and_lid     , "/\\");
    (C.or_lid      , "\\/");
    (C.imp_lid     , "==>");
    (C.iff_lid     , "<==>");
    (C.precedes_lid, "<<");
    (C.eq2_lid     , "==");
]

let unary_prim_ops = [
    (C.op_Negation, "not");
    (C.op_Minus, "-");
    (C.not_lid, "~")
]

let is_prim_op ps f = match f.n with
  | Tm_fvar fv -> ps |> U.for_some (fv_eq_lid fv)
  | _ -> false

let get_lid f = match f.n with
  | Tm_fvar fv -> fv.fv_name.v
  | _ -> failwith "get_lid"

let is_infix_prim_op (e:term) = is_prim_op (fst (List.split infix_prim_ops)) e
let is_unary_prim_op (e:term) = is_prim_op (fst (List.split unary_prim_ops)) e

let quants = [
  (C.forall_lid, "forall");
  (C.exists_lid, "exists")
]
type exp = term

let is_b2t (t:typ)   = is_prim_op [C.b2t_lid] t
let is_quant (t:typ) = is_prim_op (fst (List.split quants)) t
let is_ite (t:typ)   = is_prim_op [C.ite_lid] t

let is_inr = function Inl _ -> false | Inr _ -> true
let filter_imp aq =
   (* keep typeclass args *)
   match aq with
   | Some (Meta t) when SU.is_fvar C.tcresolve_lid t -> true
   | Some (Implicit _)
   | Some (Meta _) -> false
   | _ -> true
let filter_imp_args args =
  args |> List.filter (function (_, None) -> true | (_, Some a) -> not a.aqual_implicit)
let filter_imp_binders bs =
  bs |> List.filter (fun b -> b.binder_qual |> filter_imp)

(* CH: F# List.find has a different type from find in list.fst ... so just a hack for now *)
let rec find  (f:'a -> bool) (l:list 'a) : 'a = match l with
  | [] -> failwith "blah"
  | hd::tl -> if f hd then hd else find f tl

let find_lid (x:lident) xs : string =
  snd (find (fun p -> lid_equals x (fst p)) xs)

let infix_prim_op_to_string e = find_lid (get_lid e)      infix_prim_ops
let unary_prim_op_to_string e = find_lid (get_lid e)      unary_prim_ops
let quant_to_string t = find_lid (get_lid t) quants

let const_to_string x = C.const_to_string x

let lbname_to_string = function
  | Inl l -> bv_to_string l
  | Inr l -> lid_to_string l.fv_name.v

let uvar_to_string u = if (Options.hide_uvar_nums()) then "?" else "?" ^ (Unionfind.uvar_id u |> string_of_int)
let version_to_string v = U.format2 "%s.%s" (U.string_of_int v.major) (U.string_of_int v.minor)
let univ_uvar_to_string u =
    if (Options.hide_uvar_nums())
    then "?"
    else "?" ^ (Unionfind.univ_uvar_id u |> string_of_int)
            ^ ":" ^ (u |> (fun (_, u, _) -> version_to_string u))

let rec int_of_univ n u = match Subst.compress_univ u with
    | U_zero -> n, None
    | U_succ u -> int_of_univ (n+1) u
    | _ -> n, Some u

let rec univ_to_string u =
Errors.with_ctx "While printing universe" (fun () ->
  // VD: commented out for testing NBE
  // if not (Options.ugly()) then
  //   let e = Resugar.resugar_universe u Range.dummyRange in
  //   let d = ToDocument.term_to_document e in
  //   Pp.pretty_string (float_of_string "1.0") 100 d
  // else
  match Subst.compress_univ u with
    | U_unif u -> "U_unif "^univ_uvar_to_string u
    | U_name x -> "U_name "^(string_of_id x)
    | U_bvar x -> "@"^string_of_int x
    | U_zero   -> "0"
    | U_succ u ->
        begin match int_of_univ 1 u with
            | n, None -> string_of_int n
            | n, Some u -> U.format2 "(%s + %s)" (univ_to_string u) (string_of_int n)
        end
    | U_max us -> U.format1 "(max %s)" (List.map univ_to_string us |> String.concat ", ")
    | U_unknown -> "unknown"
)

let univs_to_string us = List.map univ_to_string us |> String.concat ", "

let univ_names_to_string us = List.map (fun x -> (string_of_id x)) us |> String.concat ", "

let qual_to_string = function
  | Assumption            -> "assume"
  | New                   -> "new"
  | Private               -> "private"
  | Unfold_for_unification_and_vcgen  -> "unfold"
  | Inline_for_extraction -> "inline_for_extraction"
  | NoExtract             -> "noextract"
  | Visible_default       -> "visible"
  | Irreducible           -> "irreducible"
  | Noeq                  -> "noeq"
  | Unopteq               -> "unopteq"
  | Logic                 -> "logic"
  | TotalEffect           -> "total"
  | Discriminator l       -> U.format1 "(Discriminator %s)" (lid_to_string l)
  | Projector (l, x)      -> U.format2 "(Projector %s %s)" (lid_to_string l) (string_of_id x)
  | RecordType (ns, fns)  -> U.format2 "(RecordType %s %s)" (text_of_path (path_of_ns ns)) (fns |> List.map string_of_id |> String.concat ", ")
  | RecordConstructor (ns, fns) -> U.format2 "(RecordConstructor %s %s)" (text_of_path (path_of_ns ns))  (fns |> List.map string_of_id |> String.concat ", ")
  | Action eff_lid        -> U.format1 "(Action %s)" (lid_to_string eff_lid)
  | ExceptionConstructor  -> "ExceptionConstructor"
  | HasMaskedEffect       -> "HasMaskedEffect"
  | Effect                -> "Effect"
  | Reifiable             -> "reify"
  | Reflectable l         -> U.format1 "(reflect %s)" (string_of_lid l)
  | OnlyName              -> "OnlyName"

let quals_to_string quals =
    match quals with
    | [] -> ""
    | _ -> quals |> List.map qual_to_string |> String.concat " "

let quals_to_string' quals =
    match quals with
    | [] -> ""
    | _ -> quals_to_string quals ^ " "


let paren s = "(" ^ s ^ ")"

(* This function prints the type it gets as argument verbatim.
   For already type-checked types use the typ_norm_to_string
   function in normalize.fs instead, since elaboration
   (higher-order unification) produces types containing lots of
   redexes that should first be reduced. *)
let rec tag_of_term (t:term) = match t.n with
  | Tm_bvar x -> "Tm_bvar: "   ^ db_to_string x
  | Tm_name x -> "Tm_name: " ^ nm_to_string x
  | Tm_fvar x -> "Tm_fvar: "   ^ lid_to_string x.fv_name.v
  | Tm_uinst _ -> "Tm_uinst"
  | Tm_constant _ -> "Tm_constant"
  | Tm_type _ -> "Tm_type"
  | Tm_quoted (_, {qkind=Quote_static}) -> "Tm_quoted (static)"
  | Tm_quoted (_, {qkind=Quote_dynamic}) -> "Tm_quoted (dynamic)"
  | Tm_abs _ -> "Tm_abs"
  | Tm_arrow _ -> "Tm_arrow"
  | Tm_refine _ -> "Tm_refine"
  | Tm_app _ -> "Tm_app"
  | Tm_match _ -> "Tm_match"
  | Tm_ascribed _ -> "Tm_ascribed"
  | Tm_let _ -> "Tm_let"
  | Tm_uvar _ -> "Tm_uvar"
  | Tm_delayed _ -> "Tm_delayed"
  | Tm_meta (_, m) -> "Tm_meta:" ^ metadata_to_string m
  | Tm_unknown -> "Tm_unknown"
  | Tm_lazy _ -> "Tm_lazy"

and term_to_string x =
  if not (Options.ugly()) then
    let e = Errors.with_ctx "While resugaring a term" (fun () -> Resugar.resugar_term x) in
    let d = ToDocument.term_to_document e in
    Pp.pretty_string (float_of_string "1.0") 100 d
  else begin
    Errors.with_ctx "While ugly-printing a term" (fun () ->
      let x = Subst.compress x in
      let x = if Options.print_implicits() then x else SU.unmeta x in
      match x.n with
      | Tm_delayed _ ->   failwith "impossible"
      | Tm_app(_, []) ->  failwith "Empty args!"

      // TODO: add an option to mark where this happens
      | Tm_lazy ({blob=b; lkind=Lazy_embedding (_, thunk)}) ->
        "[LAZYEMB:" ^
        term_to_string (Thunk.force thunk) ^ "]"
      | Tm_lazy i ->
        "[lazy:" ^
        term_to_string (must !lazy_chooser i.lkind i) // can't call into Syntax.Util here..
        ^"]"

      | Tm_quoted (tm, qi) ->
        begin match qi.qkind with
        | Quote_static ->
            let print_aq (bv, t) =
              U.format2 "%s -> %s" (bv_to_string bv) (term_to_string t)
            in
            U.format2 "`(%s)%s" (term_to_string tm)
                                (FStar.Common.string_of_list print_aq qi.antiquotes)
        | Quote_dynamic ->
            U.format1 "quote (%s)" (term_to_string tm)
        end

      | Tm_meta(t, Meta_pattern (_, ps)) ->
        let pats = ps |> List.map (fun args -> args |> List.map (fun (t, _) -> term_to_string t) |> String.concat "; ") |> String.concat "\/" in
        U.format2 "{:pattern %s} %s" pats (term_to_string t)

      | Tm_meta(t, Meta_monadic (m, t')) -> U.format4 ("(MetaMonadic-{%s %s} (%s) %s)") (sli m) (term_to_string t') (tag_of_term t) (term_to_string t)

      | Tm_meta(t, Meta_monadic_lift(m0, m1, t')) -> U.format4 ("(MetaMonadicLift-{%s : %s -> %s} %s)") (term_to_string t') (sli m0) (sli m1) (term_to_string t)

      | Tm_meta(t, Meta_labeled(l,r,b)) ->
        U.format3 "Meta_labeled(%s, %s){%s}" l (Range.string_of_range r) (term_to_string t)

      | Tm_meta(t, Meta_named(l)) ->
        U.format3 "Meta_named(%s, %s){%s}" (lid_to_string l) (Range.string_of_range t.pos) (term_to_string t)

      | Tm_meta(t, Meta_desugared _) ->
        U.format1 "Meta_desugared{%s}"  (term_to_string t)

      | Tm_bvar x ->        db_to_string x ^ ":(" ^ (tag_of_term x.sort) ^  ")"
      | Tm_name x ->        nm_to_string x // ^ "@@(" ^ term_to_string x.sort ^ ")"
      | Tm_fvar f ->        fv_to_string f
      | Tm_uvar (u, ([], _)) ->
        if Options.print_bound_var_types()
        && Options.print_effect_args()
        then ctx_uvar_to_string_aux true u
        else "?" ^ (string_of_int <| Unionfind.uvar_id u.ctx_uvar_head)
      | Tm_uvar (u, s) ->
        if Options.print_bound_var_types()
        && Options.print_effect_args()
        then U.format2 "(%s @ %s)" (ctx_uvar_to_string_aux true u) (List.map subst_to_string (fst s) |> String.concat "; ")
        else "?" ^ (string_of_int <| Unionfind.uvar_id u.ctx_uvar_head)
      | Tm_constant c ->    const_to_string c
      | Tm_type u ->        if (Options.print_universes()) then U.format1 "Type u#(%s)" (univ_to_string u) else "Type"
      | Tm_arrow(bs, c) ->  U.format2 "(%s -> %s)"  (binders_to_string " -> " bs) (comp_to_string c)
      | Tm_abs(bs, t2, lc) ->
        begin match lc with
            | Some rc when (Options.print_implicits()) ->
              U.format4 "(fun %s -> (%s $$ (residual) %s %s))"
                            (binders_to_string " " bs)
                            (term_to_string t2)
                            (string_of_lid rc.residual_effect)
                            (if Option.isNone rc.residual_typ then "None" else term_to_string (Option.get rc.residual_typ))
            | _ ->
              U.format2 "(fun %s -> %s)" (binders_to_string " " bs) (term_to_string t2)
        end
      | Tm_refine(xt, f) -> U.format3 "(%s:%s{%s})" (bv_to_string xt) (xt.sort |> term_to_string) (f |> formula_to_string)
      | Tm_app(t, args) ->  U.format2 "(%s %s)" (term_to_string t) (args_to_string args)
      | Tm_let(lbs, e) ->   U.format2 "%s\nin\n%s" (lbs_to_string [] lbs) (term_to_string e)
      | Tm_ascribed(e,(annot, topt, b),eff_name) ->
        let annot = match annot with
            | Inl t -> U.format2 "[%s] %s" (map_opt eff_name Ident.string_of_lid |> dflt "default") (term_to_string t)
            | Inr c -> comp_to_string c in
        let topt = match topt with
            | None -> ""
            | Some t -> U.format1 "by %s" (term_to_string t) in
        let s = if b then "ascribed_eq" else "ascribed" in
        U.format4 "(%s <%s: %s %s)" (term_to_string e) s annot topt
      | Tm_match(head, asc_opt, branches, lc) ->
        let lc_str =
          match lc with
          | Some lc when (Options.print_implicits ()) ->
            U.format1 " (residual_comp:%s)"
              (if Option.isNone lc.residual_typ then "None" else term_to_string (Option.get lc.residual_typ))
          | _ -> "" in
        U.format4 "(match %s %swith\n\t| %s%s)"
          (term_to_string head)
          (match asc_opt with
           | None -> ""
           | Some (b, (asc, tacopt, use_eq)) ->
             let s = if use_eq then "returns$" else "returns" in
             U.format4 "as %s %s %s%s "
               (binder_to_string b)
               s
               (match asc with
                | Inl t -> term_to_string t
                | Inr c -> comp_to_string c)
               (match tacopt with
                | None -> ""
                | Some tac -> U.format1 " by %s" (term_to_string tac)))
          (U.concat_l "\n\t|" (branches |> List.map branch_to_string))
          lc_str
      | Tm_uinst(t, us) ->
        if (Options.print_universes())
        then U.format2 "%s<%s>" (term_to_string t) (univs_to_string us)
        else term_to_string t

      | Tm_unknown -> "_"
    )
  end

and branch_to_string (p, wopt, e) : string =
    U.format3 "%s %s -> %s"
                (p |> pat_to_string)
                (match wopt with | None -> "" | Some w -> U.format1 "when %s" (w |> term_to_string))
                (e |> term_to_string)
and ctx_uvar_to_string_aux print_reason ctx_uvar =
    let reason_string =
      if print_reason
      then U.format1 "(* %s *)\n" ctx_uvar.ctx_uvar_reason
      else U.format2 "(%s-%s) "
             (Range.string_of_pos (Range.start_of_range ctx_uvar.ctx_uvar_range))
             (Range.string_of_pos (Range.end_of_range ctx_uvar.ctx_uvar_range)) in
    format5 "%s(%s |- %s : %s) %s"
            reason_string
            (binders_to_string ", " ctx_uvar.ctx_uvar_binders)
            (uvar_to_string ctx_uvar.ctx_uvar_head)
            (term_to_string (SU.ctx_uvar_typ ctx_uvar))
            (match SU.ctx_uvar_should_check ctx_uvar with
             | Allow_unresolved s -> "Allow_unresolved " ^s
             | Allow_untyped s -> "Allow_untyped " ^s
             | Allow_ghost s -> "Allow_ghost " ^s
             | Strict   -> "Strict"
             | Already_checked -> "Already_checked")


and subst_elt_to_string = function
   | DB(i, x) -> U.format2 "DB (%s, %s)" (string_of_int i) (bv_to_string x)
   | NM(x, i) -> U.format2 "NM (%s, %s)" (bv_to_string x) (string_of_int i)
   | NT(x, t) -> U.format2 "NT (%s, %s)" (bv_to_string x) (term_to_string t)
   | UN(i, u) -> U.format2 "UN (%s, %s)" (string_of_int i) (univ_to_string u)
   | UD(u, i) -> U.format2 "UD (%s, %s)" (string_of_id u) (string_of_int i)

and subst_to_string s = s |> List.map subst_elt_to_string |> String.concat "; "

and pat_to_string x =
  if not (Options.ugly()) then
    let e = Resugar.resugar_pat x (new_bv_set ()) in
    let d = ToDocument.pat_to_document e in
    Pp.pretty_string (float_of_string "1.0") 100 d
  else match x.v with
    | Pat_cons(l, us_opt, pats) ->
      U.format3 "(%s%s%s)" 
                (fv_to_string l)
                (if not (Options.print_universes())
                 then " "
                 else 
                   match us_opt with
                   | None -> " "
                   | Some us ->
                     U.format1 " %s " (List.map univ_to_string us |> String.concat " "))
                (List.map (fun (x, b) -> let p = pat_to_string x in if b then "#"^p else p) pats |> String.concat " ")
    | Pat_dot_term topt ->
      if Options.print_bound_var_types()
      then U.format1 ".%s" (if topt = None then "_" else topt |> U.must |> term_to_string)
      else "._"
    | Pat_var x ->
      if Options.print_bound_var_types()
      then U.format2 "%s:%s" (bv_to_string x) (term_to_string x.sort)
      else bv_to_string x
    | Pat_constant c -> const_to_string c
    | Pat_wild x ->
      if Options.print_bound_var_types()
      then U.format2 "_wild_%s:%s" (bv_to_string x) (term_to_string x.sort)
      else bv_to_string x


and lbs_to_string quals lbs =
//    let lbs =
//        if (Options.print_universes())
//        then (fst lbs, snd lbs |> List.map (fun lb -> let us, td = Subst.open_univ_vars lb.lbunivs (Util.mk_conj lb.lbtyp lb.lbdef) in
//                                        let t, d = match (Subst.compress td).n with
//                                            | Tm_app(_, [(t, _); (d, _)]) -> t, d
//                                            | _ -> failwith "Impossibe" in
//                                        {lb with lbunivs=us; lbtyp=t; lbdef=d}))
//        else lbs in
    U.format3 "%slet %s %s"
    (quals_to_string' quals)
    (if fst lbs then "rec" else "")
    (U.concat_l "\n and " (snd lbs |> List.map (fun lb ->
                                                    U.format5 "%s%s %s : %s = %s"
                                                            (attrs_to_string lb.lbattrs)
                                                            (lbname_to_string lb.lbname)
                                                            (if (Options.print_universes())
                                                             then "<"^univ_names_to_string lb.lbunivs^">"
                                                             else "")
                                                            (term_to_string lb.lbtyp)
                                                            (lb.lbdef |> term_to_string))))
and attrs_to_string = function
    | [] -> ""
    | tms -> U.format1 "[@ %s]" (List.map (fun t -> paren (term_to_string t)) tms |> String.concat "; ")

//and uvar_t_to_string (uv, k) =
//   if false && (Options.print_real_names())
//   then
//       U.format2 "(U%s : %s)"
//       (if (Options.hide_uvar_nums()) then "?" else U.string_of_int (Unionfind.uvar_id uv))
//       (kind_to_string k)
//   else U.format1 "U%s"  (if (Options.hide_uvar_nums()) then "?" else U.string_of_int (Unionfind.uvar_id uv))

and bqual_to_string' s = function
  | Some (Implicit false) -> "#" ^ s
  | Some (Implicit true) -> "#." ^ s
  | Some Equality -> "$" ^ s
  | Some (Meta t) when SU.is_fvar C.tcresolve_lid t -> "{|" ^ s ^ "|}"
  | Some (Meta t) -> "#[" ^ term_to_string t ^ "]" ^ s
  | None -> s

and aqual_to_string' s = function
  | Some ({aqual_implicit=true}) -> "#" ^ s
  | _ -> s
  
and binder_to_string' is_arrow b =
  if not (Options.ugly()) then
    match Resugar.resugar_binder b Range.dummyRange with
    | None -> ""
    | Some e ->
      let d = ToDocument.binder_to_document e in
      Pp.pretty_string (float_of_string "1.0") 100 d
  else
    let attrs = attrs_to_string b.binder_attrs in
    if is_null_binder b
    then (attrs ^ "_:" ^ term_to_string b.binder_bv.sort)
    else if not is_arrow && not (Options.print_bound_var_types())
    then bqual_to_string' (attrs ^ nm_to_string b.binder_bv) b.binder_qual
    else bqual_to_string' (attrs ^ nm_to_string b.binder_bv ^ ":" ^ term_to_string b.binder_bv.sort) b.binder_qual

and binder_to_string b =  binder_to_string' false b

and arrow_binder_to_string b = binder_to_string' true b

and binders_to_string sep bs =
    let bs =
      if (Options.print_implicits())
      then bs
      else filter_imp_binders bs in
    if sep = " -> "
    then bs |> List.map arrow_binder_to_string |> String.concat sep
    else bs |> List.map binder_to_string |> String.concat sep

and arg_to_string = function
   | a,  imp -> aqual_to_string' (term_to_string a) imp

and args_to_string args =
    let args =
      if (Options.print_implicits())
      then args
      else filter_imp_args args in
    args |> List.map arg_to_string |> String.concat " "

and comp_to_string c =
  if not (Options.ugly()) then
    let e = Errors.with_ctx "While resugaring a computation" (fun () -> Resugar.resugar_comp c) in
    let d = ToDocument.term_to_document e in
    Pp.pretty_string (float_of_string "1.0") 100 d
  else
    Errors.with_ctx "While ugly-printing a computation" (fun () ->
    match c.n with
    | Total t ->
      begin match (compress t).n with
        | Tm_type _ when not (Options.print_implicits() || Options.print_universes()) -> term_to_string t
        | _ -> U.format1 "Tot %s" (term_to_string t)
      end
    | GTotal t ->
      begin match (compress t).n with
        | Tm_type _ when not (Options.print_implicits() || Options.print_universes()) -> term_to_string t
        | _ -> U.format1 "GTot %s" (term_to_string t)
      end
    | Comp c ->
        let basic =
          if (Options.print_effect_args())
          then U.format5 "%s<%s> (%s) %s (attributes %s)"
                            (sli c.effect_name)
                            (c.comp_univs |> List.map univ_to_string |> String.concat ", ")
                            (term_to_string c.result_typ)
                            (c.effect_args |> List.map arg_to_string |> String.concat ", ")
                            (cflags_to_string c.flags)
          else if c.flags |> U.for_some (function TOTAL -> true | _ -> false)
          && not (Options.print_effect_args())
          then U.format1 "Tot %s" (term_to_string c.result_typ)
          else if not (Options.print_effect_args())
                  && not (Options.print_implicits())
                  && lid_equals c.effect_name (C.effect_ML_lid())
          then term_to_string c.result_typ
          else if not (Options.print_effect_args())
               && c.flags |> U.for_some (function MLEFFECT -> true | _ -> false)
          then U.format1 "ALL %s" (term_to_string c.result_typ)
          else U.format2 "%s (%s)" (sli c.effect_name) (term_to_string c.result_typ) in
      let dec = c.flags
        |> List.collect (function DECREASES dec_order ->
            (match dec_order with
             | Decreases_lex l ->
               [U.format1 " (decreases [%s])"
                  (match l with
                   | [] -> ""
                   | hd::tl ->
                     tl |> List.fold_left (fun s t ->
                       s ^ ";" ^ term_to_string t) (term_to_string hd))]
             | Decreases_wf (rel, e) ->
               [U.format2 "(decreases {:well-founded %s %s})" (term_to_string rel) (term_to_string e)])
             | _ -> [])
            
        |> String.concat " " in
      U.format2 "%s%s" basic dec
    )

and cflag_to_string c =
    match c with
        | TOTAL -> "total"
        | MLEFFECT -> "ml"
        | RETURN -> "return"
        | PARTIAL_RETURN -> "partial_return"
        | SOMETRIVIAL -> "sometrivial"
        | TRIVIAL_POSTCONDITION -> "trivial_postcondition"
        | SHOULD_NOT_INLINE -> "should_not_inline"
        | LEMMA -> "lemma"
        | CPS -> "cps"
        | DECREASES _ -> "" (* TODO : already printed for now *)

and cflags_to_string fs = FStar.Common.string_of_list cflag_to_string fs

(* CH: at this point not even trying to detect if something looks like a formula,
       only locally detecting certain patterns *)
and formula_to_string phi = term_to_string phi

and metadata_to_string = function
    | Meta_pattern (_, ps) ->
        let pats = ps |> List.map (fun args -> args |> List.map (fun (t, _) -> term_to_string t) |> String.concat "; ") |> String.concat "\/" in
        U.format1 "{Meta_pattern %s}" pats

    | Meta_named lid ->
        U.format1 "{Meta_named %s}" (sli lid)

    | Meta_labeled (l, r, _) ->
        U.format2 "{Meta_labeled (%s, %s)}" l (Range.string_of_range r)

    | Meta_desugared msi ->
        "{Meta_desugared}"

    | Meta_monadic (m, t) ->
        U.format2 "{Meta_monadic(%s @ %s)}" (sli m) (term_to_string t)

    | Meta_monadic_lift (m, m', t) ->
        U.format3 "{Meta_monadic_lift(%s -> %s @ %s)}" (sli m) (sli m') (term_to_string t)

let aqual_to_string aq = aqual_to_string' "" aq
let bqual_to_string bq = bqual_to_string' "" bq

let comp_to_string' env c =
  if Options.ugly ()
  then comp_to_string c
  else let e = Resugar.resugar_comp' env c in
       let d = ToDocument.term_to_document e in
       Pp.pretty_string (float_of_string "1.0") 100 d

let term_to_string' env x =
  if Options.ugly ()
  then term_to_string x
  else let e = Resugar.resugar_term' env x in
       let d = ToDocument.term_to_document e in
       Pp.pretty_string (float_of_string "1.0") 100 d

let binder_to_json env b =
    let n = JsonStr (bqual_to_string' (nm_to_string b.binder_bv) b.binder_qual) in
    let t = JsonStr (term_to_string' env b.binder_bv.sort) in
    JsonAssoc [("name", n); ("type", t)]

let binders_to_json env bs =
    JsonList (List.map (binder_to_json env) bs)


//let subst_to_string subst =
//   U.format1 "{%s}" <|
//    (List.map (function
//        | Inl (a, t) -> U.format2 "(%s -> %s)" (strBvd a) (typ_to_string t)
//        | Inr (x, e) -> U.format2 "(%s -> %s)" (strBvd x) (exp_to_string e)) subst |> String.concat ", ")
//let freevars_to_string (fvs:freevars) =
//    let f (l:set (bvar 'a 'b)) = l |> U.set_elements |> List.map (fun t -> strBvd t.v) |> String.concat ", " in
//    U.format2 "ftvs={%s}, fxvs={%s}" (f fvs.ftvs) (f fvs.fxvs)


let enclose_universes s =
    if Options.print_universes ()
    then "<" ^ s ^ ">"
    else ""

let tscheme_to_string s =
  if not (Options.ugly()) then
    let d = Resugar.resugar_tscheme s in
    let d = ToDocument.decl_to_document d in
    Pp.pretty_string (float_of_string "1.0") 100 d
  else
    let (us, t) = s in
    U.format2 "%s%s" (enclose_universes <| univ_names_to_string us) (term_to_string t)

let action_to_string a =
    U.format5 "%s%s %s : %s = %s"
        (sli a.action_name)
        (binders_to_string " " a.action_params)
        (enclose_universes <| univ_names_to_string a.action_univs)
        (term_to_string a.action_typ)
        (term_to_string a.action_defn)

let wp_eff_combinators_to_string combs =
  let tscheme_opt_to_string = function
    | Some ts -> tscheme_to_string ts
    | None -> "None" in

  U.format "{\n\
    ret_wp       = %s\n\
  ; bind_wp      = %s\n\
  ; stronger     = %s\n\
  ; if_then_else = %s\n\
  ; ite_wp       = %s\n\
  ; close_wp     = %s\n\
  ; trivial      = %s\n\
  ; repr         = %s\n\
  ; return_repr  = %s\n\
  ; bind_repr    = %s\n\
  }\n"
    [ tscheme_to_string combs.ret_wp;
      tscheme_to_string combs.bind_wp;
      tscheme_to_string combs.stronger;
      tscheme_to_string combs.if_then_else;
      tscheme_to_string combs.ite_wp;
      tscheme_to_string combs.close_wp;
      tscheme_to_string combs.trivial;
      tscheme_opt_to_string combs.repr;
      tscheme_opt_to_string combs.return_repr;
      tscheme_opt_to_string combs.bind_repr ]

let indexed_effect_binder_kind_to_string = function
  | Type_binder -> "type_binder"
  | Substitutive_binder -> "subst_binder"
  | BindCont_no_abstraction_binder -> "bind_g_no_abs_binder"
  | Range_binder -> "range_binder"
  | Repr_binder -> "repr_binder"
  | Ad_hoc_binder -> "ad_hoc_binder"

let list_to_string f elts =
    match elts with
        | [] -> "[]"
        | x::xs ->
            let strb = U.new_string_builder () in
            U.string_builder_append strb "[" ;
            U.string_builder_append strb (f x) ;
            List.iter (fun x ->
                       U.string_builder_append strb "; " ;
                       U.string_builder_append strb (f x)
                       ) xs ;
            U.string_builder_append strb "]" ;
            U.string_of_string_builder strb

let indexed_effect_combinator_kind_to_string = function
  | Substitutive_combinator l ->
    U.format1 "standard_combinator (%s)"
      (list_to_string indexed_effect_binder_kind_to_string l)
  | Substitutive_invariant_combinator -> "substitutive_invariant"
  | Ad_hoc_combinator -> "ad_hoc_combinator"

let indexed_effect_combinator_kind_opt_to_string k =
  match k with
  | None -> "kind not set"
  | Some k -> indexed_effect_combinator_kind_to_string k

let layered_eff_combinators_to_string combs =
  let to_str (ts_t, ts_ty, kopt) =
    U.format3 "(%s) : (%s)<%s>"
      (tscheme_to_string ts_t) (tscheme_to_string ts_ty)
      (indexed_effect_combinator_kind_opt_to_string kopt) in

  let to_str2 (ts_t, ts_ty) =
    U.format2 "(%s) : (%s)"
      (tscheme_to_string ts_t) (tscheme_to_string ts_ty) in

  U.format "{\n\
  ; l_repr = %s\n\
  ; l_return = %s\n\
  ; l_bind = %s\n\
  ; l_subcomp = %s\n\
  ; l_if_then_else = %s\n
  }\n"
    [ to_str2 combs.l_repr;
      to_str2 combs.l_return;
      to_str  combs.l_bind;
      to_str  combs.l_subcomp;
      to_str  combs.l_if_then_else ]

let eff_combinators_to_string = function
  | Primitive_eff combs
  | DM4F_eff combs -> wp_eff_combinators_to_string combs
  | Layered_eff combs -> layered_eff_combinators_to_string combs

let eff_decl_to_string' for_free r q ed =
 if not (Options.ugly()) then
    let d = Resugar.resugar_eff_decl r q ed in
    let d = ToDocument.decl_to_document d in
    Pp.pretty_string (float_of_string "1.0") 100 d
 else
    let actions_to_string actions =
        actions |>
        List.map action_to_string |>
        String.concat ",\n\t" in
    let eff_name = if SU.is_layered ed then "layered_effect" else "new_effect" in
    U.format "%s%s { \
      %s%s %s : %s \n  \
        %s\n\
      and effect_actions\n\t%s\n}\n"
        [eff_name;
         (if for_free then "_for_free " else "");
         lid_to_string ed.mname;
         enclose_universes <| univ_names_to_string ed.univs;
         binders_to_string " " ed.binders;
         ed.signature |> SU.effect_sig_ts |> tscheme_to_string;
         eff_combinators_to_string ed.combinators;
         actions_to_string ed.actions]

let eff_decl_to_string for_free ed =
  eff_decl_to_string' for_free Range.dummyRange [] ed

let sub_eff_to_string se =
  let tsopt_to_string ts_opt =
    if is_some ts_opt then ts_opt |> must |> tscheme_to_string
    else "<None>" in
  U.format4 "sub_effect %s ~> %s : lift = %s ;; lift_wp = %s"
    (lid_to_string se.source) (lid_to_string se.target)
    (tsopt_to_string se.lift) (tsopt_to_string se.lift_wp)

let pragma_to_string (p:pragma) : string =
  match p with
  | ResetOptions None     -> "#reset-options"
  | ResetOptions (Some s) -> U.format1 "#reset-options \"%s\"" s
  | SetOptions s          -> U.format1 "#set-options \"%s\"" s
  | PushOptions None      -> "#push-options"
  | PushOptions (Some s)  -> U.format1 "#push-options \"%s\"" s
  | RestartSolver         -> "#restart-solver"
  | PrintEffectsGraph     -> "#print-effects-graph"
  | PopOptions            -> "#pop-options"

let rec sigelt_to_string (x: sigelt) =
 // if not (Options.ugly()) then
 //    let e = Resugar.resugar_sigelt x in
 //    begin match e with
 //    | Some d ->
 //      let d = ToDocument.decl_to_document d in
 //      Pp.pretty_string (float_of_string "1.0") 100 d
 //    | _ -> ""
 //    end
 // else
   let basic =
      match x.sigel with
      | Sig_pragma p -> pragma_to_string p
      | Sig_inductive_typ(lid, univs, tps, k, _, _) ->
        let quals_str = quals_to_string' x.sigquals in
        let binders_str = binders_to_string " " tps in
        let term_str = term_to_string k in
        if Options.print_universes () then U.format5 "%stype %s<%s> %s : %s" quals_str (string_of_lid lid) (univ_names_to_string univs) binders_str term_str
        else U.format4 "%stype %s %s : %s" quals_str (string_of_lid lid) binders_str term_str
      | Sig_datacon(lid, univs, t, _, _, _) ->
        if (Options.print_universes())
        then //let univs, t = Subst.open_univ_vars univs t in (* AR: don't open the universes, else it's a bit confusing *)
             U.format3 "datacon<%s> %s : %s" (univ_names_to_string univs) (string_of_lid lid) (term_to_string t)
        else U.format2 "datacon %s : %s" (string_of_lid lid) (term_to_string t)
      | Sig_declare_typ(lid, univs, t) ->
        //let univs, t = Subst.open_univ_vars univs t in
        U.format4 "%sval %s %s : %s" (quals_to_string' x.sigquals) (string_of_lid lid)
            (if (Options.print_universes())
             then U.format1 "<%s>" (univ_names_to_string univs)
             else "")
            (term_to_string t)
      | Sig_assume(lid, us, f) ->
        if Options.print_universes () then U.format3 "assume %s<%s> : %s" (string_of_lid lid) (univ_names_to_string us) (term_to_string f)
        else U.format2 "assume %s : %s" (string_of_lid lid) (term_to_string f)
      | Sig_let(lbs, _) -> lbs_to_string x.sigquals lbs
      | Sig_bundle(ses, _) -> "(* Sig_bundle *)" ^ (List.map sigelt_to_string ses |> String.concat "\n")
      | Sig_fail (errs, lax, ses) ->
        U.format3 "(* Sig_fail %s %s *)\n%s\n(* / Sig_fail*)\n"
            (string_of_bool lax)
            (FStar.Common.string_of_list string_of_int errs)
            (List.map sigelt_to_string ses |> String.concat "\n")

      | Sig_new_effect(ed) -> eff_decl_to_string' (SU.is_dm4f ed) x.sigrng x.sigquals ed
      | Sig_sub_effect (se) -> sub_eff_to_string se
      | Sig_effect_abbrev(l, univs, tps, c, flags) ->
        if (Options.print_universes())
        then let univs, t = Subst.open_univ_vars univs (mk (Tm_arrow(tps, c)) Range.dummyRange) in
             let tps, c = match (Subst.compress t).n with
                | Tm_arrow(bs, c) -> bs, c
                | _ -> failwith "impossible" in
             U.format4 "effect %s<%s> %s = %s" (sli l) (univ_names_to_string univs) (binders_to_string " " tps) (comp_to_string c)
        else U.format3 "effect %s %s = %s" (sli l) (binders_to_string " " tps) (comp_to_string c)
      | Sig_splice (lids, t) ->
        U.format2 "splice[%s] (%s)" (String.concat "; " <| List.map Ident.string_of_lid lids) (term_to_string t)
      | Sig_polymonadic_bind (m, n, p, t, ty, k) ->
        U.format6 "polymonadic_bind (%s, %s) |> %s = (%s, %s)<%s>"
          (Ident.string_of_lid m)
          (Ident.string_of_lid n)
          (Ident.string_of_lid p)
          (tscheme_to_string t)
          (tscheme_to_string ty)
          (indexed_effect_combinator_kind_opt_to_string k)
      | Sig_polymonadic_subcomp (m, n, t, ty, k) ->
        U.format5 "polymonadic_subcomp %s <: %s = (%s, %s)<%s>"
          (Ident.string_of_lid m)
          (Ident.string_of_lid n)
          (tscheme_to_string t)
          (tscheme_to_string ty)
          (indexed_effect_combinator_kind_opt_to_string k)
      in
      match x.sigattrs with
      | [] -> "[@ ]" ^ "\n" ^ basic //It is important to keep this empty attribute marker since the Vale type extractor uses it as a delimiter
      | _ -> attrs_to_string x.sigattrs ^ "\n" ^ basic

(* A "short" version of printing a sigelt. Meant to (usually) be a small string
suitable to embed in an error message. No need to be fully faithful to
printing universes, etc, it should just make it clear enough to which
sigelt it refers to. *)
let rec sigelt_to_string_short (x: sigelt) = match x.sigel with
  | Sig_pragma p ->
    pragma_to_string p

  | Sig_let((false, [{lbname=lb}]), _) ->
    U.format1 "let %s" (lbname_to_string lb)

  | Sig_let((true, [{lbname=lb}]), _) ->
    U.format1 "let rec %s" (lbname_to_string lb)

  | Sig_let((true, ({lbname=lb})::_), _) ->
    U.format1 "let rec %s and ..." (lbname_to_string lb)

  | Sig_let _ ->
    failwith "Impossible: sigelt_to_string_short, ill-formed let"

  | Sig_declare_typ(lid, _, t) ->
    U.format1 "val %s" (string_of_lid lid)

  | Sig_inductive_typ(lid, _, _, _, _, _) ->
    U.format1 "type %s" (string_of_lid lid)

  | Sig_datacon(lid, _, t, _, _, _) ->
    U.format2 "datacon %s : %s" (string_of_lid lid) (term_to_string t)

  | Sig_assume(lid, us, f) ->
    U.format2 "assume %s : %s" (string_of_lid lid) (term_to_string f)

  | Sig_bundle(ses, _) -> List.hd ses |> sigelt_to_string_short

  | Sig_fail (errs, lax, ses) ->
    U.format1 "[@@expect_failure] %s" (ses |> List.hd |> sigelt_to_string_short)

  | Sig_new_effect ed ->
    let kw =
      if SU.is_layered ed then "layered_effect"
      else if SU.is_dm4f ed then "new_effect_for_free"
      else "new_effect"
    in
    U.format2 "%s { %s ... }" kw (lid_to_string ed.mname)

  | Sig_sub_effect se ->
    U.format2 "sub_effect %s ~> %s" (lid_to_string se.source) (lid_to_string se.target)

  | Sig_effect_abbrev (l, univs, tps, c, flags) ->
    U.format3 "effect %s %s = %s" (sli l) (binders_to_string " " tps) (comp_to_string c)

  | Sig_splice (lids, t) ->
    U.format3 "%splice[%s] (%s)"
              "%s" // sigh, no escape for format
              (String.concat "; " <| List.map Ident.string_of_lid lids)
              (term_to_string t)

  | Sig_polymonadic_bind (m, n, p, t, ty, _) ->
    U.format3 "polymonadic_bind (%s, %s) |> %s"
              (Ident.string_of_lid m) (Ident.string_of_lid n) (Ident.string_of_lid p)

  | Sig_polymonadic_subcomp (m, n, t, ty, _) ->
    U.format2 "polymonadic_subcomp %s <: %s" (Ident.string_of_lid m) (Ident.string_of_lid n)

let tag_of_sigelt (se:sigelt) : string =
  match se.sigel with
  | Sig_inductive_typ _    -> "Sig_inductive_typ"
  | Sig_bundle _           -> "Sig_bundle"
  | Sig_datacon _          -> "Sig_datacon"
  | Sig_declare_typ _      -> "Sig_declare_typ"
  | Sig_let _              -> "Sig_let"
  | Sig_assume _           -> "Sig_assume"
  | Sig_new_effect _       -> "Sig_new_effect"
  | Sig_sub_effect _       -> "Sig_sub_effect"
  | Sig_effect_abbrev _    -> "Sig_effect_abbrev"
  | Sig_pragma _           -> "Sig_pragma"
  | Sig_splice _           -> "Sig_splice"
  | Sig_polymonadic_bind _ -> "Sig_polymonadic_bind"
  | Sig_polymonadic_subcomp _ -> "Sig_polymonadic_subcomp"
  | Sig_fail _             -> "Sig_fail"

(*
 * AR: 07/19: exports is redundant, keeping it here until vale is fixed to not parse it
 *)
let modul_to_string (m:modul) =
  U.format3 "module %s\nDeclarations: [\n%s\n]\nExports: [\n%s\n]\n" (sli m.name)
                                                                     (List.map sigelt_to_string m.declarations |> String.concat "\n")
                                                                     (List.map sigelt_to_string m.declarations |> String.concat "\n")


//let abs_ascription_to_string ascription =
//  let strb = U.new_string_builder () in
//  begin match ascription with
//      | None -> U.string_builder_append strb "None"
//      | Some (Inl lc) ->
//          U.string_builder_append strb "Some Inr " ;
//          U.string_builder_append strb (Ident.string_of_lid lc.eff_name)
//      | Some (Inr lid) ->
//          U.string_builder_append strb "Some Inr " ;
//          U.string_builder_append strb (Ident.string_of_lid lid)
//  end ;
//  U.string_of_string_builder strb

let set_to_string f s =
    let elts = U.set_elements s in
    match elts with
        | [] -> "{}"
        | x::xs ->
            let strb = U.new_string_builder () in
            U.string_builder_append strb "{" ;
            U.string_builder_append strb (f x) ;
            List.iter (fun x ->
                       U.string_builder_append strb ", " ;
                       U.string_builder_append strb (f x)
                       ) xs ;
            U.string_builder_append strb "}" ;
            (* U.string_builder_append strb (list_to_string f (raw_list s)) ; *)
            U.string_of_string_builder strb

let bvs_to_string sep bvs = binders_to_string sep (List.map mk_binder bvs)

let ctx_uvar_to_string ctx_uvar = ctx_uvar_to_string_aux true ctx_uvar

let ctx_uvar_to_string_no_reason ctx_uvar = ctx_uvar_to_string_aux false ctx_uvar

let rec emb_typ_to_string = function
    | ET_abstract -> "abstract"
    | ET_app (h, []) -> h
    | ET_app(h, args) -> "(" ^h^ " " ^ (List.map emb_typ_to_string args |> String.concat " ")  ^")"
    | ET_fun(a, b) -> "(" ^ emb_typ_to_string a ^ ") -> " ^ emb_typ_to_string b
