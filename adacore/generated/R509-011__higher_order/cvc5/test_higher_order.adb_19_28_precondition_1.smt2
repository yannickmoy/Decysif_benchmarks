;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

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

(declare-sort small_int 0)

;; "small_int'int"
(declare-fun small_intqtint (small_int) Int)

;; "small_int'axiom"
(assert
  (forall ((i small_int))
    (and (<= (- 100) (small_intqtint i)) (<= (small_intqtint i) 100))))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= (- 100) x) (<= x 100)))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 100)))

;; "to_rep"
(define-fun to_rep1 ((x small_int)) Int
  (small_intqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) small_int)

;; "inversion_axiom"
(assert
  (forall ((x small_int))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x small_int))
    (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-sort map1 0)

;; "get"
(declare-fun get (map1
  Int
  Int) small_int)

(declare-datatypes ((t 0))
  (((tqtmk (rec__first integer)(rec__last integer)))))

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
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((t1 0))
  (((tqtmk1 (rec__first1 integer)(rec__last1 integer)))))

;; "mk"
(declare-fun mk1 (Int
  Int) t1)

;; "mk_def"
(assert
  (forall ((f Int) (l Int))
    (! (=>
         (in_range f)
         (=>
           (in_range l)
           (and
             (= (to_rep (rec__first1 (mk1 f l))) f)
             (= (to_rep (rec__last1 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

;; "dynamic_property"
(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts map1)(rt t)(rt_2 t1)))))

;; "to_array"
(define-fun to_array ((a us_t)) map1
  (elts a))

;; "of_array"
(define-fun of_array ((a map1) (f Int) (l Int) (f2 Int) (l2 Int)) us_t
  (us_tqtmk a (mk f l) (mk1 f2 l2)))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep (rec__last (rt a))))

;; "length"
(define-fun length ((a us_t)) Int
  (ite (<= (first a) (last a)) (+ (- (last a) (first a)) 1) 0))

;; "first_2"
(define-fun first_2 ((a us_t)) Int
  (to_rep (rec__first1 (rt_2 a))))

;; "last_2"
(define-fun last_2 ((a us_t)) Int
  (to_rep (rec__last1 (rt_2 a))))

;; "length_2"
(define-fun length_2 ((a us_t)) Int
  (ite (<= (first_2 a) (last_2 a)) (+ (- (last_2 a) (first_2 a)) 1) 0))

;; "dynamic_property"
(define-fun dynamic_property2 ((range_first1 Int) (range_last1 Int) (f1 Int) (l1 Int) (range_first2 Int) (range_last2 Int) (f2 Int) (l2 Int)) Bool
  (and
    (dynamic_property range_first1 range_last1 f1 l1)
    (dynamic_property1 range_first2 range_last2 f2 l2)))

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

;; "no_overflows"
(declare-fun no_overflows (us_t) Bool)

;; "no_overflows"
(declare-fun no_overflows1 (us_t
  Int
  Int
  Int) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const dummy Int)

;; "temp_____aggregate_def_1003"
(declare-fun temp_____aggregate_def_1003 (Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int) map1)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment2))

;; "temp_____aggregate_def_1041"
(declare-fun temp_____aggregate_def_1041 (Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int) map1)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size2 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "component__size_axiom"
(assert (<= 0 component__size2))

;; "alignment_axiom"
(assert (<= 0 alignment3))

;; "in_range"
(declare-fun in_range3 (Int
  Int
  Int) Bool)

;; "in_range"
(declare-fun in_range4 (Int) Bool)

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const component__size3 Int)

(declare-const alignment4 Int)

;; "value__size_axiom"
(assert (<= 0 value__size4))

;; "object__size_axiom"
(assert (<= 0 object__size4))

;; "component__size_axiom"
(assert (<= 0 component__size3))

;; "alignment_axiom"
(assert (<= 0 alignment4))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_343 us_t) (temp___is_init_339 Bool) (temp___skip_constant_340 Bool) (temp___do_toplevel_341 Bool) (temp___do_typ_inv_342 Bool)) Bool
  (=>
    (not (= temp___skip_constant_340 true))
    (dynamic_property2
      1
      100
      (first temp___expr_343)
      (last temp___expr_343)
      1
      100
      (first_2 temp___expr_343)
      (last_2 temp___expr_343))))

