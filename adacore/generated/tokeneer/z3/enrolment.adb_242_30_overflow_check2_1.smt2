;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-datatypes ()
  ((tuple0 (Tuple0))))

(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-datatypes ()
  ((int__ref (int__refqtmk (int__content Int)))))

(declare-datatypes ()
  ((bool__ref (bool__refqtmk (bool__content Bool)))))

(declare-sort integer 0)

;; "integer'int"
(declare-fun integerqtint (integer) Int)

;; "integer'axiom"
(assert
  (forall ((i integer))
    (and
      (<= (- 2147483648) (integerqtint i))
      (<= (integerqtint i) 2147483647))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

(declare-sort us_rep 0)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const dummy us_rep)

(declare-datatypes ()
  ((t__ref (t__refqtmk (t__content us_rep)))))

(declare-sort character 0)

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 255)))

;; "to_rep"
(declare-fun to_rep (character) Int)

;; "of_rep"
(declare-fun of_rep (Int) character)

;; "inversion_axiom"
(assert
  (forall ((x character))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x character)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int character))))))

(declare-sort issueridt 0)

;; "issueridt'int"
(declare-fun issueridtqtint (issueridt) Int)

;; "issueridt'axiom"
(assert
  (forall ((i issueridt))
    (and (<= 0 (issueridtqtint i)) (<= (issueridtqtint i) 4294967295))))

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 4294967295)))

;; "to_rep"
(define-fun to_rep1 ((x issueridt)) Int
  (issueridtqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) issueridt)

;; "inversion_axiom"
(assert
  (forall ((x issueridt))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x issueridt))
    (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-sort namecountt 0)

;; "namecountt'int"
(declare-fun namecounttqtint (namecountt) Int)

;; "namecountt'axiom"
(assert
  (forall ((i namecountt))
    (and (<= 0 (namecounttqtint i)) (<= (namecounttqtint i) 40))))

;; "in_range"
(define-fun in_range4 ((x Int)) Bool
  (and (<= 0 x) (<= x 40)))

;; "to_rep"
(define-fun to_rep2 ((x namecountt)) Int
  (namecounttqtint x))

;; "of_rep"
(declare-fun of_rep2 (Int) namecountt)

