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

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "divides"
(define-fun divides ((param__a Int) (param__b Int)) Bool
  (= (mod1 param__b param__a) 0))

(declare-const a Int)

(declare-const b Int)

(declare-const r4b Int)

;; Goal "def'vc"
;; File "math_simple_half.ads", line 5, characters 0-0
(assert
  (not
  (=>
    (in_range a)
    (=>
      (in_range b)
      (forall ((math_simple_half__gcd__result Int))
        (=>
          (let ((o (min a b)))
            (and
              (in_range o)
              (exists ((c Int))
                (and
                  (= c o)
                  (and
                    (in_range c)
                    (exists ((spark__branch Bool))
                      (and
                        (= spark__branch (and (ite (= (mod1 a c) 0)
                                                true
                                                false) (ite (= (mod1 b c) 0)
                                                         true
                                                         false)))
                        (ite (= spark__branch true)
                          (= math_simple_half__gcd__result c)
                          (let ((o1 (__cdiv c 2)))
                            (and
                              (in_range o1)
                              (exists ((c1 Int))
                                (and
                                  (= c1 o1)
                                  (and
                                    (= (+ c1 1) r4b)
                                    (and
                                      (in_range1 r4b)
                                      (and
                                        (let ((temp___171 r4b))
                                          (let ((temp___172 (- (min a b) 1)))
                                            (exists ((j Int))
                                              (and
                                                (= j temp___171)
                                                (=>
                                                  (= (and (ite (<= temp___171 j)
                                                            true
                                                            false) (ite (<= j temp___172)
                                                                    true
                                                                    false)) true)
                                                  (and
                                                    (in_range j)
                                                    (and
                                                      (not
                                                        (= (divides
                                                             j
                                                             (min a b)) true))
                                                      (exists ((j1 Int))
                                                        (and
                                                          (forall ((x Int))
                                                            (=>
                                                              (and
                                                                (<= (+ c1 1) x)
                                                                (<= x j1))
                                                              (not
                                                                (= (divides
                                                                    x
                                                                    (min a b)) true))))
                                                          (and
                                                            (and
                                                              (<= r4b j1)
                                                              (<= j1 (- 
                                                              (min
                                                                a
                                                                b) 1)))
                                                            (= j1 temp___172)))))))))))
                                        (exists ((c2 Int))
                                          (and
                                            (ite (< 1 c1)
                                              (ite (= (and (ite (= (mod1
                                                                    a
                                                                    c1) 0)
                                                             true
                                                             false) (ite (= 
                                                                    (mod1
                                                                    b
                                                                    c1) 0)
                                                                    true
                                                                    false)) true)
                                                (= c2 c1)
                                                (exists ((c3 Int))
                                                  (and
                                                    (and
                                                      (< 1 c3)
                                                      (forall ((x Int))
                                                        (=>
                                                          (and
                                                            (<= c3 x)
                                                            (<= x (min a b)))
                                                          (not
                                                            (and
                                                              (= (divides
                                                                   x
                                                                   a) true)
                                                              (= (divides
                                                                   x
                                                                   b) true))))))
                                                    (and
                                                      (in_range c3)
                                                      (let ((o2 (- c3 1)))
                                                        (and
                                                          (in_range o2)
                                                          (and
                                                            (= c2 o2)
                                                            (=>
                                                              (< 1 c2)
                                                              (= (and 
                                                              (ite (= 
                                                                (mod1
                                                                  a
                                                                  c2) 0)
                                                                true
                                                                false) 
                                                              (ite (= 
                                                                (mod1
                                                                  b
                                                                  c2) 0)
                                                                true
                                                                false)) true)))))))))
                                              (= c2 c1))
                                            (= math_simple_half__gcd__result c2))))))))))))))))))
          (= (divides math_simple_half__gcd__result a) true)))))))

(check-sat)
(get-info :reason-unknown)