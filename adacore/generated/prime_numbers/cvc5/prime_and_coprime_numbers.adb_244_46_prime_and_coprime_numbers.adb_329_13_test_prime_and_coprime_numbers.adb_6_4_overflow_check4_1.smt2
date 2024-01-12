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
                                (forall ((is_prime4 (Array Int Bool)) (index_11 Int) (index_31 Int) (index_21 Int) (s Int) (d Int) (r Int) (dd Int) (ds Int))
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
                                                          (forall ((spark__branch1 Bool) (s1 Int) (d1 Int) (r1 Int) (dd1 Int) (ds1 Int))
                                                            (=>
                                                              (and
                                                                (= spark__branch1 
                                                                (ite (= 
                                                                  (mod1
                                                                    v
                                                                    c169b) 0)
                                                                  true
                                                                  false))
                                                                (ite (= spark__branch1 true)
                                                                  (let ((o2 
                                                                    c169b))
                                                                    (let ((o3 
                                                                    (smallest_divisor
                                                                    o2)))
                                                                    (and
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
                                                                    (and
                                                                    (= s1 o3)
                                                                    (and
                                                                    (in_range1
                                                                    s1)
                                                                    (let ((o4 (__cdiv v s1)))
                                                                    (and
                                                                    (in_range1
                                                                    o4)
                                                                    (and
                                                                    (= d1 o4)
                                                                    (and
                                                                    (in_range1
                                                                    d1)
                                                                    (let ((o5 
                                                                    (mod1
                                                                    v
                                                                    s1)))
                                                                    (and
                                                                    (in_range1
                                                                    o5)
                                                                    (and
                                                                    (= r1 o5)
                                                                    (and
                                                                    (in_range1
                                                                    r1)
                                                                    (let ((o6 (__cdiv v 
                                                                    c169b)))
                                                                    (and
                                                                    (in_range1
                                                                    o6)
                                                                    (and
                                                                    (= dd1 o6)
                                                                    (and
                                                                    (in_range1
                                                                    dd1)
                                                                    (let ((o7 (__cdiv 
                                                                    c169b s1)))
                                                                    (and
                                                                    (in_range1
                                                                    o7)
                                                                    (and
                                                                    (= ds1 o7)
                                                                    (and
                                                                    (in_range1
                                                                    ds1)
                                                                    (and
                                                                    (= v (+ (* d1 s1) r1))
                                                                    (and
                                                                    (= v (* dd1 
                                                                    c169b))
                                                                    (and
                                                                    (= 
                                                                    c169b (* s1 ds1))
                                                                    (and
                                                                    (= r1 (* s1 (- (* dd1 ds1) d1)))
                                                                    (and
                                                                    (< r1 s1)
                                                                    (= r1 0)))))))))))))))))))))))))))
                                                                  (and
                                                                    (and
                                                                    (and
                                                                    (and
                                                                    (= s1 s)
                                                                    (= d1 d))
                                                                    (= r1 r))
                                                                    (= dd1 dd))
                                                                    (= ds1 ds))))
                                                              (=>
                                                                (smallest_divisor__function_guard
                                                                  (smallest_divisor
                                                                    c169b)
                                                                  c169b)
                                                                (=>
                                                                  (=>
                                                                    (= 
                                                                    (mod1
                                                                    v
                                                                    c169b) 0)
                                                                    (= 
                                                                    (mod1
                                                                    v
                                                                    (smallest_divisor
                                                                    c169b)) 0))
                                                                  (=>
                                                                    (in_range
                                                                    (+ 
                                                                    c169b 1))
                                                                    (forall 
                                                                    ((v1 Int))
                                                                    (=>
                                                                    (smallest_divisor__function_guard
                                                                    (smallest_divisor
                                                                    c169b)
                                                                    c169b)
                                                                    (=>
                                                                    (forall 
                                                                    ((w Int))
                                                                    (=>
                                                                    (and
                                                                    (<= (+ 
                                                                    c169b 1) w)
                                                                    (<= w v1))
                                                                    (=>
                                                                    (= 
                                                                    (mod1
                                                                    w
                                                                    c169b) 0)
                                                                    (= 
                                                                    (mod1
                                                                    w
                                                                    (smallest_divisor
                                                                    c169b)) 0))))
                                                                    (=>
                                                                    (and
                                                                    (<= (+ 
                                                                    c169b 1) v1)
                                                                    (<= v1 100000))
                                                                    (=>
                                                                    (not
                                                                    (= v1 100000))
                                                                    (forall 
                                                                    ((v2 Int))
                                                                    (=>
                                                                    (= v2 (+ v1 1))
                                                                    (forall 
                                                                    ((spark__branch2 Bool))
                                                                    (=>
                                                                    (= spark__branch2 
                                                                    (ite (= 
                                                                    (mod1
                                                                    v2
                                                                    c169b) 0)
                                                                    true
                                                                    false))
                                                                    (=>
                                                                    (= spark__branch2 true)
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
                                                                    ((s2 Int))
                                                                    (=>
                                                                    (= s2 o3)
                                                                    (=>
                                                                    (in_range1
                                                                    s2)
                                                                    (let ((o4 (__cdiv v2 s2)))
                                                                    (=>
                                                                    (in_range1
                                                                    o4)
                                                                    (forall 
                                                                    ((d2 Int))
                                                                    (=>
                                                                    (= d2 o4)
                                                                    (=>
                                                                    (in_range1
                                                                    d2)
                                                                    (let ((o5 
                                                                    (mod1
                                                                    v2
                                                                    s2)))
                                                                    (=>
                                                                    (in_range1
                                                                    o5)
                                                                    (forall 
                                                                    ((r2 Int))
                                                                    (=>
                                                                    (= r2 o5)
                                                                    (=>
                                                                    (in_range1
                                                                    r2)
                                                                    (let ((o6 (__cdiv v2 
                                                                    c169b)))
                                                                    (=>
                                                                    (in_range1
                                                                    o6)
                                                                    (forall 
                                                                    ((dd2 Int))
                                                                    (=>
                                                                    (= dd2 o6)
                                                                    (=>
                                                                    (in_range1
                                                                    dd2)
                                                                    (let ((o7 (__cdiv 
                                                                    c169b s2)))
                                                                    (=>
                                                                    (in_range1
                                                                    o7)
                                                                    (forall 
                                                                    ((ds2 Int))
                                                                    (=>
                                                                    (= ds2 o7)
                                                                    (=>
                                                                    (in_range1
                                                                    ds2)
                                                                    (=>
                                                                    (= v2 (+ (* d2 s2) r2))
                                                                    (=>
                                                                    (= v2 (* dd2 
                                                                    c169b))
                                                                    (=>
                                                                    (= 
                                                                    c169b (* s2 ds2))
                                                                    (<= (* dd2 ds2) 2147483647)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
