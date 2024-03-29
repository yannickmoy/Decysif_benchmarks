;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(define-fun __cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))
(define-fun __cmod ((x Int) (y Int)) Int (ite (>= x 0) (mod x y) (- (mod (- x) y))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "mod"
(define-fun mod1 ((x Int) (y Int)) Int
  (ite (<= 0 y) (mod x y) (- (mod (- x) y))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "is_prime"
(define-fun is_prime ((param__value Int)) Bool
  (and (>= param__value 2) (ite (forall ((v Int))
                                  (=>
                                    (and (<= 2 v) (<= v (- param__value 1)))
                                    (not (= (mod1 param__value v) 0))))
                             true
                             false)))

;; "smallest_divisor"
(declare-fun smallest_divisor (Int) Int)

;; "smallest_divisor__function_guard"
(declare-fun smallest_divisor__function_guard (Int
  Int) Bool)

(declare-const c169b Int)

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

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

;; "temp_____aggregate_def_293"
(declare-fun temp_____aggregate_def_293 (Bool) (Array Int Bool))

;; Goal "def'vc"
;; File "prime_and_coprime_numbers.adb", line 201, characters 0-0
(assert
  (not
  (forall ((index_1 Int) (index_3 Int))
    (=>
      (in_range1 index_1)
      (=>
        (in_range index_3)
        (let ((o (distinct 1 0)))
          (forall ((temp___297 (Array Int Bool)))
            (=>
              (and
                (forall ((temp___296 Int))
                  (! (=>
                       (and (<= 0 temp___296) (<= temp___296 100000))
                       (= (select temp___297 temp___296) o)) :pattern ((select temp___297 temp___296)) ))
                (= temp___297 (temp_____aggregate_def_293 o)))
              (forall ((is_prime1 (Array Int Bool)))
                (=>
                  (= is_prime1 temp___297)
                  (forall ((is_prime2 (Array Int Bool)))
                    (=>
                      (= is_prime2 (store is_prime1 0 (distinct 0 0)))
                      (forall ((is_prime3 (Array Int Bool)))
                        (=>
                          (= is_prime3 (store is_prime2 1 (distinct 0 0)))
                          (forall ((index_2 Int))
                            (=>
                              (= index_2 2)
                              (=>
                                (= (and (ite (<= 2 index_2) true false) 
                                (ite (<= index_2 100000)
                                  true
                                  false)) true)
                                (forall ((is_prime4 (Array Int Bool)) (index_11 Int) (index_31 Int) (index_21 Int))
                                  (=>
                                    (and
                                      (forall ((v Int))
                                        (=>
                                          (and
                                            (<= 0 v)
                                            (<= v (- index_21 1)))
                                          (=
                                            (= (select is_prime4 v) true)
                                            (= (is_prime v) true))))
                                      (forall ((v Int))
                                        (=>
                                          (and (<= index_21 v) (<= v 100000))
                                          (=
                                            (= (select is_prime4 v) true)
                                            (forall ((div1 Int))
                                              (=>
                                                (and
                                                  (<= 2 div1)
                                                  (<= div1 (- index_21 1)))
                                                (not (= (mod1 v div1) 0))))))))
                                    (=>
                                      (= (and (ite (and
                                                     (in_range1 index_11)
                                                     (in_range index_31))
                                                true
                                                false) (ite (and
                                                              (<= 2 index_21)
                                                              (<= index_21 100000))
                                                         true
                                                         false)) true)
                                      (forall ((spark__branch Bool))
                                        (=>
                                          (= spark__branch (select is_prime4 index_21))
                                          (=>
                                            (not (= spark__branch true))
                                            (=>
                                              (= index_21 c169b)
                                              (=>
                                                (in_range1 c169b)
                                                (let ((o1 (+ c169b 1)))
                                                  (=>
                                                    (in_range o1)
                                                    (forall ((v Int))
                                                      (=>
                                                        (= v o1)
                                                        (=>
                                                          (= (and (ite (<= o1 v)
                                                                    true
                                                                    false) 
                                                          (ite (<= v 100000)
                                                            true
                                                            false)) true)
                                                          (forall ((spark__branch1 Bool))
                                                            (=>
                                                              (= spark__branch1 
                                                              (ite (= 
                                                                (mod1
                                                                  v
                                                                  c169b) 0)
                                                                true
                                                                false))
                                                              (=>
                                                                (= spark__branch1 true)
                                                                (let ((o2 
                                                                  c169b))
                                                                  (let ((o3 
                                                                    (smallest_divisor
                                                                    o2)))
                                                                    (=>
                                                                    (and
                                                                    (smallest_divisor__function_guard
                                                                    o3
                                                                    o2)
                                                                    (and
                                                                    (in_range1
                                                                    o3)
                                                                    (and
                                                                    (and
                                                                    (<= 2 o3)
                                                                    (<= o3 (- o2 1)))
                                                                    (= o2 (* o3 (__cdiv o2 o3))))))
                                                                    (forall 
                                                                    ((s Int))
                                                                    (=>
                                                                    (= s o3)
                                                                    (=>
                                                                    (in_range1
                                                                    s)
                                                                    (let ((o4 (__cdiv v s)))
                                                                    (=>
                                                                    (in_range1
                                                                    o4)
                                                                    (forall 
                                                                    ((d Int))
                                                                    (=>
                                                                    (= d o4)
                                                                    (=>
                                                                    (in_range1
                                                                    d)
                                                                    (let ((o5 
                                                                    (mod1
                                                                    v
                                                                    s)))
                                                                    (=>
                                                                    (in_range1
                                                                    o5)
                                                                    (forall 
                                                                    ((r Int))
                                                                    (=>
                                                                    (= r o5)
                                                                    (=>
                                                                    (in_range1
                                                                    r)
                                                                    (let ((o6 (__cdiv v 
                                                                    c169b)))
                                                                    (=>
                                                                    (in_range1
                                                                    o6)
                                                                    (forall 
                                                                    ((dd Int))
                                                                    (=>
                                                                    (= dd o6)
                                                                    (=>
                                                                    (in_range1
                                                                    dd)
                                                                    (let ((o7 (__cdiv 
                                                                    c169b s)))
                                                                    (=>
                                                                    (in_range1
                                                                    o7)
                                                                    (forall 
                                                                    ((ds Int))
                                                                    (=>
                                                                    (= ds o7)
                                                                    (=>
                                                                    (in_range1
                                                                    ds)
                                                                    (=>
                                                                    (= v (+ (* d s) r))
                                                                    (=>
                                                                    (= v (* dd 
                                                                    c169b))
                                                                    (=>
                                                                    (= 
                                                                    c169b (* s ds))
                                                                    (=>
                                                                    (= r (* s (- (* dd ds) d)))
                                                                    (=>
                                                                    (< r s)
                                                                    (= r 0)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
