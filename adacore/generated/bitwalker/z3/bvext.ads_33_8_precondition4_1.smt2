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

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert
  (and
    (and (bvule #x0000000000000000 i) (bvule i #x000000000000003F))
    (and (bvule #x0000000000000001 n) (bvule n (bvsub #x0000000000000040 i)))))

;; "o"
(define-fun o () Int
  (bv2int n))

;; "t_int'result'unused"
(define-fun t_intqtresultqtunused () Int
  o)

;; "Ensures"
(assert (in_range o))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o)

;; "o"
(define-fun o1 () Int
  (bv2int i))

;; "t_int'result'unused"
(define-fun t_intqtresultqtunused1 () Int
  o1)

;; "Ensures"
(assert (in_range o1))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o1)

;; "o"
(define-fun o2 () (_ BitVec 64)
  y)

;; "o"
(define-fun o3 () (_ BitVec 64)
  (extract_seq o2 o1 o))

;; "H"
(assert (extract_seq__function_guard o3 o2 o1 o))

;; "H"
(assert true)

;; "H"
(assert
  (= o3 (ite (< o o1)
          #x0000000000000000
          (bvand (bvlshr o2 ((_ int2bv 64) (- 64 (+ o1 o)))) (bvsub (ite (< 
                                                                    o 18446744073709551616)
                                                                    (bvshl #x0000000000000001 ((_ int2bv 64) 
                                                                    o))
                                                                    #x0000000000000000) #x0000000000000001)))))

;; "extract_seq'result'unused"
(define-fun extract_seqqtresultqtunused () (_ BitVec 64)
  o3)

;; "o"
(define-fun o4 () Int
  (bv2int n))

;; "t_int'result'unused"
(define-fun t_intqtresultqtunused2 () Int
  o4)

;; "Ensures"
(assert (in_range o4))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused2 () Int
  o4)

;; "o"
(define-fun o5 () Int
  (bv2int i))

;; "t_int'result'unused"
(define-fun t_intqtresultqtunused3 () Int
  o5)

;; "Ensures"
(assert (in_range o5))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o5)

;; "o"
(define-fun o6 () (_ BitVec 64)
  x)

;; Goal "def'vc"
;; File "bvext.ads", line 32, characters 0-0
(assert
  (not (<= o4 (- 64 o5))))

(check-sat)