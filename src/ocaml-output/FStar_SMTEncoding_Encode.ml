open Prims
type prims_t =
  {
  mk:
    FStar_Ident.lident ->
      Prims.string ->
        (FStar_SMTEncoding_Term.term * Prims.int *
          FStar_SMTEncoding_Term.decl Prims.list)
    ;
  is: FStar_Ident.lident -> Prims.bool }
let (__proj__Mkprims_t__item__mk :
  prims_t ->
    FStar_Ident.lident ->
      Prims.string ->
        (FStar_SMTEncoding_Term.term * Prims.int *
          FStar_SMTEncoding_Term.decl Prims.list))
  = fun projectee  -> match projectee with | { mk = mk1; is;_} -> mk1 
let (__proj__Mkprims_t__item__is :
  prims_t -> FStar_Ident.lident -> Prims.bool) =
  fun projectee  -> match projectee with | { mk = mk1; is;_} -> is 
let (prims : prims_t) =
  let uu____136 =
    FStar_SMTEncoding_Env.fresh_fvar "a" FStar_SMTEncoding_Term.Term_sort  in
  match uu____136 with
  | (asym,a) ->
      let uu____147 =
        FStar_SMTEncoding_Env.fresh_fvar "x" FStar_SMTEncoding_Term.Term_sort
         in
      (match uu____147 with
       | (xsym,x) ->
           let uu____158 =
             FStar_SMTEncoding_Env.fresh_fvar "y"
               FStar_SMTEncoding_Term.Term_sort
              in
           (match uu____158 with
            | (ysym,y) ->
                let quant vars body rng x1 =
                  let xname_decl =
                    let uu____236 =
                      let uu____248 =
                        FStar_All.pipe_right vars
                          (FStar_List.map FStar_SMTEncoding_Term.fv_sort)
                         in
                      (x1, uu____248, FStar_SMTEncoding_Term.Term_sort,
                        FStar_Pervasives_Native.None)
                       in
                    FStar_SMTEncoding_Term.DeclFun uu____236  in
                  let xtok = Prims.strcat x1 "@tok"  in
                  let xtok_decl =
                    FStar_SMTEncoding_Term.DeclFun
                      (xtok, [], FStar_SMTEncoding_Term.Term_sort,
                        FStar_Pervasives_Native.None)
                     in
                  let xapp =
                    let uu____268 =
                      let uu____276 =
                        FStar_List.map FStar_SMTEncoding_Util.mkFreeV vars
                         in
                      (x1, uu____276)  in
                    FStar_SMTEncoding_Util.mkApp uu____268  in
                  let xtok1 = FStar_SMTEncoding_Util.mkApp (xtok, [])  in
                  let xtok_app =
                    FStar_SMTEncoding_EncodeTerm.mk_Apply xtok1 vars  in
                  let uu____295 =
                    let uu____298 =
                      let uu____301 =
                        let uu____304 =
                          let uu____305 =
                            let uu____313 =
                              let uu____314 =
                                let uu____325 =
                                  FStar_SMTEncoding_Util.mkEq (xapp, body)
                                   in
                                ([[xapp]], vars, uu____325)  in
                              FStar_SMTEncoding_Term.mkForall rng uu____314
                               in
                            (uu____313, FStar_Pervasives_Native.None,
                              (Prims.strcat "primitive_" x1))
                             in
                          FStar_SMTEncoding_Util.mkAssume uu____305  in
                        let uu____337 =
                          let uu____340 =
                            let uu____341 =
                              let uu____349 =
                                let uu____350 =
                                  let uu____361 =
                                    FStar_SMTEncoding_Util.mkEq
                                      (xtok_app, xapp)
                                     in
                                  ([[xtok_app]], vars, uu____361)  in
                                FStar_SMTEncoding_Term.mkForall rng uu____350
                                 in
                              (uu____349,
                                (FStar_Pervasives_Native.Some
                                   "Name-token correspondence"),
                                (Prims.strcat "token_correspondence_" x1))
                               in
                            FStar_SMTEncoding_Util.mkAssume uu____341  in
                          [uu____340]  in
                        uu____304 :: uu____337  in
                      xtok_decl :: uu____301  in
                    xname_decl :: uu____298  in
                  (xtok1, (FStar_List.length vars), uu____295)  in
                let axy =
                  FStar_List.map FStar_SMTEncoding_Term.mk_fv
                    [(asym, FStar_SMTEncoding_Term.Term_sort);
                    (xsym, FStar_SMTEncoding_Term.Term_sort);
                    (ysym, FStar_SMTEncoding_Term.Term_sort)]
                   in
                let xy =
                  FStar_List.map FStar_SMTEncoding_Term.mk_fv
                    [(xsym, FStar_SMTEncoding_Term.Term_sort);
                    (ysym, FStar_SMTEncoding_Term.Term_sort)]
                   in
                let qx =
                  FStar_List.map FStar_SMTEncoding_Term.mk_fv
                    [(xsym, FStar_SMTEncoding_Term.Term_sort)]
                   in
                let prims1 =
                  let uu____531 =
                    let uu____552 =
                      let uu____571 =
                        let uu____572 = FStar_SMTEncoding_Util.mkEq (x, y)
                           in
                        FStar_All.pipe_left FStar_SMTEncoding_Term.boxBool
                          uu____572
                         in
                      quant axy uu____571  in
                    (FStar_Parser_Const.op_Eq, uu____552)  in
                  let uu____589 =
                    let uu____612 =
                      let uu____633 =
                        let uu____652 =
                          let uu____653 =
                            let uu____654 =
                              FStar_SMTEncoding_Util.mkEq (x, y)  in
                            FStar_SMTEncoding_Util.mkNot uu____654  in
                          FStar_All.pipe_left FStar_SMTEncoding_Term.boxBool
                            uu____653
                           in
                        quant axy uu____652  in
                      (FStar_Parser_Const.op_notEq, uu____633)  in
                    let uu____671 =
                      let uu____694 =
                        let uu____715 =
                          let uu____734 =
                            let uu____735 =
                              let uu____736 =
                                let uu____741 =
                                  FStar_SMTEncoding_Term.unboxInt x  in
                                let uu____742 =
                                  FStar_SMTEncoding_Term.unboxInt y  in
                                (uu____741, uu____742)  in
                              FStar_SMTEncoding_Util.mkLT uu____736  in
                            FStar_All.pipe_left
                              FStar_SMTEncoding_Term.boxBool uu____735
                             in
                          quant xy uu____734  in
                        (FStar_Parser_Const.op_LT, uu____715)  in
                      let uu____759 =
                        let uu____782 =
                          let uu____803 =
                            let uu____822 =
                              let uu____823 =
                                let uu____824 =
                                  let uu____829 =
                                    FStar_SMTEncoding_Term.unboxInt x  in
                                  let uu____830 =
                                    FStar_SMTEncoding_Term.unboxInt y  in
                                  (uu____829, uu____830)  in
                                FStar_SMTEncoding_Util.mkLTE uu____824  in
                              FStar_All.pipe_left
                                FStar_SMTEncoding_Term.boxBool uu____823
                               in
                            quant xy uu____822  in
                          (FStar_Parser_Const.op_LTE, uu____803)  in
                        let uu____847 =
                          let uu____870 =
                            let uu____891 =
                              let uu____910 =
                                let uu____911 =
                                  let uu____912 =
                                    let uu____917 =
                                      FStar_SMTEncoding_Term.unboxInt x  in
                                    let uu____918 =
                                      FStar_SMTEncoding_Term.unboxInt y  in
                                    (uu____917, uu____918)  in
                                  FStar_SMTEncoding_Util.mkGT uu____912  in
                                FStar_All.pipe_left
                                  FStar_SMTEncoding_Term.boxBool uu____911
                                 in
                              quant xy uu____910  in
                            (FStar_Parser_Const.op_GT, uu____891)  in
                          let uu____935 =
                            let uu____958 =
                              let uu____979 =
                                let uu____998 =
                                  let uu____999 =
                                    let uu____1000 =
                                      let uu____1005 =
                                        FStar_SMTEncoding_Term.unboxInt x  in
                                      let uu____1006 =
                                        FStar_SMTEncoding_Term.unboxInt y  in
                                      (uu____1005, uu____1006)  in
                                    FStar_SMTEncoding_Util.mkGTE uu____1000
                                     in
                                  FStar_All.pipe_left
                                    FStar_SMTEncoding_Term.boxBool uu____999
                                   in
                                quant xy uu____998  in
                              (FStar_Parser_Const.op_GTE, uu____979)  in
                            let uu____1023 =
                              let uu____1046 =
                                let uu____1067 =
                                  let uu____1086 =
                                    let uu____1087 =
                                      let uu____1088 =
                                        let uu____1093 =
                                          FStar_SMTEncoding_Term.unboxInt x
                                           in
                                        let uu____1094 =
                                          FStar_SMTEncoding_Term.unboxInt y
                                           in
                                        (uu____1093, uu____1094)  in
                                      FStar_SMTEncoding_Util.mkSub uu____1088
                                       in
                                    FStar_All.pipe_left
                                      FStar_SMTEncoding_Term.boxInt
                                      uu____1087
                                     in
                                  quant xy uu____1086  in
                                (FStar_Parser_Const.op_Subtraction,
                                  uu____1067)
                                 in
                              let uu____1111 =
                                let uu____1134 =
                                  let uu____1155 =
                                    let uu____1174 =
                                      let uu____1175 =
                                        let uu____1176 =
                                          FStar_SMTEncoding_Term.unboxInt x
                                           in
                                        FStar_SMTEncoding_Util.mkMinus
                                          uu____1176
                                         in
                                      FStar_All.pipe_left
                                        FStar_SMTEncoding_Term.boxInt
                                        uu____1175
                                       in
                                    quant qx uu____1174  in
                                  (FStar_Parser_Const.op_Minus, uu____1155)
                                   in
                                let uu____1193 =
                                  let uu____1216 =
                                    let uu____1237 =
                                      let uu____1256 =
                                        let uu____1257 =
                                          let uu____1258 =
                                            let uu____1263 =
                                              FStar_SMTEncoding_Term.unboxInt
                                                x
                                               in
                                            let uu____1264 =
                                              FStar_SMTEncoding_Term.unboxInt
                                                y
                                               in
                                            (uu____1263, uu____1264)  in
                                          FStar_SMTEncoding_Util.mkAdd
                                            uu____1258
                                           in
                                        FStar_All.pipe_left
                                          FStar_SMTEncoding_Term.boxInt
                                          uu____1257
                                         in
                                      quant xy uu____1256  in
                                    (FStar_Parser_Const.op_Addition,
                                      uu____1237)
                                     in
                                  let uu____1281 =
                                    let uu____1304 =
                                      let uu____1325 =
                                        let uu____1344 =
                                          let uu____1345 =
                                            let uu____1346 =
                                              let uu____1351 =
                                                FStar_SMTEncoding_Term.unboxInt
                                                  x
                                                 in
                                              let uu____1352 =
                                                FStar_SMTEncoding_Term.unboxInt
                                                  y
                                                 in
                                              (uu____1351, uu____1352)  in
                                            FStar_SMTEncoding_Util.mkMul
                                              uu____1346
                                             in
                                          FStar_All.pipe_left
                                            FStar_SMTEncoding_Term.boxInt
                                            uu____1345
                                           in
                                        quant xy uu____1344  in
                                      (FStar_Parser_Const.op_Multiply,
                                        uu____1325)
                                       in
                                    let uu____1369 =
                                      let uu____1392 =
                                        let uu____1413 =
                                          let uu____1432 =
                                            let uu____1433 =
                                              let uu____1434 =
                                                let uu____1439 =
                                                  FStar_SMTEncoding_Term.unboxInt
                                                    x
                                                   in
                                                let uu____1440 =
                                                  FStar_SMTEncoding_Term.unboxInt
                                                    y
                                                   in
                                                (uu____1439, uu____1440)  in
                                              FStar_SMTEncoding_Util.mkDiv
                                                uu____1434
                                               in
                                            FStar_All.pipe_left
                                              FStar_SMTEncoding_Term.boxInt
                                              uu____1433
                                             in
                                          quant xy uu____1432  in
                                        (FStar_Parser_Const.op_Division,
                                          uu____1413)
                                         in
                                      let uu____1457 =
                                        let uu____1480 =
                                          let uu____1501 =
                                            let uu____1520 =
                                              let uu____1521 =
                                                let uu____1522 =
                                                  let uu____1527 =
                                                    FStar_SMTEncoding_Term.unboxInt
                                                      x
                                                     in
                                                  let uu____1528 =
                                                    FStar_SMTEncoding_Term.unboxInt
                                                      y
                                                     in
                                                  (uu____1527, uu____1528)
                                                   in
                                                FStar_SMTEncoding_Util.mkMod
                                                  uu____1522
                                                 in
                                              FStar_All.pipe_left
                                                FStar_SMTEncoding_Term.boxInt
                                                uu____1521
                                               in
                                            quant xy uu____1520  in
                                          (FStar_Parser_Const.op_Modulus,
                                            uu____1501)
                                           in
                                        let uu____1545 =
                                          let uu____1568 =
                                            let uu____1589 =
                                              let uu____1608 =
                                                let uu____1609 =
                                                  let uu____1610 =
                                                    let uu____1615 =
                                                      FStar_SMTEncoding_Term.unboxBool
                                                        x
                                                       in
                                                    let uu____1616 =
                                                      FStar_SMTEncoding_Term.unboxBool
                                                        y
                                                       in
                                                    (uu____1615, uu____1616)
                                                     in
                                                  FStar_SMTEncoding_Util.mkAnd
                                                    uu____1610
                                                   in
                                                FStar_All.pipe_left
                                                  FStar_SMTEncoding_Term.boxBool
                                                  uu____1609
                                                 in
                                              quant xy uu____1608  in
                                            (FStar_Parser_Const.op_And,
                                              uu____1589)
                                             in
                                          let uu____1633 =
                                            let uu____1656 =
                                              let uu____1677 =
                                                let uu____1696 =
                                                  let uu____1697 =
                                                    let uu____1698 =
                                                      let uu____1703 =
                                                        FStar_SMTEncoding_Term.unboxBool
                                                          x
                                                         in
                                                      let uu____1704 =
                                                        FStar_SMTEncoding_Term.unboxBool
                                                          y
                                                         in
                                                      (uu____1703,
                                                        uu____1704)
                                                       in
                                                    FStar_SMTEncoding_Util.mkOr
                                                      uu____1698
                                                     in
                                                  FStar_All.pipe_left
                                                    FStar_SMTEncoding_Term.boxBool
                                                    uu____1697
                                                   in
                                                quant xy uu____1696  in
                                              (FStar_Parser_Const.op_Or,
                                                uu____1677)
                                               in
                                            let uu____1721 =
                                              let uu____1744 =
                                                let uu____1765 =
                                                  let uu____1784 =
                                                    let uu____1785 =
                                                      let uu____1786 =
                                                        FStar_SMTEncoding_Term.unboxBool
                                                          x
                                                         in
                                                      FStar_SMTEncoding_Util.mkNot
                                                        uu____1786
                                                       in
                                                    FStar_All.pipe_left
                                                      FStar_SMTEncoding_Term.boxBool
                                                      uu____1785
                                                     in
                                                  quant qx uu____1784  in
                                                (FStar_Parser_Const.op_Negation,
                                                  uu____1765)
                                                 in
                                              [uu____1744]  in
                                            uu____1656 :: uu____1721  in
                                          uu____1568 :: uu____1633  in
                                        uu____1480 :: uu____1545  in
                                      uu____1392 :: uu____1457  in
                                    uu____1304 :: uu____1369  in
                                  uu____1216 :: uu____1281  in
                                uu____1134 :: uu____1193  in
                              uu____1046 :: uu____1111  in
                            uu____958 :: uu____1023  in
                          uu____870 :: uu____935  in
                        uu____782 :: uu____847  in
                      uu____694 :: uu____759  in
                    uu____612 :: uu____671  in
                  uu____531 :: uu____589  in
                let mk1 l v1 =
                  let uu____2145 =
                    let uu____2157 =
                      FStar_All.pipe_right prims1
                        (FStar_List.find
                           (fun uu____2247  ->
                              match uu____2247 with
                              | (l',uu____2268) ->
                                  FStar_Ident.lid_equals l l'))
                       in
                    FStar_All.pipe_right uu____2157
                      (FStar_Option.map
                         (fun uu____2367  ->
                            match uu____2367 with
                            | (uu____2395,b) ->
                                let uu____2429 = FStar_Ident.range_of_lid l
                                   in
                                b uu____2429 v1))
                     in
                  FStar_All.pipe_right uu____2145 FStar_Option.get  in
                let is l =
                  FStar_All.pipe_right prims1
                    (FStar_Util.for_some
                       (fun uu____2512  ->
                          match uu____2512 with
                          | (l',uu____2533) -> FStar_Ident.lid_equals l l'))
                   in
                { mk = mk1; is }))
  
let (pretype_axiom :
  FStar_Range.range ->
    FStar_SMTEncoding_Env.env_t ->
      FStar_SMTEncoding_Term.term ->
        (Prims.string * FStar_SMTEncoding_Term.sort * Prims.bool) Prims.list
          -> FStar_SMTEncoding_Term.decl)
  =
  fun rng  ->
    fun env  ->
      fun tapp  ->
        fun vars  ->
          let uu____2607 =
            FStar_SMTEncoding_Env.fresh_fvar "x"
              FStar_SMTEncoding_Term.Term_sort
             in
          match uu____2607 with
          | (xxsym,xx) ->
              let uu____2618 =
                FStar_SMTEncoding_Env.fresh_fvar "f"
                  FStar_SMTEncoding_Term.Fuel_sort
                 in
              (match uu____2618 with
               | (ffsym,ff) ->
                   let xx_has_type =
                     FStar_SMTEncoding_Term.mk_HasTypeFuel ff xx tapp  in
                   let tapp_hash = FStar_SMTEncoding_Term.hash_of_term tapp
                      in
                   let module_name =
                     env.FStar_SMTEncoding_Env.current_module_name  in
                   let uu____2634 =
                     let uu____2642 =
                       let uu____2643 =
                         let uu____2654 =
                           let uu____2655 =
                             FStar_SMTEncoding_Term.mk_fv
                               (xxsym, FStar_SMTEncoding_Term.Term_sort)
                              in
                           let uu____2665 =
                             let uu____2676 =
                               FStar_SMTEncoding_Term.mk_fv
                                 (ffsym, FStar_SMTEncoding_Term.Fuel_sort)
                                in
                             uu____2676 :: vars  in
                           uu____2655 :: uu____2665  in
                         let uu____2702 =
                           let uu____2703 =
                             let uu____2708 =
                               let uu____2709 =
                                 let uu____2714 =
                                   FStar_SMTEncoding_Util.mkApp
                                     ("PreType", [xx])
                                    in
                                 (tapp, uu____2714)  in
                               FStar_SMTEncoding_Util.mkEq uu____2709  in
                             (xx_has_type, uu____2708)  in
                           FStar_SMTEncoding_Util.mkImp uu____2703  in
                         ([[xx_has_type]], uu____2654, uu____2702)  in
                       FStar_SMTEncoding_Term.mkForall rng uu____2643  in
                     let uu____2727 =
                       let uu____2729 =
                         let uu____2731 =
                           let uu____2733 =
                             FStar_Util.digest_of_string tapp_hash  in
                           Prims.strcat "_pretyping_" uu____2733  in
                         Prims.strcat module_name uu____2731  in
                       FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.mk_unique
                         uu____2729
                        in
                     (uu____2642, (FStar_Pervasives_Native.Some "pretyping"),
                       uu____2727)
                      in
                   FStar_SMTEncoding_Util.mkAssume uu____2634)
  
let (primitive_type_axioms :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      Prims.string ->
        FStar_SMTEncoding_Term.term -> FStar_SMTEncoding_Term.decl Prims.list)
  =
  let xx =
    FStar_SMTEncoding_Term.mk_fv ("x", FStar_SMTEncoding_Term.Term_sort)  in
  let x = FStar_SMTEncoding_Util.mkFreeV xx  in
  let yy =
    FStar_SMTEncoding_Term.mk_fv ("y", FStar_SMTEncoding_Term.Term_sort)  in
  let y = FStar_SMTEncoding_Util.mkFreeV yy  in
  let mk_unit env nm tt =
    let typing_pred = FStar_SMTEncoding_Term.mk_HasType x tt  in
    let uu____2786 =
      let uu____2787 =
        let uu____2795 =
          FStar_SMTEncoding_Term.mk_HasType
            FStar_SMTEncoding_Term.mk_Term_unit tt
           in
        (uu____2795, (FStar_Pervasives_Native.Some "unit typing"),
          "unit_typing")
         in
      FStar_SMTEncoding_Util.mkAssume uu____2787  in
    let uu____2800 =
      let uu____2803 =
        let uu____2804 =
          let uu____2812 =
            let uu____2813 =
              let uu____2824 =
                let uu____2825 =
                  let uu____2830 =
                    FStar_SMTEncoding_Util.mkEq
                      (x, FStar_SMTEncoding_Term.mk_Term_unit)
                     in
                  (typing_pred, uu____2830)  in
                FStar_SMTEncoding_Util.mkImp uu____2825  in
              ([[typing_pred]], [xx], uu____2824)  in
            let uu____2855 =
              let uu____2870 = FStar_TypeChecker_Env.get_range env  in
              FStar_SMTEncoding_EncodeTerm.mkForall_fuel uu____2870  in
            uu____2855 uu____2813  in
          (uu____2812, (FStar_Pervasives_Native.Some "unit inversion"),
            "unit_inversion")
           in
        FStar_SMTEncoding_Util.mkAssume uu____2804  in
      [uu____2803]  in
    uu____2786 :: uu____2800  in
  let mk_bool env nm tt =
    let typing_pred = FStar_SMTEncoding_Term.mk_HasType x tt  in
    let bb =
      FStar_SMTEncoding_Term.mk_fv ("b", FStar_SMTEncoding_Term.Bool_sort)
       in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let uu____2898 =
      let uu____2899 =
        let uu____2907 =
          let uu____2908 = FStar_TypeChecker_Env.get_range env  in
          let uu____2909 =
            let uu____2920 =
              let uu____2925 =
                let uu____2928 = FStar_SMTEncoding_Term.boxBool b  in
                [uu____2928]  in
              [uu____2925]  in
            let uu____2933 =
              let uu____2934 = FStar_SMTEncoding_Term.boxBool b  in
              FStar_SMTEncoding_Term.mk_HasType uu____2934 tt  in
            (uu____2920, [bb], uu____2933)  in
          FStar_SMTEncoding_Term.mkForall uu____2908 uu____2909  in
        (uu____2907, (FStar_Pervasives_Native.Some "bool typing"),
          "bool_typing")
         in
      FStar_SMTEncoding_Util.mkAssume uu____2899  in
    let uu____2959 =
      let uu____2962 =
        let uu____2963 =
          let uu____2971 =
            let uu____2972 =
              let uu____2983 =
                let uu____2984 =
                  let uu____2989 =
                    FStar_SMTEncoding_Term.mk_tester
                      (FStar_Pervasives_Native.fst
                         FStar_SMTEncoding_Term.boxBoolFun) x
                     in
                  (typing_pred, uu____2989)  in
                FStar_SMTEncoding_Util.mkImp uu____2984  in
              ([[typing_pred]], [xx], uu____2983)  in
            let uu____3016 =
              let uu____3031 = FStar_TypeChecker_Env.get_range env  in
              FStar_SMTEncoding_EncodeTerm.mkForall_fuel uu____3031  in
            uu____3016 uu____2972  in
          (uu____2971, (FStar_Pervasives_Native.Some "bool inversion"),
            "bool_inversion")
           in
        FStar_SMTEncoding_Util.mkAssume uu____2963  in
      [uu____2962]  in
    uu____2898 :: uu____2959  in
  let mk_int env nm tt =
    let lex_t1 =
      let uu____3055 =
        let uu____3056 =
          let uu____3062 =
            FStar_Ident.text_of_lid FStar_Parser_Const.lex_t_lid  in
          (uu____3062, FStar_SMTEncoding_Term.Term_sort)  in
        FStar_SMTEncoding_Term.mk_fv uu____3056  in
      FStar_All.pipe_left FStar_SMTEncoding_Util.mkFreeV uu____3055  in
    let typing_pred = FStar_SMTEncoding_Term.mk_HasType x tt  in
    let typing_pred_y = FStar_SMTEncoding_Term.mk_HasType y tt  in
    let aa =
      FStar_SMTEncoding_Term.mk_fv ("a", FStar_SMTEncoding_Term.Int_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let bb =
      FStar_SMTEncoding_Term.mk_fv ("b", FStar_SMTEncoding_Term.Int_sort)  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let precedes_y_x =
      let uu____3076 =
        FStar_SMTEncoding_Util.mkApp
          ("Prims.precedes", [lex_t1; lex_t1; y; x])
         in
      FStar_All.pipe_left FStar_SMTEncoding_Term.mk_Valid uu____3076  in
    let uu____3081 =
      let uu____3082 =
        let uu____3090 =
          let uu____3091 = FStar_TypeChecker_Env.get_range env  in
          let uu____3092 =
            let uu____3103 =
              let uu____3108 =
                let uu____3111 = FStar_SMTEncoding_Term.boxInt b  in
                [uu____3111]  in
              [uu____3108]  in
            let uu____3116 =
              let uu____3117 = FStar_SMTEncoding_Term.boxInt b  in
              FStar_SMTEncoding_Term.mk_HasType uu____3117 tt  in
            (uu____3103, [bb], uu____3116)  in
          FStar_SMTEncoding_Term.mkForall uu____3091 uu____3092  in
        (uu____3090, (FStar_Pervasives_Native.Some "int typing"),
          "int_typing")
         in
      FStar_SMTEncoding_Util.mkAssume uu____3082  in
    let uu____3142 =
      let uu____3145 =
        let uu____3146 =
          let uu____3154 =
            let uu____3155 =
              let uu____3166 =
                let uu____3167 =
                  let uu____3172 =
                    FStar_SMTEncoding_Term.mk_tester
                      (FStar_Pervasives_Native.fst
                         FStar_SMTEncoding_Term.boxIntFun) x
                     in
                  (typing_pred, uu____3172)  in
                FStar_SMTEncoding_Util.mkImp uu____3167  in
              ([[typing_pred]], [xx], uu____3166)  in
            let uu____3199 =
              let uu____3214 = FStar_TypeChecker_Env.get_range env  in
              FStar_SMTEncoding_EncodeTerm.mkForall_fuel uu____3214  in
            uu____3199 uu____3155  in
          (uu____3154, (FStar_Pervasives_Native.Some "int inversion"),
            "int_inversion")
           in
        FStar_SMTEncoding_Util.mkAssume uu____3146  in
      let uu____3219 =
        let uu____3222 =
          let uu____3223 =
            let uu____3231 =
              let uu____3232 =
                let uu____3243 =
                  let uu____3244 =
                    let uu____3249 =
                      let uu____3250 =
                        let uu____3253 =
                          let uu____3256 =
                            let uu____3259 =
                              let uu____3260 =
                                let uu____3265 =
                                  FStar_SMTEncoding_Term.unboxInt x  in
                                let uu____3266 =
                                  FStar_SMTEncoding_Util.mkInteger'
                                    (Prims.parse_int "0")
                                   in
                                (uu____3265, uu____3266)  in
                              FStar_SMTEncoding_Util.mkGT uu____3260  in
                            let uu____3268 =
                              let uu____3271 =
                                let uu____3272 =
                                  let uu____3277 =
                                    FStar_SMTEncoding_Term.unboxInt y  in
                                  let uu____3278 =
                                    FStar_SMTEncoding_Util.mkInteger'
                                      (Prims.parse_int "0")
                                     in
                                  (uu____3277, uu____3278)  in
                                FStar_SMTEncoding_Util.mkGTE uu____3272  in
                              let uu____3280 =
                                let uu____3283 =
                                  let uu____3284 =
                                    let uu____3289 =
                                      FStar_SMTEncoding_Term.unboxInt y  in
                                    let uu____3290 =
                                      FStar_SMTEncoding_Term.unboxInt x  in
                                    (uu____3289, uu____3290)  in
                                  FStar_SMTEncoding_Util.mkLT uu____3284  in
                                [uu____3283]  in
                              uu____3271 :: uu____3280  in
                            uu____3259 :: uu____3268  in
                          typing_pred_y :: uu____3256  in
                        typing_pred :: uu____3253  in
                      FStar_SMTEncoding_Util.mk_and_l uu____3250  in
                    (uu____3249, precedes_y_x)  in
                  FStar_SMTEncoding_Util.mkImp uu____3244  in
                ([[typing_pred; typing_pred_y; precedes_y_x]], [xx; yy],
                  uu____3243)
                 in
              let uu____3323 =
                let uu____3338 = FStar_TypeChecker_Env.get_range env  in
                FStar_SMTEncoding_EncodeTerm.mkForall_fuel uu____3338  in
              uu____3323 uu____3232  in
            (uu____3231,
              (FStar_Pervasives_Native.Some
                 "well-founded ordering on nat (alt)"),
              "well-founded-ordering-on-nat")
             in
          FStar_SMTEncoding_Util.mkAssume uu____3223  in
        [uu____3222]  in
      uu____3145 :: uu____3219  in
    uu____3081 :: uu____3142  in
  let mk_str env nm tt =
    let typing_pred = FStar_SMTEncoding_Term.mk_HasType x tt  in
    let bb =
      FStar_SMTEncoding_Term.mk_fv ("b", FStar_SMTEncoding_Term.String_sort)
       in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let uu____3366 =
      let uu____3367 =
        let uu____3375 =
          let uu____3376 = FStar_TypeChecker_Env.get_range env  in
          let uu____3377 =
            let uu____3388 =
              let uu____3393 =
                let uu____3396 = FStar_SMTEncoding_Term.boxString b  in
                [uu____3396]  in
              [uu____3393]  in
            let uu____3401 =
              let uu____3402 = FStar_SMTEncoding_Term.boxString b  in
              FStar_SMTEncoding_Term.mk_HasType uu____3402 tt  in
            (uu____3388, [bb], uu____3401)  in
          FStar_SMTEncoding_Term.mkForall uu____3376 uu____3377  in
        (uu____3375, (FStar_Pervasives_Native.Some "string typing"),
          "string_typing")
         in
      FStar_SMTEncoding_Util.mkAssume uu____3367  in
    let uu____3427 =
      let uu____3430 =
        let uu____3431 =
          let uu____3439 =
            let uu____3440 =
              let uu____3451 =
                let uu____3452 =
                  let uu____3457 =
                    FStar_SMTEncoding_Term.mk_tester
                      (FStar_Pervasives_Native.fst
                         FStar_SMTEncoding_Term.boxStringFun) x
                     in
                  (typing_pred, uu____3457)  in
                FStar_SMTEncoding_Util.mkImp uu____3452  in
              ([[typing_pred]], [xx], uu____3451)  in
            let uu____3484 =
              let uu____3499 = FStar_TypeChecker_Env.get_range env  in
              FStar_SMTEncoding_EncodeTerm.mkForall_fuel uu____3499  in
            uu____3484 uu____3440  in
          (uu____3439, (FStar_Pervasives_Native.Some "string inversion"),
            "string_inversion")
           in
        FStar_SMTEncoding_Util.mkAssume uu____3431  in
      [uu____3430]  in
    uu____3366 :: uu____3427  in
  let mk_true_interp env nm true_tm =
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [true_tm])  in
    let uu____3527 =
      FStar_SMTEncoding_Util.mkAssume
        (valid, (FStar_Pervasives_Native.Some "True interpretation"),
          "true_interp")
       in
    [uu____3527]  in
  let mk_false_interp env nm false_tm =
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [false_tm])  in
    let uu____3555 =
      let uu____3556 =
        let uu____3564 =
          FStar_SMTEncoding_Util.mkIff
            (FStar_SMTEncoding_Util.mkFalse, valid)
           in
        (uu____3564, (FStar_Pervasives_Native.Some "False interpretation"),
          "false_interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____3556  in
    [uu____3555]  in
  let mk_and_interp env conj uu____3585 =
    let aa =
      FStar_SMTEncoding_Term.mk_fv ("a", FStar_SMTEncoding_Term.Term_sort)
       in
    let bb =
      FStar_SMTEncoding_Term.mk_fv ("b", FStar_SMTEncoding_Term.Term_sort)
       in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let l_and_a_b = FStar_SMTEncoding_Util.mkApp (conj, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_and_a_b])  in
    let valid_a = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
    let valid_b = FStar_SMTEncoding_Util.mkApp ("Valid", [b])  in
    let uu____3614 =
      let uu____3615 =
        let uu____3623 =
          let uu____3624 = FStar_TypeChecker_Env.get_range env  in
          let uu____3625 =
            let uu____3636 =
              let uu____3637 =
                let uu____3642 =
                  FStar_SMTEncoding_Util.mkAnd (valid_a, valid_b)  in
                (uu____3642, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____3637  in
            ([[l_and_a_b]], [aa; bb], uu____3636)  in
          FStar_SMTEncoding_Term.mkForall uu____3624 uu____3625  in
        (uu____3623, (FStar_Pervasives_Native.Some "/\\ interpretation"),
          "l_and-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____3615  in
    [uu____3614]  in
  let mk_or_interp env disj uu____3695 =
    let aa =
      FStar_SMTEncoding_Term.mk_fv ("a", FStar_SMTEncoding_Term.Term_sort)
       in
    let bb =
      FStar_SMTEncoding_Term.mk_fv ("b", FStar_SMTEncoding_Term.Term_sort)
       in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let l_or_a_b = FStar_SMTEncoding_Util.mkApp (disj, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_or_a_b])  in
    let valid_a = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
    let valid_b = FStar_SMTEncoding_Util.mkApp ("Valid", [b])  in
    let uu____3724 =
      let uu____3725 =
        let uu____3733 =
          let uu____3734 = FStar_TypeChecker_Env.get_range env  in
          let uu____3735 =
            let uu____3746 =
              let uu____3747 =
                let uu____3752 =
                  FStar_SMTEncoding_Util.mkOr (valid_a, valid_b)  in
                (uu____3752, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____3747  in
            ([[l_or_a_b]], [aa; bb], uu____3746)  in
          FStar_SMTEncoding_Term.mkForall uu____3734 uu____3735  in
        (uu____3733, (FStar_Pervasives_Native.Some "\\/ interpretation"),
          "l_or-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____3725  in
    [uu____3724]  in
  let mk_eq2_interp env eq2 tt =
    let aa =
      FStar_SMTEncoding_Term.mk_fv ("a", FStar_SMTEncoding_Term.Term_sort)
       in
    let xx1 =
      FStar_SMTEncoding_Term.mk_fv ("x", FStar_SMTEncoding_Term.Term_sort)
       in
    let yy1 =
      FStar_SMTEncoding_Term.mk_fv ("y", FStar_SMTEncoding_Term.Term_sort)
       in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let x1 = FStar_SMTEncoding_Util.mkFreeV xx1  in
    let y1 = FStar_SMTEncoding_Util.mkFreeV yy1  in
    let eq2_x_y = FStar_SMTEncoding_Util.mkApp (eq2, [a; x1; y1])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [eq2_x_y])  in
    let uu____3828 =
      let uu____3829 =
        let uu____3837 =
          let uu____3838 = FStar_TypeChecker_Env.get_range env  in
          let uu____3839 =
            let uu____3850 =
              let uu____3851 =
                let uu____3856 = FStar_SMTEncoding_Util.mkEq (x1, y1)  in
                (uu____3856, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____3851  in
            ([[eq2_x_y]], [aa; xx1; yy1], uu____3850)  in
          FStar_SMTEncoding_Term.mkForall uu____3838 uu____3839  in
        (uu____3837, (FStar_Pervasives_Native.Some "Eq2 interpretation"),
          "eq2-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____3829  in
    [uu____3828]  in
  let mk_eq3_interp env eq3 tt =
    let aa =
      FStar_SMTEncoding_Term.mk_fv ("a", FStar_SMTEncoding_Term.Term_sort)
       in
    let bb =
      FStar_SMTEncoding_Term.mk_fv ("b", FStar_SMTEncoding_Term.Term_sort)
       in
    let xx1 =
      FStar_SMTEncoding_Term.mk_fv ("x", FStar_SMTEncoding_Term.Term_sort)
       in
    let yy1 =
      FStar_SMTEncoding_Term.mk_fv ("y", FStar_SMTEncoding_Term.Term_sort)
       in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let x1 = FStar_SMTEncoding_Util.mkFreeV xx1  in
    let y1 = FStar_SMTEncoding_Util.mkFreeV yy1  in
    let eq3_x_y = FStar_SMTEncoding_Util.mkApp (eq3, [a; b; x1; y1])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [eq3_x_y])  in
    let uu____3944 =
      let uu____3945 =
        let uu____3953 =
          let uu____3954 = FStar_TypeChecker_Env.get_range env  in
          let uu____3955 =
            let uu____3966 =
              let uu____3967 =
                let uu____3972 = FStar_SMTEncoding_Util.mkEq (x1, y1)  in
                (uu____3972, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____3967  in
            ([[eq3_x_y]], [aa; bb; xx1; yy1], uu____3966)  in
          FStar_SMTEncoding_Term.mkForall uu____3954 uu____3955  in
        (uu____3953, (FStar_Pervasives_Native.Some "Eq3 interpretation"),
          "eq3-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____3945  in
    [uu____3944]  in
  let mk_imp_interp env imp tt =
    let aa =
      FStar_SMTEncoding_Term.mk_fv ("a", FStar_SMTEncoding_Term.Term_sort)
       in
    let bb =
      FStar_SMTEncoding_Term.mk_fv ("b", FStar_SMTEncoding_Term.Term_sort)
       in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let l_imp_a_b = FStar_SMTEncoding_Util.mkApp (imp, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_imp_a_b])  in
    let valid_a = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
    let valid_b = FStar_SMTEncoding_Util.mkApp ("Valid", [b])  in
    let uu____4070 =
      let uu____4071 =
        let uu____4079 =
          let uu____4080 = FStar_TypeChecker_Env.get_range env  in
          let uu____4081 =
            let uu____4092 =
              let uu____4093 =
                let uu____4098 =
                  FStar_SMTEncoding_Util.mkImp (valid_a, valid_b)  in
                (uu____4098, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____4093  in
            ([[l_imp_a_b]], [aa; bb], uu____4092)  in
          FStar_SMTEncoding_Term.mkForall uu____4080 uu____4081  in
        (uu____4079, (FStar_Pervasives_Native.Some "==> interpretation"),
          "l_imp-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____4071  in
    [uu____4070]  in
  let mk_iff_interp env iff tt =
    let aa =
      FStar_SMTEncoding_Term.mk_fv ("a", FStar_SMTEncoding_Term.Term_sort)
       in
    let bb =
      FStar_SMTEncoding_Term.mk_fv ("b", FStar_SMTEncoding_Term.Term_sort)
       in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let l_iff_a_b = FStar_SMTEncoding_Util.mkApp (iff, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_iff_a_b])  in
    let valid_a = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
    let valid_b = FStar_SMTEncoding_Util.mkApp ("Valid", [b])  in
    let uu____4180 =
      let uu____4181 =
        let uu____4189 =
          let uu____4190 = FStar_TypeChecker_Env.get_range env  in
          let uu____4191 =
            let uu____4202 =
              let uu____4203 =
                let uu____4208 =
                  FStar_SMTEncoding_Util.mkIff (valid_a, valid_b)  in
                (uu____4208, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____4203  in
            ([[l_iff_a_b]], [aa; bb], uu____4202)  in
          FStar_SMTEncoding_Term.mkForall uu____4190 uu____4191  in
        (uu____4189, (FStar_Pervasives_Native.Some "<==> interpretation"),
          "l_iff-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____4181  in
    [uu____4180]  in
  let mk_not_interp env l_not tt =
    let aa =
      FStar_SMTEncoding_Term.mk_fv ("a", FStar_SMTEncoding_Term.Term_sort)
       in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let l_not_a = FStar_SMTEncoding_Util.mkApp (l_not, [a])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_not_a])  in
    let not_valid_a =
      let uu____4277 = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
      FStar_All.pipe_left FStar_SMTEncoding_Util.mkNot uu____4277  in
    let uu____4282 =
      let uu____4283 =
        let uu____4291 =
          let uu____4292 = FStar_TypeChecker_Env.get_range env  in
          let uu____4293 =
            let uu____4304 =
              FStar_SMTEncoding_Util.mkIff (not_valid_a, valid)  in
            ([[l_not_a]], [aa], uu____4304)  in
          FStar_SMTEncoding_Term.mkForall uu____4292 uu____4293  in
        (uu____4291, (FStar_Pervasives_Native.Some "not interpretation"),
          "l_not-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____4283  in
    [uu____4282]  in
  let mk_range_interp env range tt =
    let range_ty = FStar_SMTEncoding_Util.mkApp (range, [])  in
    let uu____4355 =
      let uu____4356 =
        let uu____4364 =
          let uu____4365 = FStar_SMTEncoding_Term.mk_Range_const ()  in
          FStar_SMTEncoding_Term.mk_HasTypeZ uu____4365 range_ty  in
        let uu____4366 =
          FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.mk_unique
            "typing_range_const"
           in
        (uu____4364, (FStar_Pervasives_Native.Some "Range_const typing"),
          uu____4366)
         in
      FStar_SMTEncoding_Util.mkAssume uu____4356  in
    [uu____4355]  in
  let mk_inversion_axiom env inversion tt =
    let tt1 =
      FStar_SMTEncoding_Term.mk_fv ("t", FStar_SMTEncoding_Term.Term_sort)
       in
    let t = FStar_SMTEncoding_Util.mkFreeV tt1  in
    let xx1 =
      FStar_SMTEncoding_Term.mk_fv ("x", FStar_SMTEncoding_Term.Term_sort)
       in
    let x1 = FStar_SMTEncoding_Util.mkFreeV xx1  in
    let inversion_t = FStar_SMTEncoding_Util.mkApp (inversion, [t])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [inversion_t])  in
    let body =
      let hastypeZ = FStar_SMTEncoding_Term.mk_HasTypeZ x1 t  in
      let hastypeS =
        let uu____4410 = FStar_SMTEncoding_Term.n_fuel (Prims.parse_int "1")
           in
        FStar_SMTEncoding_Term.mk_HasTypeFuel uu____4410 x1 t  in
      let uu____4412 = FStar_TypeChecker_Env.get_range env  in
      let uu____4413 =
        let uu____4424 = FStar_SMTEncoding_Util.mkImp (hastypeZ, hastypeS)
           in
        ([[hastypeZ]], [xx1], uu____4424)  in
      FStar_SMTEncoding_Term.mkForall uu____4412 uu____4413  in
    let uu____4449 =
      let uu____4450 =
        let uu____4458 =
          let uu____4459 = FStar_TypeChecker_Env.get_range env  in
          let uu____4460 =
            let uu____4471 = FStar_SMTEncoding_Util.mkImp (valid, body)  in
            ([[inversion_t]], [tt1], uu____4471)  in
          FStar_SMTEncoding_Term.mkForall uu____4459 uu____4460  in
        (uu____4458,
          (FStar_Pervasives_Native.Some "inversion interpretation"),
          "inversion-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____4450  in
    [uu____4449]  in
  let mk_with_type_axiom env with_type1 tt =
    let tt1 =
      FStar_SMTEncoding_Term.mk_fv ("t", FStar_SMTEncoding_Term.Term_sort)
       in
    let t = FStar_SMTEncoding_Util.mkFreeV tt1  in
    let ee =
      FStar_SMTEncoding_Term.mk_fv ("e", FStar_SMTEncoding_Term.Term_sort)
       in
    let e = FStar_SMTEncoding_Util.mkFreeV ee  in
    let with_type_t_e = FStar_SMTEncoding_Util.mkApp (with_type1, [t; e])  in
    let uu____4530 =
      let uu____4531 =
        let uu____4539 =
          let uu____4540 = FStar_TypeChecker_Env.get_range env  in
          let uu____4541 =
            let uu____4557 =
              let uu____4558 =
                let uu____4563 =
                  FStar_SMTEncoding_Util.mkEq (with_type_t_e, e)  in
                let uu____4564 =
                  FStar_SMTEncoding_Term.mk_HasType with_type_t_e t  in
                (uu____4563, uu____4564)  in
              FStar_SMTEncoding_Util.mkAnd uu____4558  in
            ([[with_type_t_e]],
              (FStar_Pervasives_Native.Some (Prims.parse_int "0")),
              [tt1; ee], uu____4557)
             in
          FStar_SMTEncoding_Term.mkForall' uu____4540 uu____4541  in
        (uu____4539,
          (FStar_Pervasives_Native.Some "with_type primitive axiom"),
          "@with_type_primitive_axiom")
         in
      FStar_SMTEncoding_Util.mkAssume uu____4531  in
    [uu____4530]  in
  let prims1 =
    [(FStar_Parser_Const.unit_lid, mk_unit);
    (FStar_Parser_Const.bool_lid, mk_bool);
    (FStar_Parser_Const.int_lid, mk_int);
    (FStar_Parser_Const.string_lid, mk_str);
    (FStar_Parser_Const.true_lid, mk_true_interp);
    (FStar_Parser_Const.false_lid, mk_false_interp);
    (FStar_Parser_Const.and_lid, mk_and_interp);
    (FStar_Parser_Const.or_lid, mk_or_interp);
    (FStar_Parser_Const.eq2_lid, mk_eq2_interp);
    (FStar_Parser_Const.eq3_lid, mk_eq3_interp);
    (FStar_Parser_Const.imp_lid, mk_imp_interp);
    (FStar_Parser_Const.iff_lid, mk_iff_interp);
    (FStar_Parser_Const.not_lid, mk_not_interp);
    (FStar_Parser_Const.range_lid, mk_range_interp);
    (FStar_Parser_Const.inversion_lid, mk_inversion_axiom);
    (FStar_Parser_Const.with_type_lid, mk_with_type_axiom)]  in
  fun env  ->
    fun t  ->
      fun s  ->
        fun tt  ->
          let uu____5094 =
            FStar_Util.find_opt
              (fun uu____5132  ->
                 match uu____5132 with
                 | (l,uu____5148) -> FStar_Ident.lid_equals l t) prims1
             in
          match uu____5094 with
          | FStar_Pervasives_Native.None  -> []
          | FStar_Pervasives_Native.Some (uu____5191,f) -> f env s tt
  
let (encode_smt_lemma :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.fv ->
      FStar_Syntax_Syntax.typ -> FStar_SMTEncoding_Term.decl Prims.list)
  =
  fun env  ->
    fun fv  ->
      fun t  ->
        let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v  in
        let uu____5252 =
          FStar_SMTEncoding_EncodeTerm.encode_function_type_as_formula t env
           in
        match uu____5252 with
        | (form,decls) ->
            let uu____5261 =
              let uu____5264 =
                FStar_SMTEncoding_Util.mkAssume
                  (form,
                    (FStar_Pervasives_Native.Some
                       (Prims.strcat "Lemma: " lid.FStar_Ident.str)),
                    (Prims.strcat "lemma_" lid.FStar_Ident.str))
                 in
              [uu____5264]  in
            FStar_List.append decls uu____5261
  
let (encode_free_var :
  Prims.bool ->
    FStar_SMTEncoding_Env.env_t ->
      FStar_Syntax_Syntax.fv ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
            FStar_Syntax_Syntax.qualifier Prims.list ->
              (FStar_SMTEncoding_Term.decl Prims.list *
                FStar_SMTEncoding_Env.env_t))
  =
  fun uninterpreted  ->
    fun env  ->
      fun fv  ->
        fun tt  ->
          fun t_norm  ->
            fun quals  ->
              let lid =
                (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v  in
              let uu____5321 =
                ((let uu____5325 =
                    (FStar_Syntax_Util.is_pure_or_ghost_function t_norm) ||
                      (FStar_TypeChecker_Env.is_reifiable_function
                         env.FStar_SMTEncoding_Env.tcenv t_norm)
                     in
                  FStar_All.pipe_left Prims.op_Negation uu____5325) ||
                   (FStar_Syntax_Util.is_lemma t_norm))
                  || uninterpreted
                 in
              if uu____5321
              then
                let arg_sorts =
                  let uu____5339 =
                    let uu____5340 = FStar_Syntax_Subst.compress t_norm  in
                    uu____5340.FStar_Syntax_Syntax.n  in
                  match uu____5339 with
                  | FStar_Syntax_Syntax.Tm_arrow (binders,uu____5346) ->
                      FStar_All.pipe_right binders
                        (FStar_List.map
                           (fun uu____5384  ->
                              FStar_SMTEncoding_Term.Term_sort))
                  | uu____5391 -> []  in
                let arity = FStar_List.length arg_sorts  in
                let uu____5393 =
                  FStar_SMTEncoding_Env.new_term_constant_and_tok_from_lid
                    env lid arity
                   in
                match uu____5393 with
                | (vname,vtok,env1) ->
                    let d =
                      FStar_SMTEncoding_Term.DeclFun
                        (vname, arg_sorts, FStar_SMTEncoding_Term.Term_sort,
                          (FStar_Pervasives_Native.Some
                             "Uninterpreted function symbol for impure function"))
                       in
                    let dd =
                      FStar_SMTEncoding_Term.DeclFun
                        (vtok, [], FStar_SMTEncoding_Term.Term_sort,
                          (FStar_Pervasives_Native.Some
                             "Uninterpreted name for impure function"))
                       in
                    ([d; dd], env1)
              else
                (let uu____5435 = prims.is lid  in
                 if uu____5435
                 then
                   let vname =
                     FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.new_fvar
                       lid
                      in
                   let uu____5446 = prims.mk lid vname  in
                   match uu____5446 with
                   | (tok,arity,definition) ->
                       let env1 =
                         FStar_SMTEncoding_Env.push_free_var env lid arity
                           vname (FStar_Pervasives_Native.Some tok)
                          in
                       (definition, env1)
                 else
                   (let encode_non_total_function_typ =
                      lid.FStar_Ident.nsstr <> "Prims"  in
                    let uu____5480 =
                      let uu____5499 =
                        FStar_SMTEncoding_EncodeTerm.curried_arrow_formals_comp
                          t_norm
                         in
                      match uu____5499 with
                      | (args,comp) ->
                          let comp1 =
                            let uu____5527 =
                              FStar_TypeChecker_Env.is_reifiable_comp
                                env.FStar_SMTEncoding_Env.tcenv comp
                               in
                            if uu____5527
                            then
                              let uu____5532 =
                                FStar_TypeChecker_Env.reify_comp
                                  (let uu___383_5535 =
                                     env.FStar_SMTEncoding_Env.tcenv  in
                                   {
                                     FStar_TypeChecker_Env.solver =
                                       (uu___383_5535.FStar_TypeChecker_Env.solver);
                                     FStar_TypeChecker_Env.range =
                                       (uu___383_5535.FStar_TypeChecker_Env.range);
                                     FStar_TypeChecker_Env.curmodule =
                                       (uu___383_5535.FStar_TypeChecker_Env.curmodule);
                                     FStar_TypeChecker_Env.gamma =
                                       (uu___383_5535.FStar_TypeChecker_Env.gamma);
                                     FStar_TypeChecker_Env.gamma_sig =
                                       (uu___383_5535.FStar_TypeChecker_Env.gamma_sig);
                                     FStar_TypeChecker_Env.gamma_cache =
                                       (uu___383_5535.FStar_TypeChecker_Env.gamma_cache);
                                     FStar_TypeChecker_Env.modules =
                                       (uu___383_5535.FStar_TypeChecker_Env.modules);
                                     FStar_TypeChecker_Env.expected_typ =
                                       (uu___383_5535.FStar_TypeChecker_Env.expected_typ);
                                     FStar_TypeChecker_Env.sigtab =
                                       (uu___383_5535.FStar_TypeChecker_Env.sigtab);
                                     FStar_TypeChecker_Env.attrtab =
                                       (uu___383_5535.FStar_TypeChecker_Env.attrtab);
                                     FStar_TypeChecker_Env.is_pattern =
                                       (uu___383_5535.FStar_TypeChecker_Env.is_pattern);
                                     FStar_TypeChecker_Env.instantiate_imp =
                                       (uu___383_5535.FStar_TypeChecker_Env.instantiate_imp);
                                     FStar_TypeChecker_Env.effects =
                                       (uu___383_5535.FStar_TypeChecker_Env.effects);
                                     FStar_TypeChecker_Env.generalize =
                                       (uu___383_5535.FStar_TypeChecker_Env.generalize);
                                     FStar_TypeChecker_Env.letrecs =
                                       (uu___383_5535.FStar_TypeChecker_Env.letrecs);
                                     FStar_TypeChecker_Env.top_level =
                                       (uu___383_5535.FStar_TypeChecker_Env.top_level);
                                     FStar_TypeChecker_Env.check_uvars =
                                       (uu___383_5535.FStar_TypeChecker_Env.check_uvars);
                                     FStar_TypeChecker_Env.use_eq =
                                       (uu___383_5535.FStar_TypeChecker_Env.use_eq);
                                     FStar_TypeChecker_Env.is_iface =
                                       (uu___383_5535.FStar_TypeChecker_Env.is_iface);
                                     FStar_TypeChecker_Env.admit =
                                       (uu___383_5535.FStar_TypeChecker_Env.admit);
                                     FStar_TypeChecker_Env.lax = true;
                                     FStar_TypeChecker_Env.lax_universes =
                                       (uu___383_5535.FStar_TypeChecker_Env.lax_universes);
                                     FStar_TypeChecker_Env.phase1 =
                                       (uu___383_5535.FStar_TypeChecker_Env.phase1);
                                     FStar_TypeChecker_Env.failhard =
                                       (uu___383_5535.FStar_TypeChecker_Env.failhard);
                                     FStar_TypeChecker_Env.nosynth =
                                       (uu___383_5535.FStar_TypeChecker_Env.nosynth);
                                     FStar_TypeChecker_Env.uvar_subtyping =
                                       (uu___383_5535.FStar_TypeChecker_Env.uvar_subtyping);
                                     FStar_TypeChecker_Env.tc_term =
                                       (uu___383_5535.FStar_TypeChecker_Env.tc_term);
                                     FStar_TypeChecker_Env.type_of =
                                       (uu___383_5535.FStar_TypeChecker_Env.type_of);
                                     FStar_TypeChecker_Env.universe_of =
                                       (uu___383_5535.FStar_TypeChecker_Env.universe_of);
                                     FStar_TypeChecker_Env.check_type_of =
                                       (uu___383_5535.FStar_TypeChecker_Env.check_type_of);
                                     FStar_TypeChecker_Env.use_bv_sorts =
                                       (uu___383_5535.FStar_TypeChecker_Env.use_bv_sorts);
                                     FStar_TypeChecker_Env.qtbl_name_and_index
                                       =
                                       (uu___383_5535.FStar_TypeChecker_Env.qtbl_name_and_index);
                                     FStar_TypeChecker_Env.normalized_eff_names
                                       =
                                       (uu___383_5535.FStar_TypeChecker_Env.normalized_eff_names);
                                     FStar_TypeChecker_Env.fv_delta_depths =
                                       (uu___383_5535.FStar_TypeChecker_Env.fv_delta_depths);
                                     FStar_TypeChecker_Env.proof_ns =
                                       (uu___383_5535.FStar_TypeChecker_Env.proof_ns);
                                     FStar_TypeChecker_Env.synth_hook =
                                       (uu___383_5535.FStar_TypeChecker_Env.synth_hook);
                                     FStar_TypeChecker_Env.splice =
                                       (uu___383_5535.FStar_TypeChecker_Env.splice);
                                     FStar_TypeChecker_Env.postprocess =
                                       (uu___383_5535.FStar_TypeChecker_Env.postprocess);
                                     FStar_TypeChecker_Env.is_native_tactic =
                                       (uu___383_5535.FStar_TypeChecker_Env.is_native_tactic);
                                     FStar_TypeChecker_Env.identifier_info =
                                       (uu___383_5535.FStar_TypeChecker_Env.identifier_info);
                                     FStar_TypeChecker_Env.tc_hooks =
                                       (uu___383_5535.FStar_TypeChecker_Env.tc_hooks);
                                     FStar_TypeChecker_Env.dsenv =
                                       (uu___383_5535.FStar_TypeChecker_Env.dsenv);
                                     FStar_TypeChecker_Env.nbe =
                                       (uu___383_5535.FStar_TypeChecker_Env.nbe)
                                   }) comp FStar_Syntax_Syntax.U_unknown
                                 in
                              FStar_Syntax_Syntax.mk_Total uu____5532
                            else comp  in
                          if encode_non_total_function_typ
                          then
                            let uu____5558 =
                              FStar_TypeChecker_Util.pure_or_ghost_pre_and_post
                                env.FStar_SMTEncoding_Env.tcenv comp1
                               in
                            (args, uu____5558)
                          else
                            (args,
                              (FStar_Pervasives_Native.None,
                                (FStar_Syntax_Util.comp_result comp1)))
                       in
                    match uu____5480 with
                    | (formals,(pre_opt,res_t)) ->
                        let mk_disc_proj_axioms guard encoded_res_t vapp vars
                          =
                          FStar_All.pipe_right quals
                            (FStar_List.collect
                               (fun uu___373_5666  ->
                                  match uu___373_5666 with
                                  | FStar_Syntax_Syntax.Discriminator d ->
                                      let uu____5670 = FStar_Util.prefix vars
                                         in
                                      (match uu____5670 with
                                       | (uu____5703,xxv) ->
                                           let xx =
                                             let uu____5742 =
                                               let uu____5743 =
                                                 let uu____5749 =
                                                   FStar_SMTEncoding_Term.fv_name
                                                     xxv
                                                    in
                                                 (uu____5749,
                                                   FStar_SMTEncoding_Term.Term_sort)
                                                  in
                                               FStar_SMTEncoding_Term.mk_fv
                                                 uu____5743
                                                in
                                             FStar_All.pipe_left
                                               FStar_SMTEncoding_Util.mkFreeV
                                               uu____5742
                                              in
                                           let uu____5752 =
                                             let uu____5753 =
                                               let uu____5761 =
                                                 let uu____5762 =
                                                   FStar_Syntax_Syntax.range_of_fv
                                                     fv
                                                    in
                                                 let uu____5763 =
                                                   let uu____5774 =
                                                     let uu____5775 =
                                                       let uu____5780 =
                                                         let uu____5781 =
                                                           FStar_SMTEncoding_Term.mk_tester
                                                             (FStar_SMTEncoding_Env.escape
                                                                d.FStar_Ident.str)
                                                             xx
                                                            in
                                                         FStar_All.pipe_left
                                                           FStar_SMTEncoding_Term.boxBool
                                                           uu____5781
                                                          in
                                                       (vapp, uu____5780)  in
                                                     FStar_SMTEncoding_Util.mkEq
                                                       uu____5775
                                                      in
                                                   ([[vapp]], vars,
                                                     uu____5774)
                                                    in
                                                 FStar_SMTEncoding_Term.mkForall
                                                   uu____5762 uu____5763
                                                  in
                                               (uu____5761,
                                                 (FStar_Pervasives_Native.Some
                                                    "Discriminator equation"),
                                                 (Prims.strcat
                                                    "disc_equation_"
                                                    (FStar_SMTEncoding_Env.escape
                                                       d.FStar_Ident.str)))
                                                in
                                             FStar_SMTEncoding_Util.mkAssume
                                               uu____5753
                                              in
                                           [uu____5752])
                                  | FStar_Syntax_Syntax.Projector (d,f) ->
                                      let uu____5796 = FStar_Util.prefix vars
                                         in
                                      (match uu____5796 with
                                       | (uu____5829,xxv) ->
                                           let xx =
                                             let uu____5868 =
                                               let uu____5869 =
                                                 let uu____5875 =
                                                   FStar_SMTEncoding_Term.fv_name
                                                     xxv
                                                    in
                                                 (uu____5875,
                                                   FStar_SMTEncoding_Term.Term_sort)
                                                  in
                                               FStar_SMTEncoding_Term.mk_fv
                                                 uu____5869
                                                in
                                             FStar_All.pipe_left
                                               FStar_SMTEncoding_Util.mkFreeV
                                               uu____5868
                                              in
                                           let f1 =
                                             {
                                               FStar_Syntax_Syntax.ppname = f;
                                               FStar_Syntax_Syntax.index =
                                                 (Prims.parse_int "0");
                                               FStar_Syntax_Syntax.sort =
                                                 FStar_Syntax_Syntax.tun
                                             }  in
                                           let tp_name =
                                             FStar_SMTEncoding_Env.mk_term_projector_name
                                               d f1
                                              in
                                           let prim_app =
                                             FStar_SMTEncoding_Util.mkApp
                                               (tp_name, [xx])
                                              in
                                           let uu____5886 =
                                             let uu____5887 =
                                               let uu____5895 =
                                                 let uu____5896 =
                                                   FStar_Syntax_Syntax.range_of_fv
                                                     fv
                                                    in
                                                 let uu____5897 =
                                                   let uu____5908 =
                                                     FStar_SMTEncoding_Util.mkEq
                                                       (vapp, prim_app)
                                                      in
                                                   ([[vapp]], vars,
                                                     uu____5908)
                                                    in
                                                 FStar_SMTEncoding_Term.mkForall
                                                   uu____5896 uu____5897
                                                  in
                                               (uu____5895,
                                                 (FStar_Pervasives_Native.Some
                                                    "Projector equation"),
                                                 (Prims.strcat
                                                    "proj_equation_" tp_name))
                                                in
                                             FStar_SMTEncoding_Util.mkAssume
                                               uu____5887
                                              in
                                           [uu____5886])
                                  | uu____5921 -> []))
                           in
                        let uu____5922 =
                          FStar_SMTEncoding_EncodeTerm.encode_binders
                            FStar_Pervasives_Native.None formals env
                           in
                        (match uu____5922 with
                         | (vars,guards,env',decls1,uu____5949) ->
                             let uu____5962 =
                               match pre_opt with
                               | FStar_Pervasives_Native.None  ->
                                   let uu____5975 =
                                     FStar_SMTEncoding_Util.mk_and_l guards
                                      in
                                   (uu____5975, decls1)
                               | FStar_Pervasives_Native.Some p ->
                                   let uu____5979 =
                                     FStar_SMTEncoding_EncodeTerm.encode_formula
                                       p env'
                                      in
                                   (match uu____5979 with
                                    | (g,ds) ->
                                        let uu____5992 =
                                          FStar_SMTEncoding_Util.mk_and_l (g
                                            :: guards)
                                           in
                                        (uu____5992,
                                          (FStar_List.append decls1 ds)))
                                in
                             (match uu____5962 with
                              | (guard,decls11) ->
                                  let dummy_var =
                                    FStar_SMTEncoding_Term.mk_fv
                                      ("@dummy",
                                        FStar_SMTEncoding_Term.dummy_sort)
                                     in
                                  let dummy_tm =
                                    FStar_SMTEncoding_Term.mkFreeV dummy_var
                                      FStar_Range.dummyRange
                                     in
                                  let should_thunk =
                                    let is_type1 t =
                                      let uu____6020 =
                                        let uu____6021 =
                                          FStar_Syntax_Subst.compress t  in
                                        uu____6021.FStar_Syntax_Syntax.n  in
                                      match uu____6020 with
                                      | FStar_Syntax_Syntax.Tm_type
                                          uu____6025 -> true
                                      | uu____6027 -> false  in
                                    let is_squash1 t =
                                      let uu____6036 =
                                        FStar_Syntax_Util.head_and_args t  in
                                      match uu____6036 with
                                      | (head1,uu____6055) ->
                                          let uu____6080 =
                                            let uu____6081 =
                                              FStar_Syntax_Util.un_uinst
                                                head1
                                               in
                                            uu____6081.FStar_Syntax_Syntax.n
                                             in
                                          (match uu____6080 with
                                           | FStar_Syntax_Syntax.Tm_fvar fv1
                                               ->
                                               FStar_Syntax_Syntax.fv_eq_lid
                                                 fv1
                                                 FStar_Parser_Const.squash_lid
                                           | FStar_Syntax_Syntax.Tm_refine
                                               ({
                                                  FStar_Syntax_Syntax.ppname
                                                    = uu____6086;
                                                  FStar_Syntax_Syntax.index =
                                                    uu____6087;
                                                  FStar_Syntax_Syntax.sort =
                                                    {
                                                      FStar_Syntax_Syntax.n =
                                                        FStar_Syntax_Syntax.Tm_fvar
                                                        fv1;
                                                      FStar_Syntax_Syntax.pos
                                                        = uu____6089;
                                                      FStar_Syntax_Syntax.vars
                                                        = uu____6090;_};_},uu____6091)
                                               ->
                                               FStar_Syntax_Syntax.fv_eq_lid
                                                 fv1
                                                 FStar_Parser_Const.unit_lid
                                           | uu____6099 -> false)
                                       in
                                    (((lid.FStar_Ident.nsstr <> "Prims") &&
                                        (let uu____6104 =
                                           FStar_All.pipe_right quals
                                             (FStar_List.contains
                                                FStar_Syntax_Syntax.Logic)
                                            in
                                         Prims.op_Negation uu____6104))
                                       &&
                                       (let uu____6110 = is_squash1 t_norm
                                           in
                                        Prims.op_Negation uu____6110))
                                      &&
                                      (let uu____6113 = is_type1 t_norm  in
                                       Prims.op_Negation uu____6113)
                                     in
                                  let uu____6115 =
                                    match vars with
                                    | [] when should_thunk ->
                                        (true, [dummy_var])
                                    | uu____6174 -> (false, vars)  in
                                  (match uu____6115 with
                                   | (thunked,vars1) ->
                                       let arity = FStar_List.length formals
                                          in
                                       let uu____6226 =
                                         FStar_SMTEncoding_Env.new_term_constant_and_tok_from_lid_maybe_thunked
                                           env lid arity thunked
                                          in
                                       (match uu____6226 with
                                        | (vname,vtok_opt,env1) ->
                                            let get_vtok uu____6264 =
                                              FStar_Option.get vtok_opt  in
                                            let vtok_tm =
                                              match (formals, vtok_opt) with
                                              | ([],uu____6278) when
                                                  Prims.op_Negation thunked
                                                  ->
                                                  let uu____6299 =
                                                    FStar_SMTEncoding_Term.mk_fv
                                                      (vname,
                                                        FStar_SMTEncoding_Term.Term_sort)
                                                     in
                                                  FStar_All.pipe_left
                                                    FStar_SMTEncoding_Util.mkFreeV
                                                    uu____6299
                                              | uu____6301 when thunked ->
                                                  FStar_SMTEncoding_Util.mkApp
                                                    (vname, [dummy_tm])
                                              | uu____6320 ->
                                                  let uu____6336 =
                                                    let uu____6344 =
                                                      get_vtok ()  in
                                                    (uu____6344, [])  in
                                                  FStar_SMTEncoding_Util.mkApp
                                                    uu____6336
                                               in
                                            let vtok_app =
                                              FStar_SMTEncoding_EncodeTerm.mk_Apply
                                                vtok_tm vars1
                                               in
                                            let vapp =
                                              let uu____6351 =
                                                let uu____6359 =
                                                  FStar_List.map
                                                    FStar_SMTEncoding_Util.mkFreeV
                                                    vars1
                                                   in
                                                (vname, uu____6359)  in
                                              FStar_SMTEncoding_Util.mkApp
                                                uu____6351
                                               in
                                            let uu____6373 =
                                              let vname_decl =
                                                let uu____6381 =
                                                  let uu____6393 =
                                                    FStar_All.pipe_right
                                                      vars1
                                                      (FStar_List.map
                                                         FStar_SMTEncoding_Term.fv_sort)
                                                     in
                                                  (vname, uu____6393,
                                                    FStar_SMTEncoding_Term.Term_sort,
                                                    FStar_Pervasives_Native.None)
                                                   in
                                                FStar_SMTEncoding_Term.DeclFun
                                                  uu____6381
                                                 in
                                              let uu____6404 =
                                                let env2 =
                                                  let uu___384_6410 = env1
                                                     in
                                                  {
                                                    FStar_SMTEncoding_Env.bvar_bindings
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.bvar_bindings);
                                                    FStar_SMTEncoding_Env.fvar_bindings
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.fvar_bindings);
                                                    FStar_SMTEncoding_Env.depth
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.depth);
                                                    FStar_SMTEncoding_Env.tcenv
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.tcenv);
                                                    FStar_SMTEncoding_Env.warn
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.warn);
                                                    FStar_SMTEncoding_Env.cache
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.cache);
                                                    FStar_SMTEncoding_Env.nolabels
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.nolabels);
                                                    FStar_SMTEncoding_Env.use_zfuel_name
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.use_zfuel_name);
                                                    FStar_SMTEncoding_Env.encode_non_total_function_typ
                                                      =
                                                      encode_non_total_function_typ;
                                                    FStar_SMTEncoding_Env.current_module_name
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.current_module_name);
                                                    FStar_SMTEncoding_Env.encoding_quantifier
                                                      =
                                                      (uu___384_6410.FStar_SMTEncoding_Env.encoding_quantifier)
                                                  }  in
                                                let uu____6411 =
                                                  let uu____6413 =
                                                    FStar_SMTEncoding_EncodeTerm.head_normal
                                                      env2 tt
                                                     in
                                                  Prims.op_Negation
                                                    uu____6413
                                                   in
                                                if uu____6411
                                                then
                                                  FStar_SMTEncoding_EncodeTerm.encode_term_pred
                                                    FStar_Pervasives_Native.None
                                                    tt env2 vtok_tm
                                                else
                                                  FStar_SMTEncoding_EncodeTerm.encode_term_pred
                                                    FStar_Pervasives_Native.None
                                                    t_norm env2 vtok_tm
                                                 in
                                              match uu____6404 with
                                              | (tok_typing,decls2) ->
                                                  let uu____6430 =
                                                    match vars1 with
                                                    | [] ->
                                                        let tok_typing1 =
                                                          FStar_SMTEncoding_Util.mkAssume
                                                            (tok_typing,
                                                              (FStar_Pervasives_Native.Some
                                                                 "function token typing"),
                                                              (Prims.strcat
                                                                 "function_token_typing_"
                                                                 vname))
                                                           in
                                                        let uu____6456 =
                                                          let uu____6457 =
                                                            let uu____6460 =
                                                              let uu____6461
                                                                =
                                                                FStar_SMTEncoding_Term.mk_fv
                                                                  (vname,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                 in
                                                              FStar_SMTEncoding_Util.mkFreeV
                                                                uu____6461
                                                               in
                                                            FStar_All.pipe_left
                                                              (fun _0_1  ->
                                                                 FStar_Pervasives_Native.Some
                                                                   _0_1)
                                                              uu____6460
                                                             in
                                                          FStar_SMTEncoding_Env.push_free_var
                                                            env1 lid arity
                                                            vname uu____6457
                                                           in
                                                        ((FStar_List.append
                                                            decls2
                                                            [tok_typing1]),
                                                          uu____6456)
                                                    | uu____6471 when thunked
                                                        -> (decls2, env1)
                                                    | uu____6484 ->
                                                        let vtok =
                                                          get_vtok ()  in
                                                        let vtok_decl =
                                                          FStar_SMTEncoding_Term.DeclFun
                                                            (vtok, [],
                                                              FStar_SMTEncoding_Term.Term_sort,
                                                              FStar_Pervasives_Native.None)
                                                           in
                                                        let name_tok_corr_formula
                                                          pat =
                                                          let uu____6508 =
                                                            FStar_Syntax_Syntax.range_of_fv
                                                              fv
                                                             in
                                                          let uu____6509 =
                                                            let uu____6520 =
                                                              FStar_SMTEncoding_Util.mkEq
                                                                (vtok_app,
                                                                  vapp)
                                                               in
                                                            ([[pat]], vars1,
                                                              uu____6520)
                                                             in
                                                          FStar_SMTEncoding_Term.mkForall
                                                            uu____6508
                                                            uu____6509
                                                           in
                                                        let name_tok_corr =
                                                          let uu____6530 =
                                                            let uu____6538 =
                                                              name_tok_corr_formula
                                                                vtok_app
                                                               in
                                                            (uu____6538,
                                                              (FStar_Pervasives_Native.Some
                                                                 "Name-token correspondence"),
                                                              (Prims.strcat
                                                                 "token_correspondence_"
                                                                 vname))
                                                             in
                                                          FStar_SMTEncoding_Util.mkAssume
                                                            uu____6530
                                                           in
                                                        let tok_typing1 =
                                                          let ff =
                                                            FStar_SMTEncoding_Term.mk_fv
                                                              ("ty",
                                                                FStar_SMTEncoding_Term.Term_sort)
                                                             in
                                                          let f =
                                                            FStar_SMTEncoding_Util.mkFreeV
                                                              ff
                                                             in
                                                          let vtok_app_r =
                                                            let uu____6549 =
                                                              let uu____6550
                                                                =
                                                                FStar_SMTEncoding_Term.mk_fv
                                                                  (vtok,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                 in
                                                              [uu____6550]
                                                               in
                                                            FStar_SMTEncoding_EncodeTerm.mk_Apply
                                                              f uu____6549
                                                             in
                                                          let guarded_tok_typing
                                                            =
                                                            let uu____6577 =
                                                              FStar_Syntax_Syntax.range_of_fv
                                                                fv
                                                               in
                                                            let uu____6578 =
                                                              let uu____6589
                                                                =
                                                                let uu____6590
                                                                  =
                                                                  let uu____6595
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_NoHoist
                                                                    f
                                                                    tok_typing
                                                                     in
                                                                  let uu____6596
                                                                    =
                                                                    name_tok_corr_formula
                                                                    vapp  in
                                                                  (uu____6595,
                                                                    uu____6596)
                                                                   in
                                                                FStar_SMTEncoding_Util.mkAnd
                                                                  uu____6590
                                                                 in
                                                              ([[vtok_app_r]],
                                                                [ff],
                                                                uu____6589)
                                                               in
                                                            FStar_SMTEncoding_Term.mkForall
                                                              uu____6577
                                                              uu____6578
                                                             in
                                                          FStar_SMTEncoding_Util.mkAssume
                                                            (guarded_tok_typing,
                                                              (FStar_Pervasives_Native.Some
                                                                 "function token typing"),
                                                              (Prims.strcat
                                                                 "function_token_typing_"
                                                                 vname))
                                                           in
                                                        ((FStar_List.append
                                                            decls2
                                                            [vtok_decl;
                                                            name_tok_corr;
                                                            tok_typing1]),
                                                          env1)
                                                     in
                                                  (match uu____6430 with
                                                   | (tok_decl,env2) ->
                                                       ((vname_decl ::
                                                         tok_decl), env2))
                                               in
                                            (match uu____6373 with
                                             | (decls2,env2) ->
                                                 let uu____6653 =
                                                   let res_t1 =
                                                     FStar_Syntax_Subst.compress
                                                       res_t
                                                      in
                                                   let uu____6663 =
                                                     FStar_SMTEncoding_EncodeTerm.encode_term
                                                       res_t1 env'
                                                      in
                                                   match uu____6663 with
                                                   | (encoded_res_t,decls) ->
                                                       let uu____6678 =
                                                         FStar_SMTEncoding_Term.mk_HasType
                                                           vapp encoded_res_t
                                                          in
                                                       (encoded_res_t,
                                                         uu____6678, decls)
                                                    in
                                                 (match uu____6653 with
                                                  | (encoded_res_t,ty_pred,decls3)
                                                      ->
                                                      let typingAx =
                                                        let uu____6695 =
                                                          let uu____6703 =
                                                            let uu____6704 =
                                                              FStar_Syntax_Syntax.range_of_fv
                                                                fv
                                                               in
                                                            let uu____6705 =
                                                              let uu____6716
                                                                =
                                                                FStar_SMTEncoding_Util.mkImp
                                                                  (guard,
                                                                    ty_pred)
                                                                 in
                                                              ([[vapp]],
                                                                vars1,
                                                                uu____6716)
                                                               in
                                                            FStar_SMTEncoding_Term.mkForall
                                                              uu____6704
                                                              uu____6705
                                                             in
                                                          (uu____6703,
                                                            (FStar_Pervasives_Native.Some
                                                               "free var typing"),
                                                            (Prims.strcat
                                                               "typing_"
                                                               vname))
                                                           in
                                                        FStar_SMTEncoding_Util.mkAssume
                                                          uu____6695
                                                         in
                                                      let freshness =
                                                        let uu____6732 =
                                                          FStar_All.pipe_right
                                                            quals
                                                            (FStar_List.contains
                                                               FStar_Syntax_Syntax.New)
                                                           in
                                                        if uu____6732
                                                        then
                                                          let uu____6740 =
                                                            let uu____6741 =
                                                              FStar_Syntax_Syntax.range_of_fv
                                                                fv
                                                               in
                                                            let uu____6742 =
                                                              let uu____6755
                                                                =
                                                                FStar_All.pipe_right
                                                                  vars1
                                                                  (FStar_List.map
                                                                    FStar_SMTEncoding_Term.fv_sort)
                                                                 in
                                                              let uu____6762
                                                                =
                                                                FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.next_id
                                                                  ()
                                                                 in
                                                              (vname,
                                                                uu____6755,
                                                                FStar_SMTEncoding_Term.Term_sort,
                                                                uu____6762)
                                                               in
                                                            FStar_SMTEncoding_Term.fresh_constructor
                                                              uu____6741
                                                              uu____6742
                                                             in
                                                          let uu____6768 =
                                                            let uu____6771 =
                                                              let uu____6772
                                                                =
                                                                FStar_Syntax_Syntax.range_of_fv
                                                                  fv
                                                                 in
                                                              pretype_axiom
                                                                uu____6772
                                                                env2 vapp
                                                                vars1
                                                               in
                                                            [uu____6771]  in
                                                          uu____6740 ::
                                                            uu____6768
                                                        else []  in
                                                      let g =
                                                        let uu____6778 =
                                                          let uu____6781 =
                                                            let uu____6784 =
                                                              let uu____6787
                                                                =
                                                                let uu____6790
                                                                  =
                                                                  mk_disc_proj_axioms
                                                                    guard
                                                                    encoded_res_t
                                                                    vapp
                                                                    vars1
                                                                   in
                                                                typingAx ::
                                                                  uu____6790
                                                                 in
                                                              FStar_List.append
                                                                freshness
                                                                uu____6787
                                                               in
                                                            FStar_List.append
                                                              decls3
                                                              uu____6784
                                                             in
                                                          FStar_List.append
                                                            decls2 uu____6781
                                                           in
                                                        FStar_List.append
                                                          decls11 uu____6778
                                                         in
                                                      (g, env2)))))))))
  
let (declare_top_level_let :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.fv ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
          (FStar_SMTEncoding_Env.fvar_binding * FStar_SMTEncoding_Term.decl
            Prims.list * FStar_SMTEncoding_Env.env_t))
  =
  fun env  ->
    fun x  ->
      fun t  ->
        fun t_norm  ->
          let uu____6832 =
            FStar_SMTEncoding_Env.lookup_fvar_binding env
              (x.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          match uu____6832 with
          | FStar_Pervasives_Native.None  ->
              let uu____6843 = encode_free_var false env x t t_norm []  in
              (match uu____6843 with
               | (decls,env1) ->
                   let fvb =
                     FStar_SMTEncoding_Env.lookup_lid env1
                       (x.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                      in
                   (fvb, decls, env1))
          | FStar_Pervasives_Native.Some fvb -> (fvb, [], env)
  
let (encode_top_level_val :
  Prims.bool ->
    FStar_SMTEncoding_Env.env_t ->
      FStar_Syntax_Syntax.fv ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
          FStar_Syntax_Syntax.qualifier Prims.list ->
            (FStar_SMTEncoding_Term.decl Prims.list *
              FStar_SMTEncoding_Env.env_t))
  =
  fun uninterpreted  ->
    fun env  ->
      fun lid  ->
        fun t  ->
          fun quals  ->
            let tt = FStar_SMTEncoding_EncodeTerm.norm env t  in
            let uu____6914 = encode_free_var uninterpreted env lid t tt quals
               in
            match uu____6914 with
            | (decls,env1) ->
                let uu____6933 = FStar_Syntax_Util.is_smt_lemma t  in
                if uu____6933
                then
                  let uu____6942 =
                    let uu____6945 = encode_smt_lemma env1 lid tt  in
                    FStar_List.append decls uu____6945  in
                  (uu____6942, env1)
                else (decls, env1)
  
let (encode_top_level_vals :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.letbinding Prims.list ->
      FStar_Syntax_Syntax.qualifier Prims.list ->
        (FStar_SMTEncoding_Term.decl Prims.list *
          FStar_SMTEncoding_Env.env_t))
  =
  fun env  ->
    fun bindings  ->
      fun quals  ->
        FStar_All.pipe_right bindings
          (FStar_List.fold_left
             (fun uu____7005  ->
                fun lb  ->
                  match uu____7005 with
                  | (decls,env1) ->
                      let uu____7025 =
                        let uu____7032 =
                          FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
                        encode_top_level_val false env1 uu____7032
                          lb.FStar_Syntax_Syntax.lbtyp quals
                         in
                      (match uu____7025 with
                       | (decls',env2) ->
                           ((FStar_List.append decls decls'), env2)))
             ([], env))
  
let (is_tactic : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t  ->
    let fstar_tactics_tactic_lid =
      FStar_Parser_Const.p2l ["FStar"; "Tactics"; "tactic"]  in
    let uu____7065 = FStar_Syntax_Util.head_and_args t  in
    match uu____7065 with
    | (hd1,args) ->
        let uu____7109 =
          let uu____7110 = FStar_Syntax_Util.un_uinst hd1  in
          uu____7110.FStar_Syntax_Syntax.n  in
        (match uu____7109 with
         | FStar_Syntax_Syntax.Tm_fvar fv when
             FStar_Syntax_Syntax.fv_eq_lid fv fstar_tactics_tactic_lid ->
             true
         | FStar_Syntax_Syntax.Tm_arrow (uu____7116,c) ->
             let effect_name = FStar_Syntax_Util.comp_effect_name c  in
             FStar_Util.starts_with "FStar.Tactics"
               effect_name.FStar_Ident.str
         | uu____7140 -> false)
  
exception Let_rec_unencodeable 
let (uu___is_Let_rec_unencodeable : Prims.exn -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | Let_rec_unencodeable  -> true
    | uu____7151 -> false
  
let (copy_env : FStar_SMTEncoding_Env.env_t -> FStar_SMTEncoding_Env.env_t) =
  fun en  ->
    let uu___385_7159 = en  in
    let uu____7160 = FStar_Util.smap_copy en.FStar_SMTEncoding_Env.cache  in
    {
      FStar_SMTEncoding_Env.bvar_bindings =
        (uu___385_7159.FStar_SMTEncoding_Env.bvar_bindings);
      FStar_SMTEncoding_Env.fvar_bindings =
        (uu___385_7159.FStar_SMTEncoding_Env.fvar_bindings);
      FStar_SMTEncoding_Env.depth =
        (uu___385_7159.FStar_SMTEncoding_Env.depth);
      FStar_SMTEncoding_Env.tcenv =
        (uu___385_7159.FStar_SMTEncoding_Env.tcenv);
      FStar_SMTEncoding_Env.warn = (uu___385_7159.FStar_SMTEncoding_Env.warn);
      FStar_SMTEncoding_Env.cache = uu____7160;
      FStar_SMTEncoding_Env.nolabels =
        (uu___385_7159.FStar_SMTEncoding_Env.nolabels);
      FStar_SMTEncoding_Env.use_zfuel_name =
        (uu___385_7159.FStar_SMTEncoding_Env.use_zfuel_name);
      FStar_SMTEncoding_Env.encode_non_total_function_typ =
        (uu___385_7159.FStar_SMTEncoding_Env.encode_non_total_function_typ);
      FStar_SMTEncoding_Env.current_module_name =
        (uu___385_7159.FStar_SMTEncoding_Env.current_module_name);
      FStar_SMTEncoding_Env.encoding_quantifier =
        (uu___385_7159.FStar_SMTEncoding_Env.encoding_quantifier)
    }
  
let (encode_top_level_let :
  FStar_SMTEncoding_Env.env_t ->
    (Prims.bool * FStar_Syntax_Syntax.letbinding Prims.list) ->
      FStar_Syntax_Syntax.qualifier Prims.list ->
        (FStar_SMTEncoding_Term.decl Prims.list *
          FStar_SMTEncoding_Env.env_t))
  =
  fun env  ->
    fun uu____7192  ->
      fun quals  ->
        match uu____7192 with
        | (is_rec,bindings) ->
            let eta_expand1 binders formals body t =
              let nbinders = FStar_List.length binders  in
              let uu____7299 = FStar_Util.first_N nbinders formals  in
              match uu____7299 with
              | (formals1,extra_formals) ->
                  let subst1 =
                    FStar_List.map2
                      (fun uu____7400  ->
                         fun uu____7401  ->
                           match (uu____7400, uu____7401) with
                           | ((formal,uu____7427),(binder,uu____7429)) ->
                               let uu____7450 =
                                 let uu____7457 =
                                   FStar_Syntax_Syntax.bv_to_name binder  in
                                 (formal, uu____7457)  in
                               FStar_Syntax_Syntax.NT uu____7450) formals1
                      binders
                     in
                  let extra_formals1 =
                    let uu____7471 =
                      FStar_All.pipe_right extra_formals
                        (FStar_List.map
                           (fun uu____7512  ->
                              match uu____7512 with
                              | (x,i) ->
                                  let uu____7531 =
                                    let uu___386_7532 = x  in
                                    let uu____7533 =
                                      FStar_Syntax_Subst.subst subst1
                                        x.FStar_Syntax_Syntax.sort
                                       in
                                    {
                                      FStar_Syntax_Syntax.ppname =
                                        (uu___386_7532.FStar_Syntax_Syntax.ppname);
                                      FStar_Syntax_Syntax.index =
                                        (uu___386_7532.FStar_Syntax_Syntax.index);
                                      FStar_Syntax_Syntax.sort = uu____7533
                                    }  in
                                  (uu____7531, i)))
                       in
                    FStar_All.pipe_right uu____7471
                      FStar_Syntax_Util.name_binders
                     in
                  let body1 =
                    let uu____7557 =
                      let uu____7562 = FStar_Syntax_Subst.compress body  in
                      let uu____7563 =
                        let uu____7564 =
                          FStar_Syntax_Util.args_of_binders extra_formals1
                           in
                        FStar_All.pipe_left FStar_Pervasives_Native.snd
                          uu____7564
                         in
                      FStar_Syntax_Syntax.extend_app_n uu____7562 uu____7563
                       in
                    uu____7557 FStar_Pervasives_Native.None
                      body.FStar_Syntax_Syntax.pos
                     in
                  ((FStar_List.append binders extra_formals1), body1)
               in
            let destruct_bound_function t e =
              let tcenv =
                let uu___387_7615 = env.FStar_SMTEncoding_Env.tcenv  in
                {
                  FStar_TypeChecker_Env.solver =
                    (uu___387_7615.FStar_TypeChecker_Env.solver);
                  FStar_TypeChecker_Env.range =
                    (uu___387_7615.FStar_TypeChecker_Env.range);
                  FStar_TypeChecker_Env.curmodule =
                    (uu___387_7615.FStar_TypeChecker_Env.curmodule);
                  FStar_TypeChecker_Env.gamma =
                    (uu___387_7615.FStar_TypeChecker_Env.gamma);
                  FStar_TypeChecker_Env.gamma_sig =
                    (uu___387_7615.FStar_TypeChecker_Env.gamma_sig);
                  FStar_TypeChecker_Env.gamma_cache =
                    (uu___387_7615.FStar_TypeChecker_Env.gamma_cache);
                  FStar_TypeChecker_Env.modules =
                    (uu___387_7615.FStar_TypeChecker_Env.modules);
                  FStar_TypeChecker_Env.expected_typ =
                    (uu___387_7615.FStar_TypeChecker_Env.expected_typ);
                  FStar_TypeChecker_Env.sigtab =
                    (uu___387_7615.FStar_TypeChecker_Env.sigtab);
                  FStar_TypeChecker_Env.attrtab =
                    (uu___387_7615.FStar_TypeChecker_Env.attrtab);
                  FStar_TypeChecker_Env.is_pattern =
                    (uu___387_7615.FStar_TypeChecker_Env.is_pattern);
                  FStar_TypeChecker_Env.instantiate_imp =
                    (uu___387_7615.FStar_TypeChecker_Env.instantiate_imp);
                  FStar_TypeChecker_Env.effects =
                    (uu___387_7615.FStar_TypeChecker_Env.effects);
                  FStar_TypeChecker_Env.generalize =
                    (uu___387_7615.FStar_TypeChecker_Env.generalize);
                  FStar_TypeChecker_Env.letrecs =
                    (uu___387_7615.FStar_TypeChecker_Env.letrecs);
                  FStar_TypeChecker_Env.top_level =
                    (uu___387_7615.FStar_TypeChecker_Env.top_level);
                  FStar_TypeChecker_Env.check_uvars =
                    (uu___387_7615.FStar_TypeChecker_Env.check_uvars);
                  FStar_TypeChecker_Env.use_eq =
                    (uu___387_7615.FStar_TypeChecker_Env.use_eq);
                  FStar_TypeChecker_Env.is_iface =
                    (uu___387_7615.FStar_TypeChecker_Env.is_iface);
                  FStar_TypeChecker_Env.admit =
                    (uu___387_7615.FStar_TypeChecker_Env.admit);
                  FStar_TypeChecker_Env.lax = true;
                  FStar_TypeChecker_Env.lax_universes =
                    (uu___387_7615.FStar_TypeChecker_Env.lax_universes);
                  FStar_TypeChecker_Env.phase1 =
                    (uu___387_7615.FStar_TypeChecker_Env.phase1);
                  FStar_TypeChecker_Env.failhard =
                    (uu___387_7615.FStar_TypeChecker_Env.failhard);
                  FStar_TypeChecker_Env.nosynth =
                    (uu___387_7615.FStar_TypeChecker_Env.nosynth);
                  FStar_TypeChecker_Env.uvar_subtyping =
                    (uu___387_7615.FStar_TypeChecker_Env.uvar_subtyping);
                  FStar_TypeChecker_Env.tc_term =
                    (uu___387_7615.FStar_TypeChecker_Env.tc_term);
                  FStar_TypeChecker_Env.type_of =
                    (uu___387_7615.FStar_TypeChecker_Env.type_of);
                  FStar_TypeChecker_Env.universe_of =
                    (uu___387_7615.FStar_TypeChecker_Env.universe_of);
                  FStar_TypeChecker_Env.check_type_of =
                    (uu___387_7615.FStar_TypeChecker_Env.check_type_of);
                  FStar_TypeChecker_Env.use_bv_sorts =
                    (uu___387_7615.FStar_TypeChecker_Env.use_bv_sorts);
                  FStar_TypeChecker_Env.qtbl_name_and_index =
                    (uu___387_7615.FStar_TypeChecker_Env.qtbl_name_and_index);
                  FStar_TypeChecker_Env.normalized_eff_names =
                    (uu___387_7615.FStar_TypeChecker_Env.normalized_eff_names);
                  FStar_TypeChecker_Env.fv_delta_depths =
                    (uu___387_7615.FStar_TypeChecker_Env.fv_delta_depths);
                  FStar_TypeChecker_Env.proof_ns =
                    (uu___387_7615.FStar_TypeChecker_Env.proof_ns);
                  FStar_TypeChecker_Env.synth_hook =
                    (uu___387_7615.FStar_TypeChecker_Env.synth_hook);
                  FStar_TypeChecker_Env.splice =
                    (uu___387_7615.FStar_TypeChecker_Env.splice);
                  FStar_TypeChecker_Env.postprocess =
                    (uu___387_7615.FStar_TypeChecker_Env.postprocess);
                  FStar_TypeChecker_Env.is_native_tactic =
                    (uu___387_7615.FStar_TypeChecker_Env.is_native_tactic);
                  FStar_TypeChecker_Env.identifier_info =
                    (uu___387_7615.FStar_TypeChecker_Env.identifier_info);
                  FStar_TypeChecker_Env.tc_hooks =
                    (uu___387_7615.FStar_TypeChecker_Env.tc_hooks);
                  FStar_TypeChecker_Env.dsenv =
                    (uu___387_7615.FStar_TypeChecker_Env.dsenv);
                  FStar_TypeChecker_Env.nbe =
                    (uu___387_7615.FStar_TypeChecker_Env.nbe)
                }  in
              let subst_comp1 formals actuals comp =
                let subst1 =
                  FStar_List.map2
                    (fun uu____7687  ->
                       fun uu____7688  ->
                         match (uu____7687, uu____7688) with
                         | ((x,uu____7714),(b,uu____7716)) ->
                             let uu____7737 =
                               let uu____7744 =
                                 FStar_Syntax_Syntax.bv_to_name b  in
                               (x, uu____7744)  in
                             FStar_Syntax_Syntax.NT uu____7737) formals
                    actuals
                   in
                FStar_Syntax_Subst.subst_comp subst1 comp  in
              let rec arrow_formals_comp_norm norm1 t1 =
                let t2 =
                  let uu____7769 = FStar_Syntax_Subst.compress t1  in
                  FStar_All.pipe_left FStar_Syntax_Util.unascribe uu____7769
                   in
                match t2.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_arrow (formals,comp) ->
                    FStar_Syntax_Subst.open_comp formals comp
                | FStar_Syntax_Syntax.Tm_refine uu____7798 ->
                    let uu____7805 = FStar_Syntax_Util.unrefine t2  in
                    arrow_formals_comp_norm norm1 uu____7805
                | uu____7806 when Prims.op_Negation norm1 ->
                    let t_norm =
                      FStar_TypeChecker_Normalize.normalize
                        [FStar_TypeChecker_Env.AllowUnboundUniverses;
                        FStar_TypeChecker_Env.Beta;
                        FStar_TypeChecker_Env.Weak;
                        FStar_TypeChecker_Env.HNF;
                        FStar_TypeChecker_Env.Exclude
                          FStar_TypeChecker_Env.Zeta;
                        FStar_TypeChecker_Env.UnfoldUntil
                          FStar_Syntax_Syntax.delta_constant;
                        FStar_TypeChecker_Env.EraseUniverses] tcenv t2
                       in
                    arrow_formals_comp_norm true t_norm
                | uu____7809 ->
                    let uu____7810 = FStar_Syntax_Syntax.mk_Total t2  in
                    ([], uu____7810)
                 in
              let aux t1 e1 =
                let uu____7852 = FStar_Syntax_Util.abs_formals e1  in
                match uu____7852 with
                | (binders,body,lopt) ->
                    let uu____7884 =
                      match binders with
                      | [] -> arrow_formals_comp_norm true t1
                      | uu____7900 -> arrow_formals_comp_norm false t1  in
                    (match uu____7884 with
                     | (formals,comp) ->
                         let nformals = FStar_List.length formals  in
                         let nbinders = FStar_List.length binders  in
                         let uu____7934 =
                           if nformals < nbinders
                           then
                             let uu____7978 =
                               FStar_Util.first_N nformals binders  in
                             match uu____7978 with
                             | (bs0,rest) ->
                                 let body1 =
                                   FStar_Syntax_Util.abs rest body lopt  in
                                 let uu____8062 =
                                   subst_comp1 formals bs0 comp  in
                                 (bs0, body1, uu____8062)
                           else
                             if nformals > nbinders
                             then
                               (let uu____8102 =
                                  eta_expand1 binders formals body
                                    (FStar_Syntax_Util.comp_result comp)
                                   in
                                match uu____8102 with
                                | (binders1,body1) ->
                                    let uu____8155 =
                                      subst_comp1 formals binders1 comp  in
                                    (binders1, body1, uu____8155))
                             else
                               (let uu____8168 =
                                  subst_comp1 formals binders comp  in
                                (binders, body, uu____8168))
                            in
                         (match uu____7934 with
                          | (binders1,body1,comp1) ->
                              (binders1, body1, comp1)))
                 in
              let uu____8228 = aux t e  in
              match uu____8228 with
              | (binders,body,comp) ->
                  let uu____8274 =
                    let uu____8285 =
                      FStar_TypeChecker_Env.is_reifiable_comp tcenv comp  in
                    if uu____8285
                    then
                      let comp1 =
                        FStar_TypeChecker_Env.reify_comp tcenv comp
                          FStar_Syntax_Syntax.U_unknown
                         in
                      let body1 =
                        FStar_TypeChecker_Util.reify_body tcenv body  in
                      let uu____8300 = aux comp1 body1  in
                      match uu____8300 with
                      | (more_binders,body2,comp2) ->
                          ((FStar_List.append binders more_binders), body2,
                            comp2)
                    else (binders, body, comp)  in
                  (match uu____8274 with
                   | (binders1,body1,comp1) ->
                       let uu____8383 =
                         FStar_Syntax_Util.ascribe body1
                           ((FStar_Util.Inl
                               (FStar_Syntax_Util.comp_result comp1)),
                             FStar_Pervasives_Native.None)
                          in
                       (binders1, uu____8383, comp1))
               in
            (try
               (fun uu___389_8410  ->
                  match () with
                  | () ->
                      let uu____8417 =
                        FStar_All.pipe_right bindings
                          (FStar_Util.for_all
                             (fun lb  ->
                                (FStar_Syntax_Util.is_lemma
                                   lb.FStar_Syntax_Syntax.lbtyp)
                                  || (is_tactic lb.FStar_Syntax_Syntax.lbtyp)))
                         in
                      if uu____8417
                      then encode_top_level_vals env bindings quals
                      else
                        (let uu____8433 =
                           FStar_All.pipe_right bindings
                             (FStar_List.fold_left
                                (fun uu____8496  ->
                                   fun lb  ->
                                     match uu____8496 with
                                     | (toks,typs,decls,env1) ->
                                         ((let uu____8551 =
                                             FStar_Syntax_Util.is_lemma
                                               lb.FStar_Syntax_Syntax.lbtyp
                                              in
                                           if uu____8551
                                           then
                                             FStar_Exn.raise
                                               Let_rec_unencodeable
                                           else ());
                                          (let t_norm =
                                             FStar_SMTEncoding_EncodeTerm.whnf
                                               env1
                                               lb.FStar_Syntax_Syntax.lbtyp
                                              in
                                           let uu____8557 =
                                             let uu____8566 =
                                               FStar_Util.right
                                                 lb.FStar_Syntax_Syntax.lbname
                                                in
                                             declare_top_level_let env1
                                               uu____8566
                                               lb.FStar_Syntax_Syntax.lbtyp
                                               t_norm
                                              in
                                           match uu____8557 with
                                           | (tok,decl,env2) ->
                                               ((tok :: toks), (t_norm ::
                                                 typs), (decl :: decls),
                                                 env2)))) ([], [], [], env))
                            in
                         match uu____8433 with
                         | (toks,typs,decls,env1) ->
                             let toks_fvbs = FStar_List.rev toks  in
                             let decls1 =
                               FStar_All.pipe_right (FStar_List.rev decls)
                                 FStar_List.flatten
                                in
                             let env_decls = copy_env env1  in
                             let typs1 = FStar_List.rev typs  in
                             let encode_non_rec_lbdef bindings1 typs2 toks1
                               env2 =
                               match (bindings1, typs2, toks1) with
                               | ({ FStar_Syntax_Syntax.lbname = lbn;
                                    FStar_Syntax_Syntax.lbunivs = uvs;
                                    FStar_Syntax_Syntax.lbtyp = uu____8707;
                                    FStar_Syntax_Syntax.lbeff = uu____8708;
                                    FStar_Syntax_Syntax.lbdef = e;
                                    FStar_Syntax_Syntax.lbattrs = uu____8710;
                                    FStar_Syntax_Syntax.lbpos = uu____8711;_}::[],t_norm::[],fvb::[])
                                   ->
                                   let flid =
                                     fvb.FStar_SMTEncoding_Env.fvar_lid  in
                                   let uu____8735 =
                                     let uu____8742 =
                                       FStar_TypeChecker_Env.open_universes_in
                                         env2.FStar_SMTEncoding_Env.tcenv uvs
                                         [e; t_norm]
                                        in
                                     match uu____8742 with
                                     | (tcenv',uu____8758,e_t) ->
                                         let uu____8764 =
                                           match e_t with
                                           | e1::t_norm1::[] -> (e1, t_norm1)
                                           | uu____8775 ->
                                               failwith "Impossible"
                                            in
                                         (match uu____8764 with
                                          | (e1,t_norm1) ->
                                              ((let uu___390_8792 = env2  in
                                                {
                                                  FStar_SMTEncoding_Env.bvar_bindings
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.bvar_bindings);
                                                  FStar_SMTEncoding_Env.fvar_bindings
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.fvar_bindings);
                                                  FStar_SMTEncoding_Env.depth
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.depth);
                                                  FStar_SMTEncoding_Env.tcenv
                                                    = tcenv';
                                                  FStar_SMTEncoding_Env.warn
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.warn);
                                                  FStar_SMTEncoding_Env.cache
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.cache);
                                                  FStar_SMTEncoding_Env.nolabels
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.nolabels);
                                                  FStar_SMTEncoding_Env.use_zfuel_name
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.use_zfuel_name);
                                                  FStar_SMTEncoding_Env.encode_non_total_function_typ
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.encode_non_total_function_typ);
                                                  FStar_SMTEncoding_Env.current_module_name
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.current_module_name);
                                                  FStar_SMTEncoding_Env.encoding_quantifier
                                                    =
                                                    (uu___390_8792.FStar_SMTEncoding_Env.encoding_quantifier)
                                                }), e1, t_norm1))
                                      in
                                   (match uu____8735 with
                                    | (env',e1,t_norm1) ->
                                        let uu____8802 =
                                          destruct_bound_function t_norm1 e1
                                           in
                                        (match uu____8802 with
                                         | (binders,body,t_body_comp) ->
                                             let t_body =
                                               FStar_Syntax_Util.comp_result
                                                 t_body_comp
                                                in
                                             ((let uu____8822 =
                                                 FStar_All.pipe_left
                                                   (FStar_TypeChecker_Env.debug
                                                      env2.FStar_SMTEncoding_Env.tcenv)
                                                   (FStar_Options.Other
                                                      "SMTEncoding")
                                                  in
                                               if uu____8822
                                               then
                                                 let uu____8827 =
                                                   FStar_Syntax_Print.binders_to_string
                                                     ", " binders
                                                    in
                                                 let uu____8830 =
                                                   FStar_Syntax_Print.term_to_string
                                                     body
                                                    in
                                                 FStar_Util.print2
                                                   "Encoding let : binders=[%s], body=%s\n"
                                                   uu____8827 uu____8830
                                               else ());
                                              (let uu____8835 =
                                                 FStar_SMTEncoding_EncodeTerm.encode_binders
                                                   FStar_Pervasives_Native.None
                                                   binders env'
                                                  in
                                               match uu____8835 with
                                               | (vars,_guards,env'1,binder_decls,uu____8862)
                                                   ->
                                                   let app =
                                                     let uu____8876 =
                                                       FStar_Syntax_Util.range_of_lbname
                                                         lbn
                                                        in
                                                     let uu____8877 =
                                                       FStar_List.map
                                                         FStar_SMTEncoding_Util.mkFreeV
                                                         vars
                                                        in
                                                     FStar_SMTEncoding_EncodeTerm.maybe_curry_fvb
                                                       uu____8876 fvb
                                                       uu____8877
                                                      in
                                                   let uu____8880 =
                                                     let is_logical =
                                                       let uu____8893 =
                                                         let uu____8894 =
                                                           FStar_Syntax_Subst.compress
                                                             t_body
                                                            in
                                                         uu____8894.FStar_Syntax_Syntax.n
                                                          in
                                                       match uu____8893 with
                                                       | FStar_Syntax_Syntax.Tm_fvar
                                                           fv when
                                                           FStar_Syntax_Syntax.fv_eq_lid
                                                             fv
                                                             FStar_Parser_Const.logical_lid
                                                           -> true
                                                       | uu____8900 -> false
                                                        in
                                                     let is_prims =
                                                       let uu____8904 =
                                                         let uu____8905 =
                                                           FStar_All.pipe_right
                                                             lbn
                                                             FStar_Util.right
                                                            in
                                                         FStar_All.pipe_right
                                                           uu____8905
                                                           FStar_Syntax_Syntax.lid_of_fv
                                                          in
                                                       FStar_All.pipe_right
                                                         uu____8904
                                                         (fun lid  ->
                                                            let uu____8914 =
                                                              FStar_Ident.lid_of_ids
                                                                lid.FStar_Ident.ns
                                                               in
                                                            FStar_Ident.lid_equals
                                                              uu____8914
                                                              FStar_Parser_Const.prims_lid)
                                                        in
                                                     let uu____8915 =
                                                       (Prims.op_Negation
                                                          is_prims)
                                                         &&
                                                         ((FStar_All.pipe_right
                                                             quals
                                                             (FStar_List.contains
                                                                FStar_Syntax_Syntax.Logic))
                                                            || is_logical)
                                                        in
                                                     if uu____8915
                                                     then
                                                       let uu____8931 =
                                                         FStar_SMTEncoding_Term.mk_Valid
                                                           app
                                                          in
                                                       let uu____8932 =
                                                         FStar_SMTEncoding_EncodeTerm.encode_formula
                                                           body env'1
                                                          in
                                                       (app, uu____8931,
                                                         uu____8932)
                                                     else
                                                       (let uu____8943 =
                                                          FStar_SMTEncoding_EncodeTerm.encode_term
                                                            body env'1
                                                           in
                                                        (app, app,
                                                          uu____8943))
                                                      in
                                                   (match uu____8880 with
                                                    | (pat,app1,(body1,decls2))
                                                        ->
                                                        let eqn =
                                                          let uu____8967 =
                                                            let uu____8975 =
                                                              let uu____8976
                                                                =
                                                                FStar_Syntax_Util.range_of_lbname
                                                                  lbn
                                                                 in
                                                              let uu____8977
                                                                =
                                                                let uu____8988
                                                                  =
                                                                  FStar_SMTEncoding_Util.mkEq
                                                                    (app1,
                                                                    body1)
                                                                   in
                                                                ([[pat]],
                                                                  vars,
                                                                  uu____8988)
                                                                 in
                                                              FStar_SMTEncoding_Term.mkForall
                                                                uu____8976
                                                                uu____8977
                                                               in
                                                            let uu____8997 =
                                                              let uu____8998
                                                                =
                                                                FStar_Util.format1
                                                                  "Equation for %s"
                                                                  flid.FStar_Ident.str
                                                                 in
                                                              FStar_Pervasives_Native.Some
                                                                uu____8998
                                                               in
                                                            (uu____8975,
                                                              uu____8997,
                                                              (Prims.strcat
                                                                 "equation_"
                                                                 fvb.FStar_SMTEncoding_Env.smt_id))
                                                             in
                                                          FStar_SMTEncoding_Util.mkAssume
                                                            uu____8967
                                                           in
                                                        let uu____9004 =
                                                          let uu____9007 =
                                                            let uu____9010 =
                                                              let uu____9013
                                                                =
                                                                let uu____9016
                                                                  =
                                                                  primitive_type_axioms
                                                                    env2.FStar_SMTEncoding_Env.tcenv
                                                                    flid
                                                                    fvb.FStar_SMTEncoding_Env.smt_id
                                                                    app1
                                                                   in
                                                                FStar_List.append
                                                                  [eqn]
                                                                  uu____9016
                                                                 in
                                                              FStar_List.append
                                                                decls2
                                                                uu____9013
                                                               in
                                                            FStar_List.append
                                                              binder_decls
                                                              uu____9010
                                                             in
                                                          FStar_List.append
                                                            decls1 uu____9007
                                                           in
                                                        (uu____9004, env2))))))
                               | uu____9021 -> failwith "Impossible"  in
                             let encode_rec_lbdefs bindings1 typs2 toks1 env2
                               =
                               let fuel =
                                 let uu____9081 =
                                   let uu____9087 =
                                     FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.fresh
                                       "fuel"
                                      in
                                   (uu____9087,
                                     FStar_SMTEncoding_Term.Fuel_sort)
                                    in
                                 FStar_SMTEncoding_Term.mk_fv uu____9081  in
                               let fuel_tm =
                                 FStar_SMTEncoding_Util.mkFreeV fuel  in
                               let env0 = env2  in
                               let uu____9093 =
                                 FStar_All.pipe_right toks1
                                   (FStar_List.fold_left
                                      (fun uu____9146  ->
                                         fun fvb  ->
                                           match uu____9146 with
                                           | (gtoks,env3) ->
                                               let flid =
                                                 fvb.FStar_SMTEncoding_Env.fvar_lid
                                                  in
                                               let g =
                                                 let uu____9201 =
                                                   FStar_Ident.lid_add_suffix
                                                     flid "fuel_instrumented"
                                                    in
                                                 FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.new_fvar
                                                   uu____9201
                                                  in
                                               let gtok =
                                                 let uu____9205 =
                                                   FStar_Ident.lid_add_suffix
                                                     flid
                                                     "fuel_instrumented_token"
                                                    in
                                                 FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.new_fvar
                                                   uu____9205
                                                  in
                                               let env4 =
                                                 let uu____9208 =
                                                   let uu____9211 =
                                                     FStar_SMTEncoding_Util.mkApp
                                                       (g, [fuel_tm])
                                                      in
                                                   FStar_All.pipe_left
                                                     (fun _0_2  ->
                                                        FStar_Pervasives_Native.Some
                                                          _0_2) uu____9211
                                                    in
                                                 FStar_SMTEncoding_Env.push_free_var
                                                   env3 flid
                                                   fvb.FStar_SMTEncoding_Env.smt_arity
                                                   gtok uu____9208
                                                  in
                                               (((fvb, g, gtok) :: gtoks),
                                                 env4)) ([], env2))
                                  in
                               match uu____9093 with
                               | (gtoks,env3) ->
                                   let gtoks1 = FStar_List.rev gtoks  in
                                   let encode_one_binding env01 uu____9338
                                     t_norm uu____9340 =
                                     match (uu____9338, uu____9340) with
                                     | ((fvb,g,gtok),{
                                                       FStar_Syntax_Syntax.lbname
                                                         = lbn;
                                                       FStar_Syntax_Syntax.lbunivs
                                                         = uvs;
                                                       FStar_Syntax_Syntax.lbtyp
                                                         = uu____9372;
                                                       FStar_Syntax_Syntax.lbeff
                                                         = uu____9373;
                                                       FStar_Syntax_Syntax.lbdef
                                                         = e;
                                                       FStar_Syntax_Syntax.lbattrs
                                                         = uu____9375;
                                                       FStar_Syntax_Syntax.lbpos
                                                         = uu____9376;_})
                                         ->
                                         let uu____9403 =
                                           let uu____9410 =
                                             FStar_TypeChecker_Env.open_universes_in
                                               env3.FStar_SMTEncoding_Env.tcenv
                                               uvs [e; t_norm]
                                              in
                                           match uu____9410 with
                                           | (tcenv',uu____9426,e_t) ->
                                               let uu____9432 =
                                                 match e_t with
                                                 | e1::t_norm1::[] ->
                                                     (e1, t_norm1)
                                                 | uu____9443 ->
                                                     failwith "Impossible"
                                                  in
                                               (match uu____9432 with
                                                | (e1,t_norm1) ->
                                                    ((let uu___391_9460 =
                                                        env3  in
                                                      {
                                                        FStar_SMTEncoding_Env.bvar_bindings
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.bvar_bindings);
                                                        FStar_SMTEncoding_Env.fvar_bindings
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.fvar_bindings);
                                                        FStar_SMTEncoding_Env.depth
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.depth);
                                                        FStar_SMTEncoding_Env.tcenv
                                                          = tcenv';
                                                        FStar_SMTEncoding_Env.warn
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.warn);
                                                        FStar_SMTEncoding_Env.cache
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.cache);
                                                        FStar_SMTEncoding_Env.nolabels
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.nolabels);
                                                        FStar_SMTEncoding_Env.use_zfuel_name
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.use_zfuel_name);
                                                        FStar_SMTEncoding_Env.encode_non_total_function_typ
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.encode_non_total_function_typ);
                                                        FStar_SMTEncoding_Env.current_module_name
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.current_module_name);
                                                        FStar_SMTEncoding_Env.encoding_quantifier
                                                          =
                                                          (uu___391_9460.FStar_SMTEncoding_Env.encoding_quantifier)
                                                      }), e1, t_norm1))
                                            in
                                         (match uu____9403 with
                                          | (env',e1,t_norm1) ->
                                              ((let uu____9475 =
                                                  FStar_All.pipe_left
                                                    (FStar_TypeChecker_Env.debug
                                                       env01.FStar_SMTEncoding_Env.tcenv)
                                                    (FStar_Options.Other
                                                       "SMTEncoding")
                                                   in
                                                if uu____9475
                                                then
                                                  let uu____9480 =
                                                    FStar_Syntax_Print.lbname_to_string
                                                      lbn
                                                     in
                                                  let uu____9482 =
                                                    FStar_Syntax_Print.term_to_string
                                                      t_norm1
                                                     in
                                                  let uu____9484 =
                                                    FStar_Syntax_Print.term_to_string
                                                      e1
                                                     in
                                                  FStar_Util.print3
                                                    "Encoding let rec %s : %s = %s\n"
                                                    uu____9480 uu____9482
                                                    uu____9484
                                                else ());
                                               (let uu____9489 =
                                                  destruct_bound_function
                                                    t_norm1 e1
                                                   in
                                                match uu____9489 with
                                                | (binders,body,tres_comp) ->
                                                    let curry =
                                                      fvb.FStar_SMTEncoding_Env.smt_arity
                                                        <>
                                                        (FStar_List.length
                                                           binders)
                                                       in
                                                    let uu____9518 =
                                                      FStar_TypeChecker_Util.pure_or_ghost_pre_and_post
                                                        env3.FStar_SMTEncoding_Env.tcenv
                                                        tres_comp
                                                       in
                                                    (match uu____9518 with
                                                     | (pre_opt,tres) ->
                                                         ((let uu____9542 =
                                                             FStar_All.pipe_left
                                                               (FStar_TypeChecker_Env.debug
                                                                  env01.FStar_SMTEncoding_Env.tcenv)
                                                               (FStar_Options.Other
                                                                  "SMTEncodingReify")
                                                              in
                                                           if uu____9542
                                                           then
                                                             let uu____9547 =
                                                               FStar_Syntax_Print.lbname_to_string
                                                                 lbn
                                                                in
                                                             let uu____9549 =
                                                               FStar_Syntax_Print.binders_to_string
                                                                 ", " binders
                                                                in
                                                             let uu____9552 =
                                                               FStar_Syntax_Print.term_to_string
                                                                 body
                                                                in
                                                             let uu____9554 =
                                                               FStar_Syntax_Print.comp_to_string
                                                                 tres_comp
                                                                in
                                                             FStar_Util.print4
                                                               "Encoding let rec %s: \n\tbinders=[%s], \n\tbody=%s, \n\ttres=%s\n"
                                                               uu____9547
                                                               uu____9549
                                                               uu____9552
                                                               uu____9554
                                                           else ());
                                                          (let uu____9559 =
                                                             FStar_SMTEncoding_EncodeTerm.encode_binders
                                                               FStar_Pervasives_Native.None
                                                               binders env'
                                                              in
                                                           match uu____9559
                                                           with
                                                           | (vars,guards,env'1,binder_decls,uu____9590)
                                                               ->
                                                               let uu____9603
                                                                 =
                                                                 match pre_opt
                                                                 with
                                                                 | FStar_Pervasives_Native.None
                                                                     ->
                                                                    let uu____9616
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    guards
                                                                     in
                                                                    (uu____9616,
                                                                    [])
                                                                 | FStar_Pervasives_Native.Some
                                                                    pre ->
                                                                    let uu____9620
                                                                    =
                                                                    FStar_SMTEncoding_EncodeTerm.encode_formula
                                                                    pre env'1
                                                                     in
                                                                    (match uu____9620
                                                                    with
                                                                    | 
                                                                    (guard,decls0)
                                                                    ->
                                                                    let uu____9633
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    (FStar_List.append
                                                                    guards
                                                                    [guard])
                                                                     in
                                                                    (uu____9633,
                                                                    decls0))
                                                                  in
                                                               (match uu____9603
                                                                with
                                                                | (guard,guard_decls)
                                                                    ->
                                                                    let binder_decls1
                                                                    =
                                                                    FStar_List.append
                                                                    binder_decls
                                                                    guard_decls
                                                                     in
                                                                    let decl_g
                                                                    =
                                                                    let uu____9656
                                                                    =
                                                                    let uu____9668
                                                                    =
                                                                    let uu____9671
                                                                    =
                                                                    let uu____9674
                                                                    =
                                                                    let uu____9677
                                                                    =
                                                                    FStar_Util.first_N
                                                                    fvb.FStar_SMTEncoding_Env.smt_arity
                                                                    vars  in
                                                                    FStar_Pervasives_Native.fst
                                                                    uu____9677
                                                                     in
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Term.fv_sort
                                                                    uu____9674
                                                                     in
                                                                    FStar_SMTEncoding_Term.Fuel_sort
                                                                    ::
                                                                    uu____9671
                                                                     in
                                                                    (g,
                                                                    uu____9668,
                                                                    FStar_SMTEncoding_Term.Term_sort,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "Fuel-instrumented function name"))
                                                                     in
                                                                    FStar_SMTEncoding_Term.DeclFun
                                                                    uu____9656
                                                                     in
                                                                    let env02
                                                                    =
                                                                    FStar_SMTEncoding_Env.push_zfuel_name
                                                                    env01
                                                                    fvb.FStar_SMTEncoding_Env.fvar_lid
                                                                    g  in
                                                                    let decl_g_tok
                                                                    =
                                                                    FStar_SMTEncoding_Term.DeclFun
                                                                    (gtok,
                                                                    [],
                                                                    FStar_SMTEncoding_Term.Term_sort,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "Token for fuel-instrumented partial applications"))
                                                                     in
                                                                    let vars_tm
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    vars  in
                                                                    let rng =
                                                                    FStar_Syntax_Util.range_of_lbname
                                                                    lbn  in
                                                                    let app =
                                                                    let uu____9707
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    vars  in
                                                                    FStar_SMTEncoding_EncodeTerm.maybe_curry_fvb
                                                                    rng fvb
                                                                    uu____9707
                                                                     in
                                                                    let mk_g_app
                                                                    args =
                                                                    FStar_SMTEncoding_EncodeTerm.maybe_curry_app
                                                                    rng
                                                                    (FStar_Util.Inl
                                                                    (FStar_SMTEncoding_Term.Var
                                                                    g))
                                                                    (fvb.FStar_SMTEncoding_Env.smt_arity
                                                                    +
                                                                    (Prims.parse_int "1"))
                                                                    args  in
                                                                    let gsapp
                                                                    =
                                                                    let uu____9722
                                                                    =
                                                                    let uu____9725
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkApp
                                                                    ("SFuel",
                                                                    [fuel_tm])
                                                                     in
                                                                    uu____9725
                                                                    ::
                                                                    vars_tm
                                                                     in
                                                                    mk_g_app
                                                                    uu____9722
                                                                     in
                                                                    let gmax
                                                                    =
                                                                    let uu____9731
                                                                    =
                                                                    let uu____9734
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkApp
                                                                    ("MaxFuel",
                                                                    [])  in
                                                                    uu____9734
                                                                    ::
                                                                    vars_tm
                                                                     in
                                                                    mk_g_app
                                                                    uu____9731
                                                                     in
                                                                    let uu____9739
                                                                    =
                                                                    FStar_SMTEncoding_EncodeTerm.encode_term
                                                                    body
                                                                    env'1  in
                                                                    (match uu____9739
                                                                    with
                                                                    | 
                                                                    (body_tm,decls2)
                                                                    ->
                                                                    let eqn_g
                                                                    =
                                                                    let uu____9757
                                                                    =
                                                                    let uu____9765
                                                                    =
                                                                    let uu____9766
                                                                    =
                                                                    FStar_Syntax_Util.range_of_lbname
                                                                    lbn  in
                                                                    let uu____9767
                                                                    =
                                                                    let uu____9783
                                                                    =
                                                                    let uu____9784
                                                                    =
                                                                    let uu____9789
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (gsapp,
                                                                    body_tm)
                                                                     in
                                                                    (guard,
                                                                    uu____9789)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____9784
                                                                     in
                                                                    ([
                                                                    [gsapp]],
                                                                    (FStar_Pervasives_Native.Some
                                                                    (Prims.parse_int "0")),
                                                                    (fuel ::
                                                                    vars),
                                                                    uu____9783)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall'
                                                                    uu____9766
                                                                    uu____9767
                                                                     in
                                                                    let uu____9803
                                                                    =
                                                                    let uu____9804
                                                                    =
                                                                    FStar_Util.format1
                                                                    "Equation for fuel-instrumented recursive function: %s"
                                                                    (fvb.FStar_SMTEncoding_Env.fvar_lid).FStar_Ident.str
                                                                     in
                                                                    FStar_Pervasives_Native.Some
                                                                    uu____9804
                                                                     in
                                                                    (uu____9765,
                                                                    uu____9803,
                                                                    (Prims.strcat
                                                                    "equation_with_fuel_"
                                                                    g))  in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____9757
                                                                     in
                                                                    let eqn_f
                                                                    =
                                                                    let uu____9811
                                                                    =
                                                                    let uu____9819
                                                                    =
                                                                    let uu____9820
                                                                    =
                                                                    FStar_Syntax_Util.range_of_lbname
                                                                    lbn  in
                                                                    let uu____9821
                                                                    =
                                                                    let uu____9832
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (app,
                                                                    gmax)  in
                                                                    ([[app]],
                                                                    vars,
                                                                    uu____9832)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____9820
                                                                    uu____9821
                                                                     in
                                                                    (uu____9819,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "Correspondence of recursive function to instrumented version"),
                                                                    (Prims.strcat
                                                                    "@fuel_correspondence_"
                                                                    g))  in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____9811
                                                                     in
                                                                    let eqn_g'
                                                                    =
                                                                    let uu____9846
                                                                    =
                                                                    let uu____9854
                                                                    =
                                                                    let uu____9855
                                                                    =
                                                                    FStar_Syntax_Util.range_of_lbname
                                                                    lbn  in
                                                                    let uu____9856
                                                                    =
                                                                    let uu____9867
                                                                    =
                                                                    let uu____9868
                                                                    =
                                                                    let uu____9873
                                                                    =
                                                                    let uu____9874
                                                                    =
                                                                    let uu____9877
                                                                    =
                                                                    FStar_SMTEncoding_Term.n_fuel
                                                                    (Prims.parse_int "0")
                                                                     in
                                                                    uu____9877
                                                                    ::
                                                                    vars_tm
                                                                     in
                                                                    mk_g_app
                                                                    uu____9874
                                                                     in
                                                                    (gsapp,
                                                                    uu____9873)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    uu____9868
                                                                     in
                                                                    ([
                                                                    [gsapp]],
                                                                    (fuel ::
                                                                    vars),
                                                                    uu____9867)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____9855
                                                                    uu____9856
                                                                     in
                                                                    (uu____9854,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "Fuel irrelevance"),
                                                                    (Prims.strcat
                                                                    "@fuel_irrelevance_"
                                                                    g))  in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____9846
                                                                     in
                                                                    let uu____9891
                                                                    =
                                                                    let gapp
                                                                    =
                                                                    mk_g_app
                                                                    (fuel_tm
                                                                    ::
                                                                    vars_tm)
                                                                     in
                                                                    let tok_corr
                                                                    =
                                                                    let tok_app
                                                                    =
                                                                    let uu____9903
                                                                    =
                                                                    let uu____9904
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    (gtok,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                     in
                                                                    FStar_All.pipe_left
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    uu____9904
                                                                     in
                                                                    FStar_SMTEncoding_EncodeTerm.mk_Apply
                                                                    uu____9903
                                                                    (fuel ::
                                                                    vars)  in
                                                                    let uu____9906
                                                                    =
                                                                    let uu____9914
                                                                    =
                                                                    let uu____9915
                                                                    =
                                                                    FStar_Syntax_Util.range_of_lbname
                                                                    lbn  in
                                                                    let uu____9916
                                                                    =
                                                                    let uu____9927
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (tok_app,
                                                                    gapp)  in
                                                                    ([
                                                                    [tok_app]],
                                                                    (fuel ::
                                                                    vars),
                                                                    uu____9927)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____9915
                                                                    uu____9916
                                                                     in
                                                                    (uu____9914,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "Fuel token correspondence"),
                                                                    (Prims.strcat
                                                                    "fuel_token_correspondence_"
                                                                    gtok))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____9906
                                                                     in
                                                                    let uu____9940
                                                                    =
                                                                    let uu____9949
                                                                    =
                                                                    FStar_SMTEncoding_EncodeTerm.encode_term_pred
                                                                    FStar_Pervasives_Native.None
                                                                    tres
                                                                    env'1
                                                                    gapp  in
                                                                    match uu____9949
                                                                    with
                                                                    | 
                                                                    (g_typing,d3)
                                                                    ->
                                                                    let uu____9964
                                                                    =
                                                                    let uu____9967
                                                                    =
                                                                    let uu____9968
                                                                    =
                                                                    let uu____9976
                                                                    =
                                                                    let uu____9977
                                                                    =
                                                                    FStar_Syntax_Util.range_of_lbname
                                                                    lbn  in
                                                                    let uu____9978
                                                                    =
                                                                    let uu____9989
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    (guard,
                                                                    g_typing)
                                                                     in
                                                                    ([[gapp]],
                                                                    (fuel ::
                                                                    vars),
                                                                    uu____9989)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____9977
                                                                    uu____9978
                                                                     in
                                                                    (uu____9976,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "Typing correspondence of token to term"),
                                                                    (Prims.strcat
                                                                    "token_correspondence_"
                                                                    g))  in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____9968
                                                                     in
                                                                    [uu____9967]
                                                                     in
                                                                    (d3,
                                                                    uu____9964)
                                                                     in
                                                                    match uu____9940
                                                                    with
                                                                    | 
                                                                    (aux_decls,typing_corr)
                                                                    ->
                                                                    (aux_decls,
                                                                    (FStar_List.append
                                                                    typing_corr
                                                                    [tok_corr]))
                                                                     in
                                                                    (match uu____9891
                                                                    with
                                                                    | 
                                                                    (aux_decls,g_typing)
                                                                    ->
                                                                    ((FStar_List.append
                                                                    binder_decls1
                                                                    (FStar_List.append
                                                                    decls2
                                                                    (FStar_List.append
                                                                    aux_decls
                                                                    [decl_g;
                                                                    decl_g_tok]))),
                                                                    (FStar_List.append
                                                                    [eqn_g;
                                                                    eqn_g';
                                                                    eqn_f]
                                                                    g_typing),
                                                                    env02))))))))))
                                      in
                                   let uu____10052 =
                                     let uu____10065 =
                                       FStar_List.zip3 gtoks1 typs2 bindings1
                                        in
                                     FStar_List.fold_left
                                       (fun uu____10128  ->
                                          fun uu____10129  ->
                                            match (uu____10128, uu____10129)
                                            with
                                            | ((decls2,eqns,env01),(gtok,ty,lb))
                                                ->
                                                let uu____10254 =
                                                  encode_one_binding env01
                                                    gtok ty lb
                                                   in
                                                (match uu____10254 with
                                                 | (decls',eqns',env02) ->
                                                     ((decls' :: decls2),
                                                       (FStar_List.append
                                                          eqns' eqns), env02)))
                                       ([decls1], [], env0) uu____10065
                                      in
                                   (match uu____10052 with
                                    | (decls2,eqns,env01) ->
                                        let uu____10327 =
                                          let isDeclFun uu___374_10342 =
                                            match uu___374_10342 with
                                            | FStar_SMTEncoding_Term.DeclFun
                                                uu____10344 -> true
                                            | uu____10357 -> false  in
                                          let uu____10359 =
                                            FStar_All.pipe_right decls2
                                              FStar_List.flatten
                                             in
                                          FStar_All.pipe_right uu____10359
                                            (FStar_List.partition isDeclFun)
                                           in
                                        (match uu____10327 with
                                         | (prefix_decls,rest) ->
                                             let eqns1 = FStar_List.rev eqns
                                                in
                                             ((FStar_List.append prefix_decls
                                                 (FStar_List.append rest
                                                    eqns1)), env01)))
                                in
                             let uu____10399 =
                               (FStar_All.pipe_right quals
                                  (FStar_Util.for_some
                                     (fun uu___375_10405  ->
                                        match uu___375_10405 with
                                        | FStar_Syntax_Syntax.HasMaskedEffect
                                             -> true
                                        | uu____10408 -> false)))
                                 ||
                                 (FStar_All.pipe_right typs1
                                    (FStar_Util.for_some
                                       (fun t  ->
                                          let uu____10416 =
                                            (FStar_Syntax_Util.is_pure_or_ghost_function
                                               t)
                                              ||
                                              (FStar_TypeChecker_Env.is_reifiable_function
                                                 env1.FStar_SMTEncoding_Env.tcenv
                                                 t)
                                             in
                                          FStar_All.pipe_left
                                            Prims.op_Negation uu____10416)))
                                in
                             if uu____10399
                             then (decls1, env_decls)
                             else
                               (try
                                  (fun uu___393_10438  ->
                                     match () with
                                     | () ->
                                         if Prims.op_Negation is_rec
                                         then
                                           encode_non_rec_lbdef bindings
                                             typs1 toks_fvbs env1
                                         else
                                           encode_rec_lbdefs bindings typs1
                                             toks_fvbs env1) ()
                                with
                                | FStar_SMTEncoding_Env.Inner_let_rec  ->
                                    (decls1, env_decls)))) ()
             with
             | Let_rec_unencodeable  ->
                 let msg =
                   let uu____10476 =
                     FStar_All.pipe_right bindings
                       (FStar_List.map
                          (fun lb  ->
                             FStar_Syntax_Print.lbname_to_string
                               lb.FStar_Syntax_Syntax.lbname))
                      in
                   FStar_All.pipe_right uu____10476
                     (FStar_String.concat " and ")
                    in
                 let decl =
                   FStar_SMTEncoding_Term.Caption
                     (Prims.strcat "let rec unencodeable: Skipping: " msg)
                    in
                 ([decl], env))
  
let rec (encode_sigelt :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_SMTEncoding_Term.decls_t * FStar_SMTEncoding_Env.env_t))
  =
  fun env  ->
    fun se  ->
      let nm =
        let uu____10546 = FStar_Syntax_Util.lid_of_sigelt se  in
        match uu____10546 with
        | FStar_Pervasives_Native.None  -> ""
        | FStar_Pervasives_Native.Some l -> l.FStar_Ident.str  in
      let uu____10552 = encode_sigelt' env se  in
      match uu____10552 with
      | (g,env1) ->
          let g1 =
            match g with
            | [] ->
                let uu____10564 =
                  let uu____10565 = FStar_Util.format1 "<Skipped %s/>" nm  in
                  FStar_SMTEncoding_Term.Caption uu____10565  in
                [uu____10564]
            | uu____10568 ->
                let uu____10569 =
                  let uu____10572 =
                    let uu____10573 =
                      FStar_Util.format1 "<Start encoding %s>" nm  in
                    FStar_SMTEncoding_Term.Caption uu____10573  in
                  uu____10572 :: g  in
                let uu____10576 =
                  let uu____10579 =
                    let uu____10580 =
                      FStar_Util.format1 "</end encoding %s>" nm  in
                    FStar_SMTEncoding_Term.Caption uu____10580  in
                  [uu____10579]  in
                FStar_List.append uu____10569 uu____10576
             in
          (g1, env1)

and (encode_sigelt' :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_SMTEncoding_Term.decls_t * FStar_SMTEncoding_Env.env_t))
  =
  fun env  ->
    fun se  ->
      (let uu____10590 =
         FStar_All.pipe_left
           (FStar_TypeChecker_Env.debug env.FStar_SMTEncoding_Env.tcenv)
           (FStar_Options.Other "SMTEncoding")
          in
       if uu____10590
       then
         let uu____10595 = FStar_Syntax_Print.sigelt_to_string se  in
         FStar_Util.print1 "@@@Encoding sigelt %s\n" uu____10595
       else ());
      (let is_opaque_to_smt t =
         let uu____10607 =
           let uu____10608 = FStar_Syntax_Subst.compress t  in
           uu____10608.FStar_Syntax_Syntax.n  in
         match uu____10607 with
         | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_string
             (s,uu____10613)) -> s = "opaque_to_smt"
         | uu____10618 -> false  in
       let is_uninterpreted_by_smt t =
         let uu____10627 =
           let uu____10628 = FStar_Syntax_Subst.compress t  in
           uu____10628.FStar_Syntax_Syntax.n  in
         match uu____10627 with
         | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_string
             (s,uu____10633)) -> s = "uninterpreted_by_smt"
         | uu____10638 -> false  in
       match se.FStar_Syntax_Syntax.sigel with
       | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____10644 ->
           failwith
             "impossible -- new_effect_for_free should have been removed by Tc.fs"
       | FStar_Syntax_Syntax.Sig_splice uu____10650 ->
           failwith "impossible -- splice should have been removed by Tc.fs"
       | FStar_Syntax_Syntax.Sig_pragma uu____10662 -> ([], env)
       | FStar_Syntax_Syntax.Sig_main uu____10663 -> ([], env)
       | FStar_Syntax_Syntax.Sig_effect_abbrev uu____10664 -> ([], env)
       | FStar_Syntax_Syntax.Sig_sub_effect uu____10677 -> ([], env)
       | FStar_Syntax_Syntax.Sig_new_effect ed ->
           let uu____10679 =
             let uu____10681 =
               FStar_TypeChecker_Env.is_reifiable_effect
                 env.FStar_SMTEncoding_Env.tcenv ed.FStar_Syntax_Syntax.mname
                in
             Prims.op_Negation uu____10681  in
           if uu____10679
           then ([], env)
           else
             (let close_effect_params tm =
                match ed.FStar_Syntax_Syntax.binders with
                | [] -> tm
                | uu____10710 ->
                    FStar_Syntax_Syntax.mk
                      (FStar_Syntax_Syntax.Tm_abs
                         ((ed.FStar_Syntax_Syntax.binders), tm,
                           (FStar_Pervasives_Native.Some
                              (FStar_Syntax_Util.mk_residual_comp
                                 FStar_Parser_Const.effect_Tot_lid
                                 FStar_Pervasives_Native.None
                                 [FStar_Syntax_Syntax.TOTAL]))))
                      FStar_Pervasives_Native.None tm.FStar_Syntax_Syntax.pos
                 in
              let encode_action env1 a =
                let uu____10742 =
                  FStar_Syntax_Util.arrow_formals_comp
                    a.FStar_Syntax_Syntax.action_typ
                   in
                match uu____10742 with
                | (formals,uu____10762) ->
                    let arity = FStar_List.length formals  in
                    let uu____10786 =
                      FStar_SMTEncoding_Env.new_term_constant_and_tok_from_lid
                        env1 a.FStar_Syntax_Syntax.action_name arity
                       in
                    (match uu____10786 with
                     | (aname,atok,env2) ->
                         let uu____10812 =
                           let uu____10817 =
                             close_effect_params
                               a.FStar_Syntax_Syntax.action_defn
                              in
                           FStar_SMTEncoding_EncodeTerm.encode_term
                             uu____10817 env2
                            in
                         (match uu____10812 with
                          | (tm,decls) ->
                              let a_decls =
                                let uu____10829 =
                                  let uu____10830 =
                                    let uu____10842 =
                                      FStar_All.pipe_right formals
                                        (FStar_List.map
                                           (fun uu____10862  ->
                                              FStar_SMTEncoding_Term.Term_sort))
                                       in
                                    (aname, uu____10842,
                                      FStar_SMTEncoding_Term.Term_sort,
                                      (FStar_Pervasives_Native.Some "Action"))
                                     in
                                  FStar_SMTEncoding_Term.DeclFun uu____10830
                                   in
                                [uu____10829;
                                FStar_SMTEncoding_Term.DeclFun
                                  (atok, [],
                                    FStar_SMTEncoding_Term.Term_sort,
                                    (FStar_Pervasives_Native.Some
                                       "Action token"))]
                                 in
                              let uu____10879 =
                                let aux uu____10925 uu____10926 =
                                  match (uu____10925, uu____10926) with
                                  | ((bv,uu____10970),(env3,acc_sorts,acc))
                                      ->
                                      let uu____11002 =
                                        FStar_SMTEncoding_Env.gen_term_var
                                          env3 bv
                                         in
                                      (match uu____11002 with
                                       | (xxsym,xx,env4) ->
                                           let uu____11025 =
                                             let uu____11028 =
                                               FStar_SMTEncoding_Term.mk_fv
                                                 (xxsym,
                                                   FStar_SMTEncoding_Term.Term_sort)
                                                in
                                             uu____11028 :: acc_sorts  in
                                           (env4, uu____11025, (xx :: acc)))
                                   in
                                FStar_List.fold_right aux formals
                                  (env2, [], [])
                                 in
                              (match uu____10879 with
                               | (uu____11060,xs_sorts,xs) ->
                                   let app =
                                     FStar_SMTEncoding_Util.mkApp (aname, xs)
                                      in
                                   let a_eq =
                                     let uu____11076 =
                                       let uu____11084 =
                                         let uu____11085 =
                                           FStar_Ident.range_of_lid
                                             a.FStar_Syntax_Syntax.action_name
                                            in
                                         let uu____11086 =
                                           let uu____11097 =
                                             let uu____11098 =
                                               let uu____11103 =
                                                 FStar_SMTEncoding_EncodeTerm.mk_Apply
                                                   tm xs_sorts
                                                  in
                                               (app, uu____11103)  in
                                             FStar_SMTEncoding_Util.mkEq
                                               uu____11098
                                              in
                                           ([[app]], xs_sorts, uu____11097)
                                            in
                                         FStar_SMTEncoding_Term.mkForall
                                           uu____11085 uu____11086
                                          in
                                       (uu____11084,
                                         (FStar_Pervasives_Native.Some
                                            "Action equality"),
                                         (Prims.strcat aname "_equality"))
                                        in
                                     FStar_SMTEncoding_Util.mkAssume
                                       uu____11076
                                      in
                                   let tok_correspondence =
                                     let tok_term =
                                       let uu____11118 =
                                         FStar_SMTEncoding_Term.mk_fv
                                           (atok,
                                             FStar_SMTEncoding_Term.Term_sort)
                                          in
                                       FStar_All.pipe_left
                                         FStar_SMTEncoding_Util.mkFreeV
                                         uu____11118
                                        in
                                     let tok_app =
                                       FStar_SMTEncoding_EncodeTerm.mk_Apply
                                         tok_term xs_sorts
                                        in
                                     let uu____11121 =
                                       let uu____11129 =
                                         let uu____11130 =
                                           FStar_Ident.range_of_lid
                                             a.FStar_Syntax_Syntax.action_name
                                            in
                                         let uu____11131 =
                                           let uu____11142 =
                                             FStar_SMTEncoding_Util.mkEq
                                               (tok_app, app)
                                              in
                                           ([[tok_app]], xs_sorts,
                                             uu____11142)
                                            in
                                         FStar_SMTEncoding_Term.mkForall
                                           uu____11130 uu____11131
                                          in
                                       (uu____11129,
                                         (FStar_Pervasives_Native.Some
                                            "Action token correspondence"),
                                         (Prims.strcat aname
                                            "_token_correspondence"))
                                        in
                                     FStar_SMTEncoding_Util.mkAssume
                                       uu____11121
                                      in
                                   (env2,
                                     (FStar_List.append decls
                                        (FStar_List.append a_decls
                                           [a_eq; tok_correspondence]))))))
                 in
              let uu____11157 =
                FStar_Util.fold_map encode_action env
                  ed.FStar_Syntax_Syntax.actions
                 in
              match uu____11157 with
              | (env1,decls2) -> ((FStar_List.flatten decls2), env1))
       | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____11183,uu____11184)
           when FStar_Ident.lid_equals lid FStar_Parser_Const.precedes_lid ->
           let uu____11185 =
             FStar_SMTEncoding_Env.new_term_constant_and_tok_from_lid env lid
               (Prims.parse_int "4")
              in
           (match uu____11185 with | (tname,ttok,env1) -> ([], env1))
       | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____11207,t) ->
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let will_encode_definition =
             let uu____11214 =
               FStar_All.pipe_right quals
                 (FStar_Util.for_some
                    (fun uu___376_11220  ->
                       match uu___376_11220 with
                       | FStar_Syntax_Syntax.Assumption  -> true
                       | FStar_Syntax_Syntax.Projector uu____11223 -> true
                       | FStar_Syntax_Syntax.Discriminator uu____11229 ->
                           true
                       | FStar_Syntax_Syntax.Irreducible  -> true
                       | uu____11232 -> false))
                in
             Prims.op_Negation uu____11214  in
           if will_encode_definition
           then ([], env)
           else
             (let fv =
                FStar_Syntax_Syntax.lid_as_fv lid
                  FStar_Syntax_Syntax.delta_constant
                  FStar_Pervasives_Native.None
                 in
              let uu____11242 =
                let uu____11249 =
                  FStar_All.pipe_right se.FStar_Syntax_Syntax.sigattrs
                    (FStar_Util.for_some is_uninterpreted_by_smt)
                   in
                encode_top_level_val uu____11249 env fv t quals  in
              match uu____11242 with
              | (decls,env1) ->
                  let tname = lid.FStar_Ident.str  in
                  let tsym =
                    let uu____11267 =
                      FStar_SMTEncoding_Term.mk_fv
                        (tname, FStar_SMTEncoding_Term.Term_sort)
                       in
                    FStar_All.pipe_left FStar_SMTEncoding_Util.mkFreeV
                      uu____11267
                     in
                  let uu____11269 =
                    let uu____11270 =
                      primitive_type_axioms env1.FStar_SMTEncoding_Env.tcenv
                        lid tname tsym
                       in
                    FStar_List.append decls uu____11270  in
                  (uu____11269, env1))
       | FStar_Syntax_Syntax.Sig_assume (l,us,f) ->
           let uu____11276 = FStar_Syntax_Subst.open_univ_vars us f  in
           (match uu____11276 with
            | (uvs,f1) ->
                let env1 =
                  let uu___394_11288 = env  in
                  let uu____11289 =
                    FStar_TypeChecker_Env.push_univ_vars
                      env.FStar_SMTEncoding_Env.tcenv uvs
                     in
                  {
                    FStar_SMTEncoding_Env.bvar_bindings =
                      (uu___394_11288.FStar_SMTEncoding_Env.bvar_bindings);
                    FStar_SMTEncoding_Env.fvar_bindings =
                      (uu___394_11288.FStar_SMTEncoding_Env.fvar_bindings);
                    FStar_SMTEncoding_Env.depth =
                      (uu___394_11288.FStar_SMTEncoding_Env.depth);
                    FStar_SMTEncoding_Env.tcenv = uu____11289;
                    FStar_SMTEncoding_Env.warn =
                      (uu___394_11288.FStar_SMTEncoding_Env.warn);
                    FStar_SMTEncoding_Env.cache =
                      (uu___394_11288.FStar_SMTEncoding_Env.cache);
                    FStar_SMTEncoding_Env.nolabels =
                      (uu___394_11288.FStar_SMTEncoding_Env.nolabels);
                    FStar_SMTEncoding_Env.use_zfuel_name =
                      (uu___394_11288.FStar_SMTEncoding_Env.use_zfuel_name);
                    FStar_SMTEncoding_Env.encode_non_total_function_typ =
                      (uu___394_11288.FStar_SMTEncoding_Env.encode_non_total_function_typ);
                    FStar_SMTEncoding_Env.current_module_name =
                      (uu___394_11288.FStar_SMTEncoding_Env.current_module_name);
                    FStar_SMTEncoding_Env.encoding_quantifier =
                      (uu___394_11288.FStar_SMTEncoding_Env.encoding_quantifier)
                  }  in
                let f2 =
                  FStar_TypeChecker_Normalize.normalize
                    [FStar_TypeChecker_Env.Beta;
                    FStar_TypeChecker_Env.Eager_unfolding]
                    env1.FStar_SMTEncoding_Env.tcenv f1
                   in
                let uu____11291 =
                  FStar_SMTEncoding_EncodeTerm.encode_formula f2 env1  in
                (match uu____11291 with
                 | (f3,decls) ->
                     let g =
                       let uu____11305 =
                         let uu____11306 =
                           let uu____11314 =
                             let uu____11315 =
                               let uu____11317 =
                                 FStar_Syntax_Print.lid_to_string l  in
                               FStar_Util.format1 "Assumption: %s"
                                 uu____11317
                                in
                             FStar_Pervasives_Native.Some uu____11315  in
                           let uu____11321 =
                             FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.mk_unique
                               (Prims.strcat "assumption_" l.FStar_Ident.str)
                              in
                           (f3, uu____11314, uu____11321)  in
                         FStar_SMTEncoding_Util.mkAssume uu____11306  in
                       [uu____11305]  in
                     ((FStar_List.append decls g), env1)))
       | FStar_Syntax_Syntax.Sig_let (lbs,uu____11326) when
           (FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
              (FStar_List.contains FStar_Syntax_Syntax.Irreducible))
             ||
             (FStar_All.pipe_right se.FStar_Syntax_Syntax.sigattrs
                (FStar_Util.for_some is_opaque_to_smt))
           ->
           let attrs = se.FStar_Syntax_Syntax.sigattrs  in
           let uu____11340 =
             FStar_Util.fold_map
               (fun env1  ->
                  fun lb  ->
                    let lid =
                      let uu____11362 =
                        let uu____11365 =
                          FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
                        uu____11365.FStar_Syntax_Syntax.fv_name  in
                      uu____11362.FStar_Syntax_Syntax.v  in
                    let uu____11366 =
                      let uu____11368 =
                        FStar_TypeChecker_Env.try_lookup_val_decl
                          env1.FStar_SMTEncoding_Env.tcenv lid
                         in
                      FStar_All.pipe_left FStar_Option.isNone uu____11368  in
                    if uu____11366
                    then
                      let val_decl =
                        let uu___395_11400 = se  in
                        {
                          FStar_Syntax_Syntax.sigel =
                            (FStar_Syntax_Syntax.Sig_declare_typ
                               (lid, (lb.FStar_Syntax_Syntax.lbunivs),
                                 (lb.FStar_Syntax_Syntax.lbtyp)));
                          FStar_Syntax_Syntax.sigrng =
                            (uu___395_11400.FStar_Syntax_Syntax.sigrng);
                          FStar_Syntax_Syntax.sigquals =
                            (FStar_Syntax_Syntax.Irreducible ::
                            (se.FStar_Syntax_Syntax.sigquals));
                          FStar_Syntax_Syntax.sigmeta =
                            (uu___395_11400.FStar_Syntax_Syntax.sigmeta);
                          FStar_Syntax_Syntax.sigattrs =
                            (uu___395_11400.FStar_Syntax_Syntax.sigattrs)
                        }  in
                      let uu____11401 = encode_sigelt' env1 val_decl  in
                      match uu____11401 with | (decls,env2) -> (env2, decls)
                    else (env1, [])) env (FStar_Pervasives_Native.snd lbs)
              in
           (match uu____11340 with
            | (env1,decls) -> ((FStar_List.flatten decls), env1))
       | FStar_Syntax_Syntax.Sig_let
           ((uu____11437,{ FStar_Syntax_Syntax.lbname = FStar_Util.Inr b2t1;
                           FStar_Syntax_Syntax.lbunivs = uu____11439;
                           FStar_Syntax_Syntax.lbtyp = uu____11440;
                           FStar_Syntax_Syntax.lbeff = uu____11441;
                           FStar_Syntax_Syntax.lbdef = uu____11442;
                           FStar_Syntax_Syntax.lbattrs = uu____11443;
                           FStar_Syntax_Syntax.lbpos = uu____11444;_}::[]),uu____11445)
           when FStar_Syntax_Syntax.fv_eq_lid b2t1 FStar_Parser_Const.b2t_lid
           ->
           let uu____11464 =
             FStar_SMTEncoding_Env.new_term_constant_and_tok_from_lid env
               (b2t1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
               (Prims.parse_int "1")
              in
           (match uu____11464 with
            | (tname,ttok,env1) ->
                let xx =
                  FStar_SMTEncoding_Term.mk_fv
                    ("x", FStar_SMTEncoding_Term.Term_sort)
                   in
                let x = FStar_SMTEncoding_Util.mkFreeV xx  in
                let b2t_x = FStar_SMTEncoding_Util.mkApp ("Prims.b2t", [x])
                   in
                let valid_b2t_x =
                  FStar_SMTEncoding_Util.mkApp ("Valid", [b2t_x])  in
                let decls =
                  let uu____11502 =
                    let uu____11505 =
                      let uu____11506 =
                        let uu____11514 =
                          let uu____11515 =
                            FStar_Syntax_Syntax.range_of_fv b2t1  in
                          let uu____11516 =
                            let uu____11527 =
                              let uu____11528 =
                                let uu____11533 =
                                  FStar_SMTEncoding_Util.mkApp
                                    ((FStar_Pervasives_Native.snd
                                        FStar_SMTEncoding_Term.boxBoolFun),
                                      [x])
                                   in
                                (valid_b2t_x, uu____11533)  in
                              FStar_SMTEncoding_Util.mkEq uu____11528  in
                            ([[b2t_x]], [xx], uu____11527)  in
                          FStar_SMTEncoding_Term.mkForall uu____11515
                            uu____11516
                           in
                        (uu____11514,
                          (FStar_Pervasives_Native.Some "b2t def"),
                          "b2t_def")
                         in
                      FStar_SMTEncoding_Util.mkAssume uu____11506  in
                    [uu____11505]  in
                  (FStar_SMTEncoding_Term.DeclFun
                     (tname, [FStar_SMTEncoding_Term.Term_sort],
                       FStar_SMTEncoding_Term.Term_sort,
                       FStar_Pervasives_Native.None))
                    :: uu____11502
                   in
                (decls, env1))
       | FStar_Syntax_Syntax.Sig_let (uu____11571,uu____11572) when
           FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_Util.for_some
                (fun uu___377_11582  ->
                   match uu___377_11582 with
                   | FStar_Syntax_Syntax.Discriminator uu____11584 -> true
                   | uu____11586 -> false))
           -> ([], env)
       | FStar_Syntax_Syntax.Sig_let (uu____11588,lids) when
           (FStar_All.pipe_right lids
              (FStar_Util.for_some
                 (fun l  ->
                    let uu____11600 =
                      let uu____11602 = FStar_List.hd l.FStar_Ident.ns  in
                      uu____11602.FStar_Ident.idText  in
                    uu____11600 = "Prims")))
             &&
             (FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
                (FStar_Util.for_some
                   (fun uu___378_11609  ->
                      match uu___378_11609 with
                      | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen 
                          -> true
                      | uu____11612 -> false)))
           -> ([], env)
       | FStar_Syntax_Syntax.Sig_let ((false ,lb::[]),uu____11615) when
           FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_Util.for_some
                (fun uu___379_11629  ->
                   match uu___379_11629 with
                   | FStar_Syntax_Syntax.Projector uu____11631 -> true
                   | uu____11637 -> false))
           ->
           let fv = FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
           let l = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v  in
           let uu____11641 = FStar_SMTEncoding_Env.try_lookup_free_var env l
              in
           (match uu____11641 with
            | FStar_Pervasives_Native.Some uu____11648 -> ([], env)
            | FStar_Pervasives_Native.None  ->
                let se1 =
                  let uu___396_11650 = se  in
                  let uu____11651 = FStar_Ident.range_of_lid l  in
                  {
                    FStar_Syntax_Syntax.sigel =
                      (FStar_Syntax_Syntax.Sig_declare_typ
                         (l, (lb.FStar_Syntax_Syntax.lbunivs),
                           (lb.FStar_Syntax_Syntax.lbtyp)));
                    FStar_Syntax_Syntax.sigrng = uu____11651;
                    FStar_Syntax_Syntax.sigquals =
                      (uu___396_11650.FStar_Syntax_Syntax.sigquals);
                    FStar_Syntax_Syntax.sigmeta =
                      (uu___396_11650.FStar_Syntax_Syntax.sigmeta);
                    FStar_Syntax_Syntax.sigattrs =
                      (uu___396_11650.FStar_Syntax_Syntax.sigattrs)
                  }  in
                encode_sigelt env se1)
       | FStar_Syntax_Syntax.Sig_let ((is_rec,bindings),uu____11654) ->
           encode_top_level_let env (is_rec, bindings)
             se.FStar_Syntax_Syntax.sigquals
       | FStar_Syntax_Syntax.Sig_bundle (ses,uu____11669) ->
           let uu____11678 = encode_sigelts env ses  in
           (match uu____11678 with
            | (g,env1) ->
                let uu____11695 =
                  FStar_All.pipe_right g
                    (FStar_List.partition
                       (fun uu___380_11718  ->
                          match uu___380_11718 with
                          | FStar_SMTEncoding_Term.Assume
                              {
                                FStar_SMTEncoding_Term.assumption_term =
                                  uu____11720;
                                FStar_SMTEncoding_Term.assumption_caption =
                                  FStar_Pervasives_Native.Some
                                  "inversion axiom";
                                FStar_SMTEncoding_Term.assumption_name =
                                  uu____11721;
                                FStar_SMTEncoding_Term.assumption_fact_ids =
                                  uu____11722;_}
                              -> false
                          | uu____11729 -> true))
                   in
                (match uu____11695 with
                 | (g',inversions) ->
                     let uu____11745 =
                       FStar_All.pipe_right g'
                         (FStar_List.partition
                            (fun uu___381_11766  ->
                               match uu___381_11766 with
                               | FStar_SMTEncoding_Term.DeclFun uu____11768
                                   -> true
                               | uu____11781 -> false))
                        in
                     (match uu____11745 with
                      | (decls,rest) ->
                          ((FStar_List.append decls
                              (FStar_List.append rest inversions)), env1))))
       | FStar_Syntax_Syntax.Sig_inductive_typ
           (t,uu____11798,tps,k,uu____11801,datas) ->
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let is_logical =
             FStar_All.pipe_right quals
               (FStar_Util.for_some
                  (fun uu___382_11820  ->
                     match uu___382_11820 with
                     | FStar_Syntax_Syntax.Logic  -> true
                     | FStar_Syntax_Syntax.Assumption  -> true
                     | uu____11824 -> false))
              in
           let constructor_or_logic_type_decl c =
             if is_logical
             then
               let uu____11837 = c  in
               match uu____11837 with
               | (name,args,uu____11842,uu____11843,uu____11844) ->
                   let uu____11855 =
                     let uu____11856 =
                       let uu____11868 =
                         FStar_All.pipe_right args
                           (FStar_List.map
                              (fun uu____11895  ->
                                 match uu____11895 with
                                 | (uu____11904,sort,uu____11906) -> sort))
                          in
                       (name, uu____11868, FStar_SMTEncoding_Term.Term_sort,
                         FStar_Pervasives_Native.None)
                        in
                     FStar_SMTEncoding_Term.DeclFun uu____11856  in
                   [uu____11855]
             else
               (let uu____11917 = FStar_Ident.range_of_lid t  in
                FStar_SMTEncoding_Term.constructor_to_decl uu____11917 c)
              in
           let inversion_axioms tapp vars =
             let uu____11935 =
               FStar_All.pipe_right datas
                 (FStar_Util.for_some
                    (fun l  ->
                       let uu____11943 =
                         FStar_TypeChecker_Env.try_lookup_lid
                           env.FStar_SMTEncoding_Env.tcenv l
                          in
                       FStar_All.pipe_right uu____11943 FStar_Option.isNone))
                in
             if uu____11935
             then []
             else
               (let uu____11978 =
                  FStar_SMTEncoding_Env.fresh_fvar "x"
                    FStar_SMTEncoding_Term.Term_sort
                   in
                match uu____11978 with
                | (xxsym,xx) ->
                    let uu____11991 =
                      FStar_All.pipe_right datas
                        (FStar_List.fold_left
                           (fun uu____12030  ->
                              fun l  ->
                                match uu____12030 with
                                | (out,decls) ->
                                    let uu____12050 =
                                      FStar_TypeChecker_Env.lookup_datacon
                                        env.FStar_SMTEncoding_Env.tcenv l
                                       in
                                    (match uu____12050 with
                                     | (uu____12061,data_t) ->
                                         let uu____12063 =
                                           FStar_Syntax_Util.arrow_formals
                                             data_t
                                            in
                                         (match uu____12063 with
                                          | (args,res) ->
                                              let indices =
                                                let uu____12107 =
                                                  let uu____12108 =
                                                    FStar_Syntax_Subst.compress
                                                      res
                                                     in
                                                  uu____12108.FStar_Syntax_Syntax.n
                                                   in
                                                match uu____12107 with
                                                | FStar_Syntax_Syntax.Tm_app
                                                    (uu____12111,indices) ->
                                                    indices
                                                | uu____12137 -> []  in
                                              let env1 =
                                                FStar_All.pipe_right args
                                                  (FStar_List.fold_left
                                                     (fun env1  ->
                                                        fun uu____12167  ->
                                                          match uu____12167
                                                          with
                                                          | (x,uu____12175)
                                                              ->
                                                              let uu____12180
                                                                =
                                                                let uu____12181
                                                                  =
                                                                  let uu____12189
                                                                    =
                                                                    FStar_SMTEncoding_Env.mk_term_projector_name
                                                                    l x  in
                                                                  (uu____12189,
                                                                    [xx])
                                                                   in
                                                                FStar_SMTEncoding_Util.mkApp
                                                                  uu____12181
                                                                 in
                                                              FStar_SMTEncoding_Env.push_term_var
                                                                env1 x
                                                                uu____12180)
                                                     env)
                                                 in
                                              let uu____12194 =
                                                FStar_SMTEncoding_EncodeTerm.encode_args
                                                  indices env1
                                                 in
                                              (match uu____12194 with
                                               | (indices1,decls') ->
                                                   (if
                                                      (FStar_List.length
                                                         indices1)
                                                        <>
                                                        (FStar_List.length
                                                           vars)
                                                    then
                                                      failwith "Impossible"
                                                    else ();
                                                    (let eqs =
                                                       let uu____12219 =
                                                         FStar_List.map2
                                                           (fun v1  ->
                                                              fun a  ->
                                                                let uu____12227
                                                                  =
                                                                  let uu____12232
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    v1  in
                                                                  (uu____12232,
                                                                    a)
                                                                   in
                                                                FStar_SMTEncoding_Util.mkEq
                                                                  uu____12227)
                                                           vars indices1
                                                          in
                                                       FStar_All.pipe_right
                                                         uu____12219
                                                         FStar_SMTEncoding_Util.mk_and_l
                                                        in
                                                     let uu____12235 =
                                                       let uu____12236 =
                                                         let uu____12241 =
                                                           let uu____12242 =
                                                             let uu____12247
                                                               =
                                                               FStar_SMTEncoding_Env.mk_data_tester
                                                                 env1 l xx
                                                                in
                                                             (uu____12247,
                                                               eqs)
                                                              in
                                                           FStar_SMTEncoding_Util.mkAnd
                                                             uu____12242
                                                            in
                                                         (out, uu____12241)
                                                          in
                                                       FStar_SMTEncoding_Util.mkOr
                                                         uu____12236
                                                        in
                                                     (uu____12235,
                                                       (FStar_List.append
                                                          decls decls'))))))))
                           (FStar_SMTEncoding_Util.mkFalse, []))
                       in
                    (match uu____11991 with
                     | (data_ax,decls) ->
                         let uu____12260 =
                           FStar_SMTEncoding_Env.fresh_fvar "f"
                             FStar_SMTEncoding_Term.Fuel_sort
                            in
                         (match uu____12260 with
                          | (ffsym,ff) ->
                              let fuel_guarded_inversion =
                                let xx_has_type_sfuel =
                                  if
                                    (FStar_List.length datas) >
                                      (Prims.parse_int "1")
                                  then
                                    let uu____12277 =
                                      FStar_SMTEncoding_Util.mkApp
                                        ("SFuel", [ff])
                                       in
                                    FStar_SMTEncoding_Term.mk_HasTypeFuel
                                      uu____12277 xx tapp
                                  else
                                    FStar_SMTEncoding_Term.mk_HasTypeFuel ff
                                      xx tapp
                                   in
                                let uu____12284 =
                                  let uu____12292 =
                                    let uu____12293 =
                                      FStar_Ident.range_of_lid t  in
                                    let uu____12294 =
                                      let uu____12305 =
                                        let uu____12306 =
                                          FStar_SMTEncoding_Term.mk_fv
                                            (ffsym,
                                              FStar_SMTEncoding_Term.Fuel_sort)
                                           in
                                        let uu____12308 =
                                          let uu____12311 =
                                            FStar_SMTEncoding_Term.mk_fv
                                              (xxsym,
                                                FStar_SMTEncoding_Term.Term_sort)
                                             in
                                          uu____12311 :: vars  in
                                        FStar_SMTEncoding_Env.add_fuel
                                          uu____12306 uu____12308
                                         in
                                      let uu____12313 =
                                        FStar_SMTEncoding_Util.mkImp
                                          (xx_has_type_sfuel, data_ax)
                                         in
                                      ([[xx_has_type_sfuel]], uu____12305,
                                        uu____12313)
                                       in
                                    FStar_SMTEncoding_Term.mkForall
                                      uu____12293 uu____12294
                                     in
                                  let uu____12322 =
                                    FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.mk_unique
                                      (Prims.strcat "fuel_guarded_inversion_"
                                         t.FStar_Ident.str)
                                     in
                                  (uu____12292,
                                    (FStar_Pervasives_Native.Some
                                       "inversion axiom"), uu____12322)
                                   in
                                FStar_SMTEncoding_Util.mkAssume uu____12284
                                 in
                              FStar_List.append decls
                                [fuel_guarded_inversion])))
              in
           let uu____12328 =
             let uu____12333 =
               let uu____12334 = FStar_Syntax_Subst.compress k  in
               uu____12334.FStar_Syntax_Syntax.n  in
             match uu____12333 with
             | FStar_Syntax_Syntax.Tm_arrow (formals,kres) ->
                 ((FStar_List.append tps formals),
                   (FStar_Syntax_Util.comp_result kres))
             | uu____12369 -> (tps, k)  in
           (match uu____12328 with
            | (formals,res) ->
                let uu____12376 = FStar_Syntax_Subst.open_term formals res
                   in
                (match uu____12376 with
                 | (formals1,res1) ->
                     let uu____12387 =
                       FStar_SMTEncoding_EncodeTerm.encode_binders
                         FStar_Pervasives_Native.None formals1 env
                        in
                     (match uu____12387 with
                      | (vars,guards,env',binder_decls,uu____12412) ->
                          let arity = FStar_List.length vars  in
                          let uu____12426 =
                            FStar_SMTEncoding_Env.new_term_constant_and_tok_from_lid
                              env t arity
                             in
                          (match uu____12426 with
                           | (tname,ttok,env1) ->
                               let ttok_tm =
                                 FStar_SMTEncoding_Util.mkApp (ttok, [])  in
                               let guard =
                                 FStar_SMTEncoding_Util.mk_and_l guards  in
                               let tapp =
                                 let uu____12456 =
                                   let uu____12464 =
                                     FStar_List.map
                                       FStar_SMTEncoding_Util.mkFreeV vars
                                      in
                                   (tname, uu____12464)  in
                                 FStar_SMTEncoding_Util.mkApp uu____12456  in
                               let uu____12470 =
                                 let tname_decl =
                                   let uu____12480 =
                                     let uu____12481 =
                                       FStar_All.pipe_right vars
                                         (FStar_List.map
                                            (fun fv  ->
                                               let uu____12500 =
                                                 let uu____12502 =
                                                   FStar_SMTEncoding_Term.fv_name
                                                     fv
                                                    in
                                                 Prims.strcat tname
                                                   uu____12502
                                                  in
                                               let uu____12504 =
                                                 FStar_SMTEncoding_Term.fv_sort
                                                   fv
                                                  in
                                               (uu____12500, uu____12504,
                                                 false)))
                                        in
                                     let uu____12508 =
                                       FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.next_id
                                         ()
                                        in
                                     (tname, uu____12481,
                                       FStar_SMTEncoding_Term.Term_sort,
                                       uu____12508, false)
                                      in
                                   constructor_or_logic_type_decl uu____12480
                                    in
                                 let uu____12516 =
                                   match vars with
                                   | [] ->
                                       let uu____12529 =
                                         let uu____12530 =
                                           let uu____12533 =
                                             FStar_SMTEncoding_Util.mkApp
                                               (tname, [])
                                              in
                                           FStar_All.pipe_left
                                             (fun _0_3  ->
                                                FStar_Pervasives_Native.Some
                                                  _0_3) uu____12533
                                            in
                                         FStar_SMTEncoding_Env.push_free_var
                                           env1 t arity tname uu____12530
                                          in
                                       ([], uu____12529)
                                   | uu____12545 ->
                                       let ttok_decl =
                                         FStar_SMTEncoding_Term.DeclFun
                                           (ttok, [],
                                             FStar_SMTEncoding_Term.Term_sort,
                                             (FStar_Pervasives_Native.Some
                                                "token"))
                                          in
                                       let ttok_fresh =
                                         let uu____12555 =
                                           FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.next_id
                                             ()
                                            in
                                         FStar_SMTEncoding_Term.fresh_token
                                           (ttok,
                                             FStar_SMTEncoding_Term.Term_sort)
                                           uu____12555
                                          in
                                       let ttok_app =
                                         FStar_SMTEncoding_EncodeTerm.mk_Apply
                                           ttok_tm vars
                                          in
                                       let pats = [[ttok_app]; [tapp]]  in
                                       let name_tok_corr =
                                         let uu____12571 =
                                           let uu____12579 =
                                             let uu____12580 =
                                               FStar_Ident.range_of_lid t  in
                                             let uu____12581 =
                                               let uu____12597 =
                                                 FStar_SMTEncoding_Util.mkEq
                                                   (ttok_app, tapp)
                                                  in
                                               (pats,
                                                 FStar_Pervasives_Native.None,
                                                 vars, uu____12597)
                                                in
                                             FStar_SMTEncoding_Term.mkForall'
                                               uu____12580 uu____12581
                                              in
                                           (uu____12579,
                                             (FStar_Pervasives_Native.Some
                                                "name-token correspondence"),
                                             (Prims.strcat
                                                "token_correspondence_" ttok))
                                            in
                                         FStar_SMTEncoding_Util.mkAssume
                                           uu____12571
                                          in
                                       ([ttok_decl;
                                        ttok_fresh;
                                        name_tok_corr], env1)
                                    in
                                 match uu____12516 with
                                 | (tok_decls,env2) ->
                                     let uu____12624 =
                                       FStar_Ident.lid_equals t
                                         FStar_Parser_Const.lex_t_lid
                                        in
                                     if uu____12624
                                     then (tok_decls, env2)
                                     else
                                       ((FStar_List.append tname_decl
                                           tok_decls), env2)
                                  in
                               (match uu____12470 with
                                | (decls,env2) ->
                                    let kindingAx =
                                      let uu____12652 =
                                        FStar_SMTEncoding_EncodeTerm.encode_term_pred
                                          FStar_Pervasives_Native.None res1
                                          env' tapp
                                         in
                                      match uu____12652 with
                                      | (k1,decls1) ->
                                          let karr =
                                            if
                                              (FStar_List.length formals1) >
                                                (Prims.parse_int "0")
                                            then
                                              let uu____12674 =
                                                let uu____12675 =
                                                  let uu____12683 =
                                                    let uu____12684 =
                                                      FStar_SMTEncoding_Term.mk_PreType
                                                        ttok_tm
                                                       in
                                                    FStar_SMTEncoding_Term.mk_tester
                                                      "Tm_arrow" uu____12684
                                                     in
                                                  (uu____12683,
                                                    (FStar_Pervasives_Native.Some
                                                       "kinding"),
                                                    (Prims.strcat
                                                       "pre_kinding_" ttok))
                                                   in
                                                FStar_SMTEncoding_Util.mkAssume
                                                  uu____12675
                                                 in
                                              [uu____12674]
                                            else []  in
                                          let uu____12692 =
                                            let uu____12695 =
                                              let uu____12698 =
                                                let uu____12699 =
                                                  let uu____12707 =
                                                    let uu____12708 =
                                                      FStar_Ident.range_of_lid
                                                        t
                                                       in
                                                    let uu____12709 =
                                                      let uu____12720 =
                                                        FStar_SMTEncoding_Util.mkImp
                                                          (guard, k1)
                                                         in
                                                      ([[tapp]], vars,
                                                        uu____12720)
                                                       in
                                                    FStar_SMTEncoding_Term.mkForall
                                                      uu____12708 uu____12709
                                                     in
                                                  (uu____12707,
                                                    FStar_Pervasives_Native.None,
                                                    (Prims.strcat "kinding_"
                                                       ttok))
                                                   in
                                                FStar_SMTEncoding_Util.mkAssume
                                                  uu____12699
                                                 in
                                              [uu____12698]  in
                                            FStar_List.append karr
                                              uu____12695
                                             in
                                          FStar_List.append decls1
                                            uu____12692
                                       in
                                    let aux =
                                      let uu____12735 =
                                        let uu____12738 =
                                          inversion_axioms tapp vars  in
                                        let uu____12741 =
                                          let uu____12744 =
                                            let uu____12745 =
                                              FStar_Ident.range_of_lid t  in
                                            pretype_axiom uu____12745 env2
                                              tapp vars
                                             in
                                          [uu____12744]  in
                                        FStar_List.append uu____12738
                                          uu____12741
                                         in
                                      FStar_List.append kindingAx uu____12735
                                       in
                                    let g =
                                      FStar_List.append decls
                                        (FStar_List.append binder_decls aux)
                                       in
                                    (g, env2))))))
       | FStar_Syntax_Syntax.Sig_datacon
           (d,uu____12750,uu____12751,uu____12752,uu____12753,uu____12754)
           when FStar_Ident.lid_equals d FStar_Parser_Const.lexcons_lid ->
           ([], env)
       | FStar_Syntax_Syntax.Sig_datacon
           (d,uu____12762,t,uu____12764,n_tps,uu____12766) ->
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let uu____12776 = FStar_Syntax_Util.arrow_formals t  in
           (match uu____12776 with
            | (formals,t_res) ->
                let arity = FStar_List.length formals  in
                let uu____12824 =
                  FStar_SMTEncoding_Env.new_term_constant_and_tok_from_lid
                    env d arity
                   in
                (match uu____12824 with
                 | (ddconstrsym,ddtok,env1) ->
                     let ddtok_tm = FStar_SMTEncoding_Util.mkApp (ddtok, [])
                        in
                     let uu____12852 =
                       FStar_SMTEncoding_Env.fresh_fvar "f"
                         FStar_SMTEncoding_Term.Fuel_sort
                        in
                     (match uu____12852 with
                      | (fuel_var,fuel_tm) ->
                          let s_fuel_tm =
                            FStar_SMTEncoding_Util.mkApp ("SFuel", [fuel_tm])
                             in
                          let uu____12872 =
                            FStar_SMTEncoding_EncodeTerm.encode_binders
                              (FStar_Pervasives_Native.Some fuel_tm) formals
                              env1
                             in
                          (match uu____12872 with
                           | (vars,guards,env',binder_decls,names1) ->
                               let fields =
                                 FStar_All.pipe_right names1
                                   (FStar_List.mapi
                                      (fun n1  ->
                                         fun x  ->
                                           let projectible = true  in
                                           let uu____12951 =
                                             FStar_SMTEncoding_Env.mk_term_projector_name
                                               d x
                                              in
                                           (uu____12951,
                                             FStar_SMTEncoding_Term.Term_sort,
                                             projectible)))
                                  in
                               let datacons =
                                 let uu____12958 =
                                   let uu____12959 =
                                     FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.next_id
                                       ()
                                      in
                                   (ddconstrsym, fields,
                                     FStar_SMTEncoding_Term.Term_sort,
                                     uu____12959, true)
                                    in
                                 let uu____12967 =
                                   let uu____12974 =
                                     FStar_Ident.range_of_lid d  in
                                   FStar_SMTEncoding_Term.constructor_to_decl
                                     uu____12974
                                    in
                                 FStar_All.pipe_right uu____12958 uu____12967
                                  in
                               let app =
                                 FStar_SMTEncoding_EncodeTerm.mk_Apply
                                   ddtok_tm vars
                                  in
                               let guard =
                                 FStar_SMTEncoding_Util.mk_and_l guards  in
                               let xvars =
                                 FStar_List.map
                                   FStar_SMTEncoding_Util.mkFreeV vars
                                  in
                               let dapp =
                                 FStar_SMTEncoding_Util.mkApp
                                   (ddconstrsym, xvars)
                                  in
                               let uu____12986 =
                                 FStar_SMTEncoding_EncodeTerm.encode_term_pred
                                   FStar_Pervasives_Native.None t env1
                                   ddtok_tm
                                  in
                               (match uu____12986 with
                                | (tok_typing,decls3) ->
                                    let tok_typing1 =
                                      match fields with
                                      | uu____12998::uu____12999 ->
                                          let ff =
                                            FStar_SMTEncoding_Term.mk_fv
                                              ("ty",
                                                FStar_SMTEncoding_Term.Term_sort)
                                             in
                                          let f =
                                            FStar_SMTEncoding_Util.mkFreeV ff
                                             in
                                          let vtok_app_l =
                                            FStar_SMTEncoding_EncodeTerm.mk_Apply
                                              ddtok_tm [ff]
                                             in
                                          let vtok_app_r =
                                            let uu____13048 =
                                              let uu____13049 =
                                                FStar_SMTEncoding_Term.mk_fv
                                                  (ddtok,
                                                    FStar_SMTEncoding_Term.Term_sort)
                                                 in
                                              [uu____13049]  in
                                            FStar_SMTEncoding_EncodeTerm.mk_Apply
                                              f uu____13048
                                             in
                                          let uu____13075 =
                                            FStar_Ident.range_of_lid d  in
                                          let uu____13076 =
                                            let uu____13087 =
                                              FStar_SMTEncoding_Term.mk_NoHoist
                                                f tok_typing
                                               in
                                            ([[vtok_app_l]; [vtok_app_r]],
                                              [ff], uu____13087)
                                             in
                                          FStar_SMTEncoding_Term.mkForall
                                            uu____13075 uu____13076
                                      | uu____13114 -> tok_typing  in
                                    let uu____13125 =
                                      FStar_SMTEncoding_EncodeTerm.encode_binders
                                        (FStar_Pervasives_Native.Some fuel_tm)
                                        formals env1
                                       in
                                    (match uu____13125 with
                                     | (vars',guards',env'',decls_formals,uu____13150)
                                         ->
                                         let uu____13163 =
                                           let xvars1 =
                                             FStar_List.map
                                               FStar_SMTEncoding_Util.mkFreeV
                                               vars'
                                              in
                                           let dapp1 =
                                             FStar_SMTEncoding_Util.mkApp
                                               (ddconstrsym, xvars1)
                                              in
                                           FStar_SMTEncoding_EncodeTerm.encode_term_pred
                                             (FStar_Pervasives_Native.Some
                                                fuel_tm) t_res env'' dapp1
                                            in
                                         (match uu____13163 with
                                          | (ty_pred',decls_pred) ->
                                              let guard' =
                                                FStar_SMTEncoding_Util.mk_and_l
                                                  guards'
                                                 in
                                              let proxy_fresh =
                                                match formals with
                                                | [] -> []
                                                | uu____13193 ->
                                                    let uu____13202 =
                                                      let uu____13203 =
                                                        FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.next_id
                                                          ()
                                                         in
                                                      FStar_SMTEncoding_Term.fresh_token
                                                        (ddtok,
                                                          FStar_SMTEncoding_Term.Term_sort)
                                                        uu____13203
                                                       in
                                                    [uu____13202]
                                                 in
                                              let encode_elim uu____13219 =
                                                let uu____13220 =
                                                  FStar_Syntax_Util.head_and_args
                                                    t_res
                                                   in
                                                match uu____13220 with
                                                | (head1,args) ->
                                                    let uu____13271 =
                                                      let uu____13272 =
                                                        FStar_Syntax_Subst.compress
                                                          head1
                                                         in
                                                      uu____13272.FStar_Syntax_Syntax.n
                                                       in
                                                    (match uu____13271 with
                                                     | FStar_Syntax_Syntax.Tm_uinst
                                                         ({
                                                            FStar_Syntax_Syntax.n
                                                              =
                                                              FStar_Syntax_Syntax.Tm_fvar
                                                              fv;
                                                            FStar_Syntax_Syntax.pos
                                                              = uu____13284;
                                                            FStar_Syntax_Syntax.vars
                                                              = uu____13285;_},uu____13286)
                                                         ->
                                                         let encoded_head_fvb
                                                           =
                                                           FStar_SMTEncoding_Env.lookup_free_var_name
                                                             env'
                                                             fv.FStar_Syntax_Syntax.fv_name
                                                            in
                                                         let uu____13292 =
                                                           FStar_SMTEncoding_EncodeTerm.encode_args
                                                             args env'
                                                            in
                                                         (match uu____13292
                                                          with
                                                          | (encoded_args,arg_decls)
                                                              ->
                                                              let guards_for_parameter
                                                                orig_arg arg
                                                                xv =
                                                                let fv1 =
                                                                  match 
                                                                    arg.FStar_SMTEncoding_Term.tm
                                                                  with
                                                                  | FStar_SMTEncoding_Term.FreeV
                                                                    fv1 ->
                                                                    fv1
                                                                  | uu____13355
                                                                    ->
                                                                    let uu____13356
                                                                    =
                                                                    let uu____13362
                                                                    =
                                                                    let uu____13364
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    orig_arg
                                                                     in
                                                                    FStar_Util.format1
                                                                    "Inductive type parameter %s must be a variable ; You may want to change it to an index."
                                                                    uu____13364
                                                                     in
                                                                    (FStar_Errors.Fatal_NonVariableInductiveTypeParameter,
                                                                    uu____13362)
                                                                     in
                                                                    FStar_Errors.raise_error
                                                                    uu____13356
                                                                    orig_arg.FStar_Syntax_Syntax.pos
                                                                   in
                                                                let guards1 =
                                                                  FStar_All.pipe_right
                                                                    guards
                                                                    (
                                                                    FStar_List.collect
                                                                    (fun g 
                                                                    ->
                                                                    let uu____13387
                                                                    =
                                                                    let uu____13389
                                                                    =
                                                                    FStar_SMTEncoding_Term.free_variables
                                                                    g  in
                                                                    FStar_List.contains
                                                                    fv1
                                                                    uu____13389
                                                                     in
                                                                    if
                                                                    uu____13387
                                                                    then
                                                                    let uu____13411
                                                                    =
                                                                    FStar_SMTEncoding_Term.subst
                                                                    g fv1 xv
                                                                     in
                                                                    [uu____13411]
                                                                    else []))
                                                                   in
                                                                FStar_SMTEncoding_Util.mk_and_l
                                                                  guards1
                                                                 in
                                                              let uu____13414
                                                                =
                                                                let uu____13428
                                                                  =
                                                                  FStar_List.zip
                                                                    args
                                                                    encoded_args
                                                                   in
                                                                FStar_List.fold_left
                                                                  (fun
                                                                    uu____13485
                                                                     ->
                                                                    fun
                                                                    uu____13486
                                                                     ->
                                                                    match 
                                                                    (uu____13485,
                                                                    uu____13486)
                                                                    with
                                                                    | 
                                                                    ((env2,arg_vars,eqns_or_guards,i),
                                                                    (orig_arg,arg))
                                                                    ->
                                                                    let uu____13597
                                                                    =
                                                                    let uu____13605
                                                                    =
                                                                    FStar_Syntax_Syntax.new_bv
                                                                    FStar_Pervasives_Native.None
                                                                    FStar_Syntax_Syntax.tun
                                                                     in
                                                                    FStar_SMTEncoding_Env.gen_term_var
                                                                    env2
                                                                    uu____13605
                                                                     in
                                                                    (match uu____13597
                                                                    with
                                                                    | 
                                                                    (uu____13619,xv,env3)
                                                                    ->
                                                                    let eqns
                                                                    =
                                                                    if
                                                                    i < n_tps
                                                                    then
                                                                    let uu____13630
                                                                    =
                                                                    guards_for_parameter
                                                                    (FStar_Pervasives_Native.fst
                                                                    orig_arg)
                                                                    arg xv
                                                                     in
                                                                    uu____13630
                                                                    ::
                                                                    eqns_or_guards
                                                                    else
                                                                    (let uu____13635
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (arg, xv)
                                                                     in
                                                                    uu____13635
                                                                    ::
                                                                    eqns_or_guards)
                                                                     in
                                                                    (env3,
                                                                    (xv ::
                                                                    arg_vars),
                                                                    eqns,
                                                                    (i +
                                                                    (Prims.parse_int "1")))))
                                                                  (env', [],
                                                                    [],
                                                                    (Prims.parse_int "0"))
                                                                  uu____13428
                                                                 in
                                                              (match uu____13414
                                                               with
                                                               | (uu____13656,arg_vars,elim_eqns_or_guards,uu____13659)
                                                                   ->
                                                                   let arg_vars1
                                                                    =
                                                                    FStar_List.rev
                                                                    arg_vars
                                                                     in
                                                                   let ty =
                                                                    FStar_SMTEncoding_EncodeTerm.maybe_curry_fvb
                                                                    (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.p
                                                                    encoded_head_fvb
                                                                    arg_vars1
                                                                     in
                                                                   let xvars1
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    vars  in
                                                                   let dapp1
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkApp
                                                                    (ddconstrsym,
                                                                    xvars1)
                                                                     in
                                                                   let ty_pred
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                                                    (FStar_Pervasives_Native.Some
                                                                    s_fuel_tm)
                                                                    dapp1 ty
                                                                     in
                                                                   let arg_binders
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Term.fv_of_term
                                                                    arg_vars1
                                                                     in
                                                                   let typing_inversion
                                                                    =
                                                                    let uu____13686
                                                                    =
                                                                    let uu____13694
                                                                    =
                                                                    let uu____13695
                                                                    =
                                                                    FStar_Ident.range_of_lid
                                                                    d  in
                                                                    let uu____13696
                                                                    =
                                                                    let uu____13707
                                                                    =
                                                                    let uu____13708
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                     in
                                                                    FStar_SMTEncoding_Env.add_fuel
                                                                    uu____13708
                                                                    (FStar_List.append
                                                                    vars
                                                                    arg_binders)
                                                                     in
                                                                    let uu____13710
                                                                    =
                                                                    let uu____13711
                                                                    =
                                                                    let uu____13716
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    (FStar_List.append
                                                                    elim_eqns_or_guards
                                                                    guards)
                                                                     in
                                                                    (ty_pred,
                                                                    uu____13716)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____13711
                                                                     in
                                                                    ([
                                                                    [ty_pred]],
                                                                    uu____13707,
                                                                    uu____13710)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____13695
                                                                    uu____13696
                                                                     in
                                                                    (uu____13694,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "data constructor typing elim"),
                                                                    (Prims.strcat
                                                                    "data_elim_"
                                                                    ddconstrsym))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____13686
                                                                     in
                                                                   let subterm_ordering
                                                                    =
                                                                    let lex_t1
                                                                    =
                                                                    let uu____13731
                                                                    =
                                                                    let uu____13732
                                                                    =
                                                                    let uu____13738
                                                                    =
                                                                    FStar_Ident.text_of_lid
                                                                    FStar_Parser_Const.lex_t_lid
                                                                     in
                                                                    (uu____13738,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    uu____13732
                                                                     in
                                                                    FStar_All.pipe_left
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    uu____13731
                                                                     in
                                                                    let uu____13741
                                                                    =
                                                                    FStar_Ident.lid_equals
                                                                    d
                                                                    FStar_Parser_Const.lextop_lid
                                                                     in
                                                                    if
                                                                    uu____13741
                                                                    then
                                                                    let x =
                                                                    let uu____13745
                                                                    =
                                                                    let uu____13751
                                                                    =
                                                                    FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.fresh
                                                                    "x"  in
                                                                    (uu____13751,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    uu____13745
                                                                     in
                                                                    let xtm =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    x  in
                                                                    let uu____13756
                                                                    =
                                                                    let uu____13764
                                                                    =
                                                                    let uu____13765
                                                                    =
                                                                    FStar_Ident.range_of_lid
                                                                    d  in
                                                                    let uu____13766
                                                                    =
                                                                    let uu____13777
                                                                    =
                                                                    let uu____13782
                                                                    =
                                                                    let uu____13785
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    lex_t1
                                                                    lex_t1
                                                                    xtm dapp1
                                                                     in
                                                                    [uu____13785]
                                                                     in
                                                                    [uu____13782]
                                                                     in
                                                                    let uu____13790
                                                                    =
                                                                    let uu____13791
                                                                    =
                                                                    let uu____13796
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_tester
                                                                    "LexCons"
                                                                    xtm  in
                                                                    let uu____13798
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    lex_t1
                                                                    lex_t1
                                                                    xtm dapp1
                                                                     in
                                                                    (uu____13796,
                                                                    uu____13798)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____13791
                                                                     in
                                                                    (uu____13777,
                                                                    [x],
                                                                    uu____13790)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____13765
                                                                    uu____13766
                                                                     in
                                                                    let uu____13819
                                                                    =
                                                                    FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.mk_unique
                                                                    "lextop"
                                                                     in
                                                                    (uu____13764,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "lextop is top"),
                                                                    uu____13819)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____13756
                                                                    else
                                                                    (let prec
                                                                    =
                                                                    let uu____13830
                                                                    =
                                                                    FStar_All.pipe_right
                                                                    vars
                                                                    (FStar_List.mapi
                                                                    (fun i 
                                                                    ->
                                                                    fun v1 
                                                                    ->
                                                                    if
                                                                    i < n_tps
                                                                    then []
                                                                    else
                                                                    (let uu____13853
                                                                    =
                                                                    let uu____13854
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    v1  in
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    lex_t1
                                                                    lex_t1
                                                                    uu____13854
                                                                    dapp1  in
                                                                    [uu____13853])))
                                                                     in
                                                                    FStar_All.pipe_right
                                                                    uu____13830
                                                                    FStar_List.flatten
                                                                     in
                                                                    let uu____13861
                                                                    =
                                                                    let uu____13869
                                                                    =
                                                                    let uu____13870
                                                                    =
                                                                    FStar_Ident.range_of_lid
                                                                    d  in
                                                                    let uu____13871
                                                                    =
                                                                    let uu____13882
                                                                    =
                                                                    let uu____13883
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                     in
                                                                    FStar_SMTEncoding_Env.add_fuel
                                                                    uu____13883
                                                                    (FStar_List.append
                                                                    vars
                                                                    arg_binders)
                                                                     in
                                                                    let uu____13885
                                                                    =
                                                                    let uu____13886
                                                                    =
                                                                    let uu____13891
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    prec  in
                                                                    (ty_pred,
                                                                    uu____13891)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____13886
                                                                     in
                                                                    ([
                                                                    [ty_pred]],
                                                                    uu____13882,
                                                                    uu____13885)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____13870
                                                                    uu____13871
                                                                     in
                                                                    (uu____13869,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "subterm ordering"),
                                                                    (Prims.strcat
                                                                    "subterm_ordering_"
                                                                    ddconstrsym))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____13861)
                                                                     in
                                                                   (arg_decls,
                                                                    [typing_inversion;
                                                                    subterm_ordering])))
                                                     | FStar_Syntax_Syntax.Tm_fvar
                                                         fv ->
                                                         let encoded_head_fvb
                                                           =
                                                           FStar_SMTEncoding_Env.lookup_free_var_name
                                                             env'
                                                             fv.FStar_Syntax_Syntax.fv_name
                                                            in
                                                         let uu____13910 =
                                                           FStar_SMTEncoding_EncodeTerm.encode_args
                                                             args env'
                                                            in
                                                         (match uu____13910
                                                          with
                                                          | (encoded_args,arg_decls)
                                                              ->
                                                              let guards_for_parameter
                                                                orig_arg arg
                                                                xv =
                                                                let fv1 =
                                                                  match 
                                                                    arg.FStar_SMTEncoding_Term.tm
                                                                  with
                                                                  | FStar_SMTEncoding_Term.FreeV
                                                                    fv1 ->
                                                                    fv1
                                                                  | uu____13973
                                                                    ->
                                                                    let uu____13974
                                                                    =
                                                                    let uu____13980
                                                                    =
                                                                    let uu____13982
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    orig_arg
                                                                     in
                                                                    FStar_Util.format1
                                                                    "Inductive type parameter %s must be a variable ; You may want to change it to an index."
                                                                    uu____13982
                                                                     in
                                                                    (FStar_Errors.Fatal_NonVariableInductiveTypeParameter,
                                                                    uu____13980)
                                                                     in
                                                                    FStar_Errors.raise_error
                                                                    uu____13974
                                                                    orig_arg.FStar_Syntax_Syntax.pos
                                                                   in
                                                                let guards1 =
                                                                  FStar_All.pipe_right
                                                                    guards
                                                                    (
                                                                    FStar_List.collect
                                                                    (fun g 
                                                                    ->
                                                                    let uu____14005
                                                                    =
                                                                    let uu____14007
                                                                    =
                                                                    FStar_SMTEncoding_Term.free_variables
                                                                    g  in
                                                                    FStar_List.contains
                                                                    fv1
                                                                    uu____14007
                                                                     in
                                                                    if
                                                                    uu____14005
                                                                    then
                                                                    let uu____14029
                                                                    =
                                                                    FStar_SMTEncoding_Term.subst
                                                                    g fv1 xv
                                                                     in
                                                                    [uu____14029]
                                                                    else []))
                                                                   in
                                                                FStar_SMTEncoding_Util.mk_and_l
                                                                  guards1
                                                                 in
                                                              let uu____14032
                                                                =
                                                                let uu____14046
                                                                  =
                                                                  FStar_List.zip
                                                                    args
                                                                    encoded_args
                                                                   in
                                                                FStar_List.fold_left
                                                                  (fun
                                                                    uu____14103
                                                                     ->
                                                                    fun
                                                                    uu____14104
                                                                     ->
                                                                    match 
                                                                    (uu____14103,
                                                                    uu____14104)
                                                                    with
                                                                    | 
                                                                    ((env2,arg_vars,eqns_or_guards,i),
                                                                    (orig_arg,arg))
                                                                    ->
                                                                    let uu____14215
                                                                    =
                                                                    let uu____14223
                                                                    =
                                                                    FStar_Syntax_Syntax.new_bv
                                                                    FStar_Pervasives_Native.None
                                                                    FStar_Syntax_Syntax.tun
                                                                     in
                                                                    FStar_SMTEncoding_Env.gen_term_var
                                                                    env2
                                                                    uu____14223
                                                                     in
                                                                    (match uu____14215
                                                                    with
                                                                    | 
                                                                    (uu____14237,xv,env3)
                                                                    ->
                                                                    let eqns
                                                                    =
                                                                    if
                                                                    i < n_tps
                                                                    then
                                                                    let uu____14248
                                                                    =
                                                                    guards_for_parameter
                                                                    (FStar_Pervasives_Native.fst
                                                                    orig_arg)
                                                                    arg xv
                                                                     in
                                                                    uu____14248
                                                                    ::
                                                                    eqns_or_guards
                                                                    else
                                                                    (let uu____14253
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (arg, xv)
                                                                     in
                                                                    uu____14253
                                                                    ::
                                                                    eqns_or_guards)
                                                                     in
                                                                    (env3,
                                                                    (xv ::
                                                                    arg_vars),
                                                                    eqns,
                                                                    (i +
                                                                    (Prims.parse_int "1")))))
                                                                  (env', [],
                                                                    [],
                                                                    (Prims.parse_int "0"))
                                                                  uu____14046
                                                                 in
                                                              (match uu____14032
                                                               with
                                                               | (uu____14274,arg_vars,elim_eqns_or_guards,uu____14277)
                                                                   ->
                                                                   let arg_vars1
                                                                    =
                                                                    FStar_List.rev
                                                                    arg_vars
                                                                     in
                                                                   let ty =
                                                                    FStar_SMTEncoding_EncodeTerm.maybe_curry_fvb
                                                                    (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.p
                                                                    encoded_head_fvb
                                                                    arg_vars1
                                                                     in
                                                                   let xvars1
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    vars  in
                                                                   let dapp1
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkApp
                                                                    (ddconstrsym,
                                                                    xvars1)
                                                                     in
                                                                   let ty_pred
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                                                    (FStar_Pervasives_Native.Some
                                                                    s_fuel_tm)
                                                                    dapp1 ty
                                                                     in
                                                                   let arg_binders
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Term.fv_of_term
                                                                    arg_vars1
                                                                     in
                                                                   let typing_inversion
                                                                    =
                                                                    let uu____14304
                                                                    =
                                                                    let uu____14312
                                                                    =
                                                                    let uu____14313
                                                                    =
                                                                    FStar_Ident.range_of_lid
                                                                    d  in
                                                                    let uu____14314
                                                                    =
                                                                    let uu____14325
                                                                    =
                                                                    let uu____14326
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                     in
                                                                    FStar_SMTEncoding_Env.add_fuel
                                                                    uu____14326
                                                                    (FStar_List.append
                                                                    vars
                                                                    arg_binders)
                                                                     in
                                                                    let uu____14328
                                                                    =
                                                                    let uu____14329
                                                                    =
                                                                    let uu____14334
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    (FStar_List.append
                                                                    elim_eqns_or_guards
                                                                    guards)
                                                                     in
                                                                    (ty_pred,
                                                                    uu____14334)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____14329
                                                                     in
                                                                    ([
                                                                    [ty_pred]],
                                                                    uu____14325,
                                                                    uu____14328)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____14313
                                                                    uu____14314
                                                                     in
                                                                    (uu____14312,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "data constructor typing elim"),
                                                                    (Prims.strcat
                                                                    "data_elim_"
                                                                    ddconstrsym))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____14304
                                                                     in
                                                                   let subterm_ordering
                                                                    =
                                                                    let lex_t1
                                                                    =
                                                                    let uu____14349
                                                                    =
                                                                    let uu____14350
                                                                    =
                                                                    let uu____14356
                                                                    =
                                                                    FStar_Ident.text_of_lid
                                                                    FStar_Parser_Const.lex_t_lid
                                                                     in
                                                                    (uu____14356,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    uu____14350
                                                                     in
                                                                    FStar_All.pipe_left
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    uu____14349
                                                                     in
                                                                    let uu____14359
                                                                    =
                                                                    FStar_Ident.lid_equals
                                                                    d
                                                                    FStar_Parser_Const.lextop_lid
                                                                     in
                                                                    if
                                                                    uu____14359
                                                                    then
                                                                    let x =
                                                                    let uu____14363
                                                                    =
                                                                    let uu____14369
                                                                    =
                                                                    FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.fresh
                                                                    "x"  in
                                                                    (uu____14369,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    uu____14363
                                                                     in
                                                                    let xtm =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    x  in
                                                                    let uu____14374
                                                                    =
                                                                    let uu____14382
                                                                    =
                                                                    let uu____14383
                                                                    =
                                                                    FStar_Ident.range_of_lid
                                                                    d  in
                                                                    let uu____14384
                                                                    =
                                                                    let uu____14395
                                                                    =
                                                                    let uu____14400
                                                                    =
                                                                    let uu____14403
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    lex_t1
                                                                    lex_t1
                                                                    xtm dapp1
                                                                     in
                                                                    [uu____14403]
                                                                     in
                                                                    [uu____14400]
                                                                     in
                                                                    let uu____14408
                                                                    =
                                                                    let uu____14409
                                                                    =
                                                                    let uu____14414
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_tester
                                                                    "LexCons"
                                                                    xtm  in
                                                                    let uu____14416
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    lex_t1
                                                                    lex_t1
                                                                    xtm dapp1
                                                                     in
                                                                    (uu____14414,
                                                                    uu____14416)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____14409
                                                                     in
                                                                    (uu____14395,
                                                                    [x],
                                                                    uu____14408)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____14383
                                                                    uu____14384
                                                                     in
                                                                    let uu____14437
                                                                    =
                                                                    FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.mk_unique
                                                                    "lextop"
                                                                     in
                                                                    (uu____14382,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "lextop is top"),
                                                                    uu____14437)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____14374
                                                                    else
                                                                    (let prec
                                                                    =
                                                                    let uu____14448
                                                                    =
                                                                    FStar_All.pipe_right
                                                                    vars
                                                                    (FStar_List.mapi
                                                                    (fun i 
                                                                    ->
                                                                    fun v1 
                                                                    ->
                                                                    if
                                                                    i < n_tps
                                                                    then []
                                                                    else
                                                                    (let uu____14471
                                                                    =
                                                                    let uu____14472
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    v1  in
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    lex_t1
                                                                    lex_t1
                                                                    uu____14472
                                                                    dapp1  in
                                                                    [uu____14471])))
                                                                     in
                                                                    FStar_All.pipe_right
                                                                    uu____14448
                                                                    FStar_List.flatten
                                                                     in
                                                                    let uu____14479
                                                                    =
                                                                    let uu____14487
                                                                    =
                                                                    let uu____14488
                                                                    =
                                                                    FStar_Ident.range_of_lid
                                                                    d  in
                                                                    let uu____14489
                                                                    =
                                                                    let uu____14500
                                                                    =
                                                                    let uu____14501
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                     in
                                                                    FStar_SMTEncoding_Env.add_fuel
                                                                    uu____14501
                                                                    (FStar_List.append
                                                                    vars
                                                                    arg_binders)
                                                                     in
                                                                    let uu____14503
                                                                    =
                                                                    let uu____14504
                                                                    =
                                                                    let uu____14509
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    prec  in
                                                                    (ty_pred,
                                                                    uu____14509)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____14504
                                                                     in
                                                                    ([
                                                                    [ty_pred]],
                                                                    uu____14500,
                                                                    uu____14503)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____14488
                                                                    uu____14489
                                                                     in
                                                                    (uu____14487,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "subterm ordering"),
                                                                    (Prims.strcat
                                                                    "subterm_ordering_"
                                                                    ddconstrsym))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____14479)
                                                                     in
                                                                   (arg_decls,
                                                                    [typing_inversion;
                                                                    subterm_ordering])))
                                                     | uu____14526 ->
                                                         ((let uu____14528 =
                                                             let uu____14534
                                                               =
                                                               let uu____14536
                                                                 =
                                                                 FStar_Syntax_Print.lid_to_string
                                                                   d
                                                                  in
                                                               let uu____14538
                                                                 =
                                                                 FStar_Syntax_Print.term_to_string
                                                                   head1
                                                                  in
                                                               FStar_Util.format2
                                                                 "Constructor %s builds an unexpected type %s\n"
                                                                 uu____14536
                                                                 uu____14538
                                                                in
                                                             (FStar_Errors.Warning_ConstructorBuildsUnexpectedType,
                                                               uu____14534)
                                                              in
                                                           FStar_Errors.log_issue
                                                             se.FStar_Syntax_Syntax.sigrng
                                                             uu____14528);
                                                          ([], [])))
                                                 in
                                              let uu____14546 =
                                                encode_elim ()  in
                                              (match uu____14546 with
                                               | (decls2,elim) ->
                                                   let g =
                                                     let uu____14572 =
                                                       let uu____14575 =
                                                         let uu____14578 =
                                                           let uu____14581 =
                                                             let uu____14584
                                                               =
                                                               let uu____14585
                                                                 =
                                                                 let uu____14597
                                                                   =
                                                                   let uu____14598
                                                                    =
                                                                    let uu____14600
                                                                    =
                                                                    FStar_Syntax_Print.lid_to_string
                                                                    d  in
                                                                    FStar_Util.format1
                                                                    "data constructor proxy: %s"
                                                                    uu____14600
                                                                     in
                                                                   FStar_Pervasives_Native.Some
                                                                    uu____14598
                                                                    in
                                                                 (ddtok, [],
                                                                   FStar_SMTEncoding_Term.Term_sort,
                                                                   uu____14597)
                                                                  in
                                                               FStar_SMTEncoding_Term.DeclFun
                                                                 uu____14585
                                                                in
                                                             [uu____14584]
                                                              in
                                                           let uu____14607 =
                                                             let uu____14610
                                                               =
                                                               let uu____14613
                                                                 =
                                                                 let uu____14616
                                                                   =
                                                                   let uu____14619
                                                                    =
                                                                    let uu____14622
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    (tok_typing1,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "typing for data constructor proxy"),
                                                                    (Prims.strcat
                                                                    "typing_tok_"
                                                                    ddtok))
                                                                     in
                                                                    let uu____14627
                                                                    =
                                                                    let uu____14630
                                                                    =
                                                                    let uu____14631
                                                                    =
                                                                    let uu____14639
                                                                    =
                                                                    let uu____14640
                                                                    =
                                                                    FStar_Ident.range_of_lid
                                                                    d  in
                                                                    let uu____14641
                                                                    =
                                                                    let uu____14652
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (app,
                                                                    dapp)  in
                                                                    ([[app]],
                                                                    vars,
                                                                    uu____14652)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____14640
                                                                    uu____14641
                                                                     in
                                                                    (uu____14639,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "equality for proxy"),
                                                                    (Prims.strcat
                                                                    "equality_tok_"
                                                                    ddtok))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____14631
                                                                     in
                                                                    let uu____14665
                                                                    =
                                                                    let uu____14668
                                                                    =
                                                                    let uu____14669
                                                                    =
                                                                    let uu____14677
                                                                    =
                                                                    let uu____14678
                                                                    =
                                                                    FStar_Ident.range_of_lid
                                                                    d  in
                                                                    let uu____14679
                                                                    =
                                                                    let uu____14690
                                                                    =
                                                                    let uu____14691
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_fv
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                     in
                                                                    FStar_SMTEncoding_Env.add_fuel
                                                                    uu____14691
                                                                    vars'  in
                                                                    let uu____14693
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    (guard',
                                                                    ty_pred')
                                                                     in
                                                                    ([
                                                                    [ty_pred']],
                                                                    uu____14690,
                                                                    uu____14693)
                                                                     in
                                                                    FStar_SMTEncoding_Term.mkForall
                                                                    uu____14678
                                                                    uu____14679
                                                                     in
                                                                    (uu____14677,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "data constructor typing intro"),
                                                                    (Prims.strcat
                                                                    "data_typing_intro_"
                                                                    ddtok))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____14669
                                                                     in
                                                                    [uu____14668]
                                                                     in
                                                                    uu____14630
                                                                    ::
                                                                    uu____14665
                                                                     in
                                                                    uu____14622
                                                                    ::
                                                                    uu____14627
                                                                     in
                                                                   FStar_List.append
                                                                    uu____14619
                                                                    elim
                                                                    in
                                                                 FStar_List.append
                                                                   decls_pred
                                                                   uu____14616
                                                                  in
                                                               FStar_List.append
                                                                 decls_formals
                                                                 uu____14613
                                                                in
                                                             FStar_List.append
                                                               proxy_fresh
                                                               uu____14610
                                                              in
                                                           FStar_List.append
                                                             uu____14581
                                                             uu____14607
                                                            in
                                                         FStar_List.append
                                                           decls3 uu____14578
                                                          in
                                                       FStar_List.append
                                                         decls2 uu____14575
                                                        in
                                                     FStar_List.append
                                                       binder_decls
                                                       uu____14572
                                                      in
                                                   ((FStar_List.append
                                                       datacons g), env1))))))))))

and (encode_sigelts :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.sigelt Prims.list ->
      (FStar_SMTEncoding_Term.decl Prims.list * FStar_SMTEncoding_Env.env_t))
  =
  fun env  ->
    fun ses  ->
      FStar_All.pipe_right ses
        (FStar_List.fold_left
           (fun uu____14731  ->
              fun se  ->
                match uu____14731 with
                | (g,env1) ->
                    let uu____14751 = encode_sigelt env1 se  in
                    (match uu____14751 with
                     | (g',env2) -> ((FStar_List.append g g'), env2)))
           ([], env))

let (encode_env_bindings :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.binding Prims.list ->
      (FStar_SMTEncoding_Term.decls_t * FStar_SMTEncoding_Env.env_t))
  =
  fun env  ->
    fun bindings  ->
      let encode_binding b uu____14819 =
        match uu____14819 with
        | (i,decls,env1) ->
            (match b with
             | FStar_Syntax_Syntax.Binding_univ uu____14856 ->
                 ((i + (Prims.parse_int "1")), decls, env1)
             | FStar_Syntax_Syntax.Binding_var x ->
                 let t1 =
                   FStar_TypeChecker_Normalize.normalize
                     [FStar_TypeChecker_Env.Beta;
                     FStar_TypeChecker_Env.Eager_unfolding;
                     FStar_TypeChecker_Env.Simplify;
                     FStar_TypeChecker_Env.Primops;
                     FStar_TypeChecker_Env.EraseUniverses]
                     env1.FStar_SMTEncoding_Env.tcenv
                     x.FStar_Syntax_Syntax.sort
                    in
                 ((let uu____14864 =
                     FStar_All.pipe_left
                       (FStar_TypeChecker_Env.debug
                          env1.FStar_SMTEncoding_Env.tcenv)
                       (FStar_Options.Other "SMTEncoding")
                      in
                   if uu____14864
                   then
                     let uu____14869 = FStar_Syntax_Print.bv_to_string x  in
                     let uu____14871 =
                       FStar_Syntax_Print.term_to_string
                         x.FStar_Syntax_Syntax.sort
                        in
                     let uu____14873 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print3 "Normalized %s : %s to %s\n"
                       uu____14869 uu____14871 uu____14873
                   else ());
                  (let uu____14878 =
                     FStar_SMTEncoding_EncodeTerm.encode_term t1 env1  in
                   match uu____14878 with
                   | (t,decls') ->
                       let t_hash = FStar_SMTEncoding_Term.hash_of_term t  in
                       let uu____14896 =
                         let uu____14904 =
                           let uu____14906 =
                             let uu____14908 =
                               FStar_Util.digest_of_string t_hash  in
                             Prims.strcat uu____14908
                               (Prims.strcat "_" (Prims.string_of_int i))
                              in
                           Prims.strcat "x_" uu____14906  in
                         FStar_SMTEncoding_Env.new_term_constant_from_string
                           env1 x uu____14904
                          in
                       (match uu____14896 with
                        | (xxsym,xx,env') ->
                            let t2 =
                              FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                FStar_Pervasives_Native.None xx t
                               in
                            let caption =
                              let uu____14928 = FStar_Options.log_queries ()
                                 in
                              if uu____14928
                              then
                                let uu____14931 =
                                  let uu____14933 =
                                    FStar_Syntax_Print.bv_to_string x  in
                                  let uu____14935 =
                                    FStar_Syntax_Print.term_to_string
                                      x.FStar_Syntax_Syntax.sort
                                     in
                                  let uu____14937 =
                                    FStar_Syntax_Print.term_to_string t1  in
                                  FStar_Util.format3 "%s : %s (%s)"
                                    uu____14933 uu____14935 uu____14937
                                   in
                                FStar_Pervasives_Native.Some uu____14931
                              else FStar_Pervasives_Native.None  in
                            let ax =
                              let a_name = Prims.strcat "binder_" xxsym  in
                              FStar_SMTEncoding_Util.mkAssume
                                (t2, (FStar_Pervasives_Native.Some a_name),
                                  a_name)
                               in
                            let g =
                              FStar_List.append
                                [FStar_SMTEncoding_Term.DeclFun
                                   (xxsym, [],
                                     FStar_SMTEncoding_Term.Term_sort,
                                     caption)]
                                (FStar_List.append decls' [ax])
                               in
                            ((i + (Prims.parse_int "1")),
                              (FStar_List.append decls g), env'))))
             | FStar_Syntax_Syntax.Binding_lid (x,(uu____14961,t)) ->
                 let t_norm = FStar_SMTEncoding_EncodeTerm.whnf env1 t  in
                 let fv =
                   FStar_Syntax_Syntax.lid_as_fv x
                     FStar_Syntax_Syntax.delta_constant
                     FStar_Pervasives_Native.None
                    in
                 let uu____14981 = encode_free_var false env1 fv t t_norm []
                    in
                 (match uu____14981 with
                  | (g,env') ->
                      ((i + (Prims.parse_int "1")),
                        (FStar_List.append decls g), env')))
         in
      let uu____15008 =
        FStar_List.fold_right encode_binding bindings
          ((Prims.parse_int "0"), [], env)
         in
      match uu____15008 with | (uu____15035,decls,env1) -> (decls, env1)
  
let (encode_labels :
  FStar_SMTEncoding_Term.error_label Prims.list ->
    (FStar_SMTEncoding_Term.decl Prims.list * FStar_SMTEncoding_Term.decl
      Prims.list))
  =
  fun labs  ->
    let prefix1 =
      FStar_All.pipe_right labs
        (FStar_List.map
           (fun uu____15088  ->
              match uu____15088 with
              | (l,uu____15097,uu____15098) ->
                  let uu____15101 =
                    let uu____15113 = FStar_SMTEncoding_Term.fv_name l  in
                    (uu____15113, [], FStar_SMTEncoding_Term.Bool_sort,
                      FStar_Pervasives_Native.None)
                     in
                  FStar_SMTEncoding_Term.DeclFun uu____15101))
       in
    let suffix =
      FStar_All.pipe_right labs
        (FStar_List.collect
           (fun uu____15146  ->
              match uu____15146 with
              | (l,uu____15157,uu____15158) ->
                  let uu____15161 =
                    let uu____15162 = FStar_SMTEncoding_Term.fv_name l  in
                    FStar_All.pipe_left
                      (fun _0_4  -> FStar_SMTEncoding_Term.Echo _0_4)
                      uu____15162
                     in
                  let uu____15165 =
                    let uu____15168 =
                      let uu____15169 = FStar_SMTEncoding_Util.mkFreeV l  in
                      FStar_SMTEncoding_Term.Eval uu____15169  in
                    [uu____15168]  in
                  uu____15161 :: uu____15165))
       in
    (prefix1, suffix)
  
let (last_env : FStar_SMTEncoding_Env.env_t Prims.list FStar_ST.ref) =
  FStar_Util.mk_ref [] 
let (init_env : FStar_TypeChecker_Env.env -> unit) =
  fun tcenv  ->
    let uu____15198 =
      let uu____15201 =
        let uu____15202 = FStar_Util.psmap_empty ()  in
        let uu____15217 = FStar_Util.psmap_empty ()  in
        let uu____15220 = FStar_Util.smap_create (Prims.parse_int "100")  in
        let uu____15224 =
          let uu____15226 = FStar_TypeChecker_Env.current_module tcenv  in
          FStar_All.pipe_right uu____15226 FStar_Ident.string_of_lid  in
        {
          FStar_SMTEncoding_Env.bvar_bindings = uu____15202;
          FStar_SMTEncoding_Env.fvar_bindings = uu____15217;
          FStar_SMTEncoding_Env.depth = (Prims.parse_int "0");
          FStar_SMTEncoding_Env.tcenv = tcenv;
          FStar_SMTEncoding_Env.warn = true;
          FStar_SMTEncoding_Env.cache = uu____15220;
          FStar_SMTEncoding_Env.nolabels = false;
          FStar_SMTEncoding_Env.use_zfuel_name = false;
          FStar_SMTEncoding_Env.encode_non_total_function_typ = true;
          FStar_SMTEncoding_Env.current_module_name = uu____15224;
          FStar_SMTEncoding_Env.encoding_quantifier = false
        }  in
      [uu____15201]  in
    FStar_ST.op_Colon_Equals last_env uu____15198
  
let (get_env :
  FStar_Ident.lident ->
    FStar_TypeChecker_Env.env -> FStar_SMTEncoding_Env.env_t)
  =
  fun cmn  ->
    fun tcenv  ->
      let uu____15268 = FStar_ST.op_Bang last_env  in
      match uu____15268 with
      | [] -> failwith "No env; call init first!"
      | e::uu____15296 ->
          let uu___397_15299 = e  in
          let uu____15300 = FStar_Ident.string_of_lid cmn  in
          {
            FStar_SMTEncoding_Env.bvar_bindings =
              (uu___397_15299.FStar_SMTEncoding_Env.bvar_bindings);
            FStar_SMTEncoding_Env.fvar_bindings =
              (uu___397_15299.FStar_SMTEncoding_Env.fvar_bindings);
            FStar_SMTEncoding_Env.depth =
              (uu___397_15299.FStar_SMTEncoding_Env.depth);
            FStar_SMTEncoding_Env.tcenv = tcenv;
            FStar_SMTEncoding_Env.warn =
              (uu___397_15299.FStar_SMTEncoding_Env.warn);
            FStar_SMTEncoding_Env.cache =
              (uu___397_15299.FStar_SMTEncoding_Env.cache);
            FStar_SMTEncoding_Env.nolabels =
              (uu___397_15299.FStar_SMTEncoding_Env.nolabels);
            FStar_SMTEncoding_Env.use_zfuel_name =
              (uu___397_15299.FStar_SMTEncoding_Env.use_zfuel_name);
            FStar_SMTEncoding_Env.encode_non_total_function_typ =
              (uu___397_15299.FStar_SMTEncoding_Env.encode_non_total_function_typ);
            FStar_SMTEncoding_Env.current_module_name = uu____15300;
            FStar_SMTEncoding_Env.encoding_quantifier =
              (uu___397_15299.FStar_SMTEncoding_Env.encoding_quantifier)
          }
  
let (set_env : FStar_SMTEncoding_Env.env_t -> unit) =
  fun env  ->
    let uu____15308 = FStar_ST.op_Bang last_env  in
    match uu____15308 with
    | [] -> failwith "Empty env stack"
    | uu____15335::tl1 -> FStar_ST.op_Colon_Equals last_env (env :: tl1)
  
let (push_env : unit -> unit) =
  fun uu____15367  ->
    let uu____15368 = FStar_ST.op_Bang last_env  in
    match uu____15368 with
    | [] -> failwith "Empty env stack"
    | hd1::tl1 ->
        let top = copy_env hd1  in
        FStar_ST.op_Colon_Equals last_env (top :: hd1 :: tl1)
  
let (pop_env : unit -> unit) =
  fun uu____15428  ->
    let uu____15429 = FStar_ST.op_Bang last_env  in
    match uu____15429 with
    | [] -> failwith "Popping an empty stack"
    | uu____15456::tl1 -> FStar_ST.op_Colon_Equals last_env tl1
  
let (snapshot_env : unit -> (Prims.int * unit)) =
  fun uu____15493  -> FStar_Common.snapshot push_env last_env () 
let (rollback_env : Prims.int FStar_Pervasives_Native.option -> unit) =
  fun depth  -> FStar_Common.rollback pop_env last_env depth 
let (init : FStar_TypeChecker_Env.env -> unit) =
  fun tcenv  ->
    init_env tcenv;
    FStar_SMTEncoding_Z3.init ();
    FStar_SMTEncoding_Z3.giveZ3 [FStar_SMTEncoding_Term.DefPrelude]
  
let (snapshot :
  Prims.string -> (FStar_TypeChecker_Env.solver_depth_t * unit)) =
  fun msg  ->
    FStar_Util.atomically
      (fun uu____15546  ->
         let uu____15547 = snapshot_env ()  in
         match uu____15547 with
         | (env_depth,()) ->
             let uu____15569 =
               FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.snapshot ()
                in
             (match uu____15569 with
              | (varops_depth,()) ->
                  let uu____15591 = FStar_SMTEncoding_Z3.snapshot msg  in
                  (match uu____15591 with
                   | (z3_depth,()) ->
                       ((env_depth, varops_depth, z3_depth), ()))))
  
let (rollback :
  Prims.string ->
    FStar_TypeChecker_Env.solver_depth_t FStar_Pervasives_Native.option ->
      unit)
  =
  fun msg  ->
    fun depth  ->
      FStar_Util.atomically
        (fun uu____15649  ->
           let uu____15650 =
             match depth with
             | FStar_Pervasives_Native.Some (s1,s2,s3) ->
                 ((FStar_Pervasives_Native.Some s1),
                   (FStar_Pervasives_Native.Some s2),
                   (FStar_Pervasives_Native.Some s3))
             | FStar_Pervasives_Native.None  ->
                 (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None,
                   FStar_Pervasives_Native.None)
              in
           match uu____15650 with
           | (env_depth,varops_depth,z3_depth) ->
               (rollback_env env_depth;
                FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.rollback
                  varops_depth;
                FStar_SMTEncoding_Z3.rollback msg z3_depth))
  
let (push : Prims.string -> unit) =
  fun msg  -> let uu____15745 = snapshot msg  in () 
let (pop : Prims.string -> unit) =
  fun msg  -> rollback msg FStar_Pervasives_Native.None 
let (open_fact_db_tags :
  FStar_SMTEncoding_Env.env_t -> FStar_SMTEncoding_Term.fact_db_id Prims.list)
  = fun env  -> [] 
let (place_decl_in_fact_dbs :
  FStar_SMTEncoding_Env.env_t ->
    FStar_SMTEncoding_Term.fact_db_id Prims.list ->
      FStar_SMTEncoding_Term.decl -> FStar_SMTEncoding_Term.decl)
  =
  fun env  ->
    fun fact_db_ids  ->
      fun d  ->
        match (fact_db_ids, d) with
        | (uu____15791::uu____15792,FStar_SMTEncoding_Term.Assume a) ->
            FStar_SMTEncoding_Term.Assume
              (let uu___398_15800 = a  in
               {
                 FStar_SMTEncoding_Term.assumption_term =
                   (uu___398_15800.FStar_SMTEncoding_Term.assumption_term);
                 FStar_SMTEncoding_Term.assumption_caption =
                   (uu___398_15800.FStar_SMTEncoding_Term.assumption_caption);
                 FStar_SMTEncoding_Term.assumption_name =
                   (uu___398_15800.FStar_SMTEncoding_Term.assumption_name);
                 FStar_SMTEncoding_Term.assumption_fact_ids = fact_db_ids
               })
        | uu____15801 -> d
  
let (fact_dbs_for_lid :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Ident.lid -> FStar_SMTEncoding_Term.fact_db_id Prims.list)
  =
  fun env  ->
    fun lid  ->
      let uu____15821 =
        let uu____15824 =
          let uu____15825 = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
          FStar_SMTEncoding_Term.Namespace uu____15825  in
        let uu____15826 = open_fact_db_tags env  in uu____15824 ::
          uu____15826
         in
      (FStar_SMTEncoding_Term.Name lid) :: uu____15821
  
let (encode_top_level_facts :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_SMTEncoding_Term.decl Prims.list * FStar_SMTEncoding_Env.env_t))
  =
  fun env  ->
    fun se  ->
      let fact_db_ids =
        FStar_All.pipe_right (FStar_Syntax_Util.lids_of_sigelt se)
          (FStar_List.collect (fact_dbs_for_lid env))
         in
      let uu____15853 = encode_sigelt env se  in
      match uu____15853 with
      | (g,env1) ->
          let g1 =
            FStar_All.pipe_right g
              (FStar_List.map (place_decl_in_fact_dbs env1 fact_db_ids))
             in
          (g1, env1)
  
let (encode_sig :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.sigelt -> unit) =
  fun tcenv  ->
    fun se  ->
      let caption decls =
        let uu____15898 = FStar_Options.log_queries ()  in
        if uu____15898
        then
          let uu____15903 =
            let uu____15904 =
              let uu____15906 =
                let uu____15908 =
                  FStar_All.pipe_right (FStar_Syntax_Util.lids_of_sigelt se)
                    (FStar_List.map FStar_Syntax_Print.lid_to_string)
                   in
                FStar_All.pipe_right uu____15908 (FStar_String.concat ", ")
                 in
              Prims.strcat "encoding sigelt " uu____15906  in
            FStar_SMTEncoding_Term.Caption uu____15904  in
          uu____15903 :: decls
        else decls  in
      (let uu____15927 =
         FStar_TypeChecker_Env.debug tcenv FStar_Options.Medium  in
       if uu____15927
       then
         let uu____15930 = FStar_Syntax_Print.sigelt_to_string se  in
         FStar_Util.print1 "+++++++++++Encoding sigelt %s\n" uu____15930
       else ());
      (let env =
         let uu____15936 = FStar_TypeChecker_Env.current_module tcenv  in
         get_env uu____15936 tcenv  in
       let uu____15937 = encode_top_level_facts env se  in
       match uu____15937 with
       | (decls,env1) ->
           (set_env env1;
            (let uu____15951 = caption decls  in
             FStar_SMTEncoding_Z3.giveZ3 uu____15951)))
  
let (encode_modul :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.modul -> unit) =
  fun tcenv  ->
    fun modul  ->
      let uu____15965 = (FStar_Options.lax ()) && (FStar_Options.ml_ish ())
         in
      if uu____15965
      then ()
      else
        (let name =
           FStar_Util.format2 "%s %s"
             (if modul.FStar_Syntax_Syntax.is_interface
              then "interface"
              else "module") (modul.FStar_Syntax_Syntax.name).FStar_Ident.str
            in
         (let uu____15980 =
            FStar_TypeChecker_Env.debug tcenv FStar_Options.Medium  in
          if uu____15980
          then
            let uu____15983 =
              FStar_All.pipe_right
                (FStar_List.length modul.FStar_Syntax_Syntax.exports)
                Prims.string_of_int
               in
            FStar_Util.print2
              "+++++++++++Encoding externals for %s ... %s exports\n" name
              uu____15983
          else ());
         (let env = get_env modul.FStar_Syntax_Syntax.name tcenv  in
          let encode_signature env1 ses =
            FStar_All.pipe_right ses
              (FStar_List.fold_left
                 (fun uu____16029  ->
                    fun se  ->
                      match uu____16029 with
                      | (g,env2) ->
                          let uu____16049 = encode_top_level_facts env2 se
                             in
                          (match uu____16049 with
                           | (g',env3) -> ((FStar_List.append g g'), env3)))
                 ([], env1))
             in
          let uu____16072 =
            encode_signature
              (let uu___399_16081 = env  in
               {
                 FStar_SMTEncoding_Env.bvar_bindings =
                   (uu___399_16081.FStar_SMTEncoding_Env.bvar_bindings);
                 FStar_SMTEncoding_Env.fvar_bindings =
                   (uu___399_16081.FStar_SMTEncoding_Env.fvar_bindings);
                 FStar_SMTEncoding_Env.depth =
                   (uu___399_16081.FStar_SMTEncoding_Env.depth);
                 FStar_SMTEncoding_Env.tcenv =
                   (uu___399_16081.FStar_SMTEncoding_Env.tcenv);
                 FStar_SMTEncoding_Env.warn = false;
                 FStar_SMTEncoding_Env.cache =
                   (uu___399_16081.FStar_SMTEncoding_Env.cache);
                 FStar_SMTEncoding_Env.nolabels =
                   (uu___399_16081.FStar_SMTEncoding_Env.nolabels);
                 FStar_SMTEncoding_Env.use_zfuel_name =
                   (uu___399_16081.FStar_SMTEncoding_Env.use_zfuel_name);
                 FStar_SMTEncoding_Env.encode_non_total_function_typ =
                   (uu___399_16081.FStar_SMTEncoding_Env.encode_non_total_function_typ);
                 FStar_SMTEncoding_Env.current_module_name =
                   (uu___399_16081.FStar_SMTEncoding_Env.current_module_name);
                 FStar_SMTEncoding_Env.encoding_quantifier =
                   (uu___399_16081.FStar_SMTEncoding_Env.encoding_quantifier)
               }) modul.FStar_Syntax_Syntax.exports
             in
          match uu____16072 with
          | (decls,env1) ->
              let caption decls1 =
                let uu____16101 = FStar_Options.log_queries ()  in
                if uu____16101
                then
                  let msg = Prims.strcat "Externals for " name  in
                  [FStar_SMTEncoding_Term.Module
                     (name,
                       (FStar_List.append
                          ((FStar_SMTEncoding_Term.Caption msg) :: decls1)
                          [FStar_SMTEncoding_Term.Caption
                             (Prims.strcat "End " msg)]))]
                else [FStar_SMTEncoding_Term.Module (name, decls1)]  in
              (set_env
                 (let uu___400_16121 = env1  in
                  {
                    FStar_SMTEncoding_Env.bvar_bindings =
                      (uu___400_16121.FStar_SMTEncoding_Env.bvar_bindings);
                    FStar_SMTEncoding_Env.fvar_bindings =
                      (uu___400_16121.FStar_SMTEncoding_Env.fvar_bindings);
                    FStar_SMTEncoding_Env.depth =
                      (uu___400_16121.FStar_SMTEncoding_Env.depth);
                    FStar_SMTEncoding_Env.tcenv =
                      (uu___400_16121.FStar_SMTEncoding_Env.tcenv);
                    FStar_SMTEncoding_Env.warn = true;
                    FStar_SMTEncoding_Env.cache =
                      (uu___400_16121.FStar_SMTEncoding_Env.cache);
                    FStar_SMTEncoding_Env.nolabels =
                      (uu___400_16121.FStar_SMTEncoding_Env.nolabels);
                    FStar_SMTEncoding_Env.use_zfuel_name =
                      (uu___400_16121.FStar_SMTEncoding_Env.use_zfuel_name);
                    FStar_SMTEncoding_Env.encode_non_total_function_typ =
                      (uu___400_16121.FStar_SMTEncoding_Env.encode_non_total_function_typ);
                    FStar_SMTEncoding_Env.current_module_name =
                      (uu___400_16121.FStar_SMTEncoding_Env.current_module_name);
                    FStar_SMTEncoding_Env.encoding_quantifier =
                      (uu___400_16121.FStar_SMTEncoding_Env.encoding_quantifier)
                  });
               (let uu____16124 =
                  FStar_TypeChecker_Env.debug tcenv FStar_Options.Medium  in
                if uu____16124
                then
                  FStar_Util.print1 "Done encoding externals for %s\n" name
                else ());
               (let decls1 = caption decls  in
                FStar_SMTEncoding_Z3.giveZ3 decls1))))
  
let (encode_query :
  (unit -> Prims.string) FStar_Pervasives_Native.option ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        (FStar_SMTEncoding_Term.decl Prims.list *
          FStar_SMTEncoding_ErrorReporting.label Prims.list *
          FStar_SMTEncoding_Term.decl * FStar_SMTEncoding_Term.decl
          Prims.list))
  =
  fun use_env_msg  ->
    fun tcenv  ->
      fun q  ->
        (let uu____16189 =
           let uu____16191 = FStar_TypeChecker_Env.current_module tcenv  in
           uu____16191.FStar_Ident.str  in
         FStar_SMTEncoding_Z3.query_logging.FStar_SMTEncoding_Z3.set_module_name
           uu____16189);
        (let env =
           let uu____16193 = FStar_TypeChecker_Env.current_module tcenv  in
           get_env uu____16193 tcenv  in
         let uu____16194 =
           let rec aux bindings =
             match bindings with
             | (FStar_Syntax_Syntax.Binding_var x)::rest ->
                 let uu____16233 = aux rest  in
                 (match uu____16233 with
                  | (out,rest1) ->
                      let t =
                        let uu____16261 =
                          FStar_Syntax_Util.destruct_typ_as_formula
                            x.FStar_Syntax_Syntax.sort
                           in
                        match uu____16261 with
                        | FStar_Pervasives_Native.Some uu____16264 ->
                            let uu____16265 =
                              FStar_Syntax_Syntax.new_bv
                                FStar_Pervasives_Native.None
                                FStar_Syntax_Syntax.t_unit
                               in
                            FStar_Syntax_Util.refine uu____16265
                              x.FStar_Syntax_Syntax.sort
                        | uu____16266 -> x.FStar_Syntax_Syntax.sort  in
                      let t1 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Env.Eager_unfolding;
                          FStar_TypeChecker_Env.Beta;
                          FStar_TypeChecker_Env.Simplify;
                          FStar_TypeChecker_Env.Primops;
                          FStar_TypeChecker_Env.EraseUniverses]
                          env.FStar_SMTEncoding_Env.tcenv t
                         in
                      let uu____16270 =
                        let uu____16273 =
                          FStar_Syntax_Syntax.mk_binder
                            (let uu___401_16276 = x  in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___401_16276.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___401_16276.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = t1
                             })
                           in
                        uu____16273 :: out  in
                      (uu____16270, rest1))
             | uu____16281 -> ([], bindings)  in
           let uu____16288 = aux tcenv.FStar_TypeChecker_Env.gamma  in
           match uu____16288 with
           | (closing,bindings) ->
               let uu____16315 =
                 FStar_Syntax_Util.close_forall_no_univs
                   (FStar_List.rev closing) q
                  in
               (uu____16315, bindings)
            in
         match uu____16194 with
         | (q1,bindings) ->
             let uu____16346 = encode_env_bindings env bindings  in
             (match uu____16346 with
              | (env_decls,env1) ->
                  ((let uu____16368 =
                      ((FStar_TypeChecker_Env.debug tcenv
                          FStar_Options.Medium)
                         ||
                         (FStar_All.pipe_left
                            (FStar_TypeChecker_Env.debug tcenv)
                            (FStar_Options.Other "SMTEncoding")))
                        ||
                        (FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug tcenv)
                           (FStar_Options.Other "SMTQuery"))
                       in
                    if uu____16368
                    then
                      let uu____16375 = FStar_Syntax_Print.term_to_string q1
                         in
                      FStar_Util.print1 "Encoding query formula: %s\n"
                        uu____16375
                    else ());
                   (let uu____16380 =
                      FStar_SMTEncoding_EncodeTerm.encode_formula q1 env1  in
                    match uu____16380 with
                    | (phi,qdecls) ->
                        let uu____16401 =
                          let uu____16406 =
                            FStar_TypeChecker_Env.get_range tcenv  in
                          FStar_SMTEncoding_ErrorReporting.label_goals
                            use_env_msg uu____16406 phi
                           in
                        (match uu____16401 with
                         | (labels,phi1) ->
                             let uu____16423 = encode_labels labels  in
                             (match uu____16423 with
                              | (label_prefix,label_suffix) ->
                                  let caption =
                                    let uu____16459 =
                                      FStar_Options.log_queries ()  in
                                    if uu____16459
                                    then
                                      let uu____16464 =
                                        let uu____16465 =
                                          let uu____16467 =
                                            FStar_Syntax_Print.term_to_string
                                              q1
                                             in
                                          Prims.strcat
                                            "Encoding query formula: "
                                            uu____16467
                                           in
                                        FStar_SMTEncoding_Term.Caption
                                          uu____16465
                                         in
                                      [uu____16464]
                                    else []  in
                                  let query_prelude =
                                    FStar_List.append env_decls
                                      (FStar_List.append label_prefix
                                         (FStar_List.append qdecls caption))
                                     in
                                  let qry =
                                    let uu____16476 =
                                      let uu____16484 =
                                        FStar_SMTEncoding_Util.mkNot phi1  in
                                      let uu____16485 =
                                        FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.mk_unique
                                          "@query"
                                         in
                                      (uu____16484,
                                        (FStar_Pervasives_Native.Some "query"),
                                        uu____16485)
                                       in
                                    FStar_SMTEncoding_Util.mkAssume
                                      uu____16476
                                     in
                                  let suffix =
                                    FStar_List.append
                                      [FStar_SMTEncoding_Term.Echo "<labels>"]
                                      (FStar_List.append label_suffix
                                         [FStar_SMTEncoding_Term.Echo
                                            "</labels>";
                                         FStar_SMTEncoding_Term.Echo "Done!"])
                                     in
                                  (query_prelude, labels, qry, suffix)))))))
  