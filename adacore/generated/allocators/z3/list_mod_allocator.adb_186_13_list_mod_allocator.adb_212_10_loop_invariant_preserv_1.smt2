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

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

(declare-sort resource 0)

;; "resource'int"
(declare-fun resourceqtint (resource) Int)

;; "resource'axiom"
(assert
  (forall ((i resource))
    (and (<= 0 (resourceqtint i)) (<= (resourceqtint i) 10000))))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 10000)))

;; "to_rep"
(define-fun to_rep ((x resource)) Int
  (resourceqtint x))

;; "of_rep"
(declare-fun of_rep (Int) resource)

;; "inversion_axiom"
(assert
  (forall ((x resource))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x resource)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-sort status 0)

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 1)))

;; "to_rep"
(declare-fun to_rep1 (status) Int)

;; "of_rep"
(declare-fun of_rep1 (Int) status)

;; "inversion_axiom"
(assert
  (forall ((x status))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x status)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-datatypes ()
  ((us_split_fields
   (us_split_fieldsqtmk
   (rec__list_mod_allocator__cell__stat status)(rec__list_mod_allocator__cell__next resource)))))

(declare-datatypes ()
  ((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const list_mod_allocator__cell__stat__first__bit Int)

(declare-const list_mod_allocator__cell__stat__last__bit Int)

(declare-const list_mod_allocator__cell__stat__position Int)

;; "list_mod_allocator__cell__stat__first__bit_axiom"
(assert (<= 0 list_mod_allocator__cell__stat__first__bit))

;; "list_mod_allocator__cell__stat__last__bit_axiom"
(assert
  (< list_mod_allocator__cell__stat__first__bit list_mod_allocator__cell__stat__last__bit))

;; "list_mod_allocator__cell__stat__position_axiom"
(assert (<= 0 list_mod_allocator__cell__stat__position))

(declare-const list_mod_allocator__cell__next__first__bit Int)

(declare-const list_mod_allocator__cell__next__last__bit Int)

(declare-const list_mod_allocator__cell__next__position Int)

;; "list_mod_allocator__cell__next__first__bit_axiom"
(assert (<= 0 list_mod_allocator__cell__next__first__bit))

;; "list_mod_allocator__cell__next__last__bit_axiom"
(assert
  (< list_mod_allocator__cell__next__first__bit list_mod_allocator__cell__next__last__bit))

;; "list_mod_allocator__cell__next__position_axiom"
(assert (<= 0 list_mod_allocator__cell__next__position))

(declare-const dummy us_rep)

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int us_rep))))))

(declare-sort us_rep1 0)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const dummy1 us_rep1)

;; "last"
(declare-fun last (us_rep1) Int)

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "get"
(declare-fun get (us_rep1
  Int) Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "alignment_axiom"
(assert (<= 0 alignment2))

(declare-const dummy2 Int)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_332 Int) (temp___is_init_328 Bool) (temp___skip_constant_329 Bool) (temp___do_toplevel_330 Bool) (temp___do_typ_inv_331 Bool)) Bool
  (=>
    (= temp___is_init_328 true)
    (=> (= temp___do_toplevel_330 true) (<= 0 temp___expr_332))))

;; "length"
(define-fun length ((param__container us_rep1)) Int
  (- (+ (last param__container) 1) 1))

(declare-sort us_rep2 0)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "alignment_axiom"
(assert (<= 0 alignment3))

(declare-const dummy3 us_rep2)

(declare-datatypes ()
  ((us_split_fields2
   (us_split_fieldsqtmk1
   (rec__list_mod_allocator__m__t__available us_rep1)(rec__list_mod_allocator__m__t__allocated us_rep2)))))

