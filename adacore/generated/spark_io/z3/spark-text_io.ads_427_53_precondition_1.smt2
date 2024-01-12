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

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

(declare-sort character 0)

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
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
  (forall ((x character)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
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

(declare-datatypes ()
  ((t (tqtmk (rec__first integer)(rec__last integer)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep1 (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep1 (rec__last (rt a))))

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

;; "is_open"
(declare-fun is_open (us_rep) Bool)

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 2)))

;; "mode"
(declare-fun mode (us_rep) Int)

;; "is_readable"
(declare-fun is_readable (us_rep) Bool)

;; "is_writable"
(declare-fun is_writable (us_rep) Bool)

;; "is_standard_input"
(declare-fun is_standard_input (us_rep) Bool)

;; "is_standard_output"
(declare-fun is_standard_output (us_rep) Bool)

;; "is_standard_error"
(declare-fun is_standard_error (us_rep) Bool)

;; "is_standard_file"
(declare-fun is_standard_file (us_rep) Bool)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_110 us_t) (temp___is_init_106 Bool) (temp___skip_constant_107 Bool) (temp___do_toplevel_108 Bool) (temp___do_typ_inv_109 Bool)) Bool
  (=>
    (not (= temp___skip_constant_107 true))
    (dynamic_property
      1
      2147483647
      (first temp___expr_110)
      (last temp___expr_110))))

;; "name"
(declare-fun name (us_rep) us_t)

;; "form"
(declare-fun form (us_rep) us_t)

;; "line_length"
(declare-fun line_length (us_rep) Int)

;; "in_range"
(define-fun in_range4 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "page_length"
(declare-fun page_length (us_rep) Int)

;; "end_of_file"
(declare-fun end_of_file (us_rep) Bool)

(declare-const to__ Int)

;; "in_range"
(define-fun in_range5 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

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

;; "is_writable__post_axiom"
(assert true)

;; "is_writable__def_axiom"
(assert
  (forall ((param__file us_rep))
    (! (=
         (= (is_writable param__file) true)
         (and
           (= (is_open param__file) true)
           (or (= (mode param__file) 1) (= (mode param__file) 2)))) :pattern (
    (is_writable
      param__file)) )))

;; "is_standard_input__post_axiom"
(assert true)

;; "is_standard_output__post_axiom"
(assert true)

;; "is_standard_error__post_axiom"
(assert true)

;; "line_length__post_axiom"
(assert
  (forall ((param__file us_rep))
    (! (=>
         (= (is_writable param__file) true)
         (in_range4 (line_length param__file))) :pattern ((line_length
                                                            param__file)) )))

;; "end_of_file__post_axiom"
(assert true)

(declare-const file us_rep)

;; "file'unused"
(define-fun fileqtunused () file_type__ref
  (file_type__refqtmk file))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range5 to__))

;; "Assume"
(assert
  (ite (and (= (is_writable file) true) (< 0 (line_length file)))
    (<= to__ (line_length file))
    (=> (= (is_readable file) true) (not (= (end_of_file file) true)))))

;; "file_type__content'result'unused"
(define-fun file_type__contentqtresultqtunused () us_rep
  file)

;; "temp___old_751"
(define-fun temp___old_751 () Bool
  (is_standard_file file))

;; "Ensures"
(assert
  (=
    (= temp___old_751 true)
    (or
      (or
        (= (is_standard_input file) true)
        (= (is_standard_output file) true))
      (= (is_standard_error file) true))))

;; "is_standard_file'result'unused"
(define-fun is_standard_fileqtresultqtunused () Bool
  temp___old_751)

;; "file_type__content'result'unused"
(define-fun file_type__contentqtresultqtunused1 () us_rep
  file)

;; "temp___old_752"
(define-fun temp___old_752 () Int
  (page_length file))

;; "Ensures"
(assert (in_range4 temp___old_752))

;; "page_length'result'unused"
(define-fun page_lengthqtresultqtunused () Int
  temp___old_752)

;; "file_type__content'result'unused"
(define-fun file_type__contentqtresultqtunused2 () us_rep
  file)

;; "temp___old_753"
(define-fun temp___old_753 () Int
  (line_length file))

;; "Ensures"
(assert (in_range4 temp___old_753))

;; "line_length'result'unused"
(define-fun line_lengthqtresultqtunused () Int
  temp___old_753)

;; "file_type__content'result'unused"
(define-fun file_type__contentqtresultqtunused3 () us_rep
  file)

;; "temp___old_754"
(define-fun temp___old_754 () us_t
  (form file))

;; "Ensures"
(assert (dynamic_invariant temp___old_754 true false true true))

;; "form'result'unused"
(define-fun formqtresultqtunused () us_t
  temp___old_754)

;; "file_type__content'result'unused"
(define-fun file_type__contentqtresultqtunused4 () us_rep
  file)

;; "temp___old_755"
(define-fun temp___old_755 () us_t
  (name file))

;; "Ensures"
(assert (dynamic_invariant temp___old_755 true false true true))

;; "name'result'unused"
(define-fun nameqtresultqtunused () us_t
  temp___old_755)

;; "file_type__content'result'unused"
(define-fun file_type__contentqtresultqtunused5 () us_rep
  file)

;; "temp___old_756"
(define-fun temp___old_756 () Bool
  (is_readable file))

;; "Ensures"
(assert
  (= (= temp___old_756 true) (and (= (is_open file) true) (= (mode file) 0))))

;; "is_readable'result'unused"
(define-fun is_readableqtresultqtunused () Bool
  temp___old_756)

;; "file_type__content'result'unused"
(define-fun file_type__contentqtresultqtunused6 () us_rep
  file)

;; Goal "def'vc"
;; File "spark-text_io.ads", line 420, characters 0-0
(assert
  (not (= (is_open file) true)))

(check-sat)