;; "inversion_axiom"
(assert
  (forall ((x namecountt))
    (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; "range_axiom"
(assert
  (forall ((x namecountt))
    (! (in_range4 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                  (of_rep2 x))) )))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "component__size_axiom"
(assert (<= 0 component__size))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-datatypes ()
  ((us_split_fields
   (us_split_fieldsqtmk
   (rec__cryptotypes__issuert__id issueridt)(rec__cryptotypes__issuert__namelength namecountt)(rec__cryptotypes__issuert__name (Array Int character))))))

(declare-datatypes ()
  ((us_rep1 (us_repqtmk (us_split_fields1 us_split_fields)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "alignment_axiom"
(assert (<= 0 alignment2))

(declare-const cryptotypes__issuert__id__first__bit Int)

(declare-const cryptotypes__issuert__id__last__bit Int)

(declare-const cryptotypes__issuert__id__position Int)

;; "cryptotypes__issuert__id__first__bit_axiom"
(assert (<= 0 cryptotypes__issuert__id__first__bit))

;; "cryptotypes__issuert__id__last__bit_axiom"
(assert
  (< cryptotypes__issuert__id__first__bit cryptotypes__issuert__id__last__bit))

;; "cryptotypes__issuert__id__position_axiom"
(assert (<= 0 cryptotypes__issuert__id__position))

(declare-const cryptotypes__issuert__namelength__first__bit Int)

(declare-const cryptotypes__issuert__namelength__last__bit Int)

(declare-const cryptotypes__issuert__namelength__position Int)

;; "cryptotypes__issuert__namelength__first__bit_axiom"
(assert (<= 0 cryptotypes__issuert__namelength__first__bit))

;; "cryptotypes__issuert__namelength__last__bit_axiom"
(assert
  (< cryptotypes__issuert__namelength__first__bit cryptotypes__issuert__namelength__last__bit))

;; "cryptotypes__issuert__namelength__position_axiom"
(assert (<= 0 cryptotypes__issuert__namelength__position))

(declare-const cryptotypes__issuert__name__first__bit Int)

(declare-const cryptotypes__issuert__name__last__bit Int)

(declare-const cryptotypes__issuert__name__position Int)

;; "cryptotypes__issuert__name__first__bit_axiom"
(assert (<= 0 cryptotypes__issuert__name__first__bit))

;; "cryptotypes__issuert__name__last__bit_axiom"
(assert
  (< cryptotypes__issuert__name__first__bit cryptotypes__issuert__name__last__bit))

;; "cryptotypes__issuert__name__position_axiom"
(assert (<= 0 cryptotypes__issuert__name__position))

(declare-const dummy1 us_rep1)

(declare-datatypes ()
  ((us_split_fields2
   (us_split_fieldsqtmk1
   (rec__keystore__optionalprivatekeyt__ispresent Bool)(rec__keystore__optionalprivatekeyt__owner us_rep1)))))

(declare-datatypes ()
  ((us_split_fields__ref
   (us_split_fields__refqtmk (us_split_fields__content us_split_fields2)))))

(declare-datatypes ()
  ((us_rep2 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "alignment_axiom"
(assert (<= 0 alignment3))

(declare-const keystore__optionalprivatekeyt__ispresent__first__bit Int)

(declare-const keystore__optionalprivatekeyt__ispresent__last__bit Int)

(declare-const keystore__optionalprivatekeyt__ispresent__position Int)

;; "keystore__optionalprivatekeyt__ispresent__first__bit_axiom"
(assert (<= 0 keystore__optionalprivatekeyt__ispresent__first__bit))

;; "keystore__optionalprivatekeyt__ispresent__last__bit_axiom"
(assert
  (< keystore__optionalprivatekeyt__ispresent__first__bit keystore__optionalprivatekeyt__ispresent__last__bit))

;; "keystore__optionalprivatekeyt__ispresent__position_axiom"
(assert (<= 0 keystore__optionalprivatekeyt__ispresent__position))

(declare-const keystore__optionalprivatekeyt__owner__first__bit Int)

(declare-const keystore__optionalprivatekeyt__owner__last__bit Int)

(declare-const keystore__optionalprivatekeyt__owner__position Int)

;; "keystore__optionalprivatekeyt__owner__first__bit_axiom"
(assert (<= 0 keystore__optionalprivatekeyt__owner__first__bit))

;; "keystore__optionalprivatekeyt__owner__last__bit_axiom"
(assert
  (< keystore__optionalprivatekeyt__owner__first__bit keystore__optionalprivatekeyt__owner__last__bit))

;; "keystore__optionalprivatekeyt__owner__position_axiom"
(assert (<= 0 keystore__optionalprivatekeyt__owner__position))

(declare-const dummy2 us_rep2)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_271 us_rep2) (temp___is_init_267 Bool) (temp___skip_constant_268 Bool) (temp___do_toplevel_269 Bool) (temp___do_typ_inv_270 Bool)) Bool
  true)

;; "privatekeypresent"
(declare-fun privatekeypresent (us_split_fields2) Bool)

;; "to_rep"
(define-fun to_rep3 ((x integer)) Int
  (integerqtint x))

;; "of_rep"
(declare-fun of_rep3 (Int) integer)

;; "inversion_axiom"
(assert
  (forall ((x integer))
    (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; "range_axiom"
(assert
  (forall ((x integer)) (! (in_range (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                                 (of_rep3 x))) )))

(declare-datatypes ()
  ((t (tqtmk (rec__first integer)(rec__last integer)))))

;; "mk"
(declare-fun mk (Int
  Int) t)

;; "mk_def"
(assert
  (forall ((f Int) (l Int))
    (! (=>
         (in_range f)
         (=>
           (in_range l)
           (and
             (= (to_rep3 (rec__first (mk f l))) f)
             (= (to_rep3 (rec__last (mk f l))) l)))) :pattern ((mk f l)) )))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))

;; "of_array"
(define-fun of_array ((a (Array Int character)) (f Int) (l Int)) us_t
  (us_tqtmk a (mk f l)))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const component__size1 Int)

(declare-const alignment4 Int)

;; "value__size_axiom"
(assert (<= 0 value__size4))

;; "object__size_axiom"
(assert (<= 0 object__size4))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment4))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const component__size2 Int)

(declare-const alignment5 Int)

;; "value__size_axiom"
(assert (<= 0 value__size5))

;; "object__size_axiom"
(assert (<= 0 object__size5))

;; "component__size_axiom"
(assert (<= 0 component__size2))

;; "alignment_axiom"
(assert (<= 0 alignment5))

;; "makedescription"
(declare-fun makedescription (us_t
  Int) (Array Int character))

;; "endoffile"
(declare-fun endoffile (us_rep) Bool)

;; "endofline"
(declare-fun endofline (us_rep) Bool)

;; "temp___String_Literal_512"
(declare-fun temp___String_Literal_512 (tuple0) (Array Int character))

;; "temp___String_Literal_512__def_axiom"
(assert
  (forall ((us_void_param tuple0))
    (! (and
         (and
           (= (to_rep (select (temp___String_Literal_512 us_void_param) 1)) 84)
           (= (to_rep (select (temp___String_Literal_512 us_void_param) 2)) 104))
         (and
           (and
             (and
               (and
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 3)) 101)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 4)) 32))
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 5)) 101)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 6)) 110)))
               (and
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 7)) 114)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 8)) 111))
                 (= (to_rep
                      (select (temp___String_Literal_512 us_void_param) 9)) 108)))
             (and
               (and
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 10)) 109)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 11)) 101))
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 12)) 110)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 13)) 116)))
               (and
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 14)) 32)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 15)) 102))
                 (= (to_rep
                      (select (temp___String_Literal_512 us_void_param) 16)) 105))))
           (and
             (and
               (and
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 17)) 108)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 18)) 101))
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 19)) 32)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 20)) 105)))
               (and
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 21)) 115)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 22)) 32))
                 (= (to_rep
                      (select (temp___String_Literal_512 us_void_param) 23)) 99)))
             (and
               (and
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 24)) 111)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 25)) 114))
                 (= (to_rep
                      (select (temp___String_Literal_512 us_void_param) 26)) 114))
               (and
                 (and
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 27)) 117)
                   (= (to_rep
                        (select (temp___String_Literal_512 us_void_param) 28)) 112))
                 (= (to_rep
                      (select (temp___String_Literal_512 us_void_param) 29)) 116)))))) :pattern (
    (temp___String_Literal_512
      us_void_param)) )))

