;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
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

;; "to_rep"
(define-fun to_rep ((x integer)) Int
  (integerqtint x))

;; "of_rep"
(declare-fun of_rep (Int) integer)

;; "inversion_axiom"
(assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "bool_eq"
(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int) (b (Array Int integer)) (b__first Int) (b__last Int)) Bool
  (ite (and
         (ite (<= a__first a__last)
           (and
             (<= b__first b__last)
             (= (- a__last a__first) (- b__last b__first)))
           (< b__last b__first))
         (forall ((temp___idx_168 Int))
           (=>
             (and (<= a__first temp___idx_168) (<= temp___idx_168 a__last))
             (= (to_rep (select a temp___idx_168)) (to_rep
                                                     (select b (+ (- b__first a__first) temp___idx_168)))))))
    true
    false))

;; "bool_eq_rev"
(assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
    (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
      (=>
        (= (bool_eq b b__first b__last a a__first a__last) true)
        (and
          (ite (<= a__first a__last)
            (and
              (<= b__first b__last)
              (= (- a__last a__first) (- b__last b__first)))
            (< b__last b__first))
          (forall ((temp___idx_168 Int))
            (=>
              (and (<= a__first temp___idx_168) (<= temp___idx_168 a__last))
              (= (to_rep (select a temp___idx_168)) (to_rep
                                                      (select b (+ (- b__first a__first) temp___idx_168)))))))))))

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
             (= (to_rep (rec__first (mk f l))) f)
             (= (to_rep (rec__last (mk f l))) l)))) :pattern ((mk f l)) )))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int integer)
  (elts a))

;; "of_array"
(define-fun of_array ((a (Array Int integer)) (f Int) (l Int)) us_t
  (us_tqtmk a (mk f l)))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep (rec__last (rt a))))

