;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
(define-fun fp.isFinite64 ((x Float64)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral64 ((x Float64)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-sort float__ 0)

;; "to_rep"
(declare-fun to_rep (float__) Float32)

;; "of_rep"
(declare-fun of_rep (Float32) float__)

;; "inversion_axiom"
(assert
  (forall ((x float__)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x float__))
    (! (fp.isFinite32 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Float32))
    (! (=> (fp.isFinite32 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                    (of_rep
                                                                    x))) )))

(declare-sort long_float 0)

;; "to_rep"
(declare-fun to_rep1 (long_float) Float64)

;; "of_rep"
(declare-fun of_rep1 (Float64) long_float)

;; "inversion_axiom"
(assert
  (forall ((x long_float))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x long_float))
    (! (fp.isFinite64 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Float64))
    (! (=> (fp.isFinite64 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                    (of_rep1
                                                                    x))) )))

(declare-const a (Array Int float__))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "component__size_axiom"
(assert (<= 0 component__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_74 Float64) (temp___is_init_70 Bool) (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool) (temp___do_typ_inv_73 Bool)) Bool
  (=>
    (or
      (= temp___is_init_70 true)
      (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
    (fp.isFinite64 temp___expr_74)))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size2 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "component__size_axiom"
(assert (<= 0 component__size2))

;; "alignment_axiom"
(assert (<= 0 alignment2))

;; "floats__test__b__aggregate_def"
(declare-fun floats__test__b__aggregate_def (Float64
  Float64
  Float64
  Float64) (Array Int long_float))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size3 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "component__size_axiom"
(assert (<= 0 component__size3))

;; "alignment_axiom"
(assert (<= 0 alignment3))

;; "floats__test__c__aggregate_def"
(declare-fun floats__test__c__aggregate_def (Float64
  Float64
  Float64
  Float64) (Array Int long_float))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const component__size4 Int)

(declare-const alignment4 Int)

;; "value__size_axiom"
(assert (<= 0 value__size4))

;; "object__size_axiom"
(assert (<= 0 object__size4))

;; "component__size_axiom"
(assert (<= 0 component__size4))

;; "alignment_axiom"
(assert (<= 0 alignment4))

;; "floats__test__d__aggregate_def"
(declare-fun floats__test__d__aggregate_def (Float64
  Float64
  Float64
  Float64) (Array Int long_float))