;; "privatekeypresent__post_axiom"
(assert true)

;; "privatekeypresent__def_axiom"
(assert
  (forall ((Keystore__thistisinfo___thistisinfo__split_fields___ us_split_fields2))
    (! (=
         (= (privatekeypresent
              Keystore__thistisinfo___thistisinfo__split_fields___) true)
         (= (rec__keystore__optionalprivatekeyt__ispresent
              Keystore__thistisinfo___thistisinfo__split_fields___) true)) :pattern (
    (privatekeypresent
      Keystore__thistisinfo___thistisinfo__split_fields___)) )))

;; "endoffile__post_axiom"
(assert true)

(declare-const thefile us_rep)

(declare-const dataok Bool)

(declare-const description (Array Int character))

(declare-const thistisinfo__split_fields us_split_fields2)

(declare-const closedok Bool)

;; "thistisinfo__split_fields"
(define-fun thistisinfo__split_fields1 () us_split_fields__ref
  (us_split_fields__refqtmk thistisinfo__split_fields))

;; "description'unused"
(define-fun descriptionqtunused () map__ref
  (map__refqtmk description))

;; "thefile'unused"
(define-fun thefileqtunused () t__ref
  (t__refqtmk thefile))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert
  (dynamic_invariant
    (us_repqtmk1 thistisinfo__split_fields)
    true
    false
    true
    true))

