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

;; "is_readable"
(declare-fun is_readable (us_rep) Bool)

;; "is_open"
(declare-fun is_open (us_rep) Bool)

;; "mode"
(declare-fun mode (us_rep) Int)

;; "end_of_file"
(declare-fun end_of_file (us_rep) Bool)

;; "end_of_file"
(declare-fun end_of_file1 (us_rep) Bool)

(declare-sort file_status 0)

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 10)))

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

(declare-datatypes ((us_split_discrs 0))
  (((us_split_discrsqtmk
    (rec__ada___spark__text_io__character_result__status file_status)))))

(declare-datatypes ((us_split_fields 0))
  (((us_split_fieldsqtmk
    (rec__ada___spark__text_io__character_result__item character)))))

(declare-datatypes ((us_rep1 0))
  (((us_repqtmk
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

(declare-const item__attr__constrained Bool)

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 2)))

;; "is_open__post_axiom"
(assert true)

;; "mode__post_axiom"
(assert
  (forall ((param__file us_rep))
    (! (=> (= (is_open param__file) true) (in_range3 (mode param__file))) :pattern (
    (mode
      param__file)) )))

;; "is_readable__post_axiom"
(assert true)

;; "is_readable__def_axiom"
(assert
  (forall ((param__file us_rep))
    (! (=
         (= (is_readable param__file) true)
         (and (= (is_open param__file) true) (= (mode param__file) 0))) :pattern (
    (is_readable
      param__file)) )))

;; "end_of_file__post_axiom"
(assert true)

;; "end_of_file__post_axiom"
(assert
  (forall ((Ada___spark__text_io__standard_input___standard_input___ us_rep))
    (! (=
         (= (end_of_file1
              Ada___spark__text_io__standard_input___standard_input___) true)
         (= (end_of_file
              Ada___spark__text_io__standard_input___standard_input___) true)) :pattern (
    (end_of_file1
      Ada___spark__text_io__standard_input___standard_input___)) )))

;; Goal "def'vc"
;; File "spark-text_io.ads", line 515, characters 0-0
(assert
  (not
  (forall ((standard_input us_rep))
    (=>
      (or
        (not (= (end_of_file1 standard_input) true))
        (and
          (= (is_readable standard_input) true)
          (not (= (end_of_file standard_input) true))))
      (= (is_open standard_input) true)))))

(check-sat)
(get-info :reason-unknown)