;; "length"
(define-fun length ((a us_t)) Int
  (ite (<= (first a) (last a)) (+ (- (last a) (first a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "component__size_axiom"
(assert (<= 0 component__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

;; "equal_subrange"
(define-fun equal_subrange ((param__a us_t) (param__j Int) (param__b us_t)) Bool
  (let ((temp___172 (let ((temp___170 (+ (- param__j 1) (length param__b))))
                      (of_array (to_array param__a) param__j temp___170))))
    (bool_eq
      (to_array temp___172)
      (first temp___172)
      (last temp___172)
      (to_array param__b)
      (first param__b)
      (last param__b))))

;; "has_sub_range_in_prefix"
(declare-fun has_sub_range_in_prefix (us_t
  Int
  us_t) Bool)

;; "has_sub_range"
(declare-fun has_sub_range (us_t
  us_t) Bool)

(declare-const a us_t)

(declare-const b us_t)

(declare-datatypes ()
  ((us_split_fields
   (us_split_fieldsqtmk
   (rec__types__option__exists Bool)(rec__types__option__value integer)))))

(declare-datatypes ()
  ((us_split_fields__ref
   (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))

(declare-datatypes ()
  ((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const types__option__exists__first__bit Int)

(declare-const types__option__exists__last__bit Int)

(declare-const types__option__exists__position Int)

;; "types__option__exists__first__bit_axiom"
(assert (<= 0 types__option__exists__first__bit))

;; "types__option__exists__last__bit_axiom"
(assert
  (< types__option__exists__first__bit types__option__exists__last__bit))

;; "types__option__exists__position_axiom"
(assert (<= 0 types__option__exists__position))

(declare-const types__option__value__first__bit Int)

(declare-const types__option__value__last__bit Int)

(declare-const types__option__value__position Int)

;; "types__option__value__first__bit_axiom"
(assert (<= 0 types__option__value__first__bit))

;; "types__option__value__last__bit_axiom"
(assert (< types__option__value__first__bit types__option__value__last__bit))

;; "types__option__value__position_axiom"
(assert (<= 0 types__option__value__position))

(declare-const dummy us_rep)

(declare-datatypes ()
  ((option__ref (option__refqtmk (option__content us_rep)))))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_180 us_t) (temp___is_init_176 Bool) (temp___skip_constant_177 Bool) (temp___do_toplevel_178 Bool) (temp___do_typ_inv_179 Bool)) Bool
  (=>
    (not (= temp___skip_constant_177 true))
    (dynamic_property
      1
      2147483647
      (first temp___expr_180)
      (last temp___expr_180))))

;; "has_sub_range_in_prefix__post_axiom"
(assert true)

;; "has_sub_range_in_prefix__def_axiom"
(assert
  (forall ((param__a us_t) (param__b us_t))
    (forall ((param__last Int))
      (! (=
           (= (has_sub_range_in_prefix param__a param__last param__b) true)
           (exists ((j Int))
             (and
               (and (<= (first param__a) j) (<= j param__last))
               (= (equal_subrange param__a j param__b) true)))) :pattern (
      (has_sub_range_in_prefix
        param__a
        param__last
        param__b)) ))))

;; "has_sub_range__post_axiom"
(assert true)

;; "has_sub_range__def_axiom"
(assert
  (forall ((param__a us_t) (param__b us_t))
    (! (=
         (= (has_sub_range param__a param__b) true)
         (= (has_sub_range_in_prefix
              param__a
              (- (+ (last param__a) 1) (length param__b))
              param__b) true)) :pattern ((has_sub_range param__a param__b)) )))

(declare-const rliteral integer)

;; "rliteral_axiom"
(assert (= (integerqtint rliteral) 1))

(declare-const search_ter_p__search__result us_split_fields)

;; "search_ter_p__search__result'unused"
(define-fun search_ter_p__search__resultqtunused () option__ref
  (option__refqtmk (us_repqtmk search_ter_p__search__result)))

;; "Assume"
(assert (dynamic_invariant a true false true true))

;; "Assume"
(assert (dynamic_invariant b true false true true))

;; "Assume"
(assert (and (< (last a) 2147483647) (<= (first b) (last b))))

;; "o"
(define-fun o () Int
  (length b))

;; "length'result'unused"
(define-fun lengthqtresultqtunused () Int
  o)

;; "o"
(define-fun o1 () Int
  (length a))

;; "length'result'unused"
(define-fun lengthqtresultqtunused1 () Int
  o1)

;; "temp___232"
(define-fun temp___232 () Bool
  (ite (< o1 o) true false))

;; "infix <'result'unused"
(define-fun infix_lsqtresultqtunused () Bool
  temp___232)

;; "o"
(define-fun o2 () Int
  (length b))

;; "length'result'unused"
(define-fun lengthqtresultqtunused2 () Int
  o2)

;; "temp___231"
(define-fun temp___231 () Bool
  (ite (= o2 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  temp___231)

(declare-const temp___233 Bool)

(declare-const o3 Int)

;; "H"
(assert (= o3 (length b)))

(declare-const lengthqtresultqtunused3 Int)

;; "H"
(assert (= lengthqtresultqtunused3 o3))

(declare-const o4 Int)

;; "H"
(assert (= o4 (length a)))

(declare-const lengthqtresultqtunused4 Int)

;; "H"
(assert (= lengthqtresultqtunused4 o4))

(declare-const infix_gteqqtresultqtunused Bool)

;; "H"
(assert (= infix_gteqqtresultqtunused (ite (<= o3 o4) true false)))

(declare-const o5 us_t)

(declare-const o6 us_t)

(declare-const has_sub_rangeqtresultqtunused Bool)

;; "H"
(assert
  (ite (<= o3 o4)
    (and
      (= o5 b)
      (and
        (= o6 a)
        (and
          (= temp___233 (has_sub_range o6 o5))
          (and
            (=
              (= temp___233 true)
              (= (has_sub_range_in_prefix
                   o6
                   (- (+ (last o6) 1) (length o5))
                   o5) true))
            (= has_sub_rangeqtresultqtunused temp___233)))))
    (= temp___233 false)))

;; "o"
(define-fun o7 () Bool
  (or temp___231 temp___232))

;; "orb'result'unused"
(define-fun orbqtresultqtunused () Bool
  o7)

;; "o"
(define-fun o8 () Bool
  (or o7 temp___233))

;; "orb'result'unused"
(define-fun orbqtresultqtunused1 () Bool
  o8)

(declare-const search_ter_p__search__result1 us_split_fields)

;; "search_ter_p__search__result'unused"
(define-fun search_ter_p__search__resultqtunused1 () option__ref
  (option__refqtmk (us_repqtmk search_ter_p__search__result1)))

(declare-const o9 Bool)

;; "H"
(assert (= o9 (distinct 0 0)))

(declare-const of_intqtresultqtunused Bool)

;; "H"
(assert (= of_intqtresultqtunused o9))

(declare-const o10 us_split_fields)

;; "H"
(assert (= o10 (us_split_fieldsqtmk o9 rliteral)))

(declare-const us_split_fieldsqtmkqtresultqtunused us_split_fields)

;; "H"
(assert (= us_split_fieldsqtmkqtresultqtunused o10))

(declare-const search_ter_p__search__result__assumeqtunused us_rep)

;; "H"
(assert (= search_ter_p__search__result__assumeqtunused (us_repqtmk o10)))

(declare-const us_repqtmkqtresultqtunused us_rep)

;; "H"
(assert (= us_repqtmkqtresultqtunused (us_repqtmk o10)))

(declare-const us_split_fieldsqtresultqtunused us_split_fields)

;; "H"
(assert (= us_split_fieldsqtresultqtunused o10))

(declare-const result____split_fields us_split_fields)

(declare-const result____split_fieldsqtunused us_split_fields__ref)

;; "H"
(assert
  (= result____split_fieldsqtunused (us_split_fields__refqtmk
                                      result____split_fields)))

;; "H"
(assert (= result____split_fields o10))

;; "Assume"
(assert true)

(declare-const o11 Int)

;; "H"
(assert (= o11 (length b)))

(declare-const lengthqtresultqtunused5 Int)

;; "H"
(assert (= lengthqtresultqtunused5 o11))

(declare-const o12 Int)

;; "H"
(assert (= o12 (length a)))

(declare-const lengthqtresultqtunused6 Int)

;; "H"
(assert (= lengthqtresultqtunused6 o12))

(declare-const infix_lsqtresultqtunused1 Bool)

;; "H"
(assert (= infix_lsqtresultqtunused1 (ite (< o12 o11) true false)))

(declare-const o13 Bool)

(declare-const o14 Int)

(declare-const lengthqtresultqtunused7 Int)

(declare-const infix_eqqtresultqtunused1 Bool)

;; "H"
(assert
  (ite (< o12 o11)
    (= o13 true)
    (and
      (= o14 (length b))
      (and
        (= lengthqtresultqtunused7 o14)
        (and
          (= o13 (ite (= o14 0) true false))
          (= infix_eqqtresultqtunused1 o13))))))

(declare-const spark__branch Bool)

(declare-const spark__branchqtunused bool__ref)

;; "H"
(assert (= spark__branchqtunused (bool__refqtmk spark__branch)))

;; "H"
(assert (= spark__branch o13))

(declare-const bool__contentqtresultqtunused Bool)

;; "H"
(assert (= bool__contentqtresultqtunused spark__branch))

(declare-const temp___235 Int)

(declare-const firstqtresultqtunused Int)

(declare-const o15 Int)

(declare-const lengthqtresultqtunused8 Int)

(declare-const range_check_qtresultqtunused Int)

(declare-const o16 Int)

(declare-const lastqtresultqtunused Int)

(declare-const o17 Int)

(declare-const infix_plqtresultqtunused Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const o18 Int)

(declare-const infix_mnqtresultqtunused Int)

(declare-const range_check_qtresultqtunused2 Int)

(declare-const i Int)

(declare-const iqtunused int__ref)

(declare-const us_split_fields__contentqtresultqtunused us_split_fields)

(declare-const us_repqtmkqtresultqtunused1 us_rep)

;; "H"
(assert
  (ite (= spark__branch true)
    (and
      (= us_split_fields__contentqtresultqtunused result____split_fields)
      (and
        (= us_repqtmkqtresultqtunused1 (us_repqtmk result____split_fields))
        (= search_ter_p__search__result1 result____split_fields)))
    (and
      (= temp___235 (first a))
      (and
        (= firstqtresultqtunused temp___235)
        (and
          (= o15 (length b))
          (and
            (= lengthqtresultqtunused8 o15)
            (and
              (in_range o15)
              (and
                (= range_check_qtresultqtunused o15)
                (and
                  (= o16 (last a))
                  (and
                    (= lastqtresultqtunused o16)
                    (and
                      (= o17 (+ o16 1))
                      (and
                        (= infix_plqtresultqtunused o17)
                        (and
                          (in_range o17)
                          (and
                            (= range_check_qtresultqtunused1 o17)
                            (and
                              (= o18 (- o17 o15))
                              (and
                                (= infix_mnqtresultqtunused o18)
                                (and
                                  (in_range o18)
                                  (and
                                    (= range_check_qtresultqtunused2 
                                    o18)
                                    (and
                                      (= iqtunused (int__refqtmk i))
                                      (and
                                        (= i temp___235)
                                        (or
                                          (and
                                            (= (and (ite (<= temp___235 
                                                      i)
                                                      true
                                                      false) (ite (<= 
                                                               i o18)
                                                               true
                                                               false)) true)
                                            (let ((o19 b))
                                              (let ((o20 a))
                                                (let ((o21 (equal_subrange
                                                             o20
                                                             i
                                                             o19)))
                                                  (and
                                                    (=
                                                      (= o21 true)
                                                      (= (let ((temp___184 
                                                           (let ((temp___182 (+ (- 
                                                             i 1) (length
                                                                    o19))))
                                                             (of_array
                                                               (to_array o20)
                                                               i
                                                               temp___182))))
                                                           (bool_eq
                                                             (to_array
                                                               temp___184)
                                                             (first
                                                               temp___184)
                                                             (last
                                                               temp___184)
                                                             (to_array o19)
                                                             (first o19)
                                                             (last o19))) true))
                                                    (exists ((spark__branch1 Bool))
                                                      (and
                                                        (= spark__branch1 o21)
                                                        (ite (= spark__branch1 true)
                                                          (and
                                                            (= (has_sub_range
                                                                 a
                                                                 b) true)
                                                            (exists ((result____split_fields1 us_split_fields))
                                                              (and
                                                                (= result____split_fields1 
                                                                (us_split_fieldsqtmk
                                                                  (distinct 1 0)
                                                                  (rec__types__option__value
                                                                    result____split_fields)))
                                                                (exists 
                                                                  ((o22 integer))
                                                                  (and
                                                                    (= 
                                                                    (to_rep
                                                                    o22) 
                                                                    i)
                                                                    (exists 
                                                                    ((result____split_fields2 us_split_fields))
                                                                    (and
                                                                    (= result____split_fields2 
                                                                    (us_split_fieldsqtmk
                                                                    (rec__types__option__exists
                                                                    result____split_fields1)
                                                                    o22))
                                                                    (= 
                                                                    search_ter_p__search__result1 result____split_fields2))))))))
                                                          (let ((o22 
                                                            b))
                                                            (let ((o23 
                                                              a))
                                                              (and
                                                                (=
                                                                  (= 
                                                                  (has_sub_range_in_prefix
                                                                    o23
                                                                    i
                                                                    o22) true)
                                                                  (exists 
                                                                    ((j Int))
                                                                    (and
                                                                    (and
                                                                    (<= 
                                                                    (first
                                                                    o23) j)
                                                                    (<= j 
                                                                    i))
                                                                    (= 
                                                                    (equal_subrange
                                                                    o23
                                                                    j
                                                                    o22) true))))
                                                                (exists 
                                                                  ((result____split_fields1 us_split_fields) (i1 Int))
                                                                  (and
                                                                    (and
                                                                    (not
                                                                    (= 
                                                                    (has_sub_range_in_prefix
                                                                    a
                                                                    i1
                                                                    b) true))
                                                                    (not
                                                                    (= 
                                                                    (rec__types__option__exists
                                                                    result____split_fields1) true)))
                                                                    (and
                                                                    (= (and 
                                                                    (ite (= result____split_fields1 
                                                                    result____split_fields)
                                                                    true
                                                                    false) 
                                                                    (ite 
                                                                    (and
                                                                    (<= 
                                                                    (first
                                                                    a) i1)
                                                                    (<= i1 (- (+ 
                                                                    (last
                                                                    a) 1) 
                                                                    (length
                                                                    b))))
                                                                    true
                                                                    false)) true)
                                                                    (and
                                                                    (not
                                                                    (= i1 
                                                                    o18))
                                                                    (exists 
                                                                    ((i2 Int))
                                                                    (and
                                                                    (= i2 (+ i1 1))
                                                                    (let ((o24 
                                                                    b))
                                                                    (let ((o25 
                                                                    a))
                                                                    (let ((o26 
                                                                    (equal_subrange
                                                                    o25
                                                                    i2
                                                                    o24)))
                                                                    (and
                                                                    (=
                                                                    (= o26 true)
                                                                    (= 
                                                                    (let ((temp___184 
                                                                    (let ((temp___182 (+ (- i2 1) 
                                                                    (length
                                                                    o24))))
                                                                    (of_array
                                                                    (to_array
                                                                    o25)
                                                                    i2
                                                                    temp___182))))
                                                                    (bool_eq
                                                                    (to_array
                                                                    temp___184)
                                                                    (first
                                                                    temp___184)
                                                                    (last
                                                                    temp___184)
                                                                    (to_array
                                                                    o24)
                                                                    (first
                                                                    o24)
                                                                    (last
                                                                    o24))) true))
                                                                    (exists 
                                                                    ((spark__branch2 Bool))
                                                                    (and
                                                                    (= spark__branch2 o26)
                                                                    (and
                                                                    (= spark__branch2 true)
                                                                    (and
                                                                    (= 
                                                                    (has_sub_range
                                                                    a
                                                                    b) true)
                                                                    (exists 
                                                                    ((result____split_fields2 us_split_fields))
                                                                    (and
                                                                    (= result____split_fields2 
                                                                    (us_split_fieldsqtmk
                                                                    (distinct 1 0)
                                                                    (rec__types__option__value
                                                                    result____split_fields1)))
                                                                    (exists 
                                                                    ((o27 integer))
                                                                    (and
                                                                    (= 
                                                                    (to_rep
                                                                    o27) i2)
                                                                    (exists 
                                                                    ((result____split_fields3 us_split_fields))
                                                                    (and
                                                                    (= result____split_fields3 
                                                                    (us_split_fieldsqtmk
                                                                    (rec__types__option__exists
                                                                    result____split_fields2)
                                                                    o27))
                                                                    (= 
                                                                    search_ter_p__search__result1 result____split_fields3))))))))))))))))))))))))))))))))
                                          (exists ((result____split_fields1 us_split_fields) (search_ter_p__search__result2 us_split_fields))
                                            (and
                                              (ite (= (and (ite (<= temp___235 
                                                             i)
                                                             true
                                                             false) (ite (<= 
                                                                    i o18)
                                                                    true
                                                                    false)) true)
                                                (let ((o19 b))
                                                  (let ((o20 a))
                                                    (let ((o21 (equal_subrange
                                                                 o20
                                                                 i
                                                                 o19)))
                                                      (and
                                                        (=
                                                          (= o21 true)
                                                          (= (let ((temp___184 
                                                               (let ((temp___182 (+ (- 
                                                                 i 1) 
                                                                 (length
                                                                   o19))))
                                                                 (of_array
                                                                   (to_array
                                                                    o20)
                                                                   i
                                                                   temp___182))))
                                                               (bool_eq
                                                                 (to_array
                                                                   temp___184)
                                                                 (first
                                                                   temp___184)
                                                                 (last
                                                                   temp___184)
                                                                 (to_array
                                                                   o19)
                                                                 (first o19)
                                                                 (last o19))) true))
                                                        (exists ((spark__branch1 Bool))
                                                          (and
                                                            (= spark__branch1 o21)
                                                            (and
                                                              (not
                                                                (= spark__branch1 true))
                                                              (let ((o22 
                                                                b))
                                                                (let ((o23 
                                                                  a))
                                                                  (and
                                                                    (=
                                                                    (= 
                                                                    (has_sub_range_in_prefix
                                                                    o23
                                                                    i
                                                                    o22) true)
                                                                    (exists 
                                                                    ((j Int))
                                                                    (and
                                                                    (and
                                                                    (<= 
                                                                    (first
                                                                    o23) j)
                                                                    (<= j 
                                                                    i))
                                                                    (= 
                                                                    (equal_subrange
                                                                    o23
                                                                    j
                                                                    o22) true))))
                                                                    (exists 
                                                                    ((i1 Int))
                                                                    (and
                                                                    (and
                                                                    (not
                                                                    (= 
                                                                    (has_sub_range_in_prefix
                                                                    a
                                                                    i1
                                                                    b) true))
                                                                    (not
                                                                    (= 
                                                                    (rec__types__option__exists
                                                                    result____split_fields1) true)))
                                                                    (and
                                                                    (= (and 
                                                                    (ite (= result____split_fields1 
                                                                    result____split_fields)
                                                                    true
                                                                    false) 
                                                                    (ite 
                                                                    (and
                                                                    (<= 
                                                                    (first
                                                                    a) i1)
                                                                    (<= i1 (- (+ 
                                                                    (last
                                                                    a) 1) 
                                                                    (length
                                                                    b))))
                                                                    true
                                                                    false)) true)
                                                                    (= i1 
                                                                    o18))))))))))))))
                                                (and
                                                  (= result____split_fields1 
                                                  result____split_fields)
                                                  (= search_ter_p__search__result2 
                                                  search_ter_p__search__result)))
                                              (= search_ter_p__search__result1 result____split_fields1))))))))))))))))))))))))

;; "Assert"
(assert
  (=>
    (= o2 0)
    (not (= (rec__types__option__exists search_ter_p__search__result1) true))))

;; "Assert"
(assert
  (=>
    (< o1 o)
    (not (= (rec__types__option__exists search_ter_p__search__result1) true))))

;; "H"
(assert (= temp___233 true))

;; Goal "def'vc"
;; File "search_ter_p.ads", line 32, characters 0-0
(assert
  (not
  (= (equal_subrange
       a
       (to_rep (rec__types__option__value search_ter_p__search__result1))
       b) true)))

(check-sat)