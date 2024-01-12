;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun __cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))
(define-fun __cmod ((x Int) (y Int)) Int (ite (>= x 0) (mod x y) (- (mod (- x) y))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

(declare-const num Int)

(declare-const denom1 Int)

(declare-const denom2 Int)

;; "pos_div_relation"
(define-fun pos_div_relation ((res Int) (num1 Int) (den Int)) Bool
  (let ((exact (div num1 den)))
    (ite (= num1 0)
      (= res 0)
      (ite (= num1 (* exact den))
        (= res exact)
        (and (<= exact res) (<= res (+ exact 1)))))))

;; "fxp_div_int"
(declare-fun fxp_div_int (Int
  Int) Int)

;; "fxp_div_int_def"
(assert
  (forall ((x Int))
    (forall ((y Int))
      (! (ite (= x 0)
           (= (fxp_div_int x y) 0)
           (ite (and (< 0 x) (< 0 y))
             (pos_div_relation (fxp_div_int x y) x y)
             (ite (and (< x 0) (< y 0))
               (pos_div_relation (fxp_div_int x y) (- x) (- y))
               (ite (and (< x 0) (< 0 y))
                 (pos_div_relation (- (fxp_div_int x y)) (- x) y)
                 (=>
                   (and (< 0 x) (< y 0))
                   (pos_div_relation (- (fxp_div_int x y)) x (- y))))))) :pattern (
      (fxp_div_int
        x
        y)) ))))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_172 Int) (temp___is_init_168 Bool) (temp___skip_constant_169 Bool) (temp___do_toplevel_170 Bool) (temp___do_typ_inv_171 Bool)) Bool
  (=>
    (or (= temp___is_init_168 true) (<= (- 2147483648) 2147483647))
    (in_range1 temp___expr_172)))

;; "Assume"
(assert (dynamic_invariant num true false true true))

;; "Assume"
(assert (in_range denom1))

;; "Assume"
(assert (in_range denom2))

;; "Assume"
(assert (and (<= 0 num) (<= denom1 denom2)))

;; "o"
(define-fun o () Int
  denom2)

;; "o"
(define-fun o1 () Int
  denom1)

;; "o"
(define-fun o2 () Int
  num)

;; "H"
(assert (<= (fxp_div_int o2 o) (fxp_div_int o2 o1)))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert true)

;; "o"
(define-fun o3 () Int
  denom2)

;; "o"
(define-fun o4 () Int
  (fxp_div_int num o3))

;; "fxp_div_int_'result'unused"
(define-fun fxp_div_int_qtresultqtunused () Int
  o4)

;; Goal "def'vc"
;; File "test_fixed_points.ads", line 20, characters 0-0
(assert
  (not (<= (- 2147483648) o4)))

(check-sat)
