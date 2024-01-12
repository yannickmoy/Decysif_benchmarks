;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "lsl"
(declare-fun lsl ((_ BitVec 32)
  Int) (_ BitVec 32))

;; "pow2"
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one (pow2 (- 32 1))))

;; "lsl_bv_is_lsl"
(assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvshl x n) (lsl x (bv2nat n)))))

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
(assert (= two_power_size_minus_one1 (pow2 (- 64 1))))

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

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

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

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483646)))

(declare-sort unsigned_32 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

;; "to_rep"
(declare-fun to_rep1 (unsigned_32) (_ BitVec 32))

;; "of_rep"
(declare-fun of_rep1 ((_ BitVec 32)) unsigned_32)

;; "inversion_axiom"
(assert
  (forall ((x unsigned_32))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert true)

;; "coerce_axiom"
(assert
  (forall ((x (_ BitVec 32)))
    (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(declare-datatypes ((t 0))
  (((tqtmk (rec__first integer)(rec__last integer)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int unsigned_32))(rt t)))))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep (rec__last (rt a))))

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

(declare-const a us_t)

(declare-const a_first Int)

(declare-const i (_ BitVec 64))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_188 us_t) (temp___is_init_184 Bool) (temp___skip_constant_185 Bool) (temp___do_toplevel_186 Bool) (temp___do_typ_inv_187 Bool)) Bool
  (=>
    (not (= temp___skip_constant_185 true))
    (dynamic_property
      0
      2147483646
      (first temp___expr_188)
      (last temp___expr_188))))

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

;; Goal "def'vc"
;; File "test.ads", line 13, characters 0-0
(assert
  (not
  (=>
    (dynamic_invariant a true false true true)
    (=>
      (in_range1 a_first)
      (=>
        (and
          (and (<= (first a) a_first) (<= a_first (last a)))
          (bvule (bvudiv i #x0000000000000020) ((_ int2bv 64) (- (last a) 
          a_first))))
        (forall ((o (_ BitVec 32)))
          (=>
            (let ((o1 (bv2nat (bvurem i #x0000000000000020))))
              (and
                (in_range1 o1)
                (ite (< o1 4294967296)
                  (= o (bvshl #x00000001 ((_ int2bv 32) o1)))
                  (= o #x00000000))))
            (let ((o1 (bv2nat (bvudiv i #x0000000000000020))))
              (=>
                (in_range1 o1)
                (let ((o2 (+ a_first o1)))
                  (=> (in_range o2) (<= (first a) o2))))))))))))

(check-sat)
(get-info :reason-unknown)
