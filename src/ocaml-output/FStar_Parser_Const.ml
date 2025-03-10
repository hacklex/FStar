open Prims
let (p2l : FStar_Ident.path -> FStar_Ident.lident) =
  fun l -> FStar_Ident.lid_of_path l FStar_Compiler_Range.dummyRange
let (pconst : Prims.string -> FStar_Ident.lident) = fun s -> p2l ["Prims"; s]
let (psconst : Prims.string -> FStar_Ident.lident) =
  fun s -> p2l ["FStar"; "Pervasives"; s]
let (psnconst : Prims.string -> FStar_Ident.lident) =
  fun s -> p2l ["FStar"; "Pervasives"; "Native"; s]
let (prims_lid : FStar_Ident.lident) = p2l ["Prims"]
let (pervasives_native_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "Native"]
let (pervasives_lid : FStar_Ident.lident) = p2l ["FStar"; "Pervasives"]
let (fstar_ns_lid : FStar_Ident.lident) = p2l ["FStar"]
let (bool_lid : FStar_Ident.lident) = pconst "bool"
let (unit_lid : FStar_Ident.lident) = pconst "unit"
let (squash_lid : FStar_Ident.lident) = pconst "squash"
let (auto_squash_lid : FStar_Ident.lident) = pconst "auto_squash"
let (string_lid : FStar_Ident.lident) = pconst "string"
let (bytes_lid : FStar_Ident.lident) = pconst "bytes"
let (int_lid : FStar_Ident.lident) = pconst "int"
let (exn_lid : FStar_Ident.lident) = pconst "exn"
let (list_lid : FStar_Ident.lident) = pconst "list"
let (immutable_array_t_lid : FStar_Ident.lident) =
  p2l ["FStar"; "ImmutableArray"; "Base"; "t"]
let (immutable_array_of_list_lid : FStar_Ident.lident) =
  p2l ["FStar"; "ImmutableArray"; "Base"; "of_list"]
let (immutable_array_length_lid : FStar_Ident.lident) =
  p2l ["FStar"; "ImmutableArray"; "Base"; "length"]
let (immutable_array_index_lid : FStar_Ident.lident) =
  p2l ["FStar"; "ImmutableArray"; "Base"; "index"]
let (eqtype_lid : FStar_Ident.lident) = pconst "eqtype"
let (option_lid : FStar_Ident.lident) = psnconst "option"
let (either_lid : FStar_Ident.lident) = psconst "either"
let (pattern_lid : FStar_Ident.lident) = psconst "pattern"
let (lex_t_lid : FStar_Ident.lident) = pconst "lex_t"
let (precedes_lid : FStar_Ident.lident) = pconst "precedes"
let (smtpat_lid : FStar_Ident.lident) = psconst "smt_pat"
let (smtpatOr_lid : FStar_Ident.lident) = psconst "smt_pat_or"
let (monadic_lid : FStar_Ident.lident) = pconst "M"
let (spinoff_lid : FStar_Ident.lident) = psconst "spinoff"
let (inl_lid : FStar_Ident.lident) = psconst "Inl"
let (inr_lid : FStar_Ident.lident) = psconst "Inr"
let (int8_lid : FStar_Ident.lident) = p2l ["FStar"; "Int8"; "t"]
let (uint8_lid : FStar_Ident.lident) = p2l ["FStar"; "UInt8"; "t"]
let (int16_lid : FStar_Ident.lident) = p2l ["FStar"; "Int16"; "t"]
let (uint16_lid : FStar_Ident.lident) = p2l ["FStar"; "UInt16"; "t"]
let (int32_lid : FStar_Ident.lident) = p2l ["FStar"; "Int32"; "t"]
let (uint32_lid : FStar_Ident.lident) = p2l ["FStar"; "UInt32"; "t"]
let (int64_lid : FStar_Ident.lident) = p2l ["FStar"; "Int64"; "t"]
let (uint64_lid : FStar_Ident.lident) = p2l ["FStar"; "UInt64"; "t"]
let (salloc_lid : FStar_Ident.lident) = p2l ["FStar"; "ST"; "salloc"]
let (swrite_lid : FStar_Ident.lident) =
  p2l ["FStar"; "ST"; "op_Colon_Equals"]
let (sread_lid : FStar_Ident.lident) = p2l ["FStar"; "ST"; "op_Bang"]
let (max_lid : FStar_Ident.lident) = p2l ["max"]
let (real_lid : FStar_Ident.lident) = p2l ["FStar"; "Real"; "real"]
let (float_lid : FStar_Ident.lident) = p2l ["FStar"; "Float"; "float"]
let (char_lid : FStar_Ident.lident) = p2l ["FStar"; "Char"; "char"]
let (heap_lid : FStar_Ident.lident) = p2l ["FStar"; "Heap"; "heap"]
let (logical_lid : FStar_Ident.lident) = pconst "logical"
let (smt_theory_symbol_attr_lid : FStar_Ident.lident) =
  pconst "smt_theory_symbol"