(declare-datatypes ()
  ((us_rep3 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; "value__size_axiom"
(assert (<= 0 value__size4))

;; "object__size_axiom"
(assert (<= 0 object__size4))

;; "alignment_axiom"
(assert (<= 0 alignment4))

(declare-const list_mod_allocator__m__t__available__first__bit Int)

(declare-const list_mod_allocator__m__t__available__last__bit Int)

(declare-const list_mod_allocator__m__t__available__position Int)

;; "list_mod_allocator__m__t__available__first__bit_axiom"
(assert (<= 0 list_mod_allocator__m__t__available__first__bit))

;; "list_mod_allocator__m__t__available__last__bit_axiom"
(assert
  (< list_mod_allocator__m__t__available__first__bit list_mod_allocator__m__t__available__last__bit))

;; "list_mod_allocator__m__t__available__position_axiom"
(assert (<= 0 list_mod_allocator__m__t__available__position))

(declare-const list_mod_allocator__m__t__allocated__first__bit Int)

(declare-const list_mod_allocator__m__t__allocated__last__bit Int)

(declare-const list_mod_allocator__m__t__allocated__position Int)

;; "list_mod_allocator__m__t__allocated__first__bit_axiom"
(assert (<= 0 list_mod_allocator__m__t__allocated__first__bit))

;; "list_mod_allocator__m__t__allocated__last__bit_axiom"
(assert
  (< list_mod_allocator__m__t__allocated__first__bit list_mod_allocator__m__t__allocated__last__bit))

;; "list_mod_allocator__m__t__allocated__position_axiom"
(assert (<= 0 list_mod_allocator__m__t__allocated__position))

(declare-const dummy4 us_rep3)

;; "model"
(declare-fun model1 ((Array Int us_rep)
  Int) us_rep3)

;; "model__function_guard"
(declare-fun model__function_guard (us_rep3
  (Array Int us_rep)
  Int) Bool)

;; "is_well_formed"
(define-fun is_well_formed ((List_mod_allocator__data___data___ (Array Int us_rep)) (List_mod_allocator__first_available___first_available___ Int)) Bool
  (and (ite (not
              (= List_mod_allocator__first_available___first_available___ 0))
         (= (to_rep1
              (rec__list_mod_allocator__cell__stat
                (us_split_fields1
                  (select List_mod_allocator__data___data___ List_mod_allocator__first_available___first_available___)))) 0)
         (distinct 1 0)) (ite (forall ((r Int))
                                (=>
                                  (and (<= 1 r) (<= r 10000))
                                  (=>
                                    (and
                                      (= (to_rep1
                                           (rec__list_mod_allocator__cell__stat
                                             (us_split_fields1
                                               (select List_mod_allocator__data___data___ r)))) 0)
                                      (not
                                        (= (to_rep
                                             (rec__list_mod_allocator__cell__next
                                               (us_split_fields1
                                                 (select List_mod_allocator__data___data___ r)))) 0)))
                                    (= (to_rep1
                                         (rec__list_mod_allocator__cell__stat
                                           (us_split_fields1
                                             (select List_mod_allocator__data___data___ 
                                             (to_rep
                                               (rec__list_mod_allocator__cell__next
                                                 (us_split_fields1
                                                   (select List_mod_allocator__data___data___ r)))))))) 0))))
                           true
                           false)))

;; "model_is_well_formed"
(declare-fun model_is_well_formed (us_rep3
  (Array Int us_rep)
  Int) Bool)

;; "is_valid"
(declare-fun is_valid ((Array Int us_rep)
  Int) Bool)

;; "contains"
(declare-fun contains (us_rep1
  Int) Bool)

;; "contains"
(declare-fun contains1 (us_rep2
  Int) Bool)

(declare-const ma us_rep1)

(declare-const r110b us_rep3)

(declare-const r112b Int)

;; "in_range"
(define-fun in_range4 ((x Int)) Bool
  (and (<= 1 x) (<= x 10000)))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const component__size Int)

(declare-const alignment5 Int)

;; "value__size_axiom"
(assert (<= 0 value__size5))

;; "object__size_axiom"
(assert (<= 0 object__size5))

;; "component__size_axiom"
(assert (<= 0 component__size))

;; "alignment_axiom"
(assert (<= 0 alignment5))

;; "last__post_axiom"
(assert
  (forall ((param__container us_rep1))
    (! (in_range3 (last param__container)) :pattern ((last param__container)) )))

;; "get__post_axiom"
(assert
  (forall ((param__container us_rep1))
    (forall ((param__position Int))
      (! (=>
           (and
             (in_range3 param__position)
             (and
               (<= 1 param__position)
               (<= param__position (last param__container))))
           (in_range1 (get param__container param__position))) :pattern (
      (get
        param__container
        param__position)) ))))

;; "contains__post_axiom"
(assert true)

;; "contains__post_axiom"
(assert true)

;; "contains__def_axiom"
(assert
  (forall ((param__s us_rep1))
    (forall ((param__e Int))
      (! (=
           (= (contains param__s param__e) true)
           (exists ((i Int))
             (and
               (and (<= 1 i) (<= i (last param__s)))
               (= (get param__s i) param__e)))) :pattern ((contains
                                                            param__s
                                                            param__e)) ))))

;; "model_is_well_formed__post_axiom"
(assert true)

;; "model_is_well_formed__def_axiom"
(assert
  (forall ((param__m us_rep3))
    (forall ((List_mod_allocator__data___data___ (Array Int us_rep)))
      (forall ((List_mod_allocator__first_available___first_available___ Int))
        (! (=
             (= (model_is_well_formed
                  param__m
                  List_mod_allocator__data___data___
                  List_mod_allocator__first_available___first_available___) true)
             (let ((avail (rec__list_mod_allocator__m__t__available
                            (us_split_fields3 param__m))))
               (let ((alloc (rec__list_mod_allocator__m__t__allocated
                              (us_split_fields3 param__m))))
                 (and
                   (and
                     (and
                       (and
                         (and
                           (and
                             (and
                               (<= (length avail) 10000)
                               (ite (not
                                      (= List_mod_allocator__first_available___first_available___ 0))
                                 (and
                                   (< 0 (length avail))
                                   (= (get avail 1) List_mod_allocator__first_available___first_available___))
                                 (= (length avail) 0)))
                             (forall ((j Int))
                               (=>
                                 (and (<= 1 j) (<= j (last avail)))
                                 (and
                                   (in_range4 (get avail j))
                                   (=>
                                     (< j (last avail))
                                     (= (to_rep
                                          (rec__list_mod_allocator__cell__next
                                            (us_split_fields1
                                              (select List_mod_allocator__data___data___ 
                                              (get
                                                avail
                                                j))))) (get avail (+ j 1))))))))
                           (forall ((j Int))
                             (=>
                               (and (<= 1 j) (<= j (last avail)))
                               (=>
                                 (< 1 j)
                                 (and
                                   (in_range4 (get avail (- j 1)))
                                   (= (get avail j) (to_rep
                                                      (rec__list_mod_allocator__cell__next
                                                        (us_split_fields1
                                                          (select List_mod_allocator__data___data___ 
                                                          (get
                                                            avail
                                                            (- j 1))))))))))))
                         (forall ((j Int))
                           (=>
                             (and (<= 1 j) (<= j (last avail)))
                             (forall ((k Int))
                               (=>
                                 (and (<= 1 k) (<= k (last avail)))
                                 (=> (= (get avail j) (get avail k)) (= j k)))))))
                       (=>
                         (and
                           (not
                             (= List_mod_allocator__first_available___first_available___ 0))
                           (in_range4
                             (to_rep
                               (rec__list_mod_allocator__cell__next
                                 (us_split_fields1
                                   (select List_mod_allocator__data___data___ 
                                   (get
                                     avail
                                     (last avail))))))))
                         (= (contains
                              avail
                              (to_rep
                                (rec__list_mod_allocator__cell__next
                                  (us_split_fields1
                                    (select List_mod_allocator__data___data___ 
                                    (get
                                      avail
                                      (last avail))))))) true)))
                     (forall ((e Int))
                       (=>
                         (and (in_range1 e) (= (contains1 alloc e) true))
                         (in_range4 e))))
                   (forall ((r Int))
                     (=>
                       (and (<= 1 r) (<= r 10000))
                       (ite (= (to_rep1
                                 (rec__list_mod_allocator__cell__stat
                                   (us_split_fields1
                                     (select List_mod_allocator__data___data___ r)))) 0)
                         (not (= (contains1 alloc r) true))
                         (and
                           (not (= (contains avail r) true))
                           (= (contains1 alloc r) true))))))))) :pattern (
        (model_is_well_formed
          param__m
          List_mod_allocator__data___data___
          List_mod_allocator__first_available___first_available___)) )))))

;; "model__post_axiom"
(assert
  (forall ((List_mod_allocator__data___data___ (Array Int us_rep)))
    (forall ((List_mod_allocator__first_available___first_available___ Int))
      (! (=>
           (and
             (in_range1
               List_mod_allocator__first_available___first_available___)
             (= (is_well_formed
                  List_mod_allocator__data___data___
                  List_mod_allocator__first_available___first_available___) true))
           (let ((result (model1
                           List_mod_allocator__data___data___
                           List_mod_allocator__first_available___first_available___)))
             (=>
               (model__function_guard
                 result
                 List_mod_allocator__data___data___
                 List_mod_allocator__first_available___first_available___)
               (= (model_is_well_formed
                    result
                    List_mod_allocator__data___data___
                    List_mod_allocator__first_available___first_available___) true)))) :pattern (
      (model1
        List_mod_allocator__data___data___
        List_mod_allocator__first_available___first_available___)) ))))

;; "is_valid__post_axiom"
(assert true)

;; "is_valid__def_axiom"
(assert
  (forall ((List_mod_allocator__data___data___ (Array Int us_rep)))
    (forall ((List_mod_allocator__first_available___first_available___ Int))
      (! (and
           (model__function_guard
             (model1
               List_mod_allocator__data___data___
               List_mod_allocator__first_available___first_available___)
             List_mod_allocator__data___data___
             List_mod_allocator__first_available___first_available___)
           (and
             (model__function_guard
               (model1
                 List_mod_allocator__data___data___
                 List_mod_allocator__first_available___first_available___)
               List_mod_allocator__data___data___
               List_mod_allocator__first_available___first_available___)
             (and
               (model__function_guard
                 (model1
                   List_mod_allocator__data___data___
                   List_mod_allocator__first_available___first_available___)
                 List_mod_allocator__data___data___
                 List_mod_allocator__first_available___first_available___)
               (=
                 (= (is_valid
                      List_mod_allocator__data___data___
                      List_mod_allocator__first_available___first_available___) true)
                 (and
                   (and
                     (= (is_well_formed
                          List_mod_allocator__data___data___
                          List_mod_allocator__first_available___first_available___) true)
                     (=>
                       (not
                         (= List_mod_allocator__first_available___first_available___ 0))
                       (= (to_rep
                            (rec__list_mod_allocator__cell__next
                              (us_split_fields1
                                (select List_mod_allocator__data___data___ 
                                (get
                                  (rec__list_mod_allocator__m__t__available
                                    (us_split_fields3
                                      (model1
                                        List_mod_allocator__data___data___
                                        List_mod_allocator__first_available___first_available___)))
                                  (last
                                    (rec__list_mod_allocator__m__t__available
                                      (us_split_fields3
                                        (model1
                                          List_mod_allocator__data___data___
                                          List_mod_allocator__first_available___first_available___))))))))) 0)))
                   (forall ((r Int))
                     (=>
                       (and (<= 1 r) (<= r 10000))
                       (=>
                         (= (to_rep1
                              (rec__list_mod_allocator__cell__stat
                                (us_split_fields1
                                  (select List_mod_allocator__data___data___ r)))) 0)
                         (= (contains
                              (rec__list_mod_allocator__m__t__available
                                (us_split_fields3
                                  (model1
                                    List_mod_allocator__data___data___
                                    List_mod_allocator__first_available___first_available___)))
                              r) true))))))))) :pattern ((is_valid
                                                           List_mod_allocator__data___data___
                                                           List_mod_allocator__first_available___first_available___)) ))))

;; "lemma_contains_equivalent__post_axiom"
(assert
  (forall ((param__container us_rep2))
    (forall ((param__item Int))
      (=>
        (and
          (in_range1 param__item)
          (and
            (= (distinct 1 0) true)
            (not (= (contains1 param__container param__item) true))))
        (forall ((e Int))
          (=>
            (and (in_range1 e) (= (contains1 param__container e) true))
            (not (= param__item e))))))))

(declare-const rliteral resource)

;; "rliteral_axiom"
(assert (= (resourceqtint rliteral) 0))

(declare-const data (Array Int us_rep))

(declare-const first_available Int)

(declare-const res Int)

(declare-const next_avail Int)

;; "next_avail'unused"
(define-fun next_availqtunused () int__ref
  (int__refqtmk next_avail))

;; "first_available'unused"
(define-fun first_availableqtunused () int__ref
  (int__refqtmk first_available))

;; "data'unused"
(define-fun dataqtunused () map__ref
  (map__refqtmk data))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 first_available))

