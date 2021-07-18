module IntOrBool

#push-options "--print_universes"

open FStar.PCM
open Steel.C.Opt
open Steel.C.PCM
open Steel.C.Ref
open Steel.C.Connection
open Steel.C.Union
open Steel.Effect

module M = Steel.Memory
module A = Steel.Effect.Atomic
module U = FStar.Universe

let int_or_bool_cases k = match k with
  | I -> option int
  | B -> option bool
  
let int_or_bool_cases_pcm k: pcm (int_or_bool_cases k) = match k with
  | I -> opt_pcm #int
  | B -> opt_pcm #bool
  
let int_or_bool = union #int_or_bool_case #int_or_bool_cases int_or_bool_cases_pcm

let int_or_bool_pcm: pcm int_or_bool = union_pcm int_or_bool_cases_pcm

let mk_int i = Ghost.hide (field_to_union_f int_or_bool_cases_pcm I (Ghost.reveal i))
let mk_bool b = Ghost.hide (field_to_union_f int_or_bool_cases_pcm B (Ghost.reveal b))

let _i = union_field int_or_bool_cases_pcm I
let _b = union_field int_or_bool_cases_pcm B

open FStar.FunctionalExtensionality

let case_of_int_or_bool u =
  let k = case_of_union int_or_bool_cases_pcm u in
  match k with
  | Some I ->
    assert (~ (Ghost.reveal u I == one (opt_pcm #int)));
    assert (exists (x:int). (Ghost.reveal u I == Ghost.reveal (some (Ghost.hide x))));
    assert (exists (x:int). (Ghost.reveal u I == Ghost.reveal (some (Ghost.hide x))) /\ u `feq` mk_int (Ghost.hide (Ghost.reveal (some (Ghost.hide x)))));
    assert (exists i. u == mk_int i); k
  | Some B -> 
    assert (~ (Ghost.reveal u B == one (opt_pcm #bool)));
    assert (exists (b:bool). Ghost.reveal u B == Ghost.reveal (some (Ghost.hide b)) /\ u `feq` mk_bool (Ghost.hide (Ghost.reveal (some (Ghost.hide b))))); k
  | None -> None
  
let case_of_int_or_bool_int _ = ()
let case_of_int_or_bool_bool _ = ()
let case_of_int_or_bool_one = ()

let mk_int_exclusive i = exclusive_union_intro int_or_bool_cases_pcm (mk_int i) I

let mk_bool_exclusive b = exclusive_union_intro int_or_bool_cases_pcm (mk_bool b) B

let addr_of_i (#i: Ghost.erased (option int)) (p: ref 'a int_or_bool_pcm)
: Steel (q:ref 'a (opt_pcm #int){q == ref_focus p _i})
    (p `pts_to` mk_int i)
    (fun q -> q `pts_to` i)
    (requires fun _ -> ~ (i == none))
    (ensures fun _ _ _ -> True)
= addr_of_union_field p I (mk_int i)

let unaddr_of_i (#i: Ghost.erased (option int)) (#opened: M.inames)
  (p: ref 'a int_or_bool_pcm)
  (q: ref 'a (opt_pcm #int){q == ref_focus p _i})
= unaddr_of_union_field #_ #_ #_ #_ #(int_or_bool_cases_pcm) I q p i // FIXME: WHY WHY WHY wrong inference of the pcm function, inferred to a constant function due to the type of q

let addr_of_b (#b: Ghost.erased (option bool)) (p: ref 'a int_or_bool_pcm)
= addr_of_union_field p B (mk_bool b)

let unaddr_of_b (#b: Ghost.erased (option bool)) (#opened: M.inames)
  (p: ref 'a int_or_bool_pcm)
  (q: ref 'a (opt_pcm #bool){q == ref_focus p _b})
= unaddr_of_union_field #_ #_ #_ #_ #(int_or_bool_cases_pcm) B q p b // same here

let switch_to_int_fpu (#u: Ghost.erased int_or_bool{exclusive int_or_bool_pcm (Ghost.reveal u)})
  (p: ref 'a int_or_bool_pcm) (i: int)
: frame_preserving_upd int_or_bool_pcm u (mk_int (some (Ghost.hide i)))
= base_fpu int_or_bool_pcm u (field_to_union_f int_or_bool_cases_pcm I (Some i))

let exclusive_not_unit (#u: Ghost.erased int_or_bool)
: Lemma
    (requires exclusive int_or_bool_pcm u)
    (ensures Some? (case_of_int_or_bool u))
    [SMTPat (exclusive int_or_bool_pcm u)]
= is_unit int_or_bool_pcm (field_to_union_f int_or_bool_cases_pcm I (Some 42));
  assert (~ (Ghost.reveal u == one int_or_bool_pcm))

let switch_to_int (#u: Ghost.erased int_or_bool)
  (p: ref 'a int_or_bool_pcm) (i: int)
: Steel unit
    (p `pts_to` u)
    (fun _ -> p `pts_to` mk_int (some i))
    (requires fun _ -> exclusive int_or_bool_pcm u)
    (ensures fun _ _ _ -> True)
= ref_upd p _ _ (switch_to_int_fpu p i)

let switch_to_bool (#u: Ghost.erased int_or_bool)
  (p: ref 'a int_or_bool_pcm) (b: bool)
: Steel unit
    (p `pts_to` u)
    (fun _ -> p `pts_to` mk_bool (some (Ghost.hide b)))
    (requires fun _ -> exclusive int_or_bool_pcm u)
    (ensures fun _ _ _ -> True)
= ref_upd p u (mk_bool (some (Ghost.hide b)))
    (base_fpu int_or_bool_pcm u (field_to_union_f int_or_bool_cases_pcm B (Some b)))
