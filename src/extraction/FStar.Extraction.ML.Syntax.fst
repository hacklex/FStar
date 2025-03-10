(*
   Copyright 2008-2016 Abhishek Anand, Nikhil Swamy,
                           Antoine Delignat-Lavaud, Pierre-Yves Strub
                               and Microsoft Research

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
(* -------------------------------------------------------------------- *)
module FStar.Extraction.ML.Syntax
open FStar.Compiler.Effect
open FStar.Compiler.List
open FStar
open FStar.Compiler
open FStar.Ident
open FStar.Compiler.Util
open FStar.Const
open FStar.BaseTypes

(* -------------------------------------------------------------------- *)
type mlsymbol = string
type mlident  = mlsymbol
type mlpath   = list mlsymbol * mlsymbol //Path and name of a module

(* -------------------------------------------------------------------- *)
let krml_keywords = []

let ocamlkeywords = [
  "and"; "as"; "assert"; "asr"; "begin"; "class";
  "constraint"; "do"; "done"; "downto"; "else"; "end";
  "exception"; "external"; "false"; "for"; "fun"; "function";
  "functor"; "if"; "in"; "include"; "inherit"; "initializer";
  "land"; "lazy"; "let"; "lor"; "lsl"; "lsr";
  "lxor"; "match"; "method"; "mod"; "module"; "mutable";
  "new"; "object"; "of"; "open"; "or"; "private";
  "rec"; "sig"; "struct"; "then"; "to"; "true";
  "try"; "type"; "val"; "virtual"; "when"; "while";
  "with"; "nonrec"
]

let fsharpkeywords = [
  "abstract"; "and"; "as"; "assert"; "base"; "begin"; "class";
  "default"; "delegate"; "do"; "done"; "downcast"; "downto";
  "elif"; "else"; "end"; "exception"; "extern"; "false";
  "finally"; "fixed"; "for"; "fun"; "function"; "global"; "if";
  "in"; "inherit"; "inline"; "interface"; "internal"; "lazy";
  "let"; "let!"; "match"; "member"; "module"; "mutable";
  "namespace"; "new"; "not"; "null"; "of"; "open"; "or";
  "override"; "private"; "public"; "rec"; "return"; "return!";
  "select"; "static"; "struct"; "then"; "to"; "true"; "try";
  "type"; "upcast"; "use"; "use!"; "val"; "void"; "when";
  "while"; "with"; "yield"; "yield!";
  // --mlcompatibility keywords
  "asr"; "land"; "lor";
  "lsl"; "lsr"; "lxor"; "mod"; "sig";
  // reserved keywords
  "atomic"; "break"; "checked"; "component"; "const";
  "constraint"; "constructor"; "continue"; "eager"; "event";
  "external"; "fixed"; "functor"; "include"; "method"; "mixin";
  "object"; "parallel"; "process"; "protected"; "pure";
  "sealed"; "tailcall"; "trait"; "virtual"; "volatile"
]

let string_of_mlpath ((p, s) : mlpath) : mlsymbol =
    String.concat "." (p @ [s])


(* -------------------------------------------------------------------- *)
type mlidents  = list mlident
type mlsymbols = list mlsymbol

(* -------------------------------------------------------------------- *)
type e_tag =
  | E_PURE
  | E_ERASABLE
  | E_IMPURE

// Line number, file name; that's all we can emit in OCaml anyhwow
type mlloc = int * string
let dummy_loc: mlloc = 0, ""

type mlty =
| MLTY_Var   of mlident
| MLTY_Fun   of mlty * e_tag * mlty
| MLTY_Named of list mlty * mlpath
| MLTY_Tuple of list mlty
| MLTY_Top  (* \mathbb{T} type in the thesis, to be used when OCaml is not expressive enough for the source type *)
| MLTY_Erased //a type that extracts to unit

type mltyscheme = mlidents * mlty   //forall a1..an. t  (the list of binders can be empty)

type mlconstant =
| MLC_Unit
| MLC_Bool   of bool
| MLC_Int    of string * option (signedness * width)
| MLC_Float  of float
| MLC_Char   of char
| MLC_String of string
| MLC_Bytes  of array byte

type mlpattern =
| MLP_Wild
| MLP_Const  of mlconstant
| MLP_Var    of mlident
| MLP_CTor   of mlpath * list mlpattern
| MLP_Branch of list mlpattern
(* SUGAR *)
| MLP_Record of list mlsymbol * list (mlsymbol * mlpattern)
| MLP_Tuple  of list mlpattern


(* metadata, suitable for either the C or the OCaml backend *)
type meta =
  | Mutable (* deprecated *)
  | Assumed
  | Private
  | NoExtract
  | CInline
  | Substitute
  | GCType
  | PpxDerivingShow
  | PpxDerivingShowConstant of string
  | PpxDerivingYoJson
  | Comment of string
  | StackInline
  | CPrologue of string
  | CEpilogue of string
  | CConst of string
  | CCConv of string
  | Erased
  | CAbstract
  | CIfDef
  | CMacro
  | Deprecated of string
  | RemoveUnusedTypeParameters of list int * FStar.Compiler.Range.range //positional
  | HasValDecl of FStar.Compiler.Range.range //this symbol appears in the interface of a module

// rename
type metadata = list meta

type mlletflavor =
  | Rec
  | NonRec

type mlexpr' =
| MLE_Const  of mlconstant
| MLE_Var    of mlident
| MLE_Name   of mlpath
| MLE_Let    of mlletbinding * mlexpr //tyscheme for polymorphic recursion
| MLE_App    of mlexpr * list mlexpr //why are function types curried, but the applications not curried
| MLE_TApp   of mlexpr * list mlty
| MLE_Fun    of list (mlident * mlty) * mlexpr
| MLE_Match  of mlexpr * list mlbranch
| MLE_Coerce of mlexpr * mlty * mlty
(* SUGAR *)
| MLE_CTor   of mlpath * list mlexpr
| MLE_Seq    of list mlexpr
| MLE_Tuple  of list mlexpr
| MLE_Record of list mlsymbol * list (mlsymbol * mlexpr)
| MLE_Proj   of mlexpr * mlpath
| MLE_If     of mlexpr * mlexpr * option mlexpr
| MLE_Raise  of mlpath * list mlexpr
| MLE_Try    of mlexpr * list mlbranch

and mlexpr = {
    expr:mlexpr';
    mlty:mlty;
    loc: mlloc;
}

and mlbranch = mlpattern * option mlexpr * mlexpr

and mllb = {
    mllb_name:mlident;
    mllb_tysc:option mltyscheme; // May be None for top-level bindings only
    mllb_add_unit:bool;
    mllb_def:mlexpr;
    mllb_meta:metadata;
    print_typ:bool;
}

and mlletbinding = mlletflavor * list mllb

type mltybody =
| MLTD_Abbrev of mlty
| MLTD_Record of list (mlsymbol * mlty)
| MLTD_DType  of list (mlsymbol * list (mlsymbol * mlty))
    (*list of constructors? list mlty is the list of arguments of the constructors?
        One could have instead used a mlty and tupled the argument types?
     *)


type one_mltydecl = {
  tydecl_assumed : bool; // bool: this was assumed (C backend)
  tydecl_name    : mlsymbol;
  tydecl_ignored : option mlsymbol;
  tydecl_parameters : mlidents;
  tydecl_meta    : metadata;
  tydecl_defn    : option mltybody
}

type mltydecl = list one_mltydecl // each element of this list is one among a collection of mutually defined types

type mlmodule1 =
| MLM_Ty  of mltydecl
| MLM_Let of mlletbinding
| MLM_Exn of mlsymbol * list (mlsymbol * mlty)
| MLM_Top of mlexpr // this seems outdated
| MLM_Loc of mlloc // Location information; line number + file; only for the OCaml backend

type mlmodule = list mlmodule1

type mlsig1 =
| MLS_Mod of mlsymbol * mlsig
| MLS_Ty  of mltydecl
    (*used for both type schemes and inductive types. Even inductives are defined in OCaml using type ....,
        unlike data in Haskell *)
| MLS_Val of mlsymbol * mltyscheme
| MLS_Exn of mlsymbol * list mlty

and mlsig = list mlsig1

let with_ty_loc t e l = {expr=e; mlty=t; loc = l }
let with_ty t e = with_ty_loc t e dummy_loc

(* -------------------------------------------------------------------- *)
type mllib =
  | MLLib of list (mlpath * option (mlsig * mlmodule) * mllib) //Last field never seems to be used. Refactor?

(* -------------------------------------------------------------------- *)
// do NOT remove Prims, because all mentions of unit/bool in F* are actually Prims.unit/bool.
let ml_unit_ty = MLTY_Erased
let ml_bool_ty = MLTY_Named ([], (["Prims"], "bool"))
let ml_int_ty  = MLTY_Named ([], (["Prims"], "int"))
let ml_string_ty  = MLTY_Named ([], (["Prims"], "string"))
let ml_unit    = with_ty ml_unit_ty (MLE_Const MLC_Unit)
let mlp_lalloc = (["SST"], "lalloc")
let apply_obj_repr :  mlexpr -> mlty -> mlexpr = fun x t ->
    let repr_name = if Options.codegen() = Some Options.FSharp
                    then MLE_Name([], "box")
                    else MLE_Name(["Obj"], "repr") in
    let obj_repr = with_ty (MLTY_Fun(t, E_PURE, MLTY_Top)) repr_name in
    with_ty_loc MLTY_Top (MLE_App(obj_repr, [x])) x.loc

open FStar.Syntax.Syntax

let push_unit (ts : mltyscheme) : mltyscheme =
    let vs, ty = ts in
    vs, MLTY_Fun(ml_unit_ty, E_PURE, ty)

let pop_unit (ts : mltyscheme) : mltyscheme =
    let vs, ty = ts in
    match ty with
    | MLTY_Fun (l, E_PURE, t) ->
        if l = ml_unit_ty
        then vs, t
        else failwith "unexpected: pop_unit: domain was not unit"
    | _ ->
        failwith "unexpected: pop_unit: not a function type"
