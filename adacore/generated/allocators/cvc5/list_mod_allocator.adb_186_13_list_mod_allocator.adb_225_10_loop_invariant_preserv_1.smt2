;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

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

(declare-datatypes ((us_split_fields 0))
  (((us_split_fieldsqtmk
    (rec__list_mod_allocator__cell__stat status)(rec__list_mod_allocator__cell__next resource)))))

(declare-datatypes ((us_rep 0))
  (((us_repqtmk (us_split_fields1 us_split_fields)))))

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

(declare-sort us_rep2 0)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "alignment_axiom"
(assert (<= 0 alignment2))

(declare-const dummy2 us_rep2)

;; "contains"
(declare-fun contains (us_rep2
  Int) Bool)

(declare-datatypes ((us_split_fields2 0))
  (((us_split_fieldsqtmk1
    (rec__list_mod_allocator__m__t__available us_rep1)(rec__list_mod_allocator__m__t__allocated us_rep2)))))

(declare-datatypes ((us_rep3 0))
  (((us_repqtmk1 (us_split_fields3 us_split_fields2)))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "alignment_axiom"
(assert (<= 0 alignment3))

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

(declare-const dummy3 us_rep3)

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
(declare-fun contains1 (us_rep1
  Int) Bool)

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; "value__size_axiom"
(assert (<= 0 value__size4))

;; "object__size_axiom"
(assert (<= 0 object__size4))

;; "alignment_axiom"
(assert (<= 0 alignment4))

(declare-const dummy4 Int)

;; "length"
(define-fun length ((param__container us_rep1)) Int
  (- (+ (last param__container) 1) 1))

(declare-const res Int)

(declare-const ma us_rep1)

(declare-const r126b us_rep3)

(declare-const r128b Int)

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
           (= (contains1 param__s param__e) true)
           (exists ((i Int))
             (and
               (and (<= 1 i) (<= i (last param__s)))
               (= (get param__s i) param__e)))) :pattern ((contains1
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
                         (= (contains1
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
                         (and (in_range1 e) (= (contains alloc e) true))
                         (in_range4 e))))
                   (forall ((r Int))
                     (=>
                       (and (<= 1 r) (<= r 10000))
                       (ite (= (to_rep1
                                 (rec__list_mod_allocator__cell__stat
                                   (us_split_fields1
                                     (select List_mod_allocator__data___data___ r)))) 0)
                         (not (= (contains alloc r) true))
                         (and
                           (not (= (contains1 avail r) true))
                           (= (contains alloc r) true))))))))) :pattern (
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
                         (= (contains1
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
            (not (= (contains param__container param__item) true))))
        (forall ((e Int))
          (=>
            (and (in_range1 e) (= (contains param__container e) true))
            (not (= param__item e))))))))

