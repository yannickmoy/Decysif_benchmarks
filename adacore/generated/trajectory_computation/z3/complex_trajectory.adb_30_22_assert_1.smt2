;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite64 ((x Float64)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral64 ((x Float64)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-const two_power_size_minus_one Int)

;; "of_int"
(declare-fun of_int (RoundingMode
  Int) Float64)

(declare-const two_power_size_minus_one1 Int)

(declare-const two_power_size_minus_one2 Int)

(declare-const two_power_size_minus_one3 Int)

(declare-datatypes ()
  ((t__ref (t__refqtmk (t__content Float64)))))

(declare-const bound Float64)

;; "low_bound"
(define-fun low_bound ((param__n Int)) Float64
  (fp.mul RNE (of_int RNE param__n) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_177 Float64) (temp___is_init_173 Bool) (temp___skip_constant_174 Bool) (temp___do_toplevel_175 Bool) (temp___do_typ_inv_176 Bool)) Bool
  (=>
    (or
      (= temp___is_init_173 true)
      (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
    (fp.isFinite64 temp___expr_177)))

;; "high_bound"
(define-fun high_bound ((param__n Int)) Float64
  (fp.mul RNE (of_int RNE param__n) bound))

;; "in_bounds"
(define-fun in_bounds ((param__v Float64)) Bool
  (and (ite (fp.leq (fp.neg (fp #b0 #b10000010011 #b1000110010111010100000000000000000000000000000000000)) param__v)
         true
         false) (ite (fp.leq param__v (fp #b0 #b10000010011 #b1000110010111010100000000000000000000000000000000000))
                  true
                  false)))

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
               (fp.leq (fp.mul RNE (fp.mul RNE (fp.mul RNE (of_int
                                                             RNE
                                                             param__n) 
               (of_int
                 RNE
                 (+ param__n 1))) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))) (fp #b0 #b01111111110 #b0000000000000000000000000000000000000000000000000000)) param__distance)
               (fp.leq param__distance (fp.mul RNE (fp.mul RNE (fp.mul RNE 
               (of_int
                 RNE
                 param__n) (of_int RNE (+ param__n 1))) bound) (fp #b0 #b01111111110 #b0000000000000000000000000000000000000000000000000000)))))) :pattern (
      (invariant__
        param__n
        param__speed
        param__distance)) ))))

(declare-const speed Float64)

(declare-const distance Float64)

(declare-const average Float64)

;; "distance'unused"
(define-fun distanceqtunused () t__ref
  (t__refqtmk distance))

;; "speed'unused"
(define-fun speedqtunused () t__ref
  (t__refqtmk speed))

;; "Assume"
(assert (dynamic_invariant bound true false true true))

;; "Assume"
(assert
  (= (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000) 
  bound))

;; "Assume"
(assert (in_range n))

;; "Assume"
(assert (dynamic_invariant1 factor true false true true))

;; "Assume"
(assert (dynamic_invariant2 drag true false true true))

;; "Assume"
(assert (dynamic_invariant speed true false true true))

;; "Assume"
(assert (dynamic_invariant distance true false true true))

;; "Assume"
(assert (dynamic_invariant average false false true true))

;; "Assume"
(assert (and (< n 25000) (= (invariant__ n speed distance) true)))

;; "complex_trajectory__compute_distance__old_speed__assume'unused"
(define-fun complex_trajectory__compute_distance__old_speed__assumeqtunused 
  () Float64
  speed)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused () Float64
  speed)

;; "Assume"
(assert (= speed old_speed))

;; "Assume"
(assert (dynamic_invariant old_speed true false true true))

;; "o"
(define-fun o () Float64
  (fp.mul RNE factor (fp #b0 #b10000000010 #b0011100111010010111100011010100111111011111001110111)))

;; "mul_rne'result'unused"
(define-fun mul_rneqtresultqtunused () Float64
  o)

;; "o"
(define-fun o1 () Float64
  (fp.mul RNE o (fp #b0 #b01111111001 #b0001000100010001000100010001000100010001000100010001)))

;; "mul_rne'result'unused"
(define-fun mul_rneqtresultqtunused1 () Float64
  o1)

;; "complex_trajectory__compute_distance__delta_speed__assume"
(define-fun complex_trajectory__compute_distance__delta_speed__assume 
  () Float64
  (fp.add RNE drag o1))

;; "add_rne'result'unused"
(define-fun add_rneqtresultqtunused () Float64
  complex_trajectory__compute_distance__delta_speed__assume)

;; "Assume"
(assert
  (= complex_trajectory__compute_distance__delta_speed__assume delta_speed))

;; "Assume"
(assert (dynamic_invariant delta_speed true false true true))

;; "complex_trajectory__compute_distance__n_bv__assume"
(define-fun complex_trajectory__compute_distance__n_bv__assume () (_ BitVec 16)
  ((_ int2bv 16) n))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused () (_ BitVec 16)
  complex_trajectory__compute_distance__n_bv__assume)

;; "Assume"
(assert (= complex_trajectory__compute_distance__n_bv__assume n_bv))

;; "Assume"
(assert true)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused1 () Float64
  speed)

;; "o"
(define-fun o2 () Float64
  (fp.add RNE speed delta_speed))

;; "add_rne'result'unused"
(define-fun add_rneqtresultqtunused1 () Float64
  o2)

;; "Ensures"
(assert (fp.isFinite64 o2))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Float64
  o2)

(declare-const speed1 Float64)

;; "speed'unused"
(define-fun speedqtunused1 () t__ref
  (t__refqtmk speed1))

;; "H"
(assert (= speed1 o2))

;; "Assert"
(assert
  (and
    (fp.leq (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000)) 
    delta_speed)
    (fp.leq delta_speed bound)))

;; "Assert"
(assert (= (in_bounds (high_bound n)) true))

;; "Assert"
(assert (= (in_bounds (low_bound n)) true))

;; "Assert"
(assert
  (fp.eq (fp.add RNE (fp.mul RNE ((_ to_fp_unsigned 11 53) RNE n_bv) 
  bound) bound) (fp.mul RNE (fp.add RNE ((_ to_fp_unsigned 11 53) RNE 
  n_bv) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) 
  bound)))

;; "Assert"
(assert
  (fp.eq (fp.add RNE (fp.mul RNE (of_int RNE n) bound) bound) (fp.mul RNE (fp.add RNE 
  (of_int
    RNE
    n) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) 
  bound)))

;; Goal "def'vc"
;; File "complex_trajectory.ads", line 39, characters 0-0
(assert
  (not
  (fp.eq (fp.sub RNE (fp.mul RNE (of_int RNE n) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))) 
  bound) (fp.mul RNE (fp.add RNE (of_int RNE n) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))))))

(check-sat)