;; "Assume"
(assert (in_range1 res))

;; "Assume"
(assert (= (is_valid data first_available) true))

;; "temp___704"
(define-fun temp___704 () Int
  0)

;; "of_base'result'unused"
(define-fun of_baseqtresultqtunused () Int
  temp___704)

;; "Assert"
(assert true)

;; "o"
(define-fun o () us_rep3
  (model1 data first_available))

;; "H"
(assert (model__function_guard o data first_available))

;; "H"
(assert true)

;; "H"
(assert (= (model_is_well_formed o data first_available) true))

;; "model'result'unused"
(define-fun modelqtresultqtunused () us_rep3
  o)

;; "o"
(define-fun o1 () us_split_fields2
  (us_split_fields3 o))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused () us_split_fields2
  o1)

;; "o"
(define-fun o2 () us_rep1
  (rec__list_mod_allocator__m__t__available o1))

;; "rec__list_mod_allocator__m__t__available'result'unused"
(define-fun rec__list_mod_allocator__m__t__availableqtresultqtunused 
  () us_rep1
  o2)

;; "o"
(define-fun o3 () Int
  (length o2))

;; "H"
(assert (dynamic_invariant o3 true false true true))

;; "H"
(assert (= o3 (- (+ (last o2) 1) 1)))

;; "length'result'unused"
(define-fun lengthqtresultqtunused () Int
  o3)

