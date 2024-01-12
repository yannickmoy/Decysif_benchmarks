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

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int small_int))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int small_int)
  (elts a))

;; "of_array"
(define-fun of_array ((a (Array Int small_int)) (f Int) (l Int)) us_t
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

;; "temp_____aggregate_def_864"
(declare-fun temp_____aggregate_def_864 (Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int) (Array Int small_int))

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

;; "in_range"
(declare-fun in_range3 (Int
  Int
  Int) Bool)

;; "in_range"
(declare-fun in_range4 (Int) Bool)

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

;; "no_overflows"
(declare-fun no_overflows (us_t
  Int
  Int) Bool)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_303 us_t) (temp___is_init_299 Bool) (temp___skip_constant_300 Bool) (temp___do_toplevel_301 Bool) (temp___do_typ_inv_302 Bool)) Bool
  (=>
    (not (= temp___skip_constant_300 true))
    (dynamic_property 1 100 (first temp___expr_303) (last temp___expr_303))))

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
    (forall ((param__x Int) (param__i Int))
      (! (=
           (= (no_overflows param__a param__x param__i) true)
           (and
             (= (in_range4
                  (+ param__x (to_rep1 (select (to_array param__a) param__i)))) true)
             (=>
               (< param__i (last param__a))
               (= (no_overflows
                    param__a
                    (+ param__x (to_rep1
                                  (select (to_array param__a) param__i)))
                    (+ param__i 1)) true)))) :pattern ((no_overflows
                                                         param__a
                                                         param__x
                                                         param__i)) ))))

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
  (forall ((temp___855 Int) (temp___856 Int) (temp___857 Int) (temp___858 Int) (temp___859 Int) (temp___860 Int) (temp___861 Int) (temp___862 Int) (temp___863 Int))
    (let ((temp___865 (temp_____aggregate_def_864
                        temp___855
                        temp___856
                        temp___857
                        temp___858
                        temp___859
                        temp___860
                        temp___861
                        temp___862
                        temp___863)))
      (and
        (and
          (= (select temp___865 1) rliteral)
          (= (select temp___865 2) rliteral1))
        (and
          (and
            (and
              (= (select temp___865 3) rliteral2)
              (= (select temp___865 4) rliteral3))
            (and
              (= (select temp___865 5) rliteral4)
              (= (select temp___865 6) rliteral5)))
          (and
            (and
              (= (select temp___865 7) rliteral6)
              (= (select temp___865 8) rliteral))
            (= (select temp___865 9) rliteral)))))))

;; Goal "def'vc"
;; File "test_higher_order.ads", line 94, characters 0-0
(assert
  (not
  (forall ((temp___868 (Array Int small_int)))
    (=>
      (and
        (and
          (and
            (= (select temp___868 1) rliteral)
            (= (select temp___868 2) rliteral1))
          (and
            (and
              (and
                (= (select temp___868 3) rliteral2)
                (= (select temp___868 4) rliteral3))
              (and
                (= (select temp___868 5) rliteral4)
                (= (select temp___868 6) rliteral5)))
            (and
              (and
                (= (select temp___868 7) rliteral6)
                (= (select temp___868 8) rliteral))
              (= (select temp___868 9) rliteral))))
        (= temp___868 (temp_____aggregate_def_864 1 2 3 4 5 6 7 1 1)))
      (let ((o (of_array temp___868 1 9)))
        (=> (< 0 (length o)) (= (no_overflows o 0 1) true)))))))

(check-sat)
(get-info :reason-unknown)