;; "dynamic_invariant"
(define-fun dynamic_invariant1 ((temp___expr_461 Int) (temp___is_init_457 Bool) (temp___skip_constant_458 Bool) (temp___do_toplevel_459 Bool) (temp___do_typ_inv_460 Bool)) Bool
  true)

;; "in_range__post_axiom"
(assert true)

;; "in_range__def_axiom"
(assert
  (forall ((param__arg Int))
    (forall ((param__low Int) (param__high Int))
      (! (=
           (= (in_range3 param__arg param__low param__high) true)
           (and (<= param__low param__arg) (<= param__arg param__high))) :pattern (
      (in_range3
        param__arg
        param__low
        param__high)) ))))

;; "in_range__post_axiom"
(assert true)

;; "in_range__def_axiom"
(assert
  (forall ((param__x Int))
    (! (=
         (= (in_range4 param__x) true)
         (= (in_range3 param__x (- 2147483648) 2147483647) true)) :pattern (
    (in_range4
      param__x)) )))

;; "no_overflows__post_axiom"
(assert true)

;; "no_overflows__def_axiom"
(assert
  (forall ((param__a us_t))
    (forall ((param__x Int) (param__i Int) (param__j Int))
      (! (=
           (= (no_overflows1 param__a param__x param__i param__j) true)
           (and
             (= (in_range4
                  (+ param__x (to_rep1
                                (get (to_array param__a) param__i param__j)))) true)
             (ite (< param__j (last_2 param__a))
               (= (no_overflows1
                    param__a
                    (+ param__x (to_rep1
                                  (get (to_array param__a) param__i param__j)))
                    param__i
                    (+ param__j 1)) true)
               (=>
                 (< param__i (last param__a))
                 (= (no_overflows1
                      param__a
                      (+ param__x (to_rep1
                                    (get
                                      (to_array param__a)
                                      param__i
                                      param__j)))
                      (+ param__i 1)
                      (first_2 param__a)) true))))) :pattern ((no_overflows1
                                                                param__a
                                                                param__x
                                                                param__i
                                                                param__j)) ))))

;; "no_overflows__post_axiom"
(assert true)

;; "no_overflows__def_axiom"
(assert
  (forall ((param__a us_t))
    (! (=
         (= (no_overflows param__a) true)
         (=>
           (and (< 0 (length param__a)) (< 0 (length_2 param__a)))
           (= (no_overflows1 param__a 0 (first param__a) (first_2 param__a)) true))) :pattern (
    (no_overflows
      param__a)) )))

(declare-const rliteral small_int)

;; "rliteral_axiom"
(assert (= (small_intqtint rliteral) 1))

(declare-const rliteral1 small_int)

;; "rliteral_axiom"
(assert (= (small_intqtint rliteral1) 2))

(declare-const rliteral2 small_int)

;; "rliteral_axiom"
(assert (= (small_intqtint rliteral2) 3))

(declare-const rliteral3 small_int)

;; "rliteral_axiom"
(assert (= (small_intqtint rliteral3) 4))

(declare-const rliteral4 small_int)

;; "rliteral_axiom"
(assert (= (small_intqtint rliteral4) 5))

(declare-const rliteral5 small_int)

;; "rliteral_axiom"
(assert (= (small_intqtint rliteral5) 6))

(declare-const rliteral6 small_int)

;; "rliteral_axiom"
(assert (= (small_intqtint rliteral6) 7))

;; "def_axiom"
(assert
  (forall ((temp___989 Int) (temp___990 Int) (temp___991 Int) (temp___992 Int) (temp___993 Int) (temp___994 Int) (temp___995 Int) (temp___996 Int) (temp___997 Int) (temp___998 Int) (temp___999 Int) (temp___1000 Int) (temp___1001 Int) (temp___1002 Int))
    (let ((temp___1004 (temp_____aggregate_def_1003
                         temp___989
                         temp___990
                         temp___991
                         temp___992
                         temp___993
                         temp___994
                         temp___995
                         temp___996
                         temp___997
                         temp___998
                         temp___999
                         temp___1000
                         temp___1001
                         temp___1002)))
      (and
        (and
          (= (get temp___1004 1 1) rliteral)
          (= (get temp___1004 1 2) rliteral1))
        (and
          (and
            (and
              (and
                (= (get temp___1004 1 3) rliteral2)
                (= (get temp___1004 1 4) rliteral3))
              (= (get temp___1004 1 5) rliteral4))
            (and
              (and
                (= (get temp___1004 1 6) rliteral5)
                (= (get temp___1004 1 7) rliteral6))
              (= (get temp___1004 2 1) rliteral)))
          (and
            (and
              (and
                (= (get temp___1004 2 2) rliteral1)
                (= (get temp___1004 2 3) rliteral2))
              (= (get temp___1004 2 4) rliteral3))
            (and
              (and
                (= (get temp___1004 2 5) rliteral4)
                (= (get temp___1004 2 6) rliteral5))
              (= (get temp___1004 2 7) rliteral6))))))))

