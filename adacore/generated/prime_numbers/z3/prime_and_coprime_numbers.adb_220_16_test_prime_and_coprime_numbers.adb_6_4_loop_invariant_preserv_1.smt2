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

;; "mod"
(define-fun mod1 ((x Int) (y Int)) Int
  (ite (<= 0 y) (mod x y) (- (mod (- x) y))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "is_prime"
(define-fun is_prime ((param__value Int)) Bool
  (and (>= param__value 2) (ite (forall ((v Int))
                                  (=>
                                    (and (<= 2 v) (<= v (- param__value 1)))
                                    (not (= (mod1 param__value v) 0))))
                             true
                             false)))

(declare-const v Int)

;; "Assume"
(assert (in_range v))

;; "Assume"
(assert (and (<= 2 v) (not (= (is_prime v) true))))

;; "temp___333"
(define-fun temp___333 () Int
  (- v 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused () Int
  temp___333)

(declare-const value Int)

;; "value'unused"
(define-fun valueqtunused () int__ref
  (int__refqtmk value))

;; "H"
(assert (= value 2))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  value)

;; "o"
(define-fun o () Bool
  (ite (<= value temp___333) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused () Bool
  o)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  value)

;; "o"
(define-fun o1 () Bool
  (ite (<= 2 value) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused1 () Bool
  o1)

;; "o"
(define-fun o2 () Bool
  (and o1 o))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o2)

;; "H"
(assert (= o2 true))

(declare-const usf Int)

(declare-const anyqtresultqtunused Int)

;; "H"
(assert (= anyqtresultqtunused usf))

(declare-const wqtunused Int)

;; "H"
(assert (= wqtunused usf))

(declare-const o3 Int)

;; "H"
(assert (= o3 (- v 1)))

(declare-const infix_mnqtresultqtunused1 Int)

;; "H"
(assert (= infix_mnqtresultqtunused1 o3))

(declare-const o4 Bool)

;; "H"
(assert (= o4 (ite (<= usf o3) true false)))

(declare-const infix_lseqqtresultqtunused2 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused2 o4))

(declare-const int__contentqtresultqtunused2 Int)

;; "H"
(assert (= int__contentqtresultqtunused2 value))

(declare-const o5 Bool)

;; "H"
(assert (= o5 (ite (<= value usf) true false)))

(declare-const infix_lseqqtresultqtunused3 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused3 o5))

(declare-const andbqtresultqtunused1 Bool)

;; "H"
(assert (= andbqtresultqtunused1 (and o5 o4)))

;; "_f'unused"
(define-fun usfqtunused () Bool
  (ite (exists ((w Int))
         (and (and (<= value w) (<= w (- v 1))) (= (mod1 v w) 0)))
    true
    false))

;; "any'result'unused"
(define-fun anyqtresultqtunused1 () Bool
  (ite (exists ((w Int))
         (and (and (<= value w) (<= w (- v 1))) (= (mod1 v w) 0)))
    true
    false))

(declare-const value1 Int)

;; "value'unused"
(define-fun valueqtunused1 () int__ref
  (int__refqtmk value1))

;; "LoopInvariant"
(assert
  (exists ((w Int))
    (and (and (<= value1 w) (<= w (- v 1))) (= (mod1 v w) 0))))

;; "Assume"
(assert (and (<= 2 value1) (<= value1 (- v 1))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  value1)

;; "o"
(define-fun o6 () Int
  (mod1 v value1))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused () Int
  o6)

;; "o"
(define-fun o7 () Bool
  (ite (= o6 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  o7)

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch o7))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (not (= spark__branch true)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused4 () Int
  value1)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused1 () Bool
  (ite (= value1 temp___333) true false))

;; "H"
(assert (not (= value1 temp___333)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  value1)

;; "o"
(define-fun o8 () Int
  (+ value1 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o8)

(declare-const value2 Int)

;; "value'unused"
(define-fun valueqtunused2 () int__ref
  (int__refqtmk value2))

;; "H"
(assert (= value2 o8))

(declare-const usf1 Int)

(declare-const anyqtresultqtunused2 Int)

;; "H"
(assert (= anyqtresultqtunused2 usf1))

(declare-const wqtunused1 Int)

;; "H"
(assert (= wqtunused1 usf1))

(declare-const o9 Int)

;; "H"
(assert (= o9 (- v 1)))

(declare-const infix_mnqtresultqtunused2 Int)

;; "H"
(assert (= infix_mnqtresultqtunused2 o9))

(declare-const o10 Bool)

;; "H"
(assert (= o10 (ite (<= usf1 o9) true false)))

(declare-const infix_lseqqtresultqtunused4 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused4 o10))

(declare-const int__contentqtresultqtunused6 Int)

;; "H"
(assert (= int__contentqtresultqtunused6 value2))

(declare-const o11 Bool)

;; "H"
(assert (= o11 (ite (<= value2 usf1) true false)))

(declare-const infix_lseqqtresultqtunused5 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused5 o11))

(declare-const andbqtresultqtunused2 Bool)

;; "H"
(assert (= andbqtresultqtunused2 (and o11 o10)))

;; "_f'unused"
(define-fun usfqtunused1 () Bool
  (ite (exists ((w Int))
         (and (and (<= value2 w) (<= w (- v 1))) (= (mod1 v w) 0)))
    true
    false))

;; "any'result'unused"
(define-fun anyqtresultqtunused3 () Bool
  (ite (exists ((w Int))
         (and (and (<= value2 w) (<= w (- v 1))) (= (mod1 v w) 0)))
    true
    false))

;; Goal "def'vc"
;; File "prime_and_coprime_numbers.adb", line 209, characters 0-0
(assert
  (not
  (exists ((w Int))
    (and (and (<= value2 w) (<= w (- v 1))) (= (mod1 v w) 0)))))

(check-sat)