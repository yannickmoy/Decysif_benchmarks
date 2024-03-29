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

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

(declare-const val__ Int)

(declare-const flatness Int)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= (- 100) x) (<= x 100)))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 100)))

;; Goal "def'vc"
;; File "scale.adb", line 11, characters 0-0
(assert
  (not
  (forall ((calc Int) (ans Int))
    (=>
      (in_range1 val__)
      (=>
        (in_range flatness)
        (=>
          (and (and (<= 0 val__) (< 0 flatness)) (<= flatness 100))
          (=>
            (in_range calc)
            (=>
              (in_range2 ans)
              (let ((o (+ flatness val__)))
                (=>
                  (in_range o)
                  (let ((o1 (* 100 flatness)))
                    (=>
                      (in_range o1)
                      (let ((o2 (__cdiv o1 o)))
                        (=>
                          (in_range o2)
                          (forall ((calc1 Int))
                            (=> (= calc1 o2) (<= calc1 100)))))))))))))))))

(check-sat)
(get-info :reason-unknown)
