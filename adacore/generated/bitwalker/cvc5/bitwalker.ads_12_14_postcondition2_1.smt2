;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "lsr"
(declare-fun lsr ((_ BitVec 8)
  Int) (_ BitVec 8))

;; "lsl"
(declare-fun lsl ((_ BitVec 8)
  Int) (_ BitVec 8))

;; "pow2"
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one (pow2 (- 8 1))))

;; "lsr_bv_is_lsr"
(assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
    (= (bvlshr x n) (lsr x (bv2nat n)))))

;; "lsl_bv_is_lsl"
(assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
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
  (and (<= 0 x) (<= x 2147483647)))

(declare-const byte (_ BitVec 8))

(declare-const left Int)

;; "nth"
(define-fun nth ((param__x (_ BitVec 8)) (param__pos Int)) Bool
  (= (bvand (ite (< param__pos 8)
              (bvlshr param__x ((_ int2bv 8) param__pos))
              #x00) #x01) #x01))

(declare-const ret Bool)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

;; Goal "def'vc"
;; File "bitwalker.ads", line 9, characters 0-0
(assert
  (not
  (=>
    (in_range left)
    (=>
      (< left 8)
      (forall ((o (_ BitVec 8)))
        (=>
          (let ((o1 (- 7 left)))
            (and
              (in_range o1)
              (ite (< o1 8)
                (let ((o2 (- 7 left)))
                  (and (in_range o2) (= o (bvshl #x01 ((_ int2bv 8) o2)))))
                (= o #x00))))
          (=>
            (= (ite (not (= (bvand byte o) #x00)) true false) ret)
            (forall ((bitwalker__peekbit8__result Bool))
              (=>
                (= bitwalker__peekbit8__result ret)
                (=>
                  (= (nth byte (- 7 left)) true)
                  (= bitwalker__peekbit8__result true)))))))))))

(check-sat)
(get-info :reason-unknown)