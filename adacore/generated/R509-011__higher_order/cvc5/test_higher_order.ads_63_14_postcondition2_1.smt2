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

(declare-datatypes ((t 0))
  (((tqtmk (rec__first integer)(rec__last integer)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((t1 0))
  (((tqtmk1 (rec__first1 integer)(rec__last1 integer)))))

;; "dynamic_property"
(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts map1)(rt t)(rt_2 t1)))))

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

;; Goal "def'vc"
;; File "test_higher_order.ads", line 58, characters 0-0
(assert
  (not
  (=>
    (dynamic_invariant a true false true true)
    (=>
      (in_range x)
      (=>
        (in_range2 i)
        (=>
          (in_range2 j)
          (=>
            (and
              (and (<= (first a) i) (<= i (last a)))
              (and (<= (first_2 a) j) (<= j (last_2 a))))
            (let ((o (length_2 a)))
              (=>
                (in_range o)
                (let ((o1 (- (last a) i)))
                  (=>
                    (in_range o1)
                    (let ((o2 (* o1 o)))
                      (=>
                        (in_range o2)
                        (let ((o3 (+ o2 (last_2 a))))
                          (=>
                            (in_range o3)
                            (let ((o4 (- o3 j)))
                              (=>
                                (in_range o4)
                                (let ((o5 (+ o4 1)))
                                  (=>
                                    (in_range o5)
                                    (let ((o6 (* 100 o5)))
                                      (=>
                                        (in_range o6)
                                        (let ((o7 (+ (- 2147483648) o6)))
                                          (=>
                                            (in_range o7)
                                            (let ((o8 (length_2 a)))
                                              (=>
                                                (in_range o8)
                                                (let ((o9 (- (last a) 
                                                  i)))
                                                  (=>
                                                    (in_range o9)
                                                    (let ((o10 (* o9 o8)))
                                                      (=>
                                                        (in_range o10)
                                                        (let ((o11 (+ o10 
                                                          (last_2
                                                            a))))
                                                          (=>
                                                            (in_range o11)
                                                            (let ((o12 (- o11 
                                                              j)))
                                                              (=>
                                                                (in_range
                                                                  o12)
                                                                (let ((o13 (+ o12 1)))
                                                                  (=>
                                                                    (in_range
                                                                    o13)
                                                                    (let ((o14 (* 100 o13)))
                                                                    (=>
                                                                    (in_range
                                                                    o14)
                                                                    (let ((o15 (- 2147483647 o14)))
                                                                    (=>
                                                                    (in_range
                                                                    o15)
                                                                    (forall 
                                                                    ((test_higher_order__in_range__2__result Bool))
                                                                    (=>
                                                                    (= test_higher_order__in_range__2__result (and 
                                                                    (ite (<= 
                                                                    x o15)
                                                                    true
                                                                    false) 
                                                                    (ite (<= o7 
                                                                    x)
                                                                    true
                                                                    false)))
                                                                    (=>
                                                                    (= test_higher_order__in_range__2__result true)
                                                                    (<= (- 2147483548) 
                                                                    x)))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
