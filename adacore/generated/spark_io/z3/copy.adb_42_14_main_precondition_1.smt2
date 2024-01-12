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

(declare-sort character 0)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 255)))

;; "to_rep"
(declare-fun to_rep (character) Int)

;; "of_rep"
(declare-fun of_rep (Int) character)

;; "inversion_axiom"
(assert
  (forall ((x character))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x character)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int character))))))

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
  (forall ((x integer)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                 (of_rep1 x))) )))

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

(declare-sort us_rep 0)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const dummy us_rep)

(declare-datatypes ()
  ((file_type__ref (file_type__refqtmk (file_type__content us_rep)))))

;; "status"
(declare-fun status (us_rep) Int)

(declare-sort file_status 0)

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 10)))

(declare-const yes (Array Int character))

(declare-const no (Array Int character))

;; "to_rep"
(declare-fun to_rep2 (file_status) Int)

;; "of_rep"
(declare-fun of_rep2 (Int) file_status)

;; "inversion_axiom"
(assert
  (forall ((x file_status))
    (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; "range_axiom"
(assert
  (forall ((x file_status))
    (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                  (of_rep2 x))) )))

(declare-datatypes ()
  ((us_split_discrs
   (us_split_discrsqtmk
   (rec__ada___spark__text_io__character_result__status file_status)))))

(declare-datatypes ()
  ((us_split_discrs__ref
   (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))

(declare-datatypes ()
  ((us_split_fields
   (us_split_fieldsqtmk
   (rec__ada___spark__text_io__character_result__item character)))))

(declare-datatypes ()
  ((us_split_fields__ref
   (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))

(declare-datatypes ()
  ((us_rep1
   (us_repqtmk
   (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "alignment_axiom"
(assert (<= 0 alignment2))

(declare-const ada___spark__text_io__character_result__status__first__bit Int)

(declare-const ada___spark__text_io__character_result__status__last__bit Int)

(declare-const ada___spark__text_io__character_result__status__position Int)

;; "ada___spark__text_io__character_result__status__first__bit_axiom"
(assert (<= 0 ada___spark__text_io__character_result__status__first__bit))

;; "ada___spark__text_io__character_result__status__last__bit_axiom"
(assert
  (< ada___spark__text_io__character_result__status__first__bit ada___spark__text_io__character_result__status__last__bit))

;; "ada___spark__text_io__character_result__status__position_axiom"
(assert (<= 0 ada___spark__text_io__character_result__status__position))

(declare-const ada___spark__text_io__character_result__item__first__bit Int)

(declare-const ada___spark__text_io__character_result__item__last__bit Int)

(declare-const ada___spark__text_io__character_result__item__position Int)

;; "ada___spark__text_io__character_result__item__first__bit_axiom"
(assert (<= 0 ada___spark__text_io__character_result__item__first__bit))

;; "ada___spark__text_io__character_result__item__last__bit_axiom"
(assert
  (< ada___spark__text_io__character_result__item__first__bit ada___spark__text_io__character_result__item__last__bit))

;; "ada___spark__text_io__character_result__item__position_axiom"
(assert (<= 0 ada___spark__text_io__character_result__item__position))

(declare-const dummy1 us_rep1)

(declare-const c__attr__constrained Bool)

(declare-const clast Int)

(declare-const clast1 Int)

(declare-const length_of_yes_no Int)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size1 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment3))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const component__size2 Int)

(declare-const alignment4 Int)

;; "value__size_axiom"
(assert (<= 0 value__size4))

;; "object__size_axiom"
(assert (<= 0 object__size4))

;; "component__size_axiom"
(assert (<= 0 component__size2))

;; "alignment_axiom"
(assert (<= 0 alignment4))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const component__size3 Int)

(declare-const alignment5 Int)

;; "value__size_axiom"
(assert (<= 0 value__size5))

;; "object__size_axiom"
(assert (<= 0 object__size5))

;; "component__size_axiom"
(assert (<= 0 component__size3))

;; "alignment_axiom"
(assert (<= 0 alignment5))

(declare-const value__size6 Int)

(declare-const object__size6 Int)

(declare-const component__size4 Int)

(declare-const alignment6 Int)

;; "value__size_axiom"
(assert (<= 0 value__size6))

;; "object__size_axiom"
(assert (<= 0 object__size6))

;; "component__size_axiom"
(assert (<= 0 component__size4))

;; "alignment_axiom"
(assert (<= 0 alignment6))

;; "status__post_axiom"
(assert
  (forall ((param__file us_rep))
    (! (in_range2 (status param__file)) :pattern ((status param__file)) )))

(declare-const spark__branch Bool)

(declare-const standard_input us_rep)

(declare-const standard_output us_rep)

(declare-const standard_error us_rep)

(declare-const source us_rep)

(declare-const destination us_rep)

(declare-const count Int)

(declare-const response (Array Int character))

(declare-const yes_no (Array Int character))

(declare-const last Int)

(declare-const last_of_yes_no Int)

(declare-const c__split_fields character)

(declare-const c__split_discrs file_status)

;; "c__split_discrs'unused"
(define-fun c__split_discrsqtunused () us_split_discrs__ref
  (us_split_discrs__refqtmk (us_split_discrsqtmk c__split_discrs)))

;; "c__split_fields'unused"
(define-fun c__split_fieldsqtunused () us_split_fields__ref
  (us_split_fields__refqtmk (us_split_fieldsqtmk c__split_fields)))

;; "last_of_yes_no'unused"
(define-fun last_of_yes_noqtunused () int__ref
  (int__refqtmk last_of_yes_no))

;; "last'unused"
(define-fun lastqtunused () int__ref
  (int__refqtmk last))

;; "yes_no'unused"
(define-fun yes_noqtunused () map__ref
  (map__refqtmk yes_no))

;; "response'unused"
(define-fun responseqtunused () map__ref
  (map__refqtmk response))

;; "count'unused"
(define-fun countqtunused () int__ref
  (int__refqtmk count))

;; "destination'unused"
(define-fun destinationqtunused () file_type__ref
  (file_type__refqtmk destination))

;; "source'unused"
(define-fun sourceqtunused () file_type__ref
  (file_type__refqtmk source))

;; "standard_error'unused"
(define-fun standard_errorqtunused () file_type__ref
  (file_type__refqtmk standard_error))

;; "standard_output'unused"
(define-fun standard_outputqtunused () file_type__ref
  (file_type__refqtmk standard_output))

;; "standard_input'unused"
(define-fun standard_inputqtunused () file_type__ref
  (file_type__refqtmk standard_input))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; Goal "def'vc"
;; File "copy.adb", line 32, characters 0-0
(assert
  (not (= (status standard_error) 1)))

(check-sat)
