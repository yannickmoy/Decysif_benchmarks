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
  (and (<= 0 i) (<= i 18446744073709551615)))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

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
(define-fun in_range1 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

(declare-sort character 0)

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 255)))

;; "to_rep"
(declare-fun to_rep (character) Int)

;; "of_rep"
(declare-fun of_rep (Int) character)

;; "inversion_axiom"
(assert
  (forall ((x character))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x character)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

;; "to_rep"
(define-fun to_rep1 ((x integer)) Int
  (integerqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) integer)

;; "inversion_axiom"
(assert
  (forall ((x integer))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-datatypes ()
  ((t (tqtmk (rec__first integer)(rec__last integer)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range1 low)
    (and
      (in_range1 high)
      (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep1 (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep1 (rec__last (rt a))))

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

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_110 us_t) (temp___is_init_106 Bool) (temp___skip_constant_107 Bool) (temp___do_toplevel_108 Bool) (temp___do_typ_inv_109 Bool)) Bool
  (=>
    (not (= temp___skip_constant_107 true))
    (dynamic_property
      1
      2147483647
      (first temp___expr_110)
      (last temp___expr_110))))

(declare-sort unsigned_64 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

;; "to_rep"
(declare-fun to_rep2 (unsigned_64) (_ BitVec 64))

;; "of_rep"
(declare-fun of_rep2 ((_ BitVec 64)) unsigned_64)

;; "inversion_axiom"
(assert
  (forall ((x unsigned_64))
    (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; "range_axiom"
(assert true)

;; "coerce_axiom"
(assert
  (forall ((x (_ BitVec 64)))
    (! (= (to_rep2 (of_rep2 x)) x) :pattern ((to_rep2 (of_rep2 x))) )))

(declare-sort u64 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

(declare-const attr__ATTRIBUTE_MODULUS2 (_ BitVec 64))

;; "in_range"
(define-fun in_range3 ((x (_ BitVec 64))) Bool
  (and (bvule #x0000000000000000 x) (bvule x #x1FFFFFFFFFFFFFFF)))

;; "to_rep"
(declare-fun to_rep3 (u64) (_ BitVec 64))

;; "of_rep"
(declare-fun of_rep3 ((_ BitVec 64)) u64)

;; "inversion_axiom"
(assert
  (forall ((x u64)) (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; "range_axiom"
(assert true)

;; "coerce_axiom"
(assert
  (forall ((x (_ BitVec 64)))
    (! (= (to_rep3 (of_rep3 x)) x) :pattern ((to_rep3 (of_rep3 x))) )))

(declare-datatypes ()
  ((t1 (tqtmk1 (rec__first1 unsigned_64)(rec__last1 unsigned_64)))))

;; "dynamic_property"
(define-fun dynamic_property1 ((range_first (_ BitVec 64)) (range_last (_ BitVec 64)) (low (_ BitVec 64)) (high (_ BitVec 64))) Bool
  (=> (bvule low high) (and (in_range3 low) (in_range3 high))))

(declare-datatypes ()
  ((us_t1 (us_tqtmk1 (elts1 (Array (_ BitVec 64) u64))(rt1 t1)))))

;; "first"
(define-fun first1 ((a us_t1)) (_ BitVec 64)
  (to_rep2 (rec__first1 (rt1 a))))

;; "last"
(define-fun last1 ((a us_t1)) (_ BitVec 64)
  (to_rep2 (rec__last1 (rt1 a))))

;; "length"
(define-fun length ((a us_t1)) Int
  (ite (bvule (first1 a) (last1 a))
    (+ (- (bv2int (last1 a)) (bv2int (first1 a))) 1)
    0))

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

(declare-const msg us_t)

(declare-const s us_t1)

(declare-const count (_ BitVec 64))

;; "dynamic_invariant"
(define-fun dynamic_invariant1 ((temp___expr_434 us_t1) (temp___is_init_430 Bool) (temp___skip_constant_431 Bool) (temp___do_toplevel_432 Bool) (temp___do_typ_inv_433 Bool)) Bool
  (=>
    (not (= temp___skip_constant_431 true))
    (dynamic_property1
      #x0000000000000000
      #x1FFFFFFFFFFFFFFF
      (first1 temp___expr_434)
      (last1 temp___expr_434))))

;; "Assume"
(assert (dynamic_invariant msg true false true true))

;; "Assume"
(assert (dynamic_invariant1 s true false true true))

;; "Assume"
(assert true)

;; "o"
(define-fun o () Int
  (length s))

;; "length'result'unused"
(define-fun lengthqtresultqtunused () Int
  o)

;; Goal "def'vc"
;; File "skein.adb", line 123, characters 0-0
(assert
  (not (uint_in_range o)))

(check-sat)