;; "def_axiom"
(assert
  (forall ((temp___1027 Int) (temp___1028 Int) (temp___1029 Int) (temp___1030 Int) (temp___1031 Int) (temp___1032 Int) (temp___1033 Int) (temp___1034 Int) (temp___1035 Int) (temp___1036 Int) (temp___1037 Int) (temp___1038 Int) (temp___1039 Int) (temp___1040 Int))
    (let ((temp___1042 (temp_____aggregate_def_1041
                         temp___1027
                         temp___1028
                         temp___1029
                         temp___1030
                         temp___1031
                         temp___1032
                         temp___1033
                         temp___1034
                         temp___1035
                         temp___1036
                         temp___1037
                         temp___1038
                         temp___1039
                         temp___1040)))
      (and
        (and
          (= (get temp___1042 1 1) rliteral)
          (= (get temp___1042 1 2) rliteral1))
        (and
          (and
            (and
              (and
                (= (get temp___1042 1 3) rliteral2)
                (= (get temp___1042 1 4) rliteral3))
              (= (get temp___1042 1 5) rliteral4))
            (and
              (and
                (= (get temp___1042 1 6) rliteral5)
                (= (get temp___1042 1 7) rliteral6))
              (= (get temp___1042 2 1) rliteral)))
          (and
            (and
              (and
                (= (get temp___1042 2 2) rliteral1)
                (= (get temp___1042 2 3) rliteral2))
              (= (get temp___1042 2 4) rliteral3))
            (and
              (and
                (= (get temp___1042 2 5) rliteral4)
                (= (get temp___1042 2 6) rliteral5))
              (= (get temp___1042 2 7) rliteral6))))))))

;; Goal "def'vc"
;; File "test_higher_order.ads", line 118, characters 0-0
(assert
  (not
  (=>
    (= (no_overflows
         (of_array
           (temp_____aggregate_def_1003 1 2 3 4 5 6 7 1 2 3 4 5 6 7)
           1
           2
           1
           7)) true)
    (forall ((temp___1047 map1))
      (=>
        (and
          (and
            (and
              (= (get temp___1047 1 1) rliteral)
              (= (get temp___1047 1 2) rliteral1))
            (and
              (and
                (and
                  (and
                    (= (get temp___1047 1 3) rliteral2)
                    (= (get temp___1047 1 4) rliteral3))
                  (= (get temp___1047 1 5) rliteral4))
                (and
                  (and
                    (= (get temp___1047 1 6) rliteral5)
                    (= (get temp___1047 1 7) rliteral6))
                  (= (get temp___1047 2 1) rliteral)))
              (and
                (and
                  (and
                    (= (get temp___1047 2 2) rliteral1)
                    (= (get temp___1047 2 3) rliteral2))
                  (= (get temp___1047 2 4) rliteral3))
                (and
                  (and
                    (= (get temp___1047 2 5) rliteral4)
                    (= (get temp___1047 2 6) rliteral5))
                  (= (get temp___1047 2 7) rliteral6)))))
          (= temp___1047 (temp_____aggregate_def_1041
                           1
                           2
                           3
                           4
                           5
                           6
                           7
                           1
                           2
                           3
                           4
                           5
                           6
                           7)))
        (let ((o (of_array temp___1047 1 2 1 7)))
          (=>
            (and (< 0 (length o)) (< 0 (length_2 o)))
            (= (no_overflows1 o 0 (first o) (first_2 o)) true))))))))

(check-sat)
(get-info :reason-unknown)
