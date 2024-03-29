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
  (and (<= 1 x) (<= x 2147483647)))

;; "divides"
(define-fun divides ((param__a Int) (param__b Int)) Bool
  (ite (exists ((c Int))
         (and (and (<= 1 c) (<= c 2147483647)) (= (* param__a c) param__b)))
    true
    false))

(declare-const arg1 Int)

(declare-const arg2 Int)

;; Goal "def'vc"
;; File "math_simple_abstract.adb", line 26, characters 0-0
(assert
  (not
  (=>
    (in_range arg1)
    (=>
      (in_range arg2)
      (=> (= (mod1 arg1 arg2) 0) (= (divides arg2 arg1) true))))))

(check-sat)
(get-info :reason-unknown)