;; Goal "def'vc"
;; File "floats.ads", line 5, characters 0-0
(assert
  (not
  (forall ((e (Array Int long_float)))
    (=>
      (forall ((i Int))
        (=>
          (and (<= 1 i) (<= i 3))
          (let ((temp___338 (to_rep (select a i))))
            (and
              (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) temp___338)
              (fp.leq temp___338 (fp #b0 #b01111111 #b00000000000000000000000))))))
      (forall ((temp___200 (Array Int long_float)))
        (=>
          (and
            (and
              (and
                (=>
                  (dynamic_invariant
                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                    true
                    true
                    true
                    true)
                  (= (to_rep1 (select temp___200 1)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)))
                (=>
                  (dynamic_invariant
                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                    true
                    true
                    true
                    true)
                  (= (to_rep1 (select temp___200 2)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))
              (and
                (=>
                  (dynamic_invariant
                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                    true
                    true
                    true
                    true)
                  (= (to_rep1 (select temp___200 3)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)))
                (=>
                  (dynamic_invariant
                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                    true
                    true
                    true
                    true)
                  (= (to_rep1 (select temp___200 4)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)))))
            (= temp___200 (floats__test__b__aggregate_def
                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))
          (forall ((b (Array Int long_float)))
            (=>
              (= b temp___200)
              (forall ((temp___209 (Array Int long_float)))
                (=>
                  (and
                    (and
                      (and
                        (=>
                          (dynamic_invariant
                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                            true
                            true
                            true
                            true)
                          (= (to_rep1 (select temp___209 1)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)))
                        (=>
                          (dynamic_invariant
                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                            true
                            true
                            true
                            true)
                          (= (to_rep1 (select temp___209 2)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))
                      (and
                        (=>
                          (dynamic_invariant
                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                            true
                            true
                            true
                            true)
                          (= (to_rep1 (select temp___209 3)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)))
                        (=>
                          (dynamic_invariant
                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                            true
                            true
                            true
                            true)
                          (= (to_rep1 (select temp___209 4)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)))))
                    (= temp___209 (floats__test__c__aggregate_def
                                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))
                  (forall ((c (Array Int long_float)))
                    (=>
                      (= c temp___209)
                      (forall ((temp___218 (Array Int long_float)))
                        (=>
                          (and
                            (and
                              (and
                                (=>
                                  (dynamic_invariant
                                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                    true
                                    true
                                    true
                                    true)
                                  (= (to_rep1 (select temp___218 1)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)))
                                (=>
                                  (dynamic_invariant
                                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                    true
                                    true
                                    true
                                    true)
                                  (= (to_rep1 (select temp___218 2)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))
                              (and
                                (=>
                                  (dynamic_invariant
                                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                    true
                                    true
                                    true
                                    true)
                                  (= (to_rep1 (select temp___218 3)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)))
                                (=>
                                  (dynamic_invariant
                                    (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                    true
                                    true
                                    true
                                    true)
                                  (= (to_rep1 (select temp___218 4)) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)))))
                            (= temp___218 (floats__test__d__aggregate_def
                                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000)
                                            (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))
                          (forall ((d (Array Int long_float)))
                            (=>
                              (= d temp___218)
                              (=>
                                (let ((temp___223 (to_rep (select a 1))))
                                  (and
                                    (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) temp___223)
                                    (fp.leq temp___223 (fp #b0 #b01111111 #b00000000000000000000000))))
                                (=>
                                  (let ((temp___227 (to_rep (select a 2))))
                                    (and
                                      (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) temp___227)
                                      (fp.leq temp___227 (fp #b0 #b01111111 #b00000000000000000000000))))
                                  (=>
                                    (let ((temp___231 (to_rep (select a 3))))
                                      (and
                                        (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) temp___231)
                                        (fp.leq temp___231 (fp #b0 #b01111111 #b00000000000000000000000))))
                                    (forall ((o long_float))
                                      (=>
                                        (= (to_rep1 o) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))
                                        (forall ((e1 (Array Int long_float)))
                                          (=>
                                            (= e1 (store e 1 o))
                                            (forall ((o1 Float32))
                                              (=>
                                                (= (to_rep (select a 1)) o1)
                                                (forall ((o2 long_float))
                                                  (=>
                                                    (= (to_rep1 o2) ((_ to_fp 11 53) RNE (fp.mul RNE o1 (fp #b0 #b01111110 #b00000000000000000000000))))
                                                    (forall ((e2 (Array Int long_float)))
                                                      (=>
                                                        (= e2 (store e1 2 o2))
                                                        (forall ((o3 Float32))
                                                          (=>
                                                            (= (to_rep
                                                                 (select 
                                                                 a 2)) o3)
                                                            (forall ((o4 long_float))
                                                              (=>
                                                                (= (to_rep1
                                                                    o4) ((_ to_fp 11 53) RNE (fp.mul RNE o3 (fp #b0 #b01111110 #b00000000000000000000000))))
                                                                (forall 
                                                                  ((e3 (Array Int long_float)))
                                                                  (=>
                                                                    (= e3 (store e2 3 o4))
                                                                    (forall 
                                                                    ((o5 Float32))
                                                                    (=>
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    a 3)) o5)
                                                                    (forall 
                                                                    ((o6 long_float))
                                                                    (=>
                                                                    (= 
                                                                    (to_rep1
                                                                    o6) ((_ to_fp 11 53) RNE (fp.mul RNE o5 (fp #b0 #b01111110 #b00000000000000000000000))))
                                                                    (forall 
                                                                    ((e4 (Array Int long_float)))
                                                                    (=>
                                                                    (= e4 (store e3 4 o6))
                                                                    (=>
                                                                    (let ((temp___239 
                                                                    (to_rep1
                                                                    (select e4 1))))
                                                                    (and
                                                                    (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) temp___239)
                                                                    (fp.leq temp___239 (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))))
                                                                    (=>
                                                                    (let ((temp___243 
                                                                    (to_rep1
                                                                    (select e4 2))))
                                                                    (and
                                                                    (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) temp___243)
                                                                    (fp.leq temp___243 (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))))
                                                                    (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) 
                                                                    (to_rep1
                                                                    (select e4 3))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