;; "o"
(define-fun o4 () Int
  o3)

;; "to_base'result'unused"
(define-fun to_baseqtresultqtunused () Int
  o4)

;; "temp___700"
(define-fun temp___700 () Int
  o4)

;; "of_base'result'unused"
(define-fun of_baseqtresultqtunused1 () Int
  temp___700)

;; "Assert"
(assert true)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  (ite (= temp___700 temp___704) true false))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  first_available)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused () (Array Int us_rep)
  data)

;; "temp___result_699"
(define-fun temp___result_699 () us_rep3
  (model1 data first_available))

;; "model'result'unused"
(define-fun modelqtresultqtunused1 () us_rep3
  temp___result_699)

;; "Assume"
(assert (model__function_guard temp___result_699 data first_available))

;; "o"
(define-fun o5 () us_split_fields2
  (us_split_fields3 temp___result_699))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused1 () us_split_fields2
  o5)

;; "temp___old_694"
(define-fun temp___old_694 () us_rep2
  (rec__list_mod_allocator__m__t__allocated o5))

;; "rec__list_mod_allocator__m__t__allocated'result'unused"
(define-fun rec__list_mod_allocator__m__t__allocatedqtresultqtunused 
  () us_rep2
  temp___old_694)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  first_available)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused1 () (Array Int us_rep)
  data)

