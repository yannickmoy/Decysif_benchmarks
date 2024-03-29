;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "pow2"
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one (pow2 (- 32 1))))

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

(declare-const two_power_size_minus_one1 Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one1 (pow2 (- 8 1))))

(declare-const two_power_size_minus_one2 Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one2 (pow2 (- 16 1))))

(declare-const two_power_size_minus_one3 Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one3 (pow2 (- 64 1))))

(declare-const x (_ BitVec 32))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_172 Float32) (temp___is_init_168 Bool) (temp___skip_constant_169 Bool) (temp___do_toplevel_170 Bool) (temp___do_typ_inv_171 Bool)) Bool
  (=>
    (or
      (= temp___is_init_168 true)
      (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
    (fp.isFinite32 temp___expr_172)))

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

;; "in_range"
(define-fun in_range ((x1 (_ BitVec 32))) Bool
  (and (bvule #x00000000 x1) (bvule x1 #x000F4240)))

;; Goal "def'vc"
;; File "wibble.adb", line 31, characters 0-0
(assert
  (not
  (forall ((state Float32))
    (=>
      (dynamic_invariant state true false true true)
      (=>
        (in_range x)
        (=>
          (and
            (bvult x #x000F4240)
            (fp.leq state (fp.mul RNE ((_ to_fp_unsigned 8 24) RNE x) (fp #b0 #b10000010 #b01000000000000000000000))))
          (let ((o (fp.add RNE state (fp #b0 #b10000010 #b01000000000000000000000))))
            (=>
              (fp.isFinite32 o)
              (forall ((state1 Float32))
                (=>
                  (= state1 o)
                  (fp.leq state1 (fp.mul RNE ((_ to_fp_unsigned 8 24) RNE (bvadd 
                  x #x00000001)) (fp #b0 #b10000010 #b01000000000000000000000)))))))))))))

(check-sat)
(get-info :reason-unknown)
