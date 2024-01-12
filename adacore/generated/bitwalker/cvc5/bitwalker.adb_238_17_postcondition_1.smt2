;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "lsr"
(declare-fun lsr ((_ BitVec 64)
  Int) (_ BitVec 64))

;; "lsl"
(declare-fun lsl ((_ BitVec 64)
  Int) (_ BitVec 64))

;; "pow2"
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one (pow2 (- 64 1))))

;; "lsr_bv_is_lsr"
(assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
    (= (bvlshr x n) (lsr x (bv2nat n)))))

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

;; "nth"
(define-fun nth ((param__x (_ BitVec 64)) (param__pos Int)) Bool
  (= (bvand (bvlshr param__x ((_ int2bv 64) param__pos)) #x0000000000000001) #x0000000000000001))

(declare-const x (_ BitVec 64))

(declare-const i Int)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

;; Goal "def'vc"
;; File "bitwalker.adb", line 236, characters 0-0
(assert
  (not
  (=>
    (in_range i)
    (=>
      (and (<= 0 i) (<= i 63))
      (= (bvlshr x ((_ int2bv 64) i)) (bvadd (bvshl (bvlshr x ((_ int2bv 64) (+ 
      i 1))) ((_ int2bv 64) 1)) (ite (= (nth x i) true)
                                  #x0000000000000001
                                  #x0000000000000000)))))))

(check-sat)
(get-info :reason-unknown)
