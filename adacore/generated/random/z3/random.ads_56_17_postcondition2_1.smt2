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

(declare-datatypes ()
  ((int__ref (int__refqtmk (int__content Int)))))

(declare-datatypes ()
  ((bool__ref (bool__refqtmk (bool__content Bool)))))

(declare-const two_power_size_minus_one Int)

;; "uint_in_range"
(define-fun uint_in_range ((i Int)) Bool
  (and (<= 0 i) (<= i 4294967295)))

(declare-datatypes ()
  ((t__ref (t__refqtmk (t__content (_ BitVec 32))))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

(declare-sort state_range 0)

;; "state_range'int"
(declare-fun state_rangeqtint (state_range) Int)

;; "state_range'axiom"
(assert
  (forall ((i state_range))
    (and (<= 0 (state_rangeqtint i)) (<= (state_rangeqtint i) 623))))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
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
  (forall ((x state_range))
    (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
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

(declare-datatypes ()
  ((us_split_fields
   (us_split_fieldsqtmk
   (rec__random__generator__state (Array Int unsigned_32))(rec__random__generator__index state_range)))))

(declare-datatypes ()
  ((us_split_fields__ref
   (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))

(declare-datatypes ()
  ((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))

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

(declare-const min Int)

(declare-const max Int)

(declare-const n (_ BitVec 32))

(declare-const slop (_ BitVec 32))

(declare-const g__split_fields us_split_fields)

(declare-const value Int)

(declare-const x (_ BitVec 32))

;; "x'unused"
(define-fun xqtunused () t__ref
  (t__refqtmk x))

;; "g__split_fields'unused"
(define-fun g__split_fieldsqtunused () us_split_fields__ref
  (us_split_fields__refqtmk g__split_fields))

;; "Assume"
(assert
  (dynamic_invariant (us_repqtmk g__split_fields) true false true true))

;; "Assume"
(assert (in_range value))

;; "Assume"
(assert (in_range min))

;; "Assume"
(assert (in_range max))

;; "Assume"
(assert (<= min max))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

(declare-const x1 (_ BitVec 32))

;; "x'unused"
(define-fun xqtunused1 () t__ref
  (t__refqtmk x1))

(declare-const o Bool)

;; "H"
(assert (= o (ite (= max 2147483647) true false)))

(declare-const infix_eqqtresultqtunused Bool)

;; "H"
(assert (= infix_eqqtresultqtunused o))

(declare-const o1 Bool)

;; "H"
(assert (= o1 (ite (= min (- 2147483648)) true false)))

(declare-const infix_eqqtresultqtunused1 Bool)

;; "H"
(assert (= infix_eqqtresultqtunused1 o1))

(declare-const o2 Bool)

;; "H"
(assert (= o2 (and o1 o)))

(declare-const andbqtresultqtunused Bool)

;; "H"
(assert (= andbqtresultqtunused o2))

(declare-const spark__branch Bool)

(declare-const spark__branchqtunused bool__ref)

;; "H"
(assert (= spark__branchqtunused (bool__refqtmk spark__branch)))

;; "H"
(assert (= spark__branch o2))

(declare-const bool__contentqtresultqtunused Bool)

;; "H"
(assert (= bool__contentqtresultqtunused spark__branch))

(declare-const o3 Int)

(declare-const infix_mnqtresultqtunused Int)

(declare-const o4 Int)

(declare-const infix_plqtresultqtunused Int)

(declare-const range_check_int_qtresultqtunused Int)

(declare-const random__random_integer__B_4__n__assume (_ BitVec 32))

(declare-const of_intqtresultqtunused (_ BitVec 32))

(declare-const o5 (_ BitVec 32))

(declare-const urem_qtresultqtunused (_ BitVec 32))

(declare-const random__random_integer__B_4__slop__assume (_ BitVec 32))

(declare-const addqtresultqtunused (_ BitVec 32))

(declare-const x2 (_ BitVec 32))

(declare-const xqtunused2 t__ref)

(declare-const t__contentqtresultqtunused (_ BitVec 32))

(declare-const o6 (_ BitVec 32))

(declare-const urem_qtresultqtunused1 (_ BitVec 32))

(declare-const us_split_fields__contentqtresultqtunused us_split_fields)

(declare-const temp___loop_entry_366qtunused us_rep)

(declare-const us_repqtmkqtresultqtunused us_rep)

(declare-const temp___loop_entry_365qtunused (_ BitVec 32))

(declare-const t__contentqtresultqtunused1 (_ BitVec 32))

(declare-const g__split_fields1 us_split_fields)

(declare-const x3 (_ BitVec 32))

(declare-const xqtunused3 t__ref)

(declare-const g__split_fieldsqtunused1 us_split_fields__ref)

(declare-const us_split_fields__contentqtresultqtunused1 us_split_fields)

(declare-const us_repqtmkqtresultqtunused1 us_rep)

(declare-const t__contentqtresultqtunused2 (_ BitVec 32))

(declare-const g__split_fields2 us_split_fields)

(declare-const o7 Bool)

(declare-const eqqtresultqtunused Bool)

(declare-const o8 (_ BitVec 32))

(declare-const subqtresultqtunused (_ BitVec 32))

(declare-const t__contentqtresultqtunused3 (_ BitVec 32))

(declare-const uleqtresultqtunused Bool)

(declare-const us_split_fields__contentqtresultqtunused2 us_split_fields)

(declare-const us_repqtmkqtresultqtunused2 us_rep)

(declare-const t__contentqtresultqtunused4 (_ BitVec 32))

(declare-const g__split_fields3 us_split_fields)

;; "H"
(assert
  (ite (= spark__branch true)
    (and
      (= us_split_fields__contentqtresultqtunused2 g__split_fields)
      (and
        (= us_repqtmkqtresultqtunused2 (us_repqtmk g__split_fields))
        (and
          (= t__contentqtresultqtunused4 x)
          (dynamic_invariant
            (us_repqtmk g__split_fields3)
            true
            true
            true
            true))))
    (and
      (= o3 (- max min))
      (and
        (= infix_mnqtresultqtunused o3)
        (and
          (= o4 (+ o3 1))
          (and
            (= infix_plqtresultqtunused o4)
            (and
              (uint_in_range o4)
              (and
                (= range_check_int_qtresultqtunused o4)
                (and
                  (= random__random_integer__B_4__n__assume ((_ int2bv 32) 
                  o4))
                  (and
                    (= of_intqtresultqtunused random__random_integer__B_4__n__assume)
                    (and
                      (= random__random_integer__B_4__n__assume n)
                      (and
                        (= o5 (bvurem #xFFFFFFFF n))
                        (and
                          (= urem_qtresultqtunused o5)
                          (and
                            (= random__random_integer__B_4__slop__assume (bvadd 
                            o5 #x00000001))
                            (and
                              (= addqtresultqtunused random__random_integer__B_4__slop__assume)
                              (and
                                (= random__random_integer__B_4__slop__assume 
                                slop)
                                (and
                                  (= xqtunused2 (t__refqtmk x2))
                                  (and
                                    (and
                                      (= us_split_fields__contentqtresultqtunused 
                                      g__split_fields)
                                      (and
                                        (= temp___loop_entry_366qtunused 
                                        (us_repqtmk
                                          g__split_fields))
                                        (and
                                          (= us_repqtmkqtresultqtunused 
                                          (us_repqtmk
                                            g__split_fields))
                                          (and
                                            (= temp___loop_entry_365qtunused 
                                            x)
                                            (and
                                              (= t__contentqtresultqtunused1 
                                              x)
                                              (and
                                                (= xqtunused3 (t__refqtmk x3))
                                                (and
                                                  (= g__split_fieldsqtunused1 
                                                  (us_split_fields__refqtmk
                                                    g__split_fields1))
                                                  (and
                                                    (dynamic_invariant
                                                      (us_repqtmk
                                                        g__split_fields1)
                                                      true
                                                      true
                                                      true
                                                      true)
                                                    (and
                                                      (= us_split_fields__contentqtresultqtunused1 
                                                      g__split_fields1)
                                                      (and
                                                        (= us_repqtmkqtresultqtunused1 
                                                        (us_repqtmk
                                                          g__split_fields1))
                                                        (and
                                                          (= t__contentqtresultqtunused2 
                                                          x3)
                                                          (and
                                                            (dynamic_invariant
                                                              (us_repqtmk
                                                                g__split_fields2)
                                                              true
                                                              true
                                                              true
                                                              true)
                                                            (and
                                                              (and
                                                                (= eqqtresultqtunused 
                                                                (ite (= 
                                                                  slop 
                                                                  n)
                                                                  true
                                                                  false))
                                                                (ite (= 
                                                                  slop 
                                                                  n)
                                                                  (= 
                                                                  o7 true)
                                                                  (and
                                                                    (= 
                                                                    o8 (bvsub #xFFFFFFFF 
                                                                    slop))
                                                                    (and
                                                                    (= 
                                                                    subqtresultqtunused 
                                                                    o8)
                                                                    (and
                                                                    (= 
                                                                    t__contentqtresultqtunused3 
                                                                    x2)
                                                                    (and
                                                                    (= 
                                                                    o7 
                                                                    (ite (bvule 
                                                                    x2 
                                                                    o8)
                                                                    true
                                                                    false))
                                                                    (= 
                                                                    uleqtresultqtunused 
                                                                    o7)))))))
                                                              (= o7 true))))))))))))))
                                    (and
                                      (= t__contentqtresultqtunused x2)
                                      (and
                                        (= o6 (bvurem x2 n))
                                        (and
                                          (= urem_qtresultqtunused1 o6)
                                          (and
                                            (= x1 o6)
                                            (and
                                              (bvule #x00000000 x1)
                                              (bvule x1 (bvsub n #x00000001)))))))))))))))))))))))))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused5 () (_ BitVec 32)
  x1)

;; "o"
(define-fun o9 () Int
  (bv2int x1))

;; "t_int'result'unused"
(define-fun t_intqtresultqtunused () Int
  o9)

;; "o"
(define-fun o10 () Int
  (+ min o9))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o10)

;; "Ensures"
(assert (in_range o10))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o10)

(declare-const value1 Int)

;; "value'unused"
(define-fun valueqtunused () int__ref
  (int__refqtmk value1))

;; "H"
(assert (= value1 o10))

;; Goal "def'vc"
;; File "random.ads", line 51, characters 0-0
(assert
  (not (<= value1 max)))

(check-sat)