;; "temp___result_698"
(define-fun temp___result_698 () us_rep3
  (model1 data first_available))

;; "model'result'unused"
(define-fun modelqtresultqtunused2 () us_rep3
  temp___result_698)

;; "Assume"
(assert (model__function_guard temp___result_698 data first_available))

;; "o"
(define-fun o6 () us_split_fields2
  (us_split_fields3 temp___result_698))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused2 () us_split_fields2
  o6)

;; "temp___old_693"
(define-fun temp___old_693 () us_rep1
  (rec__list_mod_allocator__m__t__available o6))

;; "rec__list_mod_allocator__m__t__available'result'unused"
(define-fun rec__list_mod_allocator__m__t__availableqtresultqtunused1 
  () us_rep1
  temp___old_693)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  first_available)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused2 () (Array Int us_rep)
  data)

;; "temp___result_697"
(define-fun temp___result_697 () us_rep3
  (model1 data first_available))

;; "model'result'unused"
(define-fun modelqtresultqtunused3 () us_rep3
  temp___result_697)

;; "Assume"
(assert (model__function_guard temp___result_697 data first_available))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 next_avail))

;; "o"
(define-fun o7 () us_rep3
  (model1 data first_available))

;; "H"
(assert (model__function_guard o7 data first_available))

;; "H"
(assert true)

;; "H"
(assert (= (model_is_well_formed o7 data first_available) true))

;; "model'result'unused"
(define-fun modelqtresultqtunused4 () us_rep3
  o7)

;; "o"
(define-fun o8 () us_split_fields2
  (us_split_fields3 o7))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused3 () us_split_fields2
  o8)

;; "list_mod_allocator__alloc__ma__assume"
(define-fun list_mod_allocator__alloc__ma__assume () us_rep1
  (rec__list_mod_allocator__m__t__available o8))

;; "rec__list_mod_allocator__m__t__available'result'unused"
(define-fun rec__list_mod_allocator__m__t__availableqtresultqtunused2 
  () us_rep1
  list_mod_allocator__alloc__ma__assume)

