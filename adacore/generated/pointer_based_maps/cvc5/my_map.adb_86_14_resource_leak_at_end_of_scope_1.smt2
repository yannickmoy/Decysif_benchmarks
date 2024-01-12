;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

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

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

(declare-sort positive 0)

;; "positive'int"
(declare-fun positiveqtint (positive) Int)

;; "positive'axiom"
(assert
  (forall ((i positive))
    (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "to_rep"
(define-fun to_rep1 ((x positive)) Int
  (positiveqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) positive)

;; "inversion_axiom"
(assert
  (forall ((x positive))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x positive)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
  (((us_repqtmk
    (rec__my_map__map_acc__is_null_pointer Bool)(rec__my_map__map_acc__is_moved Bool)(rec__my_map__map_acc__pointer_value_abstr us_main_type)))))

;; "bool_eq"
(define-fun bool_eq ((a us_rep) (b us_rep)) Bool
  (ite (and
         (= (rec__my_map__map_acc__is_null_pointer a) (rec__my_map__map_acc__is_null_pointer
                                                        b))
         (=>
           (not (= (rec__my_map__map_acc__is_null_pointer a) true))
           (= (rec__my_map__map_acc__pointer_value_abstr a) (rec__my_map__map_acc__pointer_value_abstr
                                                              b))))
    true
    false))

(declare-const dummy us_rep)

(declare-const dummy1 us_rep)

(declare-datatypes ((us_rep1 0))
  (((us_repqtmk1
    (rec__my_map__nullable_int_acc__is_null_pointer Bool)(rec__my_map__nullable_int_acc__is_moved Bool)(rec__my_map__nullable_int_acc__pointer_value integer)))))

(declare-const us_null_pointer us_rep1)

;; "__null_pointer__def_axiom"
(assert
  (= (rec__my_map__nullable_int_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy2 us_rep1)

(declare-datatypes ((us_split_fields 0))
  (((us_split_fieldsqtmk
    (rec__my_map__map__key positive)(rec__my_map__map__value us_rep1)(rec__my_map__map__next us_rep)))))

(declare-datatypes ((us_rep2 0))
  (((us_repqtmk2 (us_split_fields1 us_split_fields)))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const my_map__map__key__first__bit Int)

(declare-const my_map__map__key__last__bit Int)

(declare-const my_map__map__key__position Int)

;; "my_map__map__key__first__bit_axiom"
(assert (<= 0 my_map__map__key__first__bit))

;; "my_map__map__key__last__bit_axiom"
(assert (< my_map__map__key__first__bit my_map__map__key__last__bit))

;; "my_map__map__key__position_axiom"
(assert (<= 0 my_map__map__key__position))

(declare-const my_map__map__value__first__bit Int)

(declare-const my_map__map__value__last__bit Int)

(declare-const my_map__map__value__position Int)

;; "my_map__map__value__first__bit_axiom"
(assert (<= 0 my_map__map__value__first__bit))

;; "my_map__map__value__last__bit_axiom"
(assert (< my_map__map__value__first__bit my_map__map__value__last__bit))

;; "my_map__map__value__position_axiom"
(assert (<= 0 my_map__map__value__position))

(declare-const my_map__map__next__first__bit Int)

(declare-const my_map__map__next__last__bit Int)

(declare-const my_map__map__next__position Int)

;; "my_map__map__next__first__bit_axiom"
(assert (<= 0 my_map__map__next__first__bit))

;; "my_map__map__next__last__bit_axiom"
(assert (< my_map__map__next__first__bit my_map__map__next__last__bit))

;; "my_map__map__next__position_axiom"
(assert (<= 0 my_map__map__next__position))

(declare-const dummy3 us_rep2)

;; "model_contains"
(declare-fun model_contains (us_rep
  Int) Bool)

;; "has_element"
(declare-fun has_element (us_rep2
  Int) Bool)

;; "__open"
(declare-fun us_open (us_main_type) us_rep2)

;; "__close"
(declare-fun us_close (us_rep2) us_main_type)

;; "close_open"
(assert
  (forall ((x us_main_type))
    (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; "open_close"
(assert
  (forall ((x us_rep2))
    (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

;; "rec__my_map__map_acc__pointer_value"
(define-fun rec__my_map__map_acc__pointer_value ((a us_rep)) us_rep2
  (us_open (rec__my_map__map_acc__pointer_value_abstr a)))

(declare-const us_null_pointer1 us_rep)

;; "__null_pointer__def_axiom"
(assert (= (rec__my_map__map_acc__is_null_pointer us_null_pointer1) true))

(declare-const dummy4 us_rep)

;; "model_value"
(declare-fun model_value (us_rep
  Int) Int)

(declare-const dummy5 us_rep)

;; "deep_copy"
(declare-fun deep_copy (us_rep) us_rep)

;; "temp___dynamic_invariant_201"
(declare-fun temp___dynamic_invariant_201 (us_rep
  Bool
  Bool
  Bool
  Bool) Bool)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_200 us_rep) (temp___is_init_196 Bool) (temp___skip_constant_197 Bool) (temp___do_toplevel_198 Bool) (temp___do_typ_inv_199 Bool)) Bool
  (=>
    (not (= (rec__my_map__map_acc__is_null_pointer temp___expr_200) true))
    (and
      (not
        (= (rec__my_map__nullable_int_acc__is_null_pointer
             (rec__my_map__map__value
               (us_split_fields1
                 (rec__my_map__map_acc__pointer_value temp___expr_200)))) true))
      (temp___dynamic_invariant_201
        (rec__my_map__map__next
          (us_split_fields1
            (rec__my_map__map_acc__pointer_value temp___expr_200)))
        true
        false
        true
        temp___do_typ_inv_199))))

;; "my_map__map_acc__def_axiom"
(assert
  (forall ((temp___expr_206 us_rep))
    (forall ((temp___is_init_202 Bool) (temp___skip_constant_203 Bool) (temp___do_toplevel_204 Bool) (temp___do_typ_inv_205 Bool))
      (! (=
           (temp___dynamic_invariant_201
             temp___expr_206
             temp___is_init_202
             temp___skip_constant_203
             temp___do_toplevel_204
             temp___do_typ_inv_205)
           (=>
             (not
               (= (rec__my_map__map_acc__is_null_pointer temp___expr_206) true))
             (and
               (not
                 (= (rec__my_map__nullable_int_acc__is_null_pointer
                      (rec__my_map__map__value
                        (us_split_fields1
                          (rec__my_map__map_acc__pointer_value
                            temp___expr_206)))) true))
               (temp___dynamic_invariant_201
                 (rec__my_map__map__next
                   (us_split_fields1
                     (rec__my_map__map_acc__pointer_value temp___expr_206)))
                 true
                 false
                 true
                 temp___do_typ_inv_205)))) :pattern ((temp___dynamic_invariant_201
                                                       temp___expr_206
                                                       temp___is_init_202
                                                       temp___skip_constant_203
                                                       temp___do_toplevel_204
                                                       temp___do_typ_inv_205)) ))))

(declare-const dummy6 us_rep)

(declare-const x us_rep)

(declare-const c__is_null_pointer Bool)

(declare-const dummy7 us_rep1)

;; "dynamic_invariant"
(define-fun dynamic_invariant1 ((temp___expr_193 us_rep1) (temp___is_init_189 Bool) (temp___skip_constant_190 Bool) (temp___do_toplevel_191 Bool) (temp___do_typ_inv_192 Bool)) Bool
  (=>
    (= temp___is_init_189 true)
    (not
      (= (rec__my_map__nullable_int_acc__is_null_pointer temp___expr_193) true))))

;; "dynamic_invariant"
(define-fun dynamic_invariant2 ((temp___expr_213 us_rep2) (temp___is_init_209 Bool) (temp___skip_constant_210 Bool) (temp___do_toplevel_211 Bool) (temp___do_typ_inv_212 Bool)) Bool
  (and
    (=>
      (= temp___is_init_209 true)
      (not
        (= (rec__my_map__nullable_int_acc__is_null_pointer
             (rec__my_map__map__value (us_split_fields1 temp___expr_213))) true)))
    (=>
      (not
        (= (rec__my_map__map_acc__is_null_pointer
             (rec__my_map__map__next (us_split_fields1 temp___expr_213))) true))
      (and
        (not
          (= (rec__my_map__nullable_int_acc__is_null_pointer
               (rec__my_map__map__value
                 (us_split_fields1
                   (rec__my_map__map_acc__pointer_value
                     (rec__my_map__map__next
                       (us_split_fields1 temp___expr_213)))))) true))
        (temp___dynamic_invariant_201
          (rec__my_map__map__next
            (us_split_fields1
              (rec__my_map__map_acc__pointer_value
                (rec__my_map__map__next (us_split_fields1 temp___expr_213)))))
          true
          false
          true
          temp___do_typ_inv_212)))))

;; "has_element__post_axiom"
(assert true)

;; "has_element__def_axiom"
(assert
  (forall ((param__m us_rep2))
    (forall ((param__k Int))
      (! (=
           (= (has_element param__m param__k) true)
           (and
             (not (= param__k 0))
             (or
               (= (to_rep1
                    (rec__my_map__map__key (us_split_fields1 param__m))) param__k)
               (= (model_contains
                    (rec__my_map__map__next (us_split_fields1 param__m))
                    param__k) true)))) :pattern ((has_element
                                                   param__m
                                                   param__k)) ))))

;; "model_contains__post_axiom"
(assert true)

;; "model_contains__def_axiom"
(assert
  (forall ((param__m us_rep))
    (forall ((param__k Int))
      (! (=
           (= (model_contains param__m param__k) true)
           (and
             (not (= (bool_eq param__m us_null_pointer1) true))
             (= (has_element
                  (rec__my_map__map_acc__pointer_value param__m)
                  param__k) true))) :pattern ((model_contains
                                                param__m
                                                param__k)) ))))

;; "model_value__post_axiom"
(assert
  (forall ((param__m us_rep))
    (forall ((param__k Int))
      (! (=>
           (and
             (and
               (=>
                 (not
                   (= (rec__my_map__map_acc__is_null_pointer param__m) true))
                 (dynamic_invariant2
                   (rec__my_map__map_acc__pointer_value param__m)
                   true
                   false
                   true
                   true))
               (in_range2 param__k))
             (= (model_contains param__m param__k) true))
           (in_range (model_value param__m param__k))) :pattern ((model_value
                                                                   param__m
                                                                   param__k)) ))))

;; "model_value__def_axiom"
(assert
  (forall ((param__m us_rep))
    (forall ((param__k Int))
      (! (= (model_value param__m param__k) (ite (= (to_rep1
                                                      (rec__my_map__map__key
                                                        (us_split_fields1
                                                          (rec__my_map__map_acc__pointer_value
                                                            param__m)))) param__k)
                                              (to_rep
                                                (rec__my_map__nullable_int_acc__pointer_value
                                                  (rec__my_map__map__value
                                                    (us_split_fields1
                                                      (rec__my_map__map_acc__pointer_value
                                                        param__m)))))
                                              (model_value
                                                (rec__my_map__map__next
                                                  (us_split_fields1
                                                    (rec__my_map__map_acc__pointer_value
                                                      param__m)))
                                                param__k))) :pattern (
      (model_value
        param__m
        param__k)) ))))

;; "deep_copy__post_axiom"
(assert
  (forall ((param__m us_rep))
    (! (=>
         (=>
           (not (= (rec__my_map__map_acc__is_null_pointer param__m) true))
           (dynamic_invariant2
             (rec__my_map__map_acc__pointer_value param__m)
             true
             false
             true
             true))
         (let ((result (deep_copy param__m)))
           (and
             (and
               (=
                 (= (bool_eq result us_null_pointer1) true)
                 (= (bool_eq param__m us_null_pointer1) true))
               (=>
                 (not (= (bool_eq param__m us_null_pointer1) true))
                 (and
                   (forall ((k Int))
                     (=>
                       (and
                         (in_range1 k)
                         (= (has_element
                              (rec__my_map__map_acc__pointer_value param__m)
                              k) true))
                       (= (model_contains result k) true)))
                   (forall ((k Int))
                     (=>
                       (and
                         (in_range1 k)
                         (= (has_element
                              (rec__my_map__map_acc__pointer_value result)
                              k) true))
                       (and
                         (= (model_contains param__m k) true)
                         (= (model_value param__m k) (model_value result k))))))))
             (dynamic_invariant result true false true true)))) :pattern (
    (deep_copy
      param__m)) )))

;; Goal "def'vc"
;; File "my_map.adb", line 81, characters 0-0
(assert
  (not
  (forall ((r__pointer_value us_split_fields) (r__is_null_pointer Bool) (r__rec__is_moved__ Bool))
    (=>
      (dynamic_invariant
        (us_repqtmk
          r__is_null_pointer
          r__rec__is_moved__
          (us_close (us_repqtmk2 r__pointer_value)))
        true
        false
        true
        true)
      (=>
        (=>
          (not (= (rec__my_map__map_acc__is_null_pointer x) true))
          (dynamic_invariant2
            (rec__my_map__map_acc__pointer_value x)
            true
            false
            true
            true))
        (=>
          (not (= (bool_eq x us_null_pointer1) true))
          (let ((o (us_repqtmk
                     r__is_null_pointer
                     r__rec__is_moved__
                     (us_close (us_repqtmk2 r__pointer_value)))))
            (let ((temp___old_439 (deep_copy o)))
              (=>
                (and
                  (dynamic_invariant temp___old_439 true false true true)
                  (and
                    (=
                      (= (bool_eq temp___old_439 us_null_pointer1) true)
                      (= (bool_eq o us_null_pointer1) true))
                    (=>
                      (not (= (bool_eq o us_null_pointer1) true))
                      (and
                        (forall ((k Int))
                          (=>
                            (and
                              (in_range1 k)
                              (= (has_element
                                   (rec__my_map__map_acc__pointer_value o)
                                   k) true))
                            (= (model_contains temp___old_439 k) true)))
                        (forall ((k Int))
                          (=>
                            (and
                              (in_range1 k)
                              (= (has_element
                                   (rec__my_map__map_acc__pointer_value
                                     temp___old_439)
                                   k) true))
                            (and
                              (= (model_contains o k) true)
                              (= (model_value o k) (model_value
                                                     temp___old_439
                                                     k)))))))))
                (forall ((r__pointer_value1 us_split_fields) (r__is_null_pointer1 Bool) (r__rec__is_moved__1 Bool))
                  (=>
                    (exists ((o1 Int))
                      (and
                        (= (to_rep1
                             (rec__my_map__map__key
                               (us_split_fields1
                                 (rec__my_map__map_acc__pointer_value x)))) o1)
                        (let ((o2 (us_repqtmk
                                    r__is_null_pointer
                                    r__rec__is_moved__
                                    (us_close (us_repqtmk2 r__pointer_value)))))
                          (let ((o3 (model_contains o2 o1)))
                            (and
                              (=
                                (= o3 true)
                                (and
                                  (not
                                    (= (bool_eq o2 us_null_pointer1) true))
                                  (= (has_element
                                       (rec__my_map__map_acc__pointer_value
                                         o2)
                                       o1) true)))
                              (exists ((spark__branch Bool))
                                (and
                                  (= spark__branch (ite (= o3 true)
                                                     false
                                                     true))
                                  (ite (= spark__branch true)
                                    (exists ((o4 Int))
                                      (and
                                        (= (to_rep
                                             (rec__my_map__nullable_int_acc__pointer_value
                                               (rec__my_map__map__value
                                                 (us_split_fields1
                                                   (rec__my_map__map_acc__pointer_value
                                                     x))))) o4)
                                        (exists ((o5 integer))
                                          (and
                                            (= (to_rep o5) o4)
                                            (exists ((c__pointer_value integer))
                                              (and
                                                (= c__pointer_value o5)
                                                (and
                                                  (= c__is_null_pointer false)
                                                  (exists ((c__rec__is_moved__ Bool))
                                                    (and
                                                      (= c__rec__is_moved__ false)
                                                      (and
                                                        (dynamic_invariant1
                                                          (us_repqtmk1
                                                            c__is_null_pointer
                                                            c__rec__is_moved__
                                                            c__pointer_value)
                                                          true
                                                          false
                                                          true
                                                          true)
                                                        (exists ((r__rec__is_moved__2 Bool))
                                                          (and
                                                            (= r__rec__is_moved__2 true)
                                                            (exists ((c__rec__is_moved__1 Bool))
                                                              (and
                                                                (= c__rec__is_moved__1 true)
                                                                (and
                                                                  (= 
                                                                  (us_repqtmk2
                                                                    r__pointer_value1) 
                                                                  (rec__my_map__map_acc__pointer_value
                                                                    (us_repqtmk
                                                                    false
                                                                    false
                                                                    (us_close
                                                                    (us_repqtmk2
                                                                    (us_split_fieldsqtmk
                                                                    (rec__my_map__map__key
                                                                    (us_split_fields1
                                                                    (rec__my_map__map_acc__pointer_value
                                                                    x)))
                                                                    (us_repqtmk1
                                                                    c__is_null_pointer
                                                                    c__rec__is_moved__
                                                                    c__pointer_value)
                                                                    (us_repqtmk
                                                                    r__is_null_pointer
                                                                    r__rec__is_moved__
                                                                    (us_close
                                                                    (us_repqtmk2
                                                                    r__pointer_value)))))))))
                                                                  (and
                                                                    (= r__is_null_pointer1 false)
                                                                    (= r__rec__is_moved__1 false)))))))))))))))))
                                    (and
                                      (and
                                        (= r__pointer_value1 r__pointer_value)
                                        (= r__is_null_pointer1 r__is_null_pointer))
                                      (= r__rec__is_moved__1 r__rec__is_moved__))))))))))
                    (forall ((o1 Int))
                      (=>
                        (= (to_rep1
                             (rec__my_map__map__key
                               (us_split_fields1
                                 (rec__my_map__map_acc__pointer_value x)))) o1)
                        (let ((o2 (us_repqtmk
                                    r__is_null_pointer1
                                    r__rec__is_moved__1
                                    (us_close
                                      (us_repqtmk2 r__pointer_value1)))))
                          (let ((o3 (model_contains o2 o1)))
                            (=>
                              (=
                                (= o3 true)
                                (and
                                  (not
                                    (= (bool_eq o2 us_null_pointer1) true))
                                  (= (has_element
                                       (rec__my_map__map_acc__pointer_value
                                         o2)
                                       o1) true)))
                              (=>
                                (= o3 true)
                                (or
                                  (= (rec__my_map__map_acc__is_null_pointer
                                       temp___old_439) true)
                                  (= (rec__my_map__map_acc__is_moved
                                       temp___old_439) true)))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
