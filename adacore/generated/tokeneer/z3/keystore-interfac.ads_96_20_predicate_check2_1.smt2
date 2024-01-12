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

(declare-sort us_image 0)

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

(declare-datatypes ()
  ((t (tqtmk (rec__first integer)(rec__last integer)))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int character)
  (elts a))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep1 (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep1 (rec__last (rt a))))

;; "length"
(define-fun length ((a us_t)) Int
  (ite (<= (first a) (last a)) (+ (- (last a) (first a)) 1) 0))

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

;; "to_string"
(declare-fun to_string (us_image
  Int) us_t)

;; "to_string__first"
(assert
  (forall ((x us_image))
    (forall ((s Int))
      (! (= (first (to_string x s)) 1) :pattern ((to_string x s)) ))))

;; "to_string__length"
(assert
  (forall ((x us_image))
    (forall ((s Int))
      (! (=> (<= 0 s) (<= (length (to_string x s)) s)) :pattern ((to_string
                                                                   x
                                                                   s)) ))))

(declare-const x Int)

;; "in_range"
(define-fun in_range2 ((x1 Int)) Bool
  (and (<= 0 x1) (<= x1 28)))

;; "attr__ATTRIBUTE_IMAGE"
(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

;; "Assume"
(assert (in_range2 x))

;; "o"
(define-fun o () us_image
  (attr__ATTRIBUTE_IMAGE x))

;; "attr__ATTRIBUTE_IMAGE'result'unused"
(define-fun attr__ATTRIBUTE_IMAGEqtresultqtunused () us_image
  o)

;; "temp___404"
(define-fun temp___404 () us_t
  (to_string o 2040))

;; "to_string'result'unused"
(define-fun to_stringqtresultqtunused () us_t
  temp___404)

;; "temp___405"
(define-fun temp___405 () (Array Int character)
  (to_array temp___404))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused () (Array Int character)
  temp___405)

;; "temp___407"
(define-fun temp___407 () us_t
  (to_string o 2040))

;; Goal "def'vc"
;; File "keystore-interfac.ads", line 95, characters 0-0
(assert
  (not (<= 0 (last temp___407))))

(check-sat)