;; "Assume"
(assert (= list_mod_allocator__alloc__ma__assume ma))

;; "Assume"
(assert true)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  first_available)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused1 () Bool
  (ite (= first_available 0) true false))

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch (ite (= first_available 0) false true)))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (= spark__branch true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused4 () Int
  first_available)

(declare-const res1 Int)

;; "res'unused"
(define-fun resqtunused () int__ref
  (int__refqtmk res1))

;; "H"
(assert (= res1 first_available))

;; "Assert"
(assert (and (<= 1 first_available) (<= first_available 10000)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  first_available)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused3 () (Array Int us_rep)
  data)

;; "o"
(define-fun o9 () us_rep
  (select data first_available))

;; "get'result'unused"
(define-fun getqtresultqtunused () us_rep
  o9)

;; "o"
(define-fun o10 () us_split_fields
  (us_split_fields1 o9))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused4 () us_split_fields
  o10)

;; "o"
(define-fun o11 () resource
  (rec__list_mod_allocator__cell__next o10))

;; "rec__list_mod_allocator__cell__next'result'unused"
(define-fun rec__list_mod_allocator__cell__nextqtresultqtunused () resource
  o11)

(declare-const o12 Int)

;; "Ensures"
(assert (= (to_rep o11) o12))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused () Int
  o12)

(declare-const next_avail1 Int)

;; "next_avail'unused"
(define-fun next_availqtunused1 () int__ref
  (int__refqtmk next_avail1))

;; "H"
(assert (= next_avail1 o12))

(declare-const o13 status)

;; "Ensures"
(assert (= (to_rep1 o13) 1))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused () status
  o13)

;; "o"
(define-fun o14 () us_split_fields
  (us_split_fieldsqtmk o13 rliteral))

;; "__split_fields'mk'result'unused"
(define-fun us_split_fieldsqtmkqtresultqtunused () us_split_fields
  o14)

;; "o"
(define-fun o15 () us_rep
  (us_repqtmk o14))

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused () us_rep
  o15)

;; "Assert"
(assert (and (<= 1 res1) (<= res1 10000)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  res1)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused4 () (Array Int us_rep)
  data)

;; "o"
(define-fun o16 () (Array Int us_rep)
  (store data res1 o15))

;; "set'result'unused"
(define-fun setqtresultqtunused () (Array Int us_rep)
  o16)

(declare-const data1 (Array Int us_rep))

;; "data'unused"
(define-fun dataqtunused1 () map__ref
  (map__refqtmk data1))

;; "H"
(assert (= data1 o16))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  next_avail1)

(declare-const first_available1 Int)

;; "first_available'unused"
(define-fun first_availableqtunused1 () int__ref
  (int__refqtmk first_available1))

;; "H"
(assert (= first_available1 next_avail1))

;; "Assert"
(assert
  (forall ((r Int))
    (=>
      (and (<= 1 r) (<= r 10000))
      (=>
        (and
          (= (to_rep1
               (rec__list_mod_allocator__cell__stat
                 (us_split_fields1 (select data1 r)))) 0)
          (not
            (= (to_rep
                 (rec__list_mod_allocator__cell__next
                   (us_split_fields1 (select data1 r)))) 0)))
        (= (to_rep1
             (rec__list_mod_allocator__cell__stat
               (us_split_fields1
                 (select data1 (to_rep
                                 (rec__list_mod_allocator__cell__next
                                   (us_split_fields1 (select data1 r)))))))) 0)))))

;; "list_mod_allocator__alloc__R110b__assume"
(define-fun list_mod_allocator__alloc__R110b__assume () us_rep3
  (model1 data1 first_available1))

;; "H"
(assert
  (model__function_guard
    list_mod_allocator__alloc__R110b__assume
    data1
    first_available1))

;; "H"
(assert true)

;; "H"
(assert
  (= (model_is_well_formed
       list_mod_allocator__alloc__R110b__assume
       data1
       first_available1) true))

;; "model'result'unused"
(define-fun modelqtresultqtunused5 () us_rep3
  list_mod_allocator__alloc__R110b__assume)

;; "Assume"
(assert (= list_mod_allocator__alloc__R110b__assume r110b))

;; "Assume"
(assert true)

;; "o"
(define-fun o17 () us_split_fields2
  (us_split_fields3 r110b))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused5 () us_split_fields2
  o17)

