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

(declare-const x Int)

(declare-const y Int)

(declare-const z Int)

(declare-sort ar_index 0)

;; "ar_index'int"
(declare-fun ar_indexqtint (ar_index) Int)

;; "ar_index'axiom"
(assert
  (forall ((i ar_index))
    (and (<= 0 (ar_indexqtint i)) (<= (ar_indexqtint i) 9999))))

;; "in_range"
(define-fun in_range1 ((x1 Int)) Bool
  (and (<= 0 x1) (<= x1 9999)))

;; "to_rep"
(define-fun to_rep ((x1 ar_index)) Int
  (ar_indexqtint x1))

;; "of_rep"
(declare-fun of_rep (Int) ar_index)

;; "inversion_axiom"
(assert
  (forall ((x1 ar_index))
    (! (= (of_rep (to_rep x1)) x1) :pattern ((to_rep x1)) )))

;; "range_axiom"
(assert
  (forall ((x1 ar_index))
    (! (in_range1 (to_rep x1)) :pattern ((to_rep x1)) )))

;; "coerce_axiom"
(assert
  (forall ((x1 Int))
    (! (=> (in_range1 x1) (= (to_rep (of_rep x1)) x1)) :pattern ((to_rep
                                                                   (of_rep
                                                                    x1))) )))

;; "to_rep"
(define-fun to_rep1 ((x1 integer)) Int
  (integerqtint x1))

;; "of_rep"
(declare-fun of_rep1 (Int) integer)

;; "inversion_axiom"
(assert
  (forall ((x1 integer))
    (! (= (of_rep1 (to_rep1 x1)) x1) :pattern ((to_rep1 x1)) )))

;; "range_axiom"
(assert
  (forall ((x1 integer))
    (! (in_range (to_rep1 x1)) :pattern ((to_rep1 x1)) )))

;; "coerce_axiom"
(assert
  (forall ((x1 Int))
    (! (=> (in_range x1) (= (to_rep1 (of_rep1 x1)) x1)) :pattern ((to_rep1
                                                                    (of_rep1
                                                                    x1))) )))

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

(declare-sort length_type 0)

;; "length_type'int"
(declare-fun length_typeqtint (length_type) Int)

;; "length_type'axiom"
(assert
  (forall ((i length_type))
    (and (<= 0 (length_typeqtint i)) (<= (length_typeqtint i) 10000))))

;; "in_range"
(define-fun in_range2 ((x1 Int)) Bool
  (and (<= 0 x1) (<= x1 10000)))

;; "to_rep"
(define-fun to_rep2 ((x1 length_type)) Int
  (length_typeqtint x1))

;; "of_rep"
(declare-fun of_rep2 (Int) length_type)

;; "inversion_axiom"
(assert
  (forall ((x1 length_type))
    (! (= (of_rep2 (to_rep2 x1)) x1) :pattern ((to_rep2 x1)) )))

;; "range_axiom"
(assert
  (forall ((x1 length_type))
    (! (in_range2 (to_rep2 x1)) :pattern ((to_rep2 x1)) )))

;; "coerce_axiom"
(assert
  (forall ((x1 Int))
    (! (=> (in_range2 x1) (= (to_rep2 (of_rep2 x1)) x1)) :pattern ((to_rep2
                                                                    (of_rep2
                                                                    x1))) )))

(declare-datatypes ((us_split_fields 0))
  (((us_split_fieldsqtmk
    (rec__ring_buf__ring_buffer__data (Array Int integer))(rec__ring_buf__ring_buffer__first ar_index)(rec__ring_buf__ring_buffer__length length_type)))))

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

(declare-const ring_buf__ring_buffer__data__first__bit Int)

(declare-const ring_buf__ring_buffer__data__last__bit Int)

(declare-const ring_buf__ring_buffer__data__position Int)

;; "ring_buf__ring_buffer__data__first__bit_axiom"
(assert (<= 0 ring_buf__ring_buffer__data__first__bit))

;; "ring_buf__ring_buffer__data__last__bit_axiom"
(assert
  (< ring_buf__ring_buffer__data__first__bit ring_buf__ring_buffer__data__last__bit))

;; "ring_buf__ring_buffer__data__position_axiom"
(assert (<= 0 ring_buf__ring_buffer__data__position))

(declare-const ring_buf__ring_buffer__first__first__bit Int)

(declare-const ring_buf__ring_buffer__first__last__bit Int)

(declare-const ring_buf__ring_buffer__first__position Int)

;; "ring_buf__ring_buffer__first__first__bit_axiom"
(assert (<= 0 ring_buf__ring_buffer__first__first__bit))

;; "ring_buf__ring_buffer__first__last__bit_axiom"
(assert
  (< ring_buf__ring_buffer__first__first__bit ring_buf__ring_buffer__first__last__bit))

;; "ring_buf__ring_buffer__first__position_axiom"
(assert (<= 0 ring_buf__ring_buffer__first__position))

(declare-const ring_buf__ring_buffer__length__first__bit Int)

(declare-const ring_buf__ring_buffer__length__last__bit Int)

(declare-const ring_buf__ring_buffer__length__position Int)

;; "ring_buf__ring_buffer__length__first__bit_axiom"
(assert (<= 0 ring_buf__ring_buffer__length__first__bit))

;; "ring_buf__ring_buffer__length__last__bit_axiom"
(assert
  (< ring_buf__ring_buffer__length__first__bit ring_buf__ring_buffer__length__last__bit))

;; "ring_buf__ring_buffer__length__position_axiom"
(assert (<= 0 ring_buf__ring_buffer__length__position))

