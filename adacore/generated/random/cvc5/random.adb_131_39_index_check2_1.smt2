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
(assert (= two_power_size_minus_one (pow2 (- 32 1))))

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

(declare-sort state_range 0)

;; "state_range'int"
(declare-fun state_rangeqtint (state_range) Int)

;; "state_range'axiom"
(assert
  (forall ((i state_range))
    (and (<= 0 (state_rangeqtint i)) (<= (state_rangeqtint i) 623))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 0 x) (<= x 623)))

;; "to_rep"
(define-fun to_rep ((x state_range)) Int
  (state_rangeqtint x))

;; "of_rep"
(declare-fun of_rep (Int) state_range)

;; "inversion_axiom"
(assert
  (forall ((x state_range))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x state_range)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

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

(declare-datatypes ((us_split_fields 0))
  (((us_split_fieldsqtmk
    (rec__random__generator__state (Array Int unsigned_32))(rec__random__generator__index state_range)))))

(declare-datatypes ((us_rep 0))
  (((us_repqtmk (us_split_fields1 us_split_fields)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const random__generator__state__first__bit Int)

(declare-const random__generator__state__last__bit Int)

(declare-const random__generator__state__position Int)

;; "random__generator__state__first__bit_axiom"
(assert (<= 0 random__generator__state__first__bit))

;; "random__generator__state__last__bit_axiom"
(assert
  (< random__generator__state__first__bit random__generator__state__last__bit))

;; "random__generator__state__position_axiom"
(assert (<= 0 random__generator__state__position))

(declare-const random__generator__index__first__bit Int)

(declare-const random__generator__index__last__bit Int)

(declare-const random__generator__index__position Int)

;; "random__generator__index__first__bit_axiom"
(assert (<= 0 random__generator__index__first__bit))

;; "random__generator__index__last__bit_axiom"
(assert
  (< random__generator__index__first__bit random__generator__index__last__bit))

;; "random__generator__index__position_axiom"
(assert (<= 0 random__generator__index__position))

(declare-const dummy us_rep)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_210 us_rep) (temp___is_init_206 Bool) (temp___skip_constant_207 Bool) (temp___do_toplevel_208 Bool) (temp___do_typ_inv_209 Bool)) Bool
  true)

;; "next"
(define-fun next ((param__x Int)) Int
  (ite (= param__x 623) 0 (+ param__x 1)))

(declare-const mat (Array (_ BitVec 32) unsigned_32))

(declare-const upper_mask (_ BitVec 32))

(declare-const lower_mask (_ BitVec 32))

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 32))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment2))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size2 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "component__size_axiom"
(assert (<= 0 component__size2))

;; "alignment_axiom"
(assert (<= 0 alignment3))

;; "random__random__mat__aggregate_def"
(declare-fun random__random__mat__aggregate_def ((_ BitVec 32)
  (_ BitVec 32)) (Array (_ BitVec 32) unsigned_32))

;; "def_axiom"
(assert
  (forall ((temp___175 (_ BitVec 32)) (temp___176 (_ BitVec 32)))
    (let ((temp___177 (random__random__mat__aggregate_def
                        temp___175
                        temp___176)))
      (and
        (= (to_rep1 (select temp___177 #x00000000)) temp___175)
        (= (to_rep1 (select temp___177 #x00000001)) temp___176)))))

;; Goal "def'vc"
;; File "random.ads", line 47, characters 0-0
(assert
  (not
  (forall ((g__split_fields us_split_fields))
    (=>
      (dynamic_invariant (us_repqtmk g__split_fields) true false true true)
      (=>
        (bvule #x00000000 (bvadd #x00000000 #x00000001))
        (forall ((temp___327 (Array (_ BitVec 32) unsigned_32)))
          (=>
            (and
              (and
                (= (to_rep1 (select temp___327 #x00000000)) #x00000000)
                (= (to_rep1 (select temp___327 #x00000001)) #x9908B0DF))
              (= temp___327 (random__random__mat__aggregate_def
                              #x00000000
                              #x9908B0DF)))
            (=>
              (= temp___327 mat)
              (=>
                (= #x80000000 upper_mask)
                (=>
                  (= #x7FFFFFFF lower_mask)
                  (forall ((o Int))
                    (=>
                      (= (to_rep
                           (rec__random__generator__index g__split_fields)) o)
                      (let ((o1 (next o)))
                        (=>
                          (and
                            (in_range o1)
                            (= o1 (ite (= o 623) 0 (+ o 1))))
                          (forall ((o2 (_ BitVec 32)))
                            (=>
                              (= (to_rep1
                                   (select (rec__random__generator__state
                                             g__split_fields) o1)) o2)
                              (forall ((o3 Int))
                                (=>
                                  (= (to_rep
                                       (rec__random__generator__index
                                         g__split_fields)) o3)
                                  (forall ((o4 (_ BitVec 32)))
                                    (=>
                                      (= (to_rep1
                                           (select (rec__random__generator__state
                                                     g__split_fields) o3)) o4)
                                      (forall ((value (_ BitVec 32)))
                                        (=>
                                          (= value (bvor (bvand o4 #x80000000) (bvand o2 #x7FFFFFFF)))
                                          (forall ((o5 Int))
                                            (=>
                                              (exists ((temp___335 Int))
                                                (and
                                                  (= (to_rep
                                                       (rec__random__generator__index
                                                         g__split_fields)) temp___335)
                                                  (ite (= (and (ite (<= 0 temp___335)
                                                                 true
                                                                 false) 
                                                    (ite (<= temp___335 226)
                                                      true
                                                      false)) true)
                                                    (exists ((o6 Int))
                                                      (and
                                                        (= (to_rep
                                                             (rec__random__generator__index
                                                               g__split_fields)) o6)
                                                        (let ((o7 (+ o6 397)))
                                                          (and
                                                            (= o5 o7)
                                                            (in_range o7)))))
                                                    (ite (= (and (ite (<= 227 temp___335)
                                                                   true
                                                                   false) 
                                                      (ite (<= temp___335 622)
                                                        true
                                                        false)) true)
                                                      (exists ((o6 Int))
                                                        (and
                                                          (= (to_rep
                                                               (rec__random__generator__index
                                                                 g__split_fields)) o6)
                                                          (let ((o7 (+ o6 (- 227))))
                                                            (and
                                                              (= o5 o7)
                                                              (in_range o7)))))
                                                      (= o5 396)))))
                                              (forall ((o6 (_ BitVec 32)))
                                                (=>
                                                  (= (to_rep1
                                                       (select (rec__random__generator__state
                                                                 g__split_fields) o5)) o6)
                                                  (forall ((o7 unsigned_32))
                                                    (=>
                                                      (= (to_rep1 o7) o6)
                                                      (forall ((o8 Int))
                                                        (=>
                                                          (= (to_rep
                                                               (rec__random__generator__index
                                                                 g__split_fields)) o8)
                                                          (forall ((g__split_fields1 us_split_fields))
                                                            (=>
                                                              (= g__split_fields1 
                                                              (us_split_fieldsqtmk
                                                                (store 
                                                                (rec__random__generator__state
                                                                  g__split_fields) o8 o7)
                                                                (rec__random__generator__index
                                                                  g__split_fields)))
                                                              (bvule (bvand value #x00000001) #x00000001)))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
