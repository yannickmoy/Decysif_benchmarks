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

(declare-sort natural 0)

;; "natural'int"
(declare-fun naturalqtint (natural) Int)

;; "natural'axiom"
(assert
  (forall ((i natural))
    (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
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
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

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
  ((us_split_fields
   (us_split_fieldsqtmk
   (rec__cartesian_trees__tree_cell__left natural)(rec__cartesian_trees__tree_cell__right natural)(rec__cartesian_trees__tree_cell__parent natural)))))

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

(declare-const cartesian_trees__tree_cell__left__first__bit Int)

(declare-const cartesian_trees__tree_cell__left__last__bit Int)

(declare-const cartesian_trees__tree_cell__left__position Int)

;; "cartesian_trees__tree_cell__left__first__bit_axiom"
(assert (<= 0 cartesian_trees__tree_cell__left__first__bit))

;; "cartesian_trees__tree_cell__left__last__bit_axiom"
(assert
  (< cartesian_trees__tree_cell__left__first__bit cartesian_trees__tree_cell__left__last__bit))

;; "cartesian_trees__tree_cell__left__position_axiom"
(assert (<= 0 cartesian_trees__tree_cell__left__position))

(declare-const cartesian_trees__tree_cell__right__first__bit Int)

(declare-const cartesian_trees__tree_cell__right__last__bit Int)

(declare-const cartesian_trees__tree_cell__right__position Int)

;; "cartesian_trees__tree_cell__right__first__bit_axiom"
(assert (<= 0 cartesian_trees__tree_cell__right__first__bit))

;; "cartesian_trees__tree_cell__right__last__bit_axiom"
(assert
  (< cartesian_trees__tree_cell__right__first__bit cartesian_trees__tree_cell__right__last__bit))

;; "cartesian_trees__tree_cell__right__position_axiom"
(assert (<= 0 cartesian_trees__tree_cell__right__position))

(declare-const cartesian_trees__tree_cell__parent__first__bit Int)

(declare-const cartesian_trees__tree_cell__parent__last__bit Int)

(declare-const cartesian_trees__tree_cell__parent__position Int)

;; "cartesian_trees__tree_cell__parent__first__bit_axiom"
(assert (<= 0 cartesian_trees__tree_cell__parent__first__bit))

;; "cartesian_trees__tree_cell__parent__last__bit_axiom"
(assert
  (< cartesian_trees__tree_cell__parent__first__bit cartesian_trees__tree_cell__parent__last__bit))

;; "cartesian_trees__tree_cell__parent__position_axiom"
(assert (<= 0 cartesian_trees__tree_cell__parent__position))

(declare-const dummy us_rep)

(declare-datatypes ()
  ((t (tqtmk (rec__first integer)(rec__last integer)))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int us_rep))(rt t)))))

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

(declare-datatypes ()
  ((us_split_discrs
   (us_split_discrsqtmk (rec__cartesian_trees__tree__size natural)))))

(declare-datatypes ()
  ((us_split_fields2
   (us_split_fieldsqtmk1
   (rec__cartesian_trees__tree__root natural)(rec__cartesian_trees__tree__cells us_t)))))

(declare-datatypes ()
  ((us_rep1
   (us_repqtmk1
   (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "alignment_axiom"
(assert (<= 0 alignment2))

(declare-const cartesian_trees__tree__size__first__bit Int)

(declare-const cartesian_trees__tree__size__last__bit Int)

(declare-const cartesian_trees__tree__size__position Int)

;; "cartesian_trees__tree__size__first__bit_axiom"
(assert (<= 0 cartesian_trees__tree__size__first__bit))

;; "cartesian_trees__tree__size__last__bit_axiom"
(assert
  (< cartesian_trees__tree__size__first__bit cartesian_trees__tree__size__last__bit))

;; "cartesian_trees__tree__size__position_axiom"
(assert (<= 0 cartesian_trees__tree__size__position))

(declare-const cartesian_trees__tree__root__first__bit Int)

(declare-const cartesian_trees__tree__root__last__bit Int)

(declare-const cartesian_trees__tree__root__position Int)

;; "cartesian_trees__tree__root__first__bit_axiom"
(assert (<= 0 cartesian_trees__tree__root__first__bit))

;; "cartesian_trees__tree__root__last__bit_axiom"
(assert
  (< cartesian_trees__tree__root__first__bit cartesian_trees__tree__root__last__bit))

;; "cartesian_trees__tree__root__position_axiom"
(assert (<= 0 cartesian_trees__tree__root__position))

(declare-const cartesian_trees__tree__cells__first__bit Int)

(declare-const cartesian_trees__tree__cells__last__bit Int)

(declare-const cartesian_trees__tree__cells__position Int)

;; "cartesian_trees__tree__cells__first__bit_axiom"
(assert (<= 0 cartesian_trees__tree__cells__first__bit))

;; "cartesian_trees__tree__cells__last__bit_axiom"
(assert
  (< cartesian_trees__tree__cells__first__bit cartesian_trees__tree__cells__last__bit))

;; "cartesian_trees__tree__cells__position_axiom"
(assert (<= 0 cartesian_trees__tree__cells__position))

(declare-const dummy1 us_rep1)

(declare-const usf Int)

;; "Ensures"
(assert (in_range usf))

;; "any'result'unused"
(define-fun anyqtresultqtunused () Int
  usf)

(declare-const usf1 us_rep1)

;; "Ensures"
(assert
  (= (to_rep (rec__cartesian_trees__tree__size (us_split_discrs1 usf1))) 
  usf))

;; "any'result'unused"
(define-fun anyqtresultqtunused1 () us_rep1
  usf1)

;; "cartesian_trees__tree__cells__pred'result'unused"
(define-fun cartesian_trees__tree__cells__predqtresultqtunused () Bool
  (ite true true false))

;; "H"
(assert (<= 1 usf))

;; Goal "def'vc"
;; File "cartesian_trees.ads", line 1, characters 0-0
(assert
  (not (<= usf 2147483646)))

(check-sat)
