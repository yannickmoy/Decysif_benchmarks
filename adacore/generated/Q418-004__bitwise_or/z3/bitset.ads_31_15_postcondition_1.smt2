;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-const two_power_size_minus_one Int)

(declare-datatypes ()
  ((t__ref (t__refqtmk (t__content (_ BitVec 64))))))

;; "bit_test"
(declare-fun bit_test ((_ BitVec 64)
  (_ BitVec 64)) Bool)

;; "bit_test__function_guard"
(declare-fun bit_test__function_guard (Bool
  (_ BitVec 64)
  (_ BitVec 64)) Bool)

(declare-const value (_ BitVec 64))

(declare-const pos (_ BitVec 64))

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

;; "in_range"
(define-fun in_range ((x (_ BitVec 64))) Bool
  (and (bvule #x0000000000000000 x) (bvule x #x000000000000003F)))

;; "bit_test__post_axiom"
(assert
  (forall ((param__value (_ BitVec 64)) (param__pos (_ BitVec 64)))
    (! (=>
         (in_range param__pos)
         (let ((result (bit_test param__value param__pos)))
           (=>
             (bit_test__function_guard result param__value param__pos)
             (=
               (= result true)
               (not
                 (= (bvand param__value (let ((temp___186 (bv2int param__pos)))
                                          (ite (< temp___186 18446744073709551616)
                                            (bvshl #x0000000000000001 param__pos)
                                            #x0000000000000000))) #x0000000000000000)))))) :pattern (
    (bit_test
      param__value
      param__pos)) )))

(declare-const mask (_ BitVec 64))

;; "mask'unused"
(define-fun maskqtunused () t__ref
  (t__refqtmk mask))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range pos))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

(declare-const o (_ BitVec 64))

(declare-const temp___199 Int)

;; "H"
(assert (= temp___199 (bv2int pos)))

(declare-const t_intqtresultqtunused Int)

;; "H"
(assert (= t_intqtresultqtunused temp___199))

(declare-const infix_lsqtresultqtunused Bool)

;; "H"
(assert
  (= infix_lsqtresultqtunused (ite (< temp___199 18446744073709551616)
                                true
                                false)))

(declare-const o1 (_ BitVec 64))

(declare-const of_intqtresultqtunused (_ BitVec 64))

(declare-const lsl_bvqtresultqtunused (_ BitVec 64))

;; "H"
(assert
  (ite (< temp___199 18446744073709551616)
    (and
      (= o1 ((_ int2bv 64) temp___199))
      (and
        (= of_intqtresultqtunused o1)
        (and
          (= o (bvshl #x0000000000000001 o1))
          (= lsl_bvqtresultqtunused o))))
    (= o #x0000000000000000)))

;; "o"
(define-fun o2 () (_ BitVec 64)
  (bvnot o))

;; "bw_not'result'unused"
(define-fun bw_notqtresultqtunused () (_ BitVec 64)
  o2)

(declare-const mask1 (_ BitVec 64))

;; "mask'unused"
(define-fun maskqtunused1 () t__ref
  (t__refqtmk mask1))

;; "H"
(assert (= mask1 o2))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused () (_ BitVec 64)
  mask1)

;; "o"
(define-fun o3 () (_ BitVec 64)
  (bvand value mask1))

;; "bw_and'result'unused"
(define-fun bw_andqtresultqtunused () (_ BitVec 64)
  o3)

(declare-const bitset__bit_clear__result (_ BitVec 64))

;; "bitset__bit_clear__result'unused"
(define-fun bitset__bit_clear__resultqtunused () t__ref
  (t__refqtmk bitset__bit_clear__result))

;; "H"
(assert (= bitset__bit_clear__result o3))

;; "result'unused"
(define-fun resultqtunused () (_ BitVec 64)
  bitset__bit_clear__result)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused1 () (_ BitVec 64)
  bitset__bit_clear__result)

;; "H"
(assert
  (bit_test__function_guard
    (bit_test bitset__bit_clear__result pos)
    bitset__bit_clear__result
    pos))

;; "H"
(assert (= (bit_test bitset__bit_clear__result pos) true))

;; Goal "def'vc"
;; File "bitset.ads", line 26, characters 0-0
(assert
  (not false))

(check-sat)