;; "Assume"
(assert (not (= (privatekeypresent thistisinfo__split_fields) true)))

(declare-const certno Int)

;; "certno'unused"
(define-fun certnoqtunused () int__ref
  (int__refqtmk certno))

;; "H"
(assert (= certno 1))

;; "Assume"
(assert (in_range1 certno))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused () us_rep
  thefile)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  dataok)

(declare-const thefile1 us_rep)

(declare-const dataok1 Bool)

;; "dataok'unused"
(define-fun dataokqtunused () bool__ref
  (bool__refqtmk dataok1))

;; "thefile'unused"
(define-fun thefileqtunused1 () t__ref
  (t__refqtmk thefile1))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert true)

(declare-const spark__branch Bool)

(declare-const thefile2 us_rep)

(declare-const dataok2 Bool)

(declare-const description1 (Array Int character))

(declare-const thistisinfo__split_fields2 us_split_fields2)

;; "thistisinfo__split_fields"
(define-fun thistisinfo__split_fields3 () us_split_fields__ref
  (us_split_fields__refqtmk thistisinfo__split_fields2))

;; "description'unused"
(define-fun descriptionqtunused1 () map__ref
  (map__refqtmk description1))

;; "dataok'unused"
(define-fun dataokqtunused1 () bool__ref
  (bool__refqtmk dataok2))

;; "thefile'unused"
(define-fun thefileqtunused2 () t__ref
  (t__refqtmk thefile2))

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

(declare-const bool__contentqtresultqtunused1 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused1 dataok1))

;; "H"
(assert (= spark__branch dataok1))

(declare-const bool__contentqtresultqtunused2 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused2 spark__branch))

(declare-const temp___513 (Array Int character))

(declare-const temp___String_Literal_512qtresultqtunused (Array Int character))

(declare-const o us_t)

(declare-const of_arrayqtresultqtunused us_t)

(declare-const o1 (Array Int character))

(declare-const makedescriptionqtresultqtunused (Array Int character))

(declare-const bool__contentqtresultqtunused3 Bool)

(declare-const map__contentqtresultqtunused (Array Int character))

(declare-const o2 Bool)

(declare-const of_intqtresultqtunused Bool)

(declare-const thistisinfo__split_fieldsqtunused us_split_fields__ref)

;; "H"
(assert
  (ite (= spark__branch true)
    (and
      (= bool__contentqtresultqtunused3 dataok1)
      (and
        (= map__contentqtresultqtunused description)
        (and
          (= o2 (distinct 0 0))
          (and
            (= of_intqtresultqtunused o2)
            (and
              (= thistisinfo__split_fieldsqtunused thistisinfo__split_fields1)
              (and
                (and
                  (=>
                    (and (= o2 true) (= dataok2 true))
                    (= (privatekeypresent thistisinfo__split_fields2) true))
                  (=>
                    (not (and (= o2 true) (= dataok2 true)))
                    (=
                      (= (privatekeypresent thistisinfo__split_fields2) true)
                      (= (privatekeypresent thistisinfo__split_fields) true))))
                (dynamic_invariant
                  (us_repqtmk1 thistisinfo__split_fields2)
                  true
                  true
                  true
                  true)))))))
    (and
      (and
        (and
          (and
            (= temp___513 (temp___String_Literal_512 Tuple0))
            (and
              (= temp___String_Literal_512qtresultqtunused temp___513)
              (and
                (<= 0 29)
                (and
                  (<= 29 1000)
                  (and
                    (dynamic_property 1 2147483647 1 29)
                    (and
                      (= o (of_array temp___513 1 29))
                      (and
                        (= of_arrayqtresultqtunused o)
                        (and
                          (= o1 (makedescription o certno))
                          (and
                            (= makedescriptionqtresultqtunused o1)
                            (= description1 o1))))))))))
          (= thefile2 thefile1))
        (= dataok2 dataok1))
      (= thistisinfo__split_fields2 thistisinfo__split_fields))))