let (true_lid : FStar_Ident.lident) = pconst "l_True"
let (false_lid : FStar_Ident.lident) = pconst "l_False"
let (and_lid : FStar_Ident.lident) = pconst "l_and"
let (or_lid : FStar_Ident.lident) = pconst "l_or"
let (not_lid : FStar_Ident.lident) = pconst "l_not"
let (imp_lid : FStar_Ident.lident) = pconst "l_imp"
let (iff_lid : FStar_Ident.lident) = pconst "l_iff"
let (ite_lid : FStar_Ident.lident) = pconst "l_ITE"
let (exists_lid : FStar_Ident.lident) = pconst "l_Exists"
let (forall_lid : FStar_Ident.lident) = pconst "l_Forall"
let (haseq_lid : FStar_Ident.lident) = pconst "hasEq"
let (b2t_lid : FStar_Ident.lident) = pconst "b2t"
let (admit_lid : FStar_Ident.lident) = pconst "admit"
let (magic_lid : FStar_Ident.lident) = pconst "magic"
let (has_type_lid : FStar_Ident.lident) = pconst "has_type"
let (c_true_lid : FStar_Ident.lident) = pconst "trivial"
let (empty_type_lid : FStar_Ident.lident) = pconst "empty"
let (c_and_lid : FStar_Ident.lident) = pconst "pair"
let (c_or_lid : FStar_Ident.lident) = pconst "sum"
let (dtuple2_lid : FStar_Ident.lident) = pconst "dtuple2"
let (eq2_lid : FStar_Ident.lident) = pconst "eq2"
let (eq3_lid : FStar_Ident.lident) = pconst "op_Equals_Equals_Equals"
let (c_eq2_lid : FStar_Ident.lident) = pconst "equals"
let (cons_lid : FStar_Ident.lident) = pconst "Cons"
let (nil_lid : FStar_Ident.lident) = pconst "Nil"
let (some_lid : FStar_Ident.lident) = psnconst "Some"
let (none_lid : FStar_Ident.lident) = psnconst "None"
let (assume_lid : FStar_Ident.lident) = pconst "_assume"
let (assert_lid : FStar_Ident.lident) = pconst "_assert"
let (pure_wp_lid : FStar_Ident.lident) = pconst "pure_wp"
let (pure_wp_monotonic_lid : FStar_Ident.lident) = pconst "pure_wp_monotonic"
let (pure_wp_monotonic0_lid : FStar_Ident.lident) =
  pconst "pure_wp_monotonic0"
let (trivial_pure_post_lid : FStar_Ident.lident) =
  psconst "trivial_pure_post"
let (pure_assert_wp_lid : FStar_Ident.lident) = pconst "pure_assert_wp0"
let (pure_assume_wp_lid : FStar_Ident.lident) = pconst "pure_assume_wp0"
let (assert_norm_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "assert_norm"]
let (list_append_lid : FStar_Ident.lident) = p2l ["FStar"; "List"; "append"]
let (list_tot_append_lid : FStar_Ident.lident) =
  p2l ["FStar"; "List"; "Tot"; "Base"; "append"]
let (id_lid : FStar_Ident.lident) = psconst "id"
let (c2l : Prims.string -> FStar_Ident.lident) =
  fun s -> p2l ["FStar"; "Char"; s]
let (char_u32_of_char : FStar_Ident.lident) = c2l "u32_of_char"
let (s2l : Prims.string -> FStar_Ident.lident) =
  fun n -> p2l ["FStar"; "String"; n]
let (string_list_of_string_lid : FStar_Ident.lident) = s2l "list_of_string"
let (string_string_of_list_lid : FStar_Ident.lident) = s2l "string_of_list"
let (string_make_lid : FStar_Ident.lident) = s2l "make"
let (string_split_lid : FStar_Ident.lident) = s2l "split"
let (string_concat_lid : FStar_Ident.lident) = s2l "concat"
let (string_compare_lid : FStar_Ident.lident) = s2l "compare"
let (string_lowercase_lid : FStar_Ident.lident) = s2l "lowercase"
let (string_uppercase_lid : FStar_Ident.lident) = s2l "uppercase"
let (string_index_lid : FStar_Ident.lident) = s2l "index"
let (string_index_of_lid : FStar_Ident.lident) = s2l "index_of"
let (string_sub_lid : FStar_Ident.lident) = s2l "sub"
let (prims_strcat_lid : FStar_Ident.lident) = pconst "strcat"
let (prims_op_Hat_lid : FStar_Ident.lident) = pconst "op_Hat"
let (let_in_typ : FStar_Ident.lident) = p2l ["Prims"; "Let"]
let (string_of_int_lid : FStar_Ident.lident) = p2l ["Prims"; "string_of_int"]
let (string_of_bool_lid : FStar_Ident.lident) =
  p2l ["Prims"; "string_of_bool"]
