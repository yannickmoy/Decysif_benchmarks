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

(declare-const x Float32)

;; "in_range"
(define-fun in_range ((x1 Float32)) Bool
  (and
    (fp.isFinite32 x1)
    (and
      (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111101110)) x1)
      (fp.leq x1 (fp #b0 #b11111110 #b11111111111111111101110)))))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_191 Float32) (temp___is_init_187 Bool) (temp___skip_constant_188 Bool) (temp___do_toplevel_189 Bool) (temp___do_typ_inv_190 Bool)) Bool
  (=>
    (or
      (= temp___is_init_187 true)
      (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111101110)) (fp #b0 #b11111110 #b11111111111111111101110)))
    (in_range temp___expr_191)))

;; "r4"
(declare-fun r4 (Float32) Float32)

;; "r4__function_guard"
(declare-fun r4__function_guard (Float32
  Float32) Bool)

;; "in_range"
(define-fun in_range1 ((x1 Float32)) Bool
  (and
    (fp.isFinite32 x1)
    (and
      (fp.leq (fp.neg (fp #b0 #b10001000 #b01101000000000000000000)) x1)
      (fp.leq x1 (fp #b0 #b10001000 #b01101000000000000000000)))))

;; "dynamic_invariant"
(define-fun dynamic_invariant1 ((temp___expr_198 Float32) (temp___is_init_194 Bool) (temp___skip_constant_195 Bool) (temp___do_toplevel_196 Bool) (temp___do_typ_inv_197 Bool)) Bool
  (=>
    (or
      (= temp___is_init_194 true)
      (fp.leq (fp.neg (fp #b0 #b10001000 #b01101000000000000000000)) (fp #b0 #b10001000 #b01101000000000000000000)))
    (in_range1 temp___expr_198)))

;; Goal "def'vc"
;; File "normalize.ads", line 25, characters 0-0
(assert
  (not
  (forall ((v1 Float32) (v2 Float32))
    (=>
      (dynamic_invariant1 x true false true true)
      (=>
        (dynamic_invariant v1 false false true true)
        (=>
          (dynamic_invariant v2 false false true true)
          (forall ((v11 Float32))
            (=>
              (= v11 (fp.div RNE x (fp #b0 #b10000111 #b01101000000000000000000)))
              (=>
                (and
                  (fp.leq (fp.neg (fp #b0 #b10000000 #b00000000000000000000000)) v11)
                  (fp.leq v11 (fp #b0 #b10000000 #b00000000000000000000000)))
                (let ((o (r4 v11)))
                  (=>
                    (and
                      (r4__function_guard o v11)
                      (and
                        (dynamic_invariant o true false true true)
                        (and
                          (= o (fp.roundToIntegral RTN v11))
                          (fp.eq o (fp.roundToIntegral RTN v11)))))
                    (forall ((v21 Float32))
                      (=>
                        (= v21 o)
                        (=>
                          (fp.leq v21 v11)
                          (fp.leq (fp.sub RNE v11 (fp #b0 #b01111111 #b00000000000000000000000)) v21)))))))))))))))

(check-sat)
(get-info :reason-unknown)
