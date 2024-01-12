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
  (and (<= 0 x) (<= x 2147483647)))

;; "min"
(define-fun min ((x Int) (y Int)) Int
  (ite (<= x y) x y))

;; "max"
(define-fun max ((x Int) (y Int)) Int
  (ite (<= x y) y x))

;; "Min_r"
(assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; "Max_l"
(assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; "Min_comm"
(assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; "Max_comm"
(assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; "Min_assoc"
(assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; "Max_assoc"
(assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

;; "are_coprime"
(define-fun are_coprime ((param__v1 Int) (param__v2 Int)) Bool
  (and (and (> param__v1 0) (> param__v2 0)) (ite (forall ((v Int))
                                                    (=>
                                                      (and
                                                        (<= 2 v)
                                                        (<= v (min
                                                                param__v1
                                                                param__v2)))
                                                      (not
                                                        (and
                                                          (= (mod1
                                                               param__v1
                                                               v) 0)
                                                          (= (mod1
                                                               param__v2
                                                               v) 0)))))
                                               true
                                               false)))

(declare-const left Int)

(declare-const right Int)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; Goal "def'vc"
;; File "prime_and_coprime_numbers.adb", line 29, characters 0-0
(assert
  (not
  (forall ((a Int) (b Int) (r Int))
    (=>
      (in_range left)
      (=>
        (in_range right)
        (=>
          (and (<= 2 left) (<= 0 right))
          (let ((o right))
            (let ((o1 left))
              (let ((temp___278 (are_coprime o1 o)))
                (=>
                  (=
                    (= temp___278 true)
                    (and
                      (and (< 0 o1) (< 0 o))
                      (forall ((v Int))
                        (=>
                          (and (<= 2 v) (<= v (min o1 o)))
                          (not (and (= (mod1 o1 v) 0) (= (mod1 o v) 0)))))))
                  (forall ((test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result Int))
                    (=>
                      (and
                        (in_range1 a)
                        (and
                          (in_range2 b)
                          (and
                            (in_range3 r)
                            (exists ((spark__branch Bool))
                              (and
                                (= spark__branch (ite (= left 0) true false))
                                (ite (= spark__branch true)
                                  (= test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result 
                                  right)
                                  (exists ((spark__branch1 Bool))
                                    (and
                                      (= spark__branch1 (ite (= right 0)
                                                          true
                                                          false))
                                      (ite (= spark__branch1 true)
                                        (= test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result 
                                        left)
                                        (let ((o2 left))
                                          (and
                                            (in_range1 o2)
                                            (exists ((a1 Int))
                                              (and
                                                (= a1 o2)
                                                (let ((o3 right))
                                                  (and
                                                    (in_range2 o3)
                                                    (exists ((b1 Int))
                                                      (and
                                                        (= b1 o3)
                                                        (exists ((a2 Int) (b2 Int))
                                                          (and
                                                            (exists ((a3 Int) (b3 Int) (r1 Int))
                                                              (and
                                                                (and
                                                                  (and
                                                                    (< 0 a3)
                                                                    (< 0 b3))
                                                                  (and
                                                                    (not
                                                                    (and
                                                                    (= a3 1)
                                                                    (= b3 1)))
                                                                    (=
                                                                    (= 
                                                                    (are_coprime
                                                                    a3
                                                                    b3) true)
                                                                    (= 
                                                                    (are_coprime
                                                                    left
                                                                    right) true))))
                                                                (and
                                                                  (and
                                                                    (and
                                                                    (in_range1
                                                                    a3)
                                                                    (in_range2
                                                                    b3))
                                                                    (in_range3
                                                                    r1))
                                                                  (exists 
                                                                    ((r2 Int))
                                                                    (and
                                                                    (= r2 
                                                                    (mod1
                                                                    a3
                                                                    b3))
                                                                    (and
                                                                    (= r2 0)
                                                                    (and
                                                                    (= a2 a3)
                                                                    (= b2 b3))))))))
                                                            (and
                                                              (not
                                                                (and
                                                                  (= a2 1)
                                                                  (< 0 b2)))
                                                              (= test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result b2)))))))))))))))))))))
                      (=>
                        (= temp___278 true)
                        (= test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result 1))))))))))))))

(check-sat)
(get-info :reason-unknown)