let (string_compare : FStar_Ident.lident) =
  p2l ["FStar"; "String"; "compare"]
let (order_lid : FStar_Ident.lident) = p2l ["FStar"; "Order"; "order"]
let (vconfig_lid : FStar_Ident.lident) = p2l ["FStar"; "VConfig"; "vconfig"]
let (mkvconfig_lid : FStar_Ident.lident) =
  p2l ["FStar"; "VConfig"; "Mkvconfig"]
let (op_Eq : FStar_Ident.lident) = pconst "op_Equality"
let (op_notEq : FStar_Ident.lident) = pconst "op_disEquality"
let (op_LT : FStar_Ident.lident) = pconst "op_LessThan"
let (op_LTE : FStar_Ident.lident) = pconst "op_LessThanOrEqual"
let (op_GT : FStar_Ident.lident) = pconst "op_GreaterThan"
let (op_GTE : FStar_Ident.lident) = pconst "op_GreaterThanOrEqual"
let (op_Subtraction : FStar_Ident.lident) = pconst "op_Subtraction"
let (op_Minus : FStar_Ident.lident) = pconst "op_Minus"
let (op_Addition : FStar_Ident.lident) = pconst "op_Addition"
let (op_Multiply : FStar_Ident.lident) = pconst "op_Multiply"
let (op_Division : FStar_Ident.lident) = pconst "op_Division"
let (op_Modulus : FStar_Ident.lident) = pconst "op_Modulus"
let (op_And : FStar_Ident.lident) = pconst "op_AmpAmp"
let (op_Or : FStar_Ident.lident) = pconst "op_BarBar"
let (op_Negation : FStar_Ident.lident) = pconst "op_Negation"
let (real_const : Prims.string -> FStar_Ident.lident) =
  fun s -> p2l ["FStar"; "Real"; s]
let (real_op_LT : FStar_Ident.lident) = real_const "op_Less_Dot"
let (real_op_LTE : FStar_Ident.lident) = real_const "op_Less_Equals_Dot"
let (real_op_GT : FStar_Ident.lident) = real_const "op_Greater_Dot"
let (real_op_GTE : FStar_Ident.lident) = real_const "op_Greater_Equals_Dot"
let (real_op_Subtraction : FStar_Ident.lident) =
  real_const "op_Subtraction_Dot"
let (real_op_Addition : FStar_Ident.lident) = real_const "op_Plus_Dot"
let (real_op_Multiply : FStar_Ident.lident) = real_const "op_Star_Dot"
let (real_op_Division : FStar_Ident.lident) = real_const "op_Slash_Dot"
let (real_of_int : FStar_Ident.lident) = real_const "of_int"
let (bvconst : Prims.string -> FStar_Ident.lident) =
  fun s -> p2l ["FStar"; "BV"; s]
