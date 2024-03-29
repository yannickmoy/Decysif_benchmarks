;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-const two_power_size_minus_one Int)

(declare-const two_power_size_minus_one1 Int)

(declare-const two_power_size_minus_one2 Int)

(declare-const two_power_size_minus_one3 Int)

(declare-datatypes ()
  ((t__ref (t__refqtmk (t__content Float32)))))

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

(declare-const state Float32)

;; "state'unused"
(define-fun stateqtunused () t__ref
  (t__refqtmk state))

;; "Assume"
(assert (dynamic_invariant state true false true true))

;; "Assume"
(assert (in_range x))

;; "Assume"
(assert
  (and
    (bvult x #x000F4240)
    (fp.leq state (fp.mul RNE ((_ to_fp_unsigned 8 24) RNE x) (fp #b0 #b10000010 #b01100000000000000000000)))))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused () Float32
  state)

;; "o"
(define-fun o () Float32
  (fp.add RNE state (fp #b0 #b10000010 #b01000000000000000000000)))

;; "add_rne'result'unused"
(define-fun add_rneqtresultqtunused () Float32
  o)

;; "Ensures"
(assert (fp.isFinite32 o))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Float32
  o)

(declare-const state1 Float32)

;; "state'unused"
(define-fun stateqtunused1 () t__ref
  (t__refqtmk state1))

;; "H"
(assert (= state1 o))

;; Goal "def'vc"
;; File "wibble.adb", line 11, characters 0-0
(assert
  (not
  (fp.leq state1 (fp.mul RNE ((_ to_fp_unsigned 8 24) RNE (bvadd x #x00000001)) (fp #b0 #b10000010 #b01100000000000000000000)))))

(check-sat)
