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

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

;; "extract_seq"
(declare-fun extract_seq ((_ BitVec 64)
  Int
  Int) (_ BitVec 64))

;; "extract_seq__function_guard"
(declare-fun extract_seq__function_guard ((_ BitVec 64)
  (_ BitVec 64)
  Int
  Int) Bool)

(declare-const x (_ BitVec 64))

(declare-const y (_ BitVec 64))

(declare-const i (_ BitVec 64))

(declare-const n (_ BitVec 64))

;; Goal "def'vc"
;; File "bvext.ads", line 32, characters 0-0
(assert
  (not
  (=>
    (and
      (and (bvule #x0000000000000000 i) (bvule i #x000000000000003F))
      (and
        (bvule #x0000000000000001 n)
        (bvule n (bvsub #x0000000000000040 i))))
    (let ((o (bv2nat n)))
      (=>
        (in_range o)
        (let ((o1 (bv2nat i)))
          (=>
            (in_range o1)
            (let ((o2 y))
              (let ((o3 (extract_seq o2 o1 o)))
                (=>
                  (and
                    (extract_seq__function_guard o3 o2 o1 o)
                    (= o3 (ite (< o o1)
                            #x0000000000000000
                            (bvand (bvlshr o2 ((_ int2bv 64) (- 64 (+ o1 o)))) (bvsub 
                            (ite (< o 18446744073709551616)
                              (bvshl #x0000000000000001 ((_ int2bv 64) o))
                              #x0000000000000000) #x0000000000000001)))))
                  (let ((o4 (bv2nat n)))
                    (=>
                      (in_range o4)
                      (let ((o5 (bv2nat i)))
                        (=> (in_range o5) (<= o4 (- 64 o5))))))))))))))))

(check-sat)
(get-info :reason-unknown)