;; "o"
(define-fun o18 () us_rep1
  (rec__list_mod_allocator__m__t__available o17))

;; "rec__list_mod_allocator__m__t__available'result'unused"
(define-fun rec__list_mod_allocator__m__t__availableqtresultqtunused3 
  () us_rep1
  o18)

;; "list_mod_allocator__alloc__B111b__L_4__R112b__assume"
(define-fun list_mod_allocator__alloc__B111b__L_4__R112b__assume () Int
  (last o18))

;; "Ensures"
(assert (in_range3 list_mod_allocator__alloc__B111b__L_4__R112b__assume))

;; "last'result'unused"
(define-fun lastqtresultqtunused () Int
  list_mod_allocator__alloc__B111b__L_4__R112b__assume)

;; "Assume"
(assert (= list_mod_allocator__alloc__B111b__L_4__R112b__assume r112b))

;; "Assume"
(assert (in_range3 r112b))

;; "temp___684"
(define-fun temp___684 () Int
  r112b)

(declare-const i Int)

;; "i'unused"
(define-fun iqtunused () int__ref
  (int__refqtmk i))

;; "H"
(assert (= i 1))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused8 () Int
  i)

;; "o"
(define-fun o19 () Bool
  (ite (<= i temp___684) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused () Bool
  o19)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  i)

;; "o"
(define-fun o20 () Bool
  (ite (<= 1 i) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused1 () Bool
  o20)

;; "o"
(define-fun o21 () Bool
  (and o20 o19))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o21)

;; "H"
(assert (= o21 true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  i)

;; "o"
(define-fun o22 () Int
  (+ i 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o22)

;; "Ensures"
(assert (in_range o22))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o22)

;; "o"
(define-fun o23 () Int
  (last ma))

;; "Ensures"
(assert (in_range3 o23))

;; "last'result'unused"
(define-fun lastqtresultqtunused1 () Int
  o23)

;; "infix >='result'unused"
(define-fun infix_gteqqtresultqtunused () Bool
  (ite (<= o22 o23) true false))

(declare-const i1 Int)

;; "i'unused"
(define-fun iqtunused1 () int__ref
  (int__refqtmk i1))

;; "LoopInvariant"
(assert (<= (+ i1 1) (last ma)))

;; "LoopInvariant"
(assert
  (forall ((j Int))
    (=>
      (and (<= 1 j) (<= j i1))
      (= (get
           (rec__list_mod_allocator__m__t__available
             (us_split_fields3 r110b))
           j) (get ma (+ j 1))))))

;; "LoopInvariant"
(assert
  (forall ((j Int))
    (=>
      (and (<= 2 j) (<= j (+ i1 1)))
      (= (get
           (rec__list_mod_allocator__m__t__available
             (us_split_fields3 r110b))
           (- j 1)) (get ma j)))))

;; "Assume"
(assert (and (<= 1 i1) (<= i1 r112b)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused11 () Int
  i1)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused2 () Bool
  (ite (= i1 temp___684) true false))

;; "H"
(assert (not (= i1 temp___684)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused12 () Int
  i1)

;; "o"
(define-fun o24 () Int
  (+ i1 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o24)

(declare-const i2 Int)

;; "i'unused"
(define-fun iqtunused2 () int__ref
  (int__refqtmk i2))

;; "H"
(assert (= i2 o24))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused13 () Int
  i2)

;; "o"
(define-fun o25 () Int
  (+ i2 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused2 () Int
  o25)

;; "Ensures"
(assert (in_range o25))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o25)

;; "o"
(define-fun o26 () Int
  (last ma))

;; "Ensures"
(assert (in_range3 o26))

;; "last'result'unused"
(define-fun lastqtresultqtunused2 () Int
  o26)

;; "infix >='result'unused"
(define-fun infix_gteqqtresultqtunused1 () Bool
  (ite (<= o25 o26) true false))

;; "LoopInvariant"
(assert (<= (+ i2 1) (last ma)))

(declare-const j Int)

;; "H"
(assert (<= 1 j))

;; "H"
(assert (<= j i2))

;; Goal "def'vc"
;; File "list_mod_allocator.ads", line 84, characters 0-0
(assert
  (not
  (= (get
       (rec__list_mod_allocator__m__t__available (us_split_fields3 r110b))
       j) (get ma (+ j 1)))))

(check-sat)