;; Goal "def'vc"
;; File "list_mod_allocator.ads", line 104, characters 0-0
(assert
  (not
  (forall ((data (Array Int us_rep)) (first_available Int))
    (=>
      (in_range1 first_available)
      (=>
        (in_range1 res)
        (=>
          (= (is_valid data first_available) true)
          (let ((o (model1 data first_available)))
            (=>
              (and
                (model__function_guard o data first_available)
                (= (model_is_well_formed o data first_available) true))
              (=>
                (model__function_guard
                  (model1 data first_available)
                  data
                  first_available)
                (=>
                  (model__function_guard
                    (model1 data first_available)
                    data
                    first_available)
                  (=>
                    (model__function_guard
                      (model1 data first_available)
                      data
                      first_available)
                    (let ((o1 (model1 data first_available)))
                      (=>
                        (and
                          (model__function_guard o1 data first_available)
                          (= (model_is_well_formed o1 data first_available) true))
                        (=>
                          (= (rec__list_mod_allocator__m__t__available
                               (us_split_fields3 o1)) ma)
                          (forall ((o2 Bool))
                            (=>
                              (ite (not (= res 0))
                                (and
                                  (and (<= 1 res) (<= res 10000))
                                  (exists ((o3 Int))
                                    (and
                                      (= (to_rep1
                                           (rec__list_mod_allocator__cell__stat
                                             (us_split_fields1
                                               (select data res)))) o3)
                                      (= o2 (ite (= o3 1) true false)))))
                                (= o2 false))
                              (forall ((spark__branch Bool))
                                (=>
                                  (= spark__branch o2)
                                  (=>
                                    (= spark__branch true)
                                    (forall ((o3 resource))
                                      (=>
                                        (= (to_rep o3) first_available)
                                        (forall ((o4 status))
                                          (=>
                                            (= (to_rep1 o4) 0)
                                            (=>
                                              (and (<= 1 res) (<= res 10000))
                                              (forall ((data1 (Array Int us_rep)))
                                                (=>
                                                  (= data1 (store data 
                                                  res (us_repqtmk
                                                        (us_split_fieldsqtmk
                                                          o4
                                                          o3))))
                                                  (forall ((first_available1 Int))
                                                    (=>
                                                      (= first_available1 
                                                      res)
                                                      (let ((list_mod_allocator__free__R126b__assume 
                                                        (model1
                                                          data1
                                                          first_available1)))
                                                        (=>
                                                          (and
                                                            (model__function_guard
                                                              list_mod_allocator__free__R126b__assume
                                                              data1
                                                              first_available1)
                                                            (= (model_is_well_formed
                                                                 list_mod_allocator__free__R126b__assume
                                                                 data1
                                                                 first_available1) true))
                                                          (=>
                                                            (= list_mod_allocator__free__R126b__assume 
                                                            r126b)
                                                            (let ((list_mod_allocator__free__B127b__L_4__R128b__assume 
                                                              (last
                                                                ma)))
                                                              (=>
                                                                (in_range3
                                                                  list_mod_allocator__free__B127b__L_4__R128b__assume)
                                                                (=>
                                                                  (= list_mod_allocator__free__B127b__L_4__R128b__assume 
                                                                  r128b)
                                                                  (=>
                                                                    (in_range3
                                                                    r128b)
                                                                    (let ((temp___712 
                                                                    r128b))
                                                                    (forall 
                                                                    ((i Int))
                                                                    (=>
                                                                    (= i 1)
                                                                    (=>
                                                                    (= (and 
                                                                    (ite (<= 1 i)
                                                                    true
                                                                    false) 
                                                                    (ite (<= i temp___712)
                                                                    true
                                                                    false)) true)
                                                                    (=>
                                                                    (in_range
                                                                    (+ i 1))
                                                                    (=>
                                                                    (in_range3
                                                                    (last
                                                                    (rec__list_mod_allocator__m__t__available
                                                                    (us_split_fields3
                                                                    r126b))))
                                                                    (forall 
                                                                    ((i1 Int))
                                                                    (=>
                                                                    (and
                                                                    (<= (+ i1 1) 
                                                                    (last
                                                                    (rec__list_mod_allocator__m__t__available
                                                                    (us_split_fields3
                                                                    r126b))))
                                                                    (and
                                                                    (forall 
                                                                    ((j Int))
                                                                    (=>
                                                                    (and
                                                                    (<= 1 j)
                                                                    (<= j i1))
                                                                    (= 
                                                                    (get
                                                                    ma
                                                                    j) 
                                                                    (get
                                                                    (rec__list_mod_allocator__m__t__available
                                                                    (us_split_fields3
                                                                    r126b))
                                                                    (+ j 1)))))
                                                                    (forall 
                                                                    ((j Int))
                                                                    (=>
                                                                    (and
                                                                    (<= 2 j)
                                                                    (<= j (+ i1 1)))
                                                                    (= 
                                                                    (get
                                                                    ma
                                                                    (- j 1)) 
                                                                    (get
                                                                    (rec__list_mod_allocator__m__t__available
                                                                    (us_split_fields3
                                                                    r126b))
                                                                    j))))))
                                                                    (=>
                                                                    (and
                                                                    (<= 1 i1)
                                                                    (<= i1 
                                                                    r128b))
                                                                    (=>
                                                                    (not
                                                                    (= i1 temp___712))
                                                                    (forall 
                                                                    ((i2 Int))
                                                                    (=>
                                                                    (= i2 (+ i1 1))
                                                                    (=>
                                                                    (in_range
                                                                    (+ i2 1))
                                                                    (=>
                                                                    (in_range3
                                                                    (last
                                                                    (rec__list_mod_allocator__m__t__available
                                                                    (us_split_fields3
                                                                    r126b))))
                                                                    (=>
                                                                    (<= (+ i2 1) 
                                                                    (last
                                                                    (rec__list_mod_allocator__m__t__available
                                                                    (us_split_fields3
                                                                    r126b))))
                                                                    (forall 
                                                                    ((j Int))
                                                                    (=>
                                                                    (and
                                                                    (<= 1 j)
                                                                    (<= j i2))
                                                                    (= 
                                                                    (get
                                                                    ma
                                                                    j) 
                                                                    (get
                                                                    (rec__list_mod_allocator__m__t__available
                                                                    (us_split_fields3
                                                                    r126b))
                                                                    (+ j 1)))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
