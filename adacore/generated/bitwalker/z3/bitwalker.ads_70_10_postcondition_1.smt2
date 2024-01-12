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

;; "uint_in_range"
(define-fun uint_in_range ((i Int)) Bool
  (and (<= 0 i) (<= i 255)))

(declare-datatypes ()
  ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "nth"
(define-fun nth ((param__x (_ BitVec 8)) (param__pos Int)) Bool
  (= (bvand (ite (< param__pos 8)
              (bvlshr param__x ((_ int2bv 8) param__pos))
              #x00) #x01) #x01))

(declare-const byte (_ BitVec 8))

(declare-const left Int)

(declare-const flag Bool)

(declare-const mask (_ BitVec 8))

(declare-const r (_ BitVec 8))

(declare-const left_bv (_ BitVec 8))

;; "nth_bv"
(define-fun nth_bv ((param__x (_ BitVec 8)) (param__pos (_ BitVec 8))) Bool
  (= (bvand (ite (< (bv2int param__pos) 8)
              (bvlshr param__x ((_ int2bv 8) (bv2int param__pos)))
              #x00) #x01) #x01))

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range left))

;; "Assume"
(assert (< left 8))

(declare-const bitwalker__pokebit8__mask__assume (_ BitVec 8))

(declare-const o Int)

;; "H"
(assert (= o (- 7 left)))

(declare-const infix_mnqtresultqtunused Int)

;; "H"
(assert (= infix_mnqtresultqtunused o))

;; "Ensures"
(assert (in_range o))

(declare-const range_check_qtresultqtunused Int)

;; "H"
(assert (= range_check_qtresultqtunused o))

(declare-const infix_lsqtresultqtunused Bool)

;; "H"
(assert (= infix_lsqtresultqtunused (ite (< o 8) true false)))

(declare-const o1 Int)

(declare-const infix_mnqtresultqtunused1 Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const o2 (_ BitVec 8))

(declare-const of_intqtresultqtunused (_ BitVec 8))

(declare-const lsl_bvqtresultqtunused (_ BitVec 8))

;; "H"
(assert
  (ite (< o 8)
    (and
      (= o1 (- 7 left))
      (and
        (= infix_mnqtresultqtunused1 o1)
        (and
          (in_range o1)
          (and
            (= range_check_qtresultqtunused1 o1)
            (and
              (= o2 ((_ int2bv 8) o1))
              (and
                (= of_intqtresultqtunused o2)
                (and
                  (= bitwalker__pokebit8__mask__assume (bvshl #x01 o2))
                  (= lsl_bvqtresultqtunused bitwalker__pokebit8__mask__assume))))))))
    (= bitwalker__pokebit8__mask__assume #x00)))

;; "Assume"
(assert (= bitwalker__pokebit8__mask__assume mask))

;; "Assume"
(assert true)

(declare-const bitwalker__pokebit8__r__assume (_ BitVec 8))

(declare-const o3 (_ BitVec 8))

(declare-const bw_notqtresultqtunused (_ BitVec 8))

(declare-const bw_andqtresultqtunused (_ BitVec 8))

(declare-const bw_orqtresultqtunused (_ BitVec 8))

;; "H"
(assert
  (ite (= flag true)
    (and
      (= bitwalker__pokebit8__r__assume (bvor byte mask))
      (= bw_orqtresultqtunused bitwalker__pokebit8__r__assume))
    (and
      (= o3 (bvnot mask))
      (and
        (= bw_notqtresultqtunused o3)
        (and
          (= bitwalker__pokebit8__r__assume (bvand byte o3))
          (= bw_andqtresultqtunused bitwalker__pokebit8__r__assume))))))

;; "Assume"
(assert (= bitwalker__pokebit8__r__assume r))

;; "Assume"
(assert true)

;; "o"
(define-fun o4 () Int
  left)

;; "Ensures"
(assert (uint_in_range o4))

;; "range_check_int_'result'unused"
(define-fun range_check_int_qtresultqtunused () Int
  o4)

;; "bitwalker__pokebit8__left_bv__assume"
(define-fun bitwalker__pokebit8__left_bv__assume () (_ BitVec 8)
  ((_ int2bv 8) o4))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused1 () (_ BitVec 8)
  bitwalker__pokebit8__left_bv__assume)

;; "Assume"
(assert (= bitwalker__pokebit8__left_bv__assume left_bv))

;; "Assume"
(assert true)

;; "Assert"
(assert (bvult left_bv #x08))

;; "Assert"
(assert (= (bvsub #x07 left_bv) ((_ int2bv 8) (- 7 left))))

;; "Assert"
(assert
  (forall ((i (_ BitVec 8)))
    (=>
      (and (bvule #x00 i) (bvule i #x07))
      (=>
        (not (= i (bvsub #x07 left_bv)))
        (= (= (nth_bv r i) true) (= (nth_bv byte i) true))))))

;; "Assert"
(assert (= (= (nth_bv r (bvsub #x07 left_bv)) true) (= flag true)))

(declare-const bitwalker__pokebit8__result (_ BitVec 8))

;; "bitwalker__pokebit8__result'unused"
(define-fun bitwalker__pokebit8__resultqtunused () t__ref
  (t__refqtmk bitwalker__pokebit8__result))

;; "H"
(assert (= bitwalker__pokebit8__result r))

;; "result'unused"
(define-fun resultqtunused () (_ BitVec 8)
  bitwalker__pokebit8__result)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused () (_ BitVec 8)
  bitwalker__pokebit8__result)

(declare-const i Int)

;; "H"
(assert (<= 0 i))

;; "H"
(assert (<= i 7))

;; "H"
(assert (not (= i (- 7 left))))

;; "H"
(assert (= (nth bitwalker__pokebit8__result i) true))

;; Goal "def'vc"
;; File "bitwalker.ads", line 63, characters 0-0
(assert
  (not (= (nth byte i) true)))

(check-sat)