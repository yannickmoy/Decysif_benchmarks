;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite64 ((x Float64)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral64 ((x Float64)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "pow2"
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one (pow2 (- 16 1))))

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
(assert (= two_power_size_minus_one2 (pow2 (- 32 1))))

(declare-const two_power_size_minus_one3 Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one3 (pow2 (- 64 1))))

(declare-const bound Float64)

;; "low_bound"
(define-fun low_bound ((param__n Int)) Float64
  (fp.mul RNE ((_ to_fp 11 53) RNE (to_real param__n)) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_177 Float64) (temp___is_init_173 Bool) (temp___skip_constant_174 Bool) (temp___do_toplevel_175 Bool) (temp___do_typ_inv_176 Bool)) Bool
  (=>
    (or
      (= temp___is_init_173 true)
      (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
    (fp.isFinite64 temp___expr_177)))

;; "high_bound"
(define-fun high_bound ((param__n Int)) Float64
  (fp.mul RNE ((_ to_fp 11 53) RNE (to_real param__n)) bound))

;; "invariant__"
(declare-fun invariant__ (Int
  Float64
  Float64) Bool)

(declare-const n Int)

(declare-const factor Float64)

(declare-const drag Float64)

(declare-const old_speed Float64)

(declare-const delta_speed Float64)

(declare-const n_bv (_ BitVec 16))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 0 x) (<= x 25000)))

;; "in_range"
(define-fun in_range1 ((x Float64)) Bool
  (and
    (fp.isFinite64 x)
    (and
      (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) x)
      (fp.leq x (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)))))

;; "dynamic_invariant"
(define-fun dynamic_invariant1 ((temp___expr_191 Float64) (temp___is_init_187 Bool) (temp___skip_constant_188 Bool) (temp___do_toplevel_189 Bool) (temp___do_typ_inv_190 Bool)) Bool
  (=>
    (or
      (= temp___is_init_187 true)
      (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)))
    (in_range1 temp___expr_191)))

;; "in_range"
(define-fun in_range2 ((x Float64)) Bool
  (and
    (fp.isFinite64 x)
    (and
      (fp.leq (fp.neg (fp #b0 #b10000000101 #b0000000000000000000000000000000000000000000000000000)) x)
      (fp.leq x (fp #b0 #b10000000101 #b0000000000000000000000000000000000000000000000000000)))))

;; "dynamic_invariant"
(define-fun dynamic_invariant2 ((temp___expr_198 Float64) (temp___is_init_194 Bool) (temp___skip_constant_195 Bool) (temp___do_toplevel_196 Bool) (temp___do_typ_inv_197 Bool)) Bool
  (=>
    (or
      (= temp___is_init_194 true)
      (fp.leq (fp.neg (fp #b0 #b10000000101 #b0000000000000000000000000000000000000000000000000000)) (fp #b0 #b10000000101 #b0000000000000000000000000000000000000000000000000000)))
    (in_range2 temp___expr_198)))

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 16))

;; "bound__def_axiom"
(assert
  (= bound (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000)))

;; "invariant____post_axiom"
(assert true)

;; "invariant____def_axiom"
(assert
  (forall ((param__n Int))
    (forall ((param__speed Float64) (param__distance Float64))
      (! (=
           (= (invariant__ param__n param__speed param__distance) true)
           (and
             (and
               (fp.leq (low_bound param__n) param__speed)
               (fp.leq param__speed (high_bound param__n)))
             (and
               (fp.leq (fp.mul RNE (fp.mul RNE (fp.mul RNE ((_ to_fp 11 53) RNE (to_real param__n)) ((_ to_fp 11 53) RNE (to_real (+ param__n 1)))) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))) (fp #b0 #b01111111110 #b0000000000000000000000000000000000000000000000000000)) param__distance)
               (fp.leq param__distance (fp.mul RNE (fp.mul RNE (fp.mul RNE ((_ to_fp 11 53) RNE (to_real param__n)) ((_ to_fp 11 53) RNE (to_real (+ param__n 1)))) 
               bound) (fp #b0 #b01111111110 #b0000000000000000000000000000000000000000000000000000)))))) :pattern (
      (invariant__
        param__n
        param__speed
        param__distance)) ))))

;; Goal "def'vc"
;; File "complex_trajectory.ads", line 39, characters 0-0
(assert
  (not
  (forall ((speed Float64) (distance Float64) (average Float64))
    (=>
      (dynamic_invariant bound true false true true)
      (=>
        (= (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000) 
        bound)
        (=>
          (in_range n)
          (=>
            (dynamic_invariant1 factor true false true true)
            (=>
              (dynamic_invariant2 drag true false true true)
              (=>
                (dynamic_invariant speed true false true true)
                (=>
                  (dynamic_invariant distance true false true true)
                  (=>
                    (dynamic_invariant average false false true true)
                    (=>
                      (and
                        (< n 25000)
                        (= (invariant__ n speed distance) true))
                      (=>
                        (= speed old_speed)
                        (=>
                          (dynamic_invariant old_speed true false true true)
                          (=>
                            (= (fp.add RNE drag (fp.mul RNE (fp.mul RNE 
                            factor (fp #b0 #b10000000010 #b0011100111010010111100011010100111111011111001110111)) (fp #b0 #b01111111001 #b0001000100010001000100010001000100010001000100010001))) 
                            delta_speed)
                            (=>
                              (dynamic_invariant
                                delta_speed
                                true
                                false
                                true
                                true)
                              (=>
                                (= ((_ int2bv 16) n) n_bv)
                                (fp.isFinite64 (fp.add RNE speed delta_speed)))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