(declare-const spark__branch1 Bool)

(declare-const thefile3 us_rep)

(declare-const dataok3 Bool)

(declare-const description2 (Array Int character))

(declare-const thistisinfo__split_fields4 us_split_fields2)

(declare-const certno1 Int)

;; "certno'unused"
(define-fun certnoqtunused1 () int__ref
  (int__refqtmk certno1))

;; "thistisinfo__split_fields'unused"
(define-fun thistisinfo__split_fieldsqtunused1 () us_split_fields__ref
  (us_split_fields__refqtmk thistisinfo__split_fields4))

;; "description'unused"
(define-fun descriptionqtunused2 () map__ref
  (map__refqtmk description2))

;; "dataok'unused"
(define-fun dataokqtunused2 () bool__ref
  (bool__refqtmk dataok3))

;; "thefile'unused"
(define-fun thefileqtunused3 () t__ref
  (t__refqtmk thefile3))

;; "spark__branch'unused"
(define-fun spark__branchqtunused1 () bool__ref
  (bool__refqtmk spark__branch1))

(declare-const bool__contentqtresultqtunused4 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused4 dataok2))

;; "H"
(assert (= spark__branch1 dataok2))

(declare-const bool__contentqtresultqtunused5 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused5 spark__branch1))

(declare-const int__contentqtresultqtunused Int)

(declare-const o3 Int)

(declare-const infix_plqtresultqtunused Int)

(declare-const range_check_qtresultqtunused Int)

(declare-const bool__contentqtresultqtunused6 Bool)

(declare-const map__contentqtresultqtunused1 (Array Int character))

(declare-const o4 Bool)

(declare-const of_intqtresultqtunused1 Bool)

(declare-const thistisinfo__split_fieldsqtunused2 us_split_fields__ref)

;; "H"
(assert
  (ite (= spark__branch1 true)
    (and
      (= int__contentqtresultqtunused certno)
      (and
        (= o3 (+ certno 1))
        (and
          (= infix_plqtresultqtunused o3)
          (and
            (in_range o3)
            (and
              (= range_check_qtresultqtunused o3)
              (and
                (= certno1 o3)
                (and
                  (= bool__contentqtresultqtunused6 dataok2)
                  (and
                    (= map__contentqtresultqtunused1 description1)
                    (and
                      (= o4 (distinct 1 0))
                      (and
                        (= of_intqtresultqtunused1 o4)
                        (and
                          (= thistisinfo__split_fieldsqtunused2 thistisinfo__split_fields3)
                          (and
                            (and
                              (=>
                                (and (= o4 true) (= dataok3 true))
                                (= (privatekeypresent
                                     thistisinfo__split_fields4) true))
                              (=>
                                (not (and (= o4 true) (= dataok3 true)))
                                (=
                                  (= (privatekeypresent
                                       thistisinfo__split_fields4) true)
                                  (= (privatekeypresent
                                       thistisinfo__split_fields2) true))))
                            (dynamic_invariant
                              (us_repqtmk1 thistisinfo__split_fields4)
                              true
                              true
                              true
                              true)))))))))))))
    (and
      (and
        (and
          (and (= thefile3 thefile2) (= dataok3 dataok2))
          (= description2 description1))
        (= thistisinfo__split_fields4 thistisinfo__split_fields2))
      (= certno1 certno))))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused7 () Bool
  dataok3)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused1 () us_rep
  thefile3)

;; "o"
(define-fun o5 () Bool
  (endoffile thefile3))

