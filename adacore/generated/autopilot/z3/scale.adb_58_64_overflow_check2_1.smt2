;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(define-fun __cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))
(define-fun __cmod ((x Int) (y Int)) Int (ite (>= x 0) (mod x y) (- (mod (- x) y))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-datatypes ()
  ((int__ref (int__refqtmk (int__content Int)))))

(declare-datatypes ()
  ((bool__ref (bool__refqtmk (bool__content Bool)))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

(declare-const mach Int)

(declare-const present Int)

(declare-const target Int)

(declare-const max Int)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 100)))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= (- 100) x) (<= x 100)))

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 100)))

;; "in_range"
(define-fun in_range4 ((x Int)) Bool
  (and (<= (- 45) x) (<= x 45)))

(declare-const target_angle Int)

(declare-const k1 Int)

(declare-const k2 Int)

(declare-const gap Int)

;; "gap'unused"
(define-fun gapqtunused () int__ref
  (int__refqtmk gap))

;; "k2'unused"
(define-fun k2qtunused () int__ref
  (int__refqtmk k2))

;; "k1'unused"
(define-fun k1qtunused () int__ref
  (int__refqtmk k1))

;; "target_angle'unused"
(define-fun target_angleqtunused () int__ref
  (int__refqtmk target_angle))

;; "Assume"
(assert (in_range3 mach))

;; "Assume"
(assert (in_range2 present))

;; "Assume"
(assert (in_range2 target))

;; "Assume"
(assert (in_range4 max))

;; "Assume"
(assert (< 0 max))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range4 target_angle))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range k1))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range k2))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range gap))

;; "o"
(define-fun o () Bool
  (ite (= present target) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  o)

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch o))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (not (= spark__branch true)))

(declare-const k11 Int)

(declare-const k21 Int)

;; "k2'unused"
(define-fun k2qtunused1 () int__ref
  (int__refqtmk k21))

;; "k1'unused"
(define-fun k1qtunused1 () int__ref
  (int__refqtmk k11))

;; "Ensures"
(assert (and (and (in_range1 k11) (< 0 k21)) (<= k11 k21)))

;; "Assume"
(assert (in_range k11))

;; "Assume"
(assert (in_range k21))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  k21)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  k11)

;; "o"
(define-fun o1 () Int
  (* max k11))

;; "infix *'result'unused"
(define-fun infix_asqtresultqtunused () Int
  o1)

;; Goal "def'vc"
;; File "scale.ads", line 9, characters 0-0
(assert
  (not (<= o1 2147483647)))

(check-sat)