let (bv_t_lid : FStar_Ident.lident) = bvconst "bv_t"
let (nat_to_bv_lid : FStar_Ident.lident) = bvconst "int2bv"
let (bv_to_nat_lid : FStar_Ident.lident) = bvconst "bv2int"
let (bv_and_lid : FStar_Ident.lident) = bvconst "bvand"
let (bv_xor_lid : FStar_Ident.lident) = bvconst "bvxor"
let (bv_or_lid : FStar_Ident.lident) = bvconst "bvor"
let (bv_add_lid : FStar_Ident.lident) = bvconst "bvadd"
let (bv_sub_lid : FStar_Ident.lident) = bvconst "bvsub"
let (bv_shift_left_lid : FStar_Ident.lident) = bvconst "bvshl"
let (bv_shift_right_lid : FStar_Ident.lident) = bvconst "bvshr"
let (bv_udiv_lid : FStar_Ident.lident) = bvconst "bvdiv"
let (bv_mod_lid : FStar_Ident.lident) = bvconst "bvmod"
let (bv_mul_lid : FStar_Ident.lident) = bvconst "bvmul"
let (bv_ult_lid : FStar_Ident.lident) = bvconst "bvult"
let (bv_uext_lid : FStar_Ident.lident) = bvconst "bv_uext"
let (array_lid : FStar_Ident.lident) = p2l ["FStar"; "Array"; "array"]
let (array_of_list_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Array"; "of_list"]
let (st_lid : FStar_Ident.lident) = p2l ["FStar"; "ST"]
let (write_lid : FStar_Ident.lident) = p2l ["FStar"; "ST"; "write"]
let (read_lid : FStar_Ident.lident) = p2l ["FStar"; "ST"; "read"]
let (alloc_lid : FStar_Ident.lident) = p2l ["FStar"; "ST"; "alloc"]
let (op_ColonEq : FStar_Ident.lident) =
  p2l ["FStar"; "ST"; "op_Colon_Equals"]
let (ref_lid : FStar_Ident.lident) = p2l ["FStar"; "Heap"; "ref"]
let (heap_addr_of_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Heap"; "addr_of"]
let (set_empty : FStar_Ident.lident) = p2l ["FStar"; "Set"; "empty"]
let (set_singleton : FStar_Ident.lident) = p2l ["FStar"; "Set"; "singleton"]
let (set_union : FStar_Ident.lident) = p2l ["FStar"; "Set"; "union"]
let (fstar_hyperheap_lid : FStar_Ident.lident) = p2l ["FStar"; "HyperHeap"]
let (rref_lid : FStar_Ident.lident) = p2l ["FStar"; "HyperHeap"; "rref"]
let (erased_lid : FStar_Ident.lident) = p2l ["FStar"; "Ghost"; "erased"]
let (effect_PURE_lid : FStar_Ident.lident) = pconst "PURE"
let (effect_Pure_lid : FStar_Ident.lident) = pconst "Pure"
let (effect_Tot_lid : FStar_Ident.lident) = pconst "Tot"
let (effect_Lemma_lid : FStar_Ident.lident) = psconst "Lemma"
let (effect_GTot_lid : FStar_Ident.lident) = pconst "GTot"
let (effect_GHOST_lid : FStar_Ident.lident) = pconst "GHOST"
let (effect_Ghost_lid : FStar_Ident.lident) = pconst "Ghost"
let (effect_DIV_lid : FStar_Ident.lident) = psconst "DIV"
let (effect_Div_lid : FStar_Ident.lident) = psconst "Div"
let (effect_Dv_lid : FStar_Ident.lident) = psconst "Dv"
let (compiler_effect_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Compiler"; "Effect"]
let (compiler_effect_ALL_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Compiler"; "Effect"; "ALL"]
let (compiler_effect_ML_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Compiler"; "Effect"; "ML"]
let (compiler_effect_failwith_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Compiler"; "Effect"; "failwith"]
let (compiler_effect_try_with_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Compiler"; "Effect"; "try_with"]
let (all_lid : FStar_Ident.lident) = p2l ["FStar"; "All"]
let (all_ALL_lid : FStar_Ident.lident) = p2l ["FStar"; "All"; "All"]
let (all_ML_lid : FStar_Ident.lident) = p2l ["FStar"; "All"; "ML"]
let (all_failwith_lid : FStar_Ident.lident) =
  p2l ["FStar"; "All"; "failwith"]
let (all_try_with_lid : FStar_Ident.lident) =
  p2l ["FStar"; "All"; "try_with"]
let (effect_ALL_lid : unit -> FStar_Ident.lident) =
  fun uu___ ->
    let uu___1 = FStar_Options.ml_ish () in
    if uu___1 then compiler_effect_ALL_lid else all_lid
let (effect_ML_lid : unit -> FStar_Ident.lident) =
  fun uu___ ->
    let uu___1 = FStar_Options.ml_ish () in
    if uu___1 then compiler_effect_ML_lid else all_ML_lid
let (failwith_lid : unit -> FStar_Ident.lident) =
  fun uu___ ->
    let uu___1 = FStar_Options.ml_ish () in
    if uu___1 then compiler_effect_failwith_lid else all_failwith_lid
let (try_with_lid : unit -> FStar_Ident.lident) =
  fun uu___ ->
    let uu___1 = FStar_Options.ml_ish () in
    if uu___1 then compiler_effect_try_with_lid else all_try_with_lid
let (as_requires : FStar_Ident.lident) = pconst "as_requires"
let (as_ensures : FStar_Ident.lident) = pconst "as_ensures"
let (decreases_lid : FStar_Ident.lident) = pconst "decreases"
let (inspect : FStar_Ident.lident) =
  p2l ["FStar"; "Tactics"; "Builtins"; "inspect"]
let (pack : FStar_Ident.lident) =
  p2l ["FStar"; "Tactics"; "Builtins"; "pack"]
let (binder_to_term : FStar_Ident.lident) =
  p2l ["FStar"; "Tactics"; "Derived"; "binder_to_term"]
let (reveal : FStar_Ident.lident) = p2l ["FStar"; "Ghost"; "reveal"]
let (hide : FStar_Ident.lident) = p2l ["FStar"; "Ghost"; "hide"]
let (term_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Reflection"; "Types"; "term"]
let (term_view_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Reflection"; "Data"; "term_view"]
let (decls_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Reflection"; "Data"; "decls"]
let (ctx_uvar_and_subst_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Reflection"; "Types"; "ctx_uvar_and_subst"]
let (universe_uvar_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Reflection"; "Types"; "universe_uvar"]
let (range_lid : FStar_Ident.lident) = pconst "range"
let (range_of_lid : FStar_Ident.lident) = pconst "range_of"
let (labeled_lid : FStar_Ident.lident) = pconst "labeled"
let (range_0 : FStar_Ident.lident) = pconst "range_0"
let (guard_free : FStar_Ident.lident) = pconst "guard_free"
let (inversion_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "inversion"]
let (with_type_lid : FStar_Ident.lident) = psconst "with_type"
let (normalize : FStar_Ident.lident) = psconst "normalize"
let (normalize_term : FStar_Ident.lident) = psconst "normalize_term"
let (norm : FStar_Ident.lident) = psconst "norm"
let (steps_simpl : FStar_Ident.lident) = psconst "simplify"
let (steps_weak : FStar_Ident.lident) = psconst "weak"
let (steps_hnf : FStar_Ident.lident) = psconst "hnf"
let (steps_primops : FStar_Ident.lident) = psconst "primops"
let (steps_zeta : FStar_Ident.lident) = psconst "zeta"
let (steps_zeta_full : FStar_Ident.lident) = psconst "zeta_full"
let (steps_iota : FStar_Ident.lident) = psconst "iota"
let (steps_delta : FStar_Ident.lident) = psconst "delta"
let (steps_reify : FStar_Ident.lident) = psconst "reify_"
let (steps_unfoldonly : FStar_Ident.lident) = psconst "delta_only"
let (steps_unfoldfully : FStar_Ident.lident) = psconst "delta_fully"
let (steps_unfoldattr : FStar_Ident.lident) = psconst "delta_attr"
let (steps_unfoldqual : FStar_Ident.lident) = psconst "delta_qualifier"
let (steps_unfoldnamespace : FStar_Ident.lident) = psconst "delta_namespace"
let (steps_unascribe : FStar_Ident.lident) = psconst "unascribe"
let (steps_nbe : FStar_Ident.lident) = psconst "nbe"
let (steps_unmeta : FStar_Ident.lident) = psconst "unmeta"
let (deprecated_attr : FStar_Ident.lident) = pconst "deprecated"
let (warn_on_use_attr : FStar_Ident.lident) = pconst "warn_on_use"
let (inline_let_attr : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "inline_let"]
let (rename_let_attr : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "rename_let"]
let (plugin_attr : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "plugin"]
let (tcnorm_attr : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "tcnorm"]
let (dm4f_bind_range_attr : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "dm4f_bind_range"]
let (must_erase_for_extraction_attr : FStar_Ident.lident) =
  psconst "must_erase_for_extraction"
let (strict_on_arguments_attr : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "strict_on_arguments"]
let (resolve_implicits_attr_string : Prims.string) =
  "FStar.Pervasives.resolve_implicits"
let (override_resolve_implicits_handler_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "override_resolve_implicits_handler"]
let (handle_smt_goals_attr : FStar_Ident.lident) = psconst "handle_smt_goals"
let (handle_smt_goals_attr_string : Prims.string) =
  "FStar.Pervasives.handle_smt_goals"
let (erasable_attr : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "erasable"]
let (comment_attr : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "Comment"]
let (fail_attr : FStar_Ident.lident) = psconst "expect_failure"
let (fail_lax_attr : FStar_Ident.lident) = psconst "expect_lax_failure"
let (tcdecltime_attr : FStar_Ident.lident) = psconst "tcdecltime"
let (noextract_to_attr : FStar_Ident.lident) = psconst "noextract_to"
let (unifier_hint_injective_lid : FStar_Ident.lident) =
  psconst "unifier_hint_injective"
let (normalize_for_extraction_lid : FStar_Ident.lident) =
  psconst "normalize_for_extraction"
let (postprocess_with : FStar_Ident.lident) =
  p2l ["FStar"; "Tactics"; "Effect"; "postprocess_with"]
let (preprocess_with : FStar_Ident.lident) =
  p2l ["FStar"; "Tactics"; "Effect"; "preprocess_with"]
let (postprocess_extr_with : FStar_Ident.lident) =
  p2l ["FStar"; "Tactics"; "Effect"; "postprocess_for_extraction_with"]
let (check_with_lid : FStar_Ident.lident) =
  FStar_Ident.lid_of_path ["FStar"; "Reflection"; "Builtins"; "check_with"]
    FStar_Compiler_Range.dummyRange
let (commute_nested_matches_lid : FStar_Ident.lident) =
  psconst "commute_nested_matches"
let (remove_unused_type_parameters_lid : FStar_Ident.lident) =
  psconst "remove_unused_type_parameters"
let (ite_soundness_by_attr : FStar_Ident.lident) = psconst "ite_soundness_by"
let (default_effect_attr : FStar_Ident.lident) = psconst "default_effect"
let (top_level_effect_attr : FStar_Ident.lident) = psconst "top_level_effect"
let (effect_parameter_attr : FStar_Ident.lident) = psconst "effect_param"
let (bind_has_range_args_attr : FStar_Ident.lident) =
  psconst "bind_has_range_args"
let (binder_strictly_positive_attr : FStar_Ident.lident) =
  psconst "strictly_positive"
let (no_auto_projectors_attr : FStar_Ident.lident) =
  psconst "no_auto_projectors"
let (no_subtping_attr_lid : FStar_Ident.lident) = psconst "no_subtyping"
let (attr_substitute_lid : FStar_Ident.lident) =
  p2l ["FStar"; "Pervasives"; "Substitute"]
let (well_founded_relation_lid : FStar_Ident.lident) =
  p2l ["FStar"; "WellFounded"; "well_founded_relation"]
let (gen_reset : ((unit -> Prims.int) * (unit -> unit))) =
  let x = FStar_Compiler_Util.mk_ref Prims.int_zero in
  let gen uu___ = FStar_Compiler_Util.incr x; FStar_Compiler_Util.read x in
  let reset uu___ = FStar_Compiler_Util.write x Prims.int_zero in
  (gen, reset)
let (next_id : unit -> Prims.int) = FStar_Pervasives_Native.fst gen_reset
let (sli : FStar_Ident.lident -> Prims.string) =
  fun l ->
    let uu___ = FStar_Options.print_real_names () in
    if uu___
    then FStar_Ident.string_of_lid l
    else
      (let uu___2 = FStar_Ident.ident_of_lid l in
       FStar_Ident.string_of_id uu___2)
let (const_to_string : FStar_Const.sconst -> Prims.string) =
  fun x ->
    match x with
    | FStar_Const.Const_effect -> "Effect"
    | FStar_Const.Const_unit -> "()"
    | FStar_Const.Const_bool b -> if b then "true" else "false"
    | FStar_Const.Const_real r -> FStar_String.op_Hat r "R"
    | FStar_Const.Const_string (s, uu___) ->
        FStar_Compiler_Util.format1 "\"%s\"" s
    | FStar_Const.Const_int (x1, uu___) -> x1
    | FStar_Const.Const_char c ->
        let uu___ =
          FStar_String.op_Hat (FStar_Compiler_Util.string_of_char c) "'" in
        FStar_String.op_Hat "'" uu___
    | FStar_Const.Const_range r -> FStar_Compiler_Range.string_of_range r
    | FStar_Const.Const_range_of -> "range_of"
    | FStar_Const.Const_set_range_of -> "set_range_of"
    | FStar_Const.Const_reify -> "reify"
    | FStar_Const.Const_reflect l ->
        let uu___ = sli l in
        FStar_Compiler_Util.format1 "[[%s.reflect]]" uu___
let (mk_tuple_lid :
  Prims.int -> FStar_Compiler_Range.range -> FStar_Ident.lident) =
  fun n ->
    fun r ->
      let t =
        let uu___ = FStar_Compiler_Util.string_of_int n in
        FStar_Compiler_Util.format1 "tuple%s" uu___ in
      let uu___ = psnconst t in FStar_Ident.set_lid_range uu___ r
let (lid_tuple2 : FStar_Ident.lident) =
  mk_tuple_lid (Prims.of_int (2)) FStar_Compiler_Range.dummyRange
let (lid_tuple3 : FStar_Ident.lident) =
  mk_tuple_lid (Prims.of_int (3)) FStar_Compiler_Range.dummyRange
let (is_tuple_constructor_string : Prims.string -> Prims.bool) =
  fun s -> FStar_Compiler_Util.starts_with s "FStar.Pervasives.Native.tuple"
let (is_tuple_constructor_id : FStar_Ident.ident -> Prims.bool) =
  fun id ->
    let uu___ = FStar_Ident.string_of_id id in
    is_tuple_constructor_string uu___
let (is_tuple_constructor_lid : FStar_Ident.lident -> Prims.bool) =
  fun lid ->
    let uu___ = FStar_Ident.string_of_lid lid in
    is_tuple_constructor_string uu___
let (mk_tuple_data_lid :
  Prims.int -> FStar_Compiler_Range.range -> FStar_Ident.lident) =
  fun n ->
    fun r ->
      let t =
        let uu___ = FStar_Compiler_Util.string_of_int n in
        FStar_Compiler_Util.format1 "Mktuple%s" uu___ in
      let uu___ = psnconst t in FStar_Ident.set_lid_range uu___ r
let (lid_Mktuple2 : FStar_Ident.lident) =
  mk_tuple_data_lid (Prims.of_int (2)) FStar_Compiler_Range.dummyRange
let (lid_Mktuple3 : FStar_Ident.lident) =
  mk_tuple_data_lid (Prims.of_int (3)) FStar_Compiler_Range.dummyRange
let (is_tuple_datacon_string : Prims.string -> Prims.bool) =
  fun s ->
    FStar_Compiler_Util.starts_with s "FStar.Pervasives.Native.Mktuple"
let (is_tuple_datacon_id : FStar_Ident.ident -> Prims.bool) =
  fun id ->
    let uu___ = FStar_Ident.string_of_id id in is_tuple_datacon_string uu___
let (is_tuple_datacon_lid : FStar_Ident.lident -> Prims.bool) =
  fun lid ->
    let uu___ = FStar_Ident.string_of_lid lid in
    is_tuple_datacon_string uu___
let (is_tuple_data_lid : FStar_Ident.lident -> Prims.int -> Prims.bool) =
  fun f ->
    fun n ->
      let uu___ = mk_tuple_data_lid n FStar_Compiler_Range.dummyRange in
      FStar_Ident.lid_equals f uu___
let (is_tuple_data_lid' : FStar_Ident.lident -> Prims.bool) =
  fun f ->
    let uu___ = FStar_Ident.string_of_lid f in is_tuple_datacon_string uu___
let (mod_prefix_dtuple : Prims.int -> Prims.string -> FStar_Ident.lident) =
  fun n -> if n = (Prims.of_int (2)) then pconst else psconst
let (mk_dtuple_lid :
  Prims.int -> FStar_Compiler_Range.range -> FStar_Ident.lident) =
  fun n ->
    fun r ->
      let t =
        let uu___ = FStar_Compiler_Util.string_of_int n in
        FStar_Compiler_Util.format1 "dtuple%s" uu___ in
      let uu___ = let uu___1 = mod_prefix_dtuple n in uu___1 t in
      FStar_Ident.set_lid_range uu___ r
let (is_dtuple_constructor_string : Prims.string -> Prims.bool) =
  fun s ->
    (s = "Prims.dtuple2") ||
      (FStar_Compiler_Util.starts_with s "FStar.Pervasives.dtuple")
let (is_dtuple_constructor_lid : FStar_Ident.lident -> Prims.bool) =
  fun lid ->
    let uu___ = FStar_Ident.string_of_lid lid in
    is_dtuple_constructor_string uu___
let (mk_dtuple_data_lid :
  Prims.int -> FStar_Compiler_Range.range -> FStar_Ident.lident) =
  fun n ->
    fun r ->
      let t =
        let uu___ = FStar_Compiler_Util.string_of_int n in
        FStar_Compiler_Util.format1 "Mkdtuple%s" uu___ in
      let uu___ = let uu___1 = mod_prefix_dtuple n in uu___1 t in
      FStar_Ident.set_lid_range uu___ r
let (is_dtuple_datacon_string : Prims.string -> Prims.bool) =
  fun s ->
    (s = "Prims.Mkdtuple2") ||
      (FStar_Compiler_Util.starts_with s "FStar.Pervasives.Mkdtuple")
let (is_dtuple_data_lid : FStar_Ident.lident -> Prims.int -> Prims.bool) =
  fun f ->
    fun n ->
      let uu___ = mk_dtuple_data_lid n FStar_Compiler_Range.dummyRange in
      FStar_Ident.lid_equals f uu___
let (is_dtuple_data_lid' : FStar_Ident.lident -> Prims.bool) =
  fun f ->
    let uu___ = FStar_Ident.string_of_lid f in is_dtuple_datacon_string uu___
let (is_name : FStar_Ident.lident -> Prims.bool) =
  fun lid ->
    let c =
      let uu___ =
        let uu___1 = FStar_Ident.ident_of_lid lid in
        FStar_Ident.string_of_id uu___1 in
      FStar_Compiler_Util.char_at uu___ Prims.int_zero in
    FStar_Compiler_Util.is_upper c
let (fstar_tactics_lid' : Prims.string Prims.list -> FStar_Ident.lid) =
  fun s ->
    FStar_Ident.lid_of_path
      (FStar_Compiler_List.op_At ["FStar"; "Tactics"] s)
      FStar_Compiler_Range.dummyRange
let (fstar_tactics_lid : Prims.string -> FStar_Ident.lid) =
  fun s -> fstar_tactics_lid' [s]
let (tac_lid : FStar_Ident.lid) = fstar_tactics_lid' ["Effect"; "tac"]
let (tactic_lid : FStar_Ident.lid) = fstar_tactics_lid' ["Effect"; "tactic"]
let (mk_class_lid : FStar_Ident.lid) =
  fstar_tactics_lid' ["Typeclasses"; "mk_class"]
let (tcresolve_lid : FStar_Ident.lid) =
  fstar_tactics_lid' ["Typeclasses"; "tcresolve"]
let (tcclass_lid : FStar_Ident.lid) =
  fstar_tactics_lid' ["Typeclasses"; "tcclass"]
let (tcinstance_lid : FStar_Ident.lid) =
  fstar_tactics_lid' ["Typeclasses"; "tcinstance"]
let (no_method_lid : FStar_Ident.lid) =
  fstar_tactics_lid' ["Typeclasses"; "no_method"]
let (effect_TAC_lid : FStar_Ident.lid) = fstar_tactics_lid' ["Effect"; "TAC"]
let (effect_Tac_lid : FStar_Ident.lid) = fstar_tactics_lid' ["Effect"; "Tac"]
let (by_tactic_lid : FStar_Ident.lid) =
  fstar_tactics_lid' ["Effect"; "with_tactic"]
let (rewrite_by_tactic_lid : FStar_Ident.lid) =
  fstar_tactics_lid' ["Effect"; "rewrite_with_tactic"]
let (synth_lid : FStar_Ident.lid) =
  fstar_tactics_lid' ["Effect"; "synth_by_tactic"]
let (assert_by_tactic_lid : FStar_Ident.lid) =
  fstar_tactics_lid' ["Effect"; "assert_by_tactic"]
let (fstar_syntax_syntax_term : FStar_Ident.lident) =
  FStar_Ident.lid_of_str "FStar.Syntax.Syntax.term"
let (binder_lid : FStar_Ident.lident) =
  FStar_Ident.lid_of_path ["FStar"; "Reflection"; "Types"; "binder"]
    FStar_Compiler_Range.dummyRange
let (binders_lid : FStar_Ident.lident) =
  FStar_Ident.lid_of_path ["FStar"; "Reflection"; "Types"; "binders"]
    FStar_Compiler_Range.dummyRange
let (bv_lid : FStar_Ident.lident) =
  FStar_Ident.lid_of_path ["FStar"; "Reflection"; "Types"; "bv"]
    FStar_Compiler_Range.dummyRange
let (fv_lid : FStar_Ident.lident) =
  FStar_Ident.lid_of_path ["FStar"; "Reflection"; "Types"; "fv"]
    FStar_Compiler_Range.dummyRange
let (norm_step_lid : FStar_Ident.lident) = psconst "norm_step"
let (calc_lid : Prims.string -> FStar_Ident.lid) =
  fun i ->
    FStar_Ident.lid_of_path ["FStar"; "Calc"; i]
      FStar_Compiler_Range.dummyRange
let (calc_init_lid : FStar_Ident.lid) = calc_lid "calc_init"
let (calc_step_lid : FStar_Ident.lid) = calc_lid "calc_step"
let (calc_finish_lid : FStar_Ident.lid) = calc_lid "calc_finish"
let (calc_push_impl_lid : FStar_Ident.lid) = calc_lid "calc_push_impl"
let (classical_sugar_lid : Prims.string -> FStar_Ident.lid) =
  fun i ->
    FStar_Ident.lid_of_path ["FStar"; "Classical"; "Sugar"; i]
      FStar_Compiler_Range.dummyRange
let (forall_intro_lid : FStar_Ident.lid) = classical_sugar_lid "forall_intro"
let (exists_intro_lid : FStar_Ident.lid) = classical_sugar_lid "exists_intro"
let (implies_intro_lid : FStar_Ident.lid) =
  classical_sugar_lid "implies_intro"
let (or_intro_left_lid : FStar_Ident.lid) =
  classical_sugar_lid "or_intro_left"
let (or_intro_right_lid : FStar_Ident.lid) =
  classical_sugar_lid "or_intro_right"
let (and_intro_lid : FStar_Ident.lid) = classical_sugar_lid "and_intro"
let (forall_elim_lid : FStar_Ident.lid) = classical_sugar_lid "forall_elim"
let (exists_elim_lid : FStar_Ident.lid) = classical_sugar_lid "exists_elim"
let (implies_elim_lid : FStar_Ident.lid) = classical_sugar_lid "implies_elim"
let (or_elim_lid : FStar_Ident.lid) = classical_sugar_lid "or_elim"
let (and_elim_lid : FStar_Ident.lid) = classical_sugar_lid "and_elim"
let (match_returns_def_name : Prims.string) =
  FStar_String.op_Hat FStar_Ident.reserved_prefix "_ret_"
let (layered_effect_reify_val_lid :
  FStar_Ident.lident -> FStar_Compiler_Range.range -> FStar_Ident.lident) =
  fun eff_name ->
    fun r ->
      let ns = FStar_Ident.ns_of_lid eff_name in
      let reify_fn_name =
        let uu___ =
          let uu___1 =
            FStar_Compiler_Effect.op_Bar_Greater eff_name
              FStar_Ident.ident_of_lid in
          FStar_Compiler_Effect.op_Bar_Greater uu___1
            FStar_Ident.string_of_id in
        FStar_String.op_Hat "reify___" uu___ in
      let uu___ = FStar_Ident.mk_ident (reify_fn_name, r) in
      FStar_Ident.lid_of_ns_and_id ns uu___