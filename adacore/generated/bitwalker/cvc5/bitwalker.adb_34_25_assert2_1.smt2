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
  (and (<= 0 x) (<= x 2147483647)))

(declare-const value (_ BitVec 64))

(declare-const left Int)

(declare-const flag Bool)

(declare-const left_bv (_ BitVec 64))

(declare-const mask (_ BitVec 64))

(declare-const r (_ BitVec 64))

;; "nth_bv"
(define-fun nth_bv ((param__x (_ BitVec 64)) (param__pos (_ BitVec 64))) Bool
  (= (bvand (bvlshr param__x ((_ int2bv 64) (bv2nat param__pos))) #x0000000000000001) #x0000000000000001))

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

;; Goal "def'vc"
;; File "bitwalker.ads", line 22, characters 0-0
(assert
  (not
  (=>
    (in_range left)
    (=>
      (< left 64)
      (=>
        (= ((_ int2bv 64) left) left_bv)
        (=>
          (bvult left_bv #x0000000000000040)
          (=>
            (= (bvsub #x000000000000003F left_bv) ((_ int2bv 64) (- 63 
            left)))
            (let ((o (- 63 left)))
              (=>
                (in_range o)
                (=>
                  (= (bvshl #x0000000000000001 ((_ int2bv 64) o)) mask)
                  (forall ((bitwalker__pokebit64__B_1__r__assume (_ BitVec 64)))
                    (=>
                      (ite (= flag true)
                        (= bitwalker__pokebit64__B_1__r__assume (bvor 
                        value mask))
                        (= bitwalker__pokebit64__B_1__r__assume (bvand 
                        value (bvnot mask))))
                      (=>
                        (= bitwalker__pokebit64__B_1__r__assume r)
                        (forall ((i (_ BitVec 64)))
                          (=>
                            (and
                              (bvule #x0000000000000000 i)
                              (bvule i #x000000000000003F))
                            (=>
                              (not (= i (bvsub #x000000000000003F left_bv)))
                              (=>
                                (= (nth_bv value i) true)
                                (= (nth_bv r i) true))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