(declare-const dummy us_rep)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_200 us_rep) (temp___is_init_196 Bool) (temp___skip_constant_197 Bool) (temp___do_toplevel_198 Bool) (temp___do_typ_inv_199 Bool)) Bool
  true)

;; "is_empty"
(declare-fun is_empty (us_rep) Bool)

;; "head"
(declare-fun head (us_rep) Int)

;; "head__function_guard"
(declare-fun head__function_guard (Int
  us_rep) Bool)

;; "is_empty__post_axiom"
(assert true)

;; "is_empty__def_axiom"
(assert
  (forall ((param__r us_rep))
    (! (=
         (= (is_empty param__r) true)
         (= (to_rep2
              (rec__ring_buf__ring_buffer__length
                (us_split_fields1 param__r))) 0)) :pattern ((is_empty
                                                              param__r)) )))

;; "head__post_axiom"
(assert
  (forall ((param__r us_rep))
    (! (=>
         (and
           (dynamic_invariant param__r true false true true)
           (not (= (is_empty param__r) true)))
         (let ((result (head param__r)))
           (=> (head__function_guard result param__r) (in_range result)))) :pattern (
    (head
      param__r)) )))

;; "head__def_axiom"
(assert
  (forall ((param__r us_rep))
    (! (= (head param__r) (to_rep1
                            (let ((temp___215qtunused (rec__ring_buf__ring_buffer__data
                                                        (us_split_fields1
                                                          param__r))))
                              (select (rec__ring_buf__ring_buffer__data
                                        (us_split_fields1 param__r)) 
                              (to_rep
                                (rec__ring_buf__ring_buffer__first
                                  (us_split_fields1 param__r))))))) :pattern (
    (head
      param__r)) )))

;; Goal "def'vc"
;; File "harness.adb", line 3, characters 0-0
(assert
  (not
  (forall ((r__split_fields us_split_fields) (h Int))
    (=>
      (in_range x)
      (=>
        (in_range y)
        (=>
          (in_range z)
          (=>
            (dynamic_invariant
              (us_repqtmk r__split_fields)
              false
              false
              true
              true)
            (=>
              (in_range h)
              (forall ((r__split_fields1 us_split_fields))
                (=>
                  (and
                    (= (is_empty (us_repqtmk r__split_fields1)) true)
                    (dynamic_invariant
                      (us_repqtmk r__split_fields1)
                      true
                      true
                      true
                      true))
                  (forall ((r__split_fields2 us_split_fields))
                    (=>
                      (and
                        (= (to_rep2
                             (rec__ring_buf__ring_buffer__length
                               r__split_fields2)) (+ (to_rep2
                                                       (rec__ring_buf__ring_buffer__length
                                                         r__split_fields1)) 1))
                        (dynamic_invariant
                          (us_repqtmk r__split_fields2)
                          true
                          true
                          true
                          true))
                      (forall ((r__split_fields3 us_split_fields))
                        (=>
                          (and
                            (= (to_rep2
                                 (rec__ring_buf__ring_buffer__length
                                   r__split_fields3)) (+ (to_rep2
                                                           (rec__ring_buf__ring_buffer__length
                                                             r__split_fields2)) 1))
                            (dynamic_invariant
                              (us_repqtmk r__split_fields3)
                              true
                              true
                              true
                              true))
                          (forall ((r__split_fields4 us_split_fields) (h1 Int))
                            (=>
                              (forall ((temp___217 us_rep))
                                (head__function_guard
                                  (head temp___217)
                                  temp___217))
                              (=>
                                (and
                                  (and
                                    (= (to_rep2
                                         (rec__ring_buf__ring_buffer__length
                                           r__split_fields4)) (- (to_rep2
                                                                   (rec__ring_buf__ring_buffer__length
                                                                    r__split_fields3)) 1))
                                    (= (let ((temp___217 (us_repqtmk
                                                           r__split_fields3)))
                                         (head temp___217)) h1))
                                  (and
                                    (dynamic_invariant
                                      (us_repqtmk r__split_fields4)
                                      true
                                      true
                                      true
                                      true)
                                    (in_range h1)))
                                (=>
                                  (= h1 x)
                                  (forall ((r__split_fields5 us_split_fields))
                                    (=>
                                      (and
                                        (= (to_rep2
                                             (rec__ring_buf__ring_buffer__length
                                               r__split_fields5)) (+ 
                                        (to_rep2
                                          (rec__ring_buf__ring_buffer__length
                                            r__split_fields4)) 1))
                                        (dynamic_invariant
                                          (us_repqtmk r__split_fields5)
                                          true
                                          true
                                          true
                                          true))
                                      (forall ((r__split_fields6 us_split_fields) (h2 Int))
                                        (=>
                                          (forall ((temp___217 us_rep))
                                            (head__function_guard
                                              (head temp___217)
                                              temp___217))
                                          (=>
                                            (and
                                              (and
                                                (= (to_rep2
                                                     (rec__ring_buf__ring_buffer__length
                                                       r__split_fields6)) (- 
                                                (to_rep2
                                                  (rec__ring_buf__ring_buffer__length
                                                    r__split_fields5)) 1))
                                                (= (let ((temp___217 
                                                     (us_repqtmk
                                                       r__split_fields5)))
                                                     (head temp___217)) h2))
                                              (and
                                                (dynamic_invariant
                                                  (us_repqtmk
                                                    r__split_fields6)
                                                  true
                                                  true
                                                  true
                                                  true)
                                                (in_range h2)))
                                            (= h2 y))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
