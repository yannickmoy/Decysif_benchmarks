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

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 1000000)))

(declare-datatypes ((t 0))
  (((tqtmk (rec__first integer)(rec__last integer)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int integer))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int integer)
  (elts a))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep (rec__last (rt a))))

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

(declare-const y Int)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_181 us_t) (temp___is_init_177 Bool) (temp___skip_constant_178 Bool) (temp___do_toplevel_179 Bool) (temp___do_typ_inv_180 Bool)) Bool
  (=>
    (not (= temp___skip_constant_178 true))
    (dynamic_property
      1
      1000000
      (first temp___expr_181)
      (last temp___expr_181))))

;; Goal "def'vc"
;; File "lcp.ads", line 10, characters 0-0
(assert
  (not
  (forall ((l Int))
    (=>
      (dynamic_invariant a true false true true)
      (=>
        (in_range x)
        (=>
          (in_range y)
          (=>
            (and
              (and (<= (first a) x) (<= x (last a)))
              (and (<= (first a) y) (<= y (last a))))
            (=>
              (and (<= (first a) y) (<= y (last a)))
              (forall ((o Int))
                (=>
                  (= (to_rep (select (to_array a) y)) o)
                  (=>
                    (and (<= (first a) x) (<= x (last a)))
                    (forall ((o1 Int))
                      (=>
                        (= (to_rep (select (to_array a) x)) o1)
                        (=>
                          (in_range1 l)
                          (forall ((l1 Int))
                            (=>
                              (= l1 0)
                              (forall ((l2 Int))
                                (=>
                                  (exists ((o2 Bool))
                                    (and
                                      (exists ((o3 Bool))
                                        (and
                                          (let ((o4 (+ x l1)))
                                            (and
                                              (in_range o4)
                                              (ite (<= o4 (last a))
                                                (let ((o5 (+ y l1)))
                                                  (and
                                                    (in_range o5)
                                                    (= o3 (ite (<= o5 
                                                            (last
                                                              a))
                                                            true
                                                            false))))
                                                (= o3 false))))
                                          (ite (= o3 true)
                                            (let ((o4 (+ y l1)))
                                              (and
                                                (in_range o4)
                                                (and
                                                  (and
                                                    (<= (first a) o4)
                                                    (<= o4 (last a)))
                                                  (exists ((o5 Int))
                                                    (and
                                                      (= (to_rep
                                                           (select (to_array
                                                                    a) o4)) o5)
                                                      (let ((o6 (+ x l1)))
                                                        (and
                                                          (in_range o6)
                                                          (and
                                                            (and
                                                              (<= (first a) o6)
                                                              (<= o6 
                                                              (last a)))
                                                            (exists ((o7 Int))
                                                              (and
                                                                (= (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    a) o6)) o7)
                                                                (= o2 
                                                                (ite (= o7 o5)
                                                                  true
                                                                  false))))))))))))
                                            (= o2 false))))
                                      (ite (= o2 true)
                                        (exists ((l3 Int))
                                          (and
                                            (forall ((k Int))
                                              (=>
                                                (and
                                                  (<= 0 k)
                                                  (<= k (- l3 1)))
                                                (= (to_rep
                                                     (select (to_array a) (+ 
                                                     x k))) (to_rep
                                                              (select 
                                                              (to_array
                                                                a) (+ 
                                                              y k))))))
                                            (and
                                              (= (and (ite (in_range1 l3)
                                                        true
                                                        false) (ite (and
                                                                    (and
                                                                    (<= (+ 
                                                                    x l3) 
                                                                    (last
                                                                    a))
                                                                    (<= (+ 
                                                                    y l3) 
                                                                    (last
                                                                    a)))
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    a) (+ 
                                                                    x l3))) 
                                                                    (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    a) (+ 
                                                                    y l3)))))
                                                                 true
                                                                 false)) true)
                                              (let ((o3 (+ l3 1)))
                                                (and
                                                  (in_range o3)
                                                  (and
                                                    (= l2 o3)
                                                    (exists ((o4 Bool))
                                                      (and
                                                        (exists ((o5 Bool))
                                                          (and
                                                            (let ((o6 (+ 
                                                              x l2)))
                                                              (and
                                                                (in_range o6)
                                                                (ite (<= o6 
                                                                  (last
                                                                    a))
                                                                  (let ((o7 (+ 
                                                                    y l2)))
                                                                    (and
                                                                    (in_range
                                                                    o7)
                                                                    (= o5 
                                                                    (ite (<= o7 
                                                                    (last
                                                                    a))
                                                                    true
                                                                    false))))
                                                                  (= o5 false))))
                                                            (ite (= o5 true)
                                                              (let ((o6 (+ 
                                                                y l2)))
                                                                (and
                                                                  (in_range
                                                                    o6)
                                                                  (and
                                                                    (and
                                                                    (<= 
                                                                    (first
                                                                    a) o6)
                                                                    (<= o6 
                                                                    (last
                                                                    a)))
                                                                    (exists 
                                                                    ((o7 Int))
                                                                    (and
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    a) o6)) o7)
                                                                    (let ((o8 (+ 
                                                                    x l2)))
                                                                    (and
                                                                    (in_range
                                                                    o8)
                                                                    (and
                                                                    (and
                                                                    (<= 
                                                                    (first
                                                                    a) o8)
                                                                    (<= o8 
                                                                    (last
                                                                    a)))
                                                                    (exists 
                                                                    ((o9 Int))
                                                                    (and
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    a) o8)) o9)
                                                                    (= o4 
                                                                    (ite (= o9 o7)
                                                                    true
                                                                    false))))))))))))
                                                              (= o4 false))))
                                                        (not (= o4 true))))))))))
                                        (= l2 l1))))
                                  (forall ((lcp__result Int))
                                    (=>
                                      (= lcp__result l2)
                                      (=>
                                        (=> (not (= o1 o)) (= lcp__result 0))
                                        (=>
                                          (=>
                                            (= x y)
                                            (= lcp__result (+ (- (last a) 
                                            x) 1)))
                                          (=>
                                            (=>
                                              (not
                                                (= (or (ite (= o1 o)
                                                         false
                                                         true) (ite (= 
                                                                 x y)
                                                                 true
                                                                 false)) true))
                                              (< 0 lcp__result))
                                            (forall ((k Int))
                                              (=>
                                                (and
                                                  (<= 0 k)
                                                  (<= k (- lcp__result 1)))
                                                (= (to_rep
                                                     (select (to_array a) (+ 
                                                     x k))) (to_rep
                                                              (select 
                                                              (to_array
                                                                a) (+ 
                                                              y k)))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)