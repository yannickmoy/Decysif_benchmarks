;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "lsl"
(declare-fun lsl ((_ BitVec 64)
  Int) (_ BitVec 64))

;; "pow2"
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one (pow2 (- 64 1))))

;; "lsl_bv_is_lsl"
(assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
    (= (bvshl x n) (lsl x (bv2nat n)))))

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
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "maxvalue"
(declare-fun maxvalue (Int) (_ BitVec 64))

;; "maxvalue__function_guard"
(declare-fun maxvalue__function_guard ((_ BitVec 64)
  Int) Bool)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-const x (_ BitVec 64))

(declare-const len Int)

;; "cases64"
(define-fun cases64 ((param__i Int)) Bool
  (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (= param__i 0) (= param__i 1)) (= param__i 2)) (= param__i 3)) (= param__i 4)) (= param__i 5)) (= param__i 6)) (= param__i 7)) (= param__i 8)) (= param__i 9)) (= param__i 10)) (= param__i 11)) (= param__i 12)) (= param__i 13)) (= param__i 14)) (= param__i 15)) (= param__i 16)) (= param__i 17)) (= param__i 18)) (= param__i 19)) (= param__i 20)) (= param__i 21)) (= param__i 22)) (= param__i 23)) (= param__i 24)) (= param__i 25)) (= param__i 26)) (= param__i 27)) (= param__i 28)) (= param__i 29)) (= param__i 30)) (= param__i 31)) (= param__i 32)) (= param__i 33)) (= param__i 34)) (= param__i 35)) (= param__i 36)) (= param__i 37)) (= param__i 38)) (= param__i 39)) (= param__i 40)) (= param__i 41)) (= param__i 42)) (= param__i 43)) (= param__i 44)) (= param__i 45)) (= param__i 46)) (= param__i 47)) (= param__i 48)) (= param__i 49)) (= param__i 50)) (= param__i 51)) (= param__i 52)) (= param__i 53)) (= param__i 54)) (= param__i 55)) (= param__i 56)) (= param__i 57)) (= param__i 58)) (= param__i 59)) (= param__i 60)) (= param__i 61)) (= param__i 62)) (= param__i 63)))

;; "maxvalue__post_axiom"
(assert true)

;; "maxvalue__def_axiom"
(assert
  (forall ((param__len Int))
    (! (= (maxvalue param__len) (bvshl #x0000000000000001 ((_ int2bv 64) param__len))) :pattern (
    (maxvalue
      param__len)) )))

;; Goal "def'vc"
;; File "bitwalker.ads", line 125, characters 0-0
(assert
  (not
  (=>
    (in_range len)
    (=>
      (forall ((temp___475 Int))
        (maxvalue__function_guard (maxvalue temp___475) temp___475))
      (=>
        (and
          (and (<= 0 len) (<= len 63))
          (bvult x (let ((temp___475 len)) (maxvalue temp___475))))
        (= (cases64 len) true))))))

(check-sat)
(get-info :reason-unknown)
