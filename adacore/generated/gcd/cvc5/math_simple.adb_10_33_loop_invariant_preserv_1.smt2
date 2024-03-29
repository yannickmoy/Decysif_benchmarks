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

;; "divides"
(define-fun divides ((param__a Int) (param__b Int)) Bool
  (= (mod1 param__b param__a) 0))

(declare-const a Int)

(declare-const b Int)

;; Goal "def'vc"
;; File "math_simple.ads", line 5, characters 0-0
(assert
  (not
  (=>
    (in_range a)
    (=>
      (in_range b)
      (let ((o (min a b)))
        (=>
          (in_range o)
          (forall ((c Int))
            (=>
              (= c o)
              (=>
                (in_range c)
                (=>
                  (< 1 c)
                  (=>
                    (not
                      (= (and (ite (= (mod1 a c) 0) true false) (ite (= 
                                                                  (mod1
                                                                    b
                                                                    c) 0)
                                                                  true
                                                                  false)) true))
                    (forall ((c1 Int))
                      (=>
                        (and
                          (< 1 c1)
                          (forall ((x Int))
                            (=>
                              (and (<= c1 x) (<= x (min a b)))
                              (not
                                (and
                                  (= (divides x a) true)
                                  (= (divides x b) true))))))
                        (=>
                          (in_range c1)
                          (let ((o1 (- c1 1)))
                            (=>
                              (in_range o1)
                              (forall ((c2 Int))
                                (=>
                                  (= c2 o1)
                                  (=>
                                    (< 1 c2)
                                    (=>
                                      (not
                                        (= (and (ite (= (mod1 a c2) 0)
                                                  true
                                                  false) (ite (= (mod1 b c2) 0)
                                                           true
                                                           false)) true))
                                      (=>
                                        (< c2 c1)
                                        (=>
                                          (< 1 c2)
                                          (forall ((x Int))
                                            (=>
                                              (and
                                                (<= c2 x)
                                                (<= x (min a b)))
                                              (not
                                                (and
                                                  (= (divides x a) true)
                                                  (= (divides x b) true)))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
