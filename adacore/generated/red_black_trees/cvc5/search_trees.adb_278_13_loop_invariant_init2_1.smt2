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
  (or (= x 0) (= x 1)))

(declare-sort natural 0)

;; "natural'int"
(declare-fun naturalqtint (natural) Int)

;; "natural'axiom"
(assert
  (forall ((i natural))
    (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "to_rep"
(define-fun to_rep ((x natural)) Int
  (naturalqtint x))

;; "of_rep"
(declare-fun of_rep (Int) natural)

;; "inversion_axiom"
(assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-sort extended_index_type 0)

;; "extended_index_type'int"
(declare-fun extended_index_typeqtint (extended_index_type) Int)

;; "extended_index_type'axiom"
(assert
  (forall ((i extended_index_type))
    (and
      (<= 0 (extended_index_typeqtint i))
      (<= (extended_index_typeqtint i) 100))))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 100)))

;; "to_rep"
(define-fun to_rep1 ((x extended_index_type)) Int
  (extended_index_typeqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) extended_index_type)

;; "inversion_axiom"
(assert
  (forall ((x extended_index_type))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x extended_index_type))
    (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-sort position_type 0)

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 2)))

;; "to_rep"
(declare-fun to_rep2 (position_type) Int)

;; "of_rep"
(declare-fun of_rep2 (Int) position_type)