;; "endoffile'result'unused"
(define-fun endoffileqtresultqtunused () Bool
  o5)

;; "o"
(define-fun o6 () Bool
  (and (ite (= o5 true) false true) dataok3))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o6)

;; "H"
(assert (= o6 true))

;; "temp___loop_entry_528'unused"
(define-fun temp___loop_entry_528qtunused () Int
  certno1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  certno1)

;; "temp___loop_entry_527'unused"
(define-fun temp___loop_entry_527qtunused () (Array Int character)
  description2)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused2 () (Array Int character)
  description2)

;; "temp___loop_entry_526'unused"
(define-fun temp___loop_entry_526qtunused () Bool
  dataok3)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused8 () Bool
  dataok3)

;; "temp___loop_entry_525'unused"
(define-fun temp___loop_entry_525qtunused () us_rep
  thefile3)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused2 () us_rep
  thefile3)

;; "__split_fields__content'result'unused"
(define-fun us_split_fields__contentqtresultqtunused () us_split_fields2
  thistisinfo__split_fields4)

;; "temp___loop_entry_524'unused"
(define-fun temp___loop_entry_524qtunused () us_rep2
  (us_repqtmk1 thistisinfo__split_fields4))

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused () us_rep2
  (us_repqtmk1 thistisinfo__split_fields4))

;; "temp___inv_530"
(define-fun temp___inv_530 () Bool
  (privatekeypresent thistisinfo__split_fields4))

;; "Ensures"
(assert
  (=
    (= temp___inv_530 true)
    (= (rec__keystore__optionalprivatekeyt__ispresent
         thistisinfo__split_fields4) true)))

;; "privatekeypresent'result'unused"
(define-fun privatekeypresentqtresultqtunused () Bool
  temp___inv_530)

(declare-const thefile4 us_rep)

(declare-const dataok4 Bool)

(declare-const description3 (Array Int character))

(declare-const thistisinfo__split_fields5 us_split_fields2)

(declare-const certno2 Int)

;; "certno'unused"
(define-fun certnoqtunused2 () int__ref
  (int__refqtmk certno2))

;; "thistisinfo__split_fields"
(define-fun thistisinfo__split_fields6 () us_split_fields__ref
  (us_split_fields__refqtmk thistisinfo__split_fields5))

;; "description'unused"
(define-fun descriptionqtunused3 () map__ref
  (map__refqtmk description3))

;; "dataok'unused"
(define-fun dataokqtunused3 () bool__ref
  (bool__refqtmk dataok4))

;; "thefile'unused"
(define-fun thefileqtunused4 () t__ref
  (t__refqtmk thefile4))

;; "LoopInvariant"
(assert (= (privatekeypresent thistisinfo__split_fields5) true))

;; "LoopInvariant"
(assert (<= 2 certno2))

;; "Assume"
(assert
  (= (and (ite (and
                 (dynamic_invariant
                   (us_repqtmk1 thistisinfo__split_fields5)
                   true
                   true
                   true
                   true)
                 (in_range1 certno2))
            true
            false) (ite (and
                          (not (= (endoffile thefile4) true))
                          (= dataok4 true))
                     true
                     false)) true))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused3 () us_rep
  thefile4)

;; "o"
(define-fun o7 () Bool
  (endofline thefile4))

;; "endofline'result'unused"
(define-fun endoflineqtresultqtunused () Bool
  o7)

(declare-const spark__branch2 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused2 () bool__ref
  (bool__refqtmk spark__branch2))

;; "H"
(assert (= spark__branch2 (ite (= o7 true) false true)))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused9 () Bool
  spark__branch2)

;; "H"
(assert (= spark__branch2 true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  certno2)

;; "o"
(define-fun o8 () Int
  (+ certno2 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o8)

;; Goal "def'vc"
;; File "enrolment.ads", line 54, characters 0-0
(assert
  (not (<= o8 2147483647)))

(check-sat)