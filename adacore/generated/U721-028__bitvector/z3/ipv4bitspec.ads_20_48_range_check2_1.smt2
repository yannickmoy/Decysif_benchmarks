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

(declare-const two_power_size_minus_one1 Int)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 128))

(declare-const br (_ BitVec 128))

(declare-sort integer 0)

;; "integer'int"
(declare-fun integerqtint (integer) Int)

;; "integer'axiom"
(assert
  (forall ((i integer))
    (and
      (<= (- 2147483648) (integerqtint i))
      (<= (integerqtint i) 2147483647))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "to_rep"
(define-fun to_rep ((x integer)) Int
  (integerqtint x))

;; "of_rep"
(declare-fun of_rep (Int) integer)

;; "inversion_axiom"
(assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

(declare-sort unsigned_8 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

;; "to_rep"
(declare-fun to_rep1 (unsigned_8) (_ BitVec 8))

;; "of_rep"
(declare-fun of_rep1 ((_ BitVec 8)) unsigned_8)

;; "inversion_axiom"
(assert
  (forall ((x unsigned_8))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert true)

;; "coerce_axiom"
(assert
  (forall ((x (_ BitVec 8)))
    (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

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

;; "Assume"
(assert true)

;; "o"
(define-fun o () (_ BitVec 128)
  ((_ int2bv 128) 24))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused () (_ BitVec 128)
  o)

;; "o"
(define-fun o1 () (_ BitVec 128)
  (bvlshr br o))

;; "lsr_bv'result'unused"
(define-fun lsr_bvqtresultqtunused () (_ BitVec 128)
  o1)

;; "o"
(define-fun o2 () (_ BitVec 128)
  (bvand o1 #x000000000000000000000000000000FF))

;; "H"
(assert true)

;; "H"
(assert (= o2 (bvand o1 #x000000000000000000000000000000FF)))

;; "truncate8'result'unused"
(define-fun truncate8qtresultqtunused () (_ BitVec 128)
  o2)

;; "o"
(define-fun o3 () (_ BitVec 128)
  ((_ zero_extend 120) #xFF))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused () (_ BitVec 128)
  o3)

;; "o"
(define-fun o4 () (_ BitVec 128)
  ((_ zero_extend 120) #x00))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused1 () (_ BitVec 128)
  o4)

;; Goal "def'vc"
;; File "ipv4bitspec.ads", line 18, characters 0-0
(assert
  (not (bvule o2 o3)))

(check-sat)