;; "inversion_axiom"
(assert
  (forall ((x position_type))
    (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; "range_axiom"
(assert
  (forall ((x position_type))
    (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                  (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
  (((us_split_fieldsqtmk
    (rec__binary_trees__cell__left extended_index_type)(rec__binary_trees__cell__right extended_index_type)(rec__binary_trees__cell__parent extended_index_type)(rec__binary_trees__cell__position position_type)))))

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

(declare-const binary_trees__cell__left__first__bit Int)

(declare-const binary_trees__cell__left__last__bit Int)

(declare-const binary_trees__cell__left__position Int)

;; "binary_trees__cell__left__first__bit_axiom"
(assert (<= 0 binary_trees__cell__left__first__bit))

;; "binary_trees__cell__left__last__bit_axiom"
(assert
  (< binary_trees__cell__left__first__bit binary_trees__cell__left__last__bit))

;; "binary_trees__cell__left__position_axiom"
(assert (<= 0 binary_trees__cell__left__position))

(declare-const binary_trees__cell__right__first__bit Int)

(declare-const binary_trees__cell__right__last__bit Int)

(declare-const binary_trees__cell__right__position Int)

;; "binary_trees__cell__right__first__bit_axiom"
(assert (<= 0 binary_trees__cell__right__first__bit))

;; "binary_trees__cell__right__last__bit_axiom"
(assert
  (< binary_trees__cell__right__first__bit binary_trees__cell__right__last__bit))

;; "binary_trees__cell__right__position_axiom"
(assert (<= 0 binary_trees__cell__right__position))

(declare-const binary_trees__cell__parent__first__bit Int)

(declare-const binary_trees__cell__parent__last__bit Int)

(declare-const binary_trees__cell__parent__position Int)

;; "binary_trees__cell__parent__first__bit_axiom"
(assert (<= 0 binary_trees__cell__parent__first__bit))

;; "binary_trees__cell__parent__last__bit_axiom"
(assert
  (< binary_trees__cell__parent__first__bit binary_trees__cell__parent__last__bit))

;; "binary_trees__cell__parent__position_axiom"
(assert (<= 0 binary_trees__cell__parent__position))

(declare-const binary_trees__cell__position__first__bit Int)

(declare-const binary_trees__cell__position__last__bit Int)

(declare-const binary_trees__cell__position__position Int)

;; "binary_trees__cell__position__first__bit_axiom"
(assert (<= 0 binary_trees__cell__position__first__bit))

;; "binary_trees__cell__position__last__bit_axiom"
(assert
  (< binary_trees__cell__position__first__bit binary_trees__cell__position__last__bit))

;; "binary_trees__cell__position__position_axiom"
(assert (<= 0 binary_trees__cell__position__position))

(declare-const dummy us_rep)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "component__size_axiom"
(assert (<= 0 component__size))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-datatypes ((us_split_fields2 0))
  (((us_split_fieldsqtmk1
    (rec__binary_trees__forest__s extended_index_type)(rec__binary_trees__forest__c (Array Int us_rep))))))

(declare-datatypes ((us_rep1 0))
  (((us_repqtmk1 (us_split_fields3 us_split_fields2)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "alignment_axiom"
(assert (<= 0 alignment2))

(declare-const binary_trees__forest__s__first__bit Int)

(declare-const binary_trees__forest__s__last__bit Int)

(declare-const binary_trees__forest__s__position Int)

;; "binary_trees__forest__s__first__bit_axiom"
(assert (<= 0 binary_trees__forest__s__first__bit))

;; "binary_trees__forest__s__last__bit_axiom"
(assert
  (< binary_trees__forest__s__first__bit binary_trees__forest__s__last__bit))

;; "binary_trees__forest__s__position_axiom"
(assert (<= 0 binary_trees__forest__s__position))

(declare-const binary_trees__forest__c__first__bit Int)

(declare-const binary_trees__forest__c__last__bit Int)

(declare-const binary_trees__forest__c__position Int)

;; "binary_trees__forest__c__first__bit_axiom"
(assert (<= 0 binary_trees__forest__c__first__bit))

;; "binary_trees__forest__c__last__bit_axiom"
(assert
  (< binary_trees__forest__c__first__bit binary_trees__forest__c__last__bit))

;; "binary_trees__forest__c__position_axiom"
(assert (<= 0 binary_trees__forest__c__position))

(declare-const dummy1 us_rep1)

;; "valid_root"
(declare-fun valid_root (us_rep1
  Int) Bool)

;; "size"
(declare-fun size (us_rep1) Int)

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

(declare-const dummy2 us_rep2)

;; "last"
(declare-fun last (us_rep2) Int)

;; "in_range"
(define-fun in_range4 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "get"
(declare-fun get (us_rep2
  Int) Int)

;; "in_range"
(define-fun in_range5 ((x Int)) Bool
  (and (<= 0 x) (<= x 1)))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; "value__size_axiom"
(assert (<= 0 value__size4))

;; "object__size_axiom"
(assert (<= 0 object__size4))

;; "alignment_axiom"
(assert (<= 0 alignment4))

(declare-const dummy3 Int)

;; "length"
(define-fun length ((param__container us_rep2)) Int
  (- (+ (last param__container) 1) 1))

;; "oeq"
(define-fun oeq ((param__left us_rep2) (param__right us_rep2)) Bool
  (and (= (length param__left) (length param__right)) (ite (forall ((n Int))
                                                             (=>
                                                               (and
                                                                 (<= 1 n)
                                                                 (<= n 
                                                                 (last
                                                                   param__left)))
                                                               (= (get
                                                                    param__left
                                                                    n) 
                                                               (get
                                                                 param__right
                                                                 n))))
                                                        true
                                                        false)))

;; "olt"
(define-fun olt ((param__left us_rep2) (param__right us_rep2)) Bool
  (and (< (length param__left) (length param__right)) (ite (forall ((n Int))
                                                             (=>
                                                               (and
                                                                 (<= 1 n)
                                                                 (<= n 
                                                                 (last
                                                                   param__left)))
                                                               (= (get
                                                                    param__left
                                                                    n) 
                                                               (get
                                                                 param__right
                                                                 n))))
                                                        true
                                                        false)))

(declare-datatypes ((us_split_fields4 0))
  (((us_split_fieldsqtmk2
    (rec__tree_model__path_type__a us_rep2)(rec__tree_model__path_type__k Bool)))))

(declare-datatypes ((us_rep3 0))
  (((us_repqtmk2 (us_split_fields5 us_split_fields4)))))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; "value__size_axiom"
(assert (<= 0 value__size5))

;; "object__size_axiom"
(assert (<= 0 object__size5))

;; "alignment_axiom"
(assert (<= 0 alignment5))

(declare-const tree_model__path_type__a__first__bit Int)

(declare-const tree_model__path_type__a__last__bit Int)

(declare-const tree_model__path_type__a__position Int)

;; "tree_model__path_type__a__first__bit_axiom"
(assert (<= 0 tree_model__path_type__a__first__bit))

;; "tree_model__path_type__a__last__bit_axiom"
(assert
  (< tree_model__path_type__a__first__bit tree_model__path_type__a__last__bit))

;; "tree_model__path_type__a__position_axiom"
(assert (<= 0 tree_model__path_type__a__position))

(declare-const tree_model__path_type__k__first__bit Int)

(declare-const tree_model__path_type__k__last__bit Int)

(declare-const tree_model__path_type__k__position Int)

;; "tree_model__path_type__k__first__bit_axiom"
(assert (<= 0 tree_model__path_type__k__first__bit))

;; "tree_model__path_type__k__last__bit_axiom"
(assert
  (< tree_model__path_type__k__first__bit tree_model__path_type__k__last__bit))

;; "tree_model__path_type__k__position_axiom"
(assert (<= 0 tree_model__path_type__k__position))

(declare-const dummy4 us_rep3)

;; "model"
(declare-fun model1 (us_rep1
  Int) (Array Int us_rep3))

;; "parent"
(declare-fun parent (us_rep1
  Int) Int)

;; "position"
(declare-fun position (us_rep1
  Int) Int)

;; "is_add"
(declare-fun is_add (us_rep2
  Int
  us_rep2) Bool)

;; "in_range"
(define-fun in_range6 ((x Int)) Bool
  (and (<= 1 x) (<= x 100)))

(declare-const value__size6 Int)

(declare-const object__size6 Int)

(declare-const component__size1 Int)

(declare-const alignment6 Int)

;; "value__size_axiom"
(assert (<= 0 value__size6))

;; "object__size_axiom"
(assert (<= 0 object__size6))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment6))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_403 (Array Int us_rep3)) (temp___is_init_399 Bool) (temp___skip_constant_400 Bool) (temp___do_toplevel_401 Bool) (temp___do_typ_inv_402 Bool)) Bool
  (forall ((temp___404 Int))
    (=>
      (and (<= 1 temp___404) (<= temp___404 100))
      (< (length
           (rec__tree_model__path_type__a
             (us_split_fields5 (select temp___expr_403 temp___404)))) 100))))

;; "ordered_prefix"
(declare-fun ordered_prefix ((Array Int us_rep3)
  (Array Int natural)
  Int
  Int) Bool)

;; "ordered_leafs"
(declare-fun ordered_leafs (us_rep1
  Int
  (Array Int natural)) Bool)

;; "ole"
(define-fun ole ((param__left us_rep2) (param__right us_rep2)) Bool
  (and (<= (length param__left) (length param__right)) (ite (forall ((n Int))
                                                              (=>
                                                                (and
                                                                  (<= 1 n)
                                                                  (<= n 
                                                                  (last
                                                                    param__left)))
                                                                (= (get
                                                                    param__left
                                                                    n) 
                                                                (get
                                                                  param__right
                                                                  n))))
                                                         true
                                                         false)))

(declare-const f us_rep1)

(declare-const f_old us_rep1)

(declare-const root Int)

(declare-const v Int)

(declare-const values (Array Int natural))

;; "is_concat"
(declare-fun is_concat (us_rep2
  us_rep2
  us_rep2) Bool)

;; "tree_structure"
(declare-fun tree_structure (us_rep1) Bool)

;; "dynamic_invariant"
(define-fun dynamic_invariant1 ((temp___expr_274 us_rep1) (temp___is_init_270 Bool) (temp___skip_constant_271 Bool) (temp___do_toplevel_272 Bool) (temp___do_typ_inv_273 Bool)) Bool
  (=>
    (= temp___do_typ_inv_273 true)
    (= (tree_structure temp___expr_274) true)))

(declare-const value__size7 Int)

(declare-const object__size7 Int)

(declare-const component__size2 Int)

(declare-const alignment7 Int)

;; "value__size_axiom"
(assert (<= 0 value__size7))

;; "object__size_axiom"
(assert (<= 0 object__size7))

;; "component__size_axiom"
(assert (<= 0 component__size2))

;; "alignment_axiom"
(assert (<= 0 alignment7))

;; "size__post_axiom"
(assert
  (forall ((param__f us_rep1))
    (! (=>
         (dynamic_invariant1 param__f true false true true)
         (in_range2 (size param__f))) :pattern ((size param__f)) )))

;; "valid_root__post_axiom"
(assert
  (forall ((param__f us_rep1))
    (forall ((param__i Int))
      (! (=>
           (and
             (dynamic_invariant1 param__f true false true true)
             (in_range6 param__i))
           (=>
             (< (size param__f) param__i)
             (not (= (valid_root param__f param__i) true)))) :pattern (
      (valid_root
        param__f
        param__i)) ))))

;; "parent__post_axiom"
(assert
  (forall ((param__f us_rep1))
    (forall ((param__i Int))
      (! (=>
           (and
             (dynamic_invariant1 param__f true false true true)
             (in_range6 param__i))
           (let ((result (parent param__f param__i)))
             (and
               (and
                 (=> (= (valid_root param__f param__i) true) (= result 0))
                 (=> (= (size param__f) 0) (= result 0)))
               (in_range2 result)))) :pattern ((parent param__f param__i)) ))))

;; "position__post_axiom"
(assert
  (forall ((param__f us_rep1))
    (forall ((param__i Int))
      (! (=>
           (and
             (and
               (dynamic_invariant1 param__f true false true true)
               (in_range6 param__i))
             (not (= (parent param__f param__i) 0)))
           (in_range5 (position param__f param__i))) :pattern ((position
                                                                 param__f
                                                                 param__i)) ))))

;; "last__post_axiom"
(assert
  (forall ((param__container us_rep2))
    (! (in_range4 (last param__container)) :pattern ((last param__container)) )))

;; "get__post_axiom"
(assert
  (forall ((param__container us_rep2))
    (forall ((param__position Int))
      (! (=>
           (and
             (in_range4 param__position)
             (and
               (<= 1 param__position)
               (<= param__position (last param__container))))
           (in_range5 (get param__container param__position))) :pattern (
      (get
        param__container
        param__position)) ))))

;; "is_add__post_axiom"
(assert true)

;; "is_add__def_axiom"
(assert
  (forall ((param__s1 us_rep2) (param__s2 us_rep2))
    (forall ((param__d Int))
      (! (=
           (= (is_add param__s1 param__d param__s2) true)
           (and
             (and
               (= (- (length param__s2) 1) (length param__s1))
               (= (olt param__s1 param__s2) true))
             (= (get param__s2 (last param__s2)) param__d))) :pattern (
      (is_add
        param__s1
        param__d
        param__s2)) ))))

;; "model__post_axiom"
(assert
  (forall ((param__f us_rep1))
    (forall ((param__root Int))
      (! (=>
           (and
             (and
               (dynamic_invariant1 param__f true false true true)
               (in_range6 param__root))
             (= (valid_root param__f param__root) true))
           (let ((result (model1 param__f param__root)))
             (and
               (and
                 (and
                   (and
                     (and
                       (= (rec__tree_model__path_type__k
                            (us_split_fields5 (select result param__root))) true)
                       (= (last
                            (rec__tree_model__path_type__a
                              (us_split_fields5 (select result param__root)))) 0))
                     (forall ((i Int))
                       (=>
                         (and (<= 1 i) (<= i 100))
                         (=>
                           (not (= i param__root))
                           (ite (and
                                  (not (= (parent param__f i) 0))
                                  (= (rec__tree_model__path_type__k
                                       (us_split_fields5
                                         (select result (parent param__f i)))) true))
                             (= (rec__tree_model__path_type__k
                                  (us_split_fields5 (select result i))) true)
                             (not
                               (= (rec__tree_model__path_type__k
                                    (us_split_fields5 (select result i))) true)))))))
                   (forall ((i Int))
                     (=>
                       (and (<= 1 i) (<= i 100))
                       (ite (and
                              (= (rec__tree_model__path_type__k
                                   (us_split_fields5 (select result i))) true)
                              (not (= i param__root)))
                         (= (is_add
                              (rec__tree_model__path_type__a
                                (us_split_fields5
                                  (select result (parent param__f i))))
                              (position param__f i)
                              (rec__tree_model__path_type__a
                                (us_split_fields5 (select result i)))) true)
                         (= (last
                              (rec__tree_model__path_type__a
                                (us_split_fields5 (select result i)))) 0)))))
                 (forall ((i Int))
                   (=>
                     (and (<= 1 i) (<= i 100))
                     (=>
                       (= (rec__tree_model__path_type__k
                            (us_split_fields5 (select result i))) true)
                       (forall ((j Int))
                         (=>
                           (and (<= 1 j) (<= j 100))
                           (=>
                             (and
                               (= (rec__tree_model__path_type__k
                                    (us_split_fields5 (select result j))) true)
                               (= (oeq
                                    (rec__tree_model__path_type__a
                                      (us_split_fields5 (select result i)))
                                    (rec__tree_model__path_type__a
                                      (us_split_fields5 (select result j)))) true))
                             (= j i))))))))
               (dynamic_invariant result true false true true)))) :pattern (
      (model1
        param__f
        param__root)) ))))

;; "ordered_prefix__post_axiom"
(assert
  (forall ((param__model (Array Int us_rep3)))
    (forall ((param__values (Array Int natural)))
      (forall ((param__i Int) (param__j Int))
        (! (=>
             (and
               (and
                 (and
                   (dynamic_invariant param__model true false true true)
                   (in_range6 param__i))
                 (in_range6 param__j))
               (and
                 (and
                   (= (rec__tree_model__path_type__k
                        (us_split_fields5 (select param__model param__i))) true)
                   (= (rec__tree_model__path_type__k
                        (us_split_fields5 (select param__model param__j))) true))
                 (= (olt
                      (rec__tree_model__path_type__a
                        (us_split_fields5 (select param__model param__i)))
                      (rec__tree_model__path_type__a
                        (us_split_fields5 (select param__model param__j)))) true)))
             (in_range
               (ite (ordered_prefix
                      param__model
                      param__values
                      param__i
                      param__j) 1 0))) :pattern ((ordered_prefix
                                                   param__model
                                                   param__values
                                                   param__i
                                                   param__j)) )))))

;; "ordered_prefix__def_axiom"
(assert
  (forall ((param__model (Array Int us_rep3)))
    (forall ((param__values (Array Int natural)))
      (forall ((param__i Int) (param__j Int))
        (! (=
             (= (ordered_prefix param__model param__values param__i param__j) true)
             (ite (= (get
                       (rec__tree_model__path_type__a
                         (us_split_fields5 (select param__model param__j)))
                       (+ (last
                            (rec__tree_model__path_type__a
                              (us_split_fields5
                                (select param__model param__i)))) 1)) 0)
               (< (to_rep (select param__values param__j)) (to_rep
                                                             (select param__values param__i)))
               (< (to_rep (select param__values param__i)) (to_rep
                                                             (select param__values param__j))))) :pattern (
        (ordered_prefix
          param__model
          param__values
          param__i
          param__j)) )))))

;; "ordered_leafs__post_axiom"
(assert
  (forall ((param__f us_rep1))
    (forall ((param__root Int))
      (forall ((param__values (Array Int natural)))
        (! (=>
             (and
               (and
                 (dynamic_invariant1 param__f true false true true)
                 (in_range6 param__root))
               (= (valid_root param__f param__root) true))
             (in_range
               (ite (ordered_leafs param__f param__root param__values) 1 0))) :pattern (
        (ordered_leafs
          param__f
          param__root
          param__values)) )))))

;; "ordered_leafs__def_axiom"
(assert
  (forall ((param__f us_rep1))
    (forall ((param__root Int))
      (forall ((param__values (Array Int natural)))
        (! (=
             (= (ordered_leafs param__f param__root param__values) true)
             (forall ((i Int))
               (=>
                 (and (<= 1 i) (<= i 100))
                 (forall ((j Int))
                   (=>
                     (and (<= 1 j) (<= j 100))
                     (=>
                       (and
                         (and
                           (= (rec__tree_model__path_type__k
                                (us_split_fields5
                                  (let ((temp___517qtunused (model1
                                                              param__f
                                                              param__root)))
                                    (select (model1 param__f param__root) i)))) true)
                           (= (rec__tree_model__path_type__k
                                (us_split_fields5
                                  (let ((temp___518qtunused (model1
                                                              param__f
                                                              param__root)))
                                    (select (model1 param__f param__root) j)))) true))
                         (= (olt
                              (rec__tree_model__path_type__a
                                (us_split_fields5
                                  (let ((temp___519qtunused (model1
                                                              param__f
                                                              param__root)))
                                    (select (model1 param__f param__root) i))))
                              (rec__tree_model__path_type__a
                                (us_split_fields5
                                  (let ((temp___520qtunused (model1
                                                              param__f
                                                              param__root)))
                                    (select (model1 param__f param__root) j))))) true))
                       (= (ordered_prefix
                            (model1 param__f param__root)
                            param__values
                            i
                            j) true))))))) :pattern ((ordered_leafs
                                                       param__f
                                                       param__root
                                                       param__values)) )))))

;; "tree_structure__post_axiom"
(assert true)

;; "is_concat__post_axiom"
(assert true)

;; "is_concat__def_axiom"
(assert
  (forall ((param__q us_rep2) (param__v us_rep2) (param__p us_rep2))
    (! (=
         (= (is_concat param__q param__v param__p) true)
         (and
           (and
             (and
               (= (- (length param__p) (length param__v)) (length param__q))
               (forall ((i Int))
                 (=>
                   (and (<= 1 i) (<= i (last param__q)))
                   (= (get param__p i) (get param__q i)))))
             (forall ((i Int))
               (=>
                 (and (<= 1 i) (<= i (last param__v)))
                 (= (get param__p (+ i (last param__q))) (get param__v i)))))
           (forall ((i Int))
             (=>
               (and (<= (+ (last param__q) 1) i) (<= i (last param__p)))
               (= (get param__v (- i (last param__q))) (get param__p i)))))) :pattern (
    (is_concat
      param__q
      param__v
      param__p)) )))

;; Goal "def'vc"
;; File "search_trees.adb", line 233, characters 0-0
(assert
  (not
  (=>
    (dynamic_invariant1 f true false true true)
    (=>
      (dynamic_invariant1 f_old true false true true)
      (=>
        (in_range6 root)
        (=>
          (in_range6 v)
          (=>
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (and
                          (and
                            (and
                              (and
                                (= (valid_root f_old root) true)
                                (= (valid_root f root) true))
                              (= (valid_root f v) true))
                            (not (= (valid_root f_old v) true)))
                          (= (rec__tree_model__path_type__k
                               (us_split_fields5
                                 (select (model1 f_old root) v))) true))
                        (= (ordered_leafs f_old root values) true))
                      (forall ((i Int))
                        (=>
                          (and (<= 1 i) (<= i 100))
                          (=>
                            (= (rec__tree_model__path_type__k
                                 (us_split_fields5
                                   (select (model1 f_old root) i))) true)
                            (ite (= (ole
                                      (rec__tree_model__path_type__a
                                        (us_split_fields5
                                          (select (model1 f_old root) 
                                          v)))
                                      (rec__tree_model__path_type__a
                                        (us_split_fields5
                                          (select (model1 f_old root) i)))) true)
                              (= (rec__tree_model__path_type__k
                                   (us_split_fields5 (select (model1 f v) i))) true)
                              (= (rec__tree_model__path_type__k
                                   (us_split_fields5
                                     (select (model1 f root) i))) true))))))
                    (forall ((i Int))
                      (=>
                        (and (<= 1 i) (<= i 100))
                        (=>
                          (= (rec__tree_model__path_type__k
                               (us_split_fields5 (select (model1 f root) i))) true)
                          (= (rec__tree_model__path_type__k
                               (us_split_fields5
                                 (select (model1 f_old root) i))) true)))))
                  (forall ((i Int))
                    (=>
                      (and (<= 1 i) (<= i 100))
                      (=>
                        (and
                          (not (= v 0))
                          (= (rec__tree_model__path_type__k
                               (us_split_fields5 (select (model1 f v) i))) true))
                        (= (rec__tree_model__path_type__k
                             (us_split_fields5
                               (select (model1 f_old root) i))) true)))))
                (forall ((i Int))
                  (=>
                    (and (<= 1 i) (<= i 100))
                    (=>
                      (= (rec__tree_model__path_type__k
                           (us_split_fields5 (select (model1 f root) i))) true)
                      (= (oeq
                           (rec__tree_model__path_type__a
                             (us_split_fields5 (select (model1 f root) i)))
                           (rec__tree_model__path_type__a
                             (us_split_fields5
                               (select (model1 f_old root) i)))) true)))))
              (forall ((i Int))
                (=>
                  (and (<= 1 i) (<= i 100))
                  (=>
                    (and
                      (not (= v 0))
                      (= (rec__tree_model__path_type__k
                           (us_split_fields5 (select (model1 f v) i))) true))
                    (= (is_concat
                         (rec__tree_model__path_type__a
                           (us_split_fields5 (select (model1 f_old root) v)))
                         (rec__tree_model__path_type__a
                           (us_split_fields5 (select (model1 f v) i)))
                         (rec__tree_model__path_type__a
                           (us_split_fields5 (select (model1 f_old root) i)))) true)))))
            (forall ((i Int))
              (=>
                (= i 1)
                (=>
                  (= (and (ite (<= 1 i) true false) (ite (<= i 100)
                                                      true
                                                      false)) true)
                  (forall ((k Int))
                    (=>
                      (and (<= 1 k) (<= k i))
                      (=>
                        (and
                          (= (rec__tree_model__path_type__k
                               (us_split_fields5 (select (model1 f root) k))) true)
                          (= (olt
                               (rec__tree_model__path_type__a
                                 (us_split_fields5
                                   (select (model1 f root) k)))
                               (rec__tree_model__path_type__a
                                 (us_split_fields5
                                   (select (model1 f_old root) v)))) true))
                        (=>
                          (not
                            (= (get
                                 (rec__tree_model__path_type__a
                                   (us_split_fields5
                                     (select (model1 f_old root) v)))
                                 (+ (last
                                      (rec__tree_model__path_type__a
                                        (us_split_fields5
                                          (select (model1 f root) k)))) 1)) 0))
                          (forall ((j Int))
                            (=>
                              (and (<= 1 j) (<= j 100))
                              (=>
                                (= (rec__tree_model__path_type__k
                                     (us_split_fields5
                                       (let ((temp___531qtunused (model1 f v)))
                                         (select (model1 f v) j)))) true)
                                (< (to_rep (select values k)) (to_rep
                                                                (select 
                                                                values j))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
