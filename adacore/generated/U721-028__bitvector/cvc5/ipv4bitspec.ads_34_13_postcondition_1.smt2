;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "pow2"
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one (pow2 (- 8 1))))

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

;; "lsl"
(declare-fun lsl ((_ BitVec 128)
  Int) (_ BitVec 128))

(declare-const two_power_size_minus_one1 Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one1 (pow2 (- 128 1))))

;; "lsl_bv_is_lsl"
(assert
  (forall ((x (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvshl x n) (lsl x (bv2nat n)))))

;; "ipv4bitswellformed"
(define-fun ipv4bitswellformed ((param__bv (_ BitVec 128))) Bool
  (= (bvand param__bv #x000000000000000000000000FFFFFFFF) param__bv))

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

(declare-sort unsigned_8 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

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

(declare-datatypes ((t 0))
  (((tqtmk (rec__first integer)(rec__last integer)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int unsigned_8))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int unsigned_8)
  (elts a))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep (rec__last (rt a))))

;; "length"
(define-fun length ((a us_t)) Int
  (ite (<= (first a) (last a)) (+ (- (last a) (first a)) 1) 0))

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

(declare-const bytes us_t)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_192 us_t) (temp___is_init_188 Bool) (temp___skip_constant_189 Bool) (temp___do_toplevel_190 Bool) (temp___do_typ_inv_191 Bool)) Bool
  (and
    (=>
      (not (= temp___skip_constant_189 true))
      (dynamic_property
        0
        2147483647
        (first temp___expr_192)
        (last temp___expr_192)))
    (=>
      (= temp___is_init_188 true)
      (=> (= temp___do_toplevel_190 true) (= (first temp___expr_192) 0)))))

;; Goal "def'vc"
;; File "ipv4bitspec.ads", line 26, characters 0-0
(assert
  (not
  (=>
    (dynamic_invariant bytes true false true true)
    (=>
      (= (length bytes) 4)
      (=>
        (and (<= (first bytes) 0) (<= 0 (last bytes)))
        (forall ((o (_ BitVec 8)))
          (=>
            (= (to_rep1 (select (to_array bytes) 0)) o)
            (=>
              (and (<= (first bytes) 1) (<= 1 (last bytes)))
              (forall ((o1 (_ BitVec 8)))
                (=>
                  (= (to_rep1 (select (to_array bytes) 1)) o1)
                  (=>
                    (and (<= (first bytes) 2) (<= 2 (last bytes)))
                    (forall ((o2 (_ BitVec 8)))
                      (=>
                        (= (to_rep1 (select (to_array bytes) 2)) o2)
                        (=>
                          (and (<= (first bytes) 3) (<= 3 (last bytes)))
                          (forall ((o3 (_ BitVec 8)))
                            (=>
                              (= (to_rep1 (select (to_array bytes) 3)) o3)
                              (forall ((ipv4bitspec__ipv4bytestobits__result (_ BitVec 128)))
                                (=>
                                  (= ipv4bitspec__ipv4bytestobits__result (bvor (bvor (bvor (bvshl ((_ zero_extend 120) o) ((_ int2bv 128) 24)) (bvshl ((_ zero_extend 120) o1) ((_ int2bv 128) 16))) (bvshl ((_ zero_extend 120) o2) ((_ int2bv 128) 8))) (bvshl ((_ zero_extend 120) o3) ((_ int2bv 128) 0))))
                                  (= (ipv4bitswellformed
                                       ipv4bitspec__ipv4bytestobits__result) true)))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
