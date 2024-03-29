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

(declare-datatypes ()
  ((t (tqtmk (rec__first integer)(rec__last integer)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ()
  ((t1 (tqtmk1 (rec__first1 integer)(rec__last1 integer)))))

;; "dynamic_property"
(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts map1)(rt t)(rt_2 t1)))))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep (rec__last (rt a))))

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

(declare-const a us_t)

(declare-const x Int)

(declare-const i Int)

(declare-const j Int)

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

;; "Assume"
(assert (dynamic_invariant a true false true true))

;; "Assume"
(assert (in_range x))

;; "Assume"
(assert (in_range2 i))

;; "Assume"
(assert (in_range2 j))

;; "Assume"
(assert
  (and
    (and (<= (first a) i) (<= i (last a)))
    (and (<= (first_2 a) j) (<= j (last_2 a)))))

;; "o"
(define-fun o () Int
  (last_2 a))

;; "last_2'result'unused"
(define-fun last_2qtresultqtunused () Int
  o)

;; "o"
(define-fun o1 () Int
  (length_2 a))

;; "length_2'result'unused"
(define-fun length_2qtresultqtunused () Int
  o1)

;; "Ensures"
(assert (in_range o1))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o1)

;; "o"
(define-fun o2 () Int
  (last a))

;; "last'result'unused"
(define-fun lastqtresultqtunused () Int
  o2)

;; "o"
(define-fun o3 () Int
  (- o2 i))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused () Int
  o3)

;; "Ensures"
(assert (in_range o3))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o3)

;; "o"
(define-fun o4 () Int
  (* o3 o1))

;; "infix *'result'unused"
(define-fun infix_asqtresultqtunused () Int
  o4)

;; "Ensures"
(assert (in_range o4))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused2 () Int
  o4)

;; "o"
(define-fun o5 () Int
  (+ o4 o))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o5)

;; "Ensures"
(assert (in_range o5))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o5)

;; "o"
(define-fun o6 () Int
  (- o5 j))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused1 () Int
  o6)

;; "Ensures"
(assert (in_range o6))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused4 () Int
  o6)

;; "o"
(define-fun o7 () Int
  (+ o6 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o7)

;; "Ensures"
(assert (in_range o7))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused5 () Int
  o7)

;; "o"
(define-fun o8 () Int
  (* 100 o7))

;; "infix *'result'unused"
(define-fun infix_asqtresultqtunused1 () Int
  o8)

;; "Ensures"
(assert (in_range o8))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused6 () Int
  o8)

;; "o"
(define-fun o9 () Int
  (+ (- 2147483648) o8))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused2 () Int
  o9)

;; "Ensures"
(assert (in_range o9))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused7 () Int
  o9)

;; "o"
(define-fun o10 () Bool
  (ite (<= o9 x) true false))

;; "infix >='result'unused"
(define-fun infix_gteqqtresultqtunused () Bool
  o10)

;; "o"
(define-fun o11 () Int
  (last_2 a))

;; "last_2'result'unused"
(define-fun last_2qtresultqtunused1 () Int
  o11)

;; "o"
(define-fun o12 () Int
  (length_2 a))

;; "length_2'result'unused"
(define-fun length_2qtresultqtunused1 () Int
  o12)

;; "Ensures"
(assert (in_range o12))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused8 () Int
  o12)

;; "o"
(define-fun o13 () Int
  (last a))

;; "last'result'unused"
(define-fun lastqtresultqtunused1 () Int
  o13)

;; "o"
(define-fun o14 () Int
  (- o13 i))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused2 () Int
  o14)

;; "Ensures"
(assert (in_range o14))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused9 () Int
  o14)

;; "o"
(define-fun o15 () Int
  (* o14 o12))

;; "infix *'result'unused"
(define-fun infix_asqtresultqtunused2 () Int
  o15)

;; "Ensures"
(assert (in_range o15))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused10 () Int
  o15)

;; "o"
(define-fun o16 () Int
  (+ o15 o11))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused3 () Int
  o16)

;; "Ensures"
(assert (in_range o16))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused11 () Int
  o16)

;; "o"
(define-fun o17 () Int
  (- o16 j))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused3 () Int
  o17)

;; "Ensures"
(assert (in_range o17))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused12 () Int
  o17)

;; "o"
(define-fun o18 () Int
  (+ o17 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused4 () Int
  o18)

;; "Ensures"
(assert (in_range o18))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused13 () Int
  o18)

;; "o"
(define-fun o19 () Int
  (* 100 o18))

;; "infix *'result'unused"
(define-fun infix_asqtresultqtunused3 () Int
  o19)

;; "Ensures"
(assert (in_range o19))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused14 () Int
  o19)

;; "o"
(define-fun o20 () Int
  (- 2147483647 o19))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused4 () Int
  o20)

;; "Ensures"
(assert (in_range o20))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused15 () Int
  o20)

;; "o"
(define-fun o21 () Bool
  (ite (<= x o20) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused () Bool
  o21)

;; "o"
(define-fun o22 () Bool
  (and o21 o10))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o22)

(declare-const test_higher_order__in_range__2__result Bool)

;; "test_higher_order__in_range__2__result'unused"
(define-fun test_higher_order__in_range__2__resultqtunused () bool__ref
  (bool__refqtmk test_higher_order__in_range__2__result))

;; "H"
(assert (= test_higher_order__in_range__2__result o22))

;; "H"
(assert (= test_higher_order__in_range__2__result true))

;; Goal "def'vc"
;; File "test_higher_order.ads", line 58, characters 0-0
(assert
  (not (<= (- 2147483548) x)))

(check-sat)
