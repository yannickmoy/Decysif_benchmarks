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

;; "mod"
(define-fun mod1 ((x Int) (y Int)) Int
  (ite (<= 0 y) (mod x y) (- (mod (- x) y))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "divides"
(define-fun divides ((param__a Int) (param__b Int)) Bool
  (ite (exists ((c Int))
         (and (and (<= 1 c) (<= c 2147483647)) (= (* param__a c) param__b)))
    true
    false))

(declare-const arg1 Int)

(declare-const arg2 Int)

;; "Assume"
(assert (in_range arg1))

;; "Assume"
(assert (in_range arg2))

;; "Assume"
(assert (not (= (mod1 arg1 arg2) 0)))

(declare-const j Int)

(declare-const jqtunused int__ref)

;; "H"
(assert (= jqtunused (int__refqtmk j)))

;; "H"
(assert (= j 1))

(declare-const int__contentqtresultqtunused Int)

;; "H"
(assert (= int__contentqtresultqtunused j))

(declare-const o Bool)

;; "H"
(assert (= o (ite (<= j 2147483647) true false)))

(declare-const infix_lseqqtresultqtunused Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused o))

(declare-const int__contentqtresultqtunused1 Int)

;; "H"
(assert (= int__contentqtresultqtunused1 j))

(declare-const o1 Bool)

;; "H"
(assert (= o1 (ite (<= 1 j) true false)))

(declare-const infix_lseqqtresultqtunused1 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused1 o1))

(declare-const o2 Bool)

;; "H"
(assert (= o2 (and o1 o)))

(declare-const andbqtresultqtunused Bool)

;; "H"
(assert (= andbqtresultqtunused o2))

(declare-const o3 Int)

(declare-const int__contentqtresultqtunused2 Int)

(declare-const usfqtunused Bool)

(declare-const anyqtresultqtunused Bool)

(declare-const j1 Int)

(declare-const jqtunused1 int__ref)

(declare-const int__contentqtresultqtunused3 Int)

(declare-const infix_eqqtresultqtunused Bool)

(declare-const usf Int)

(declare-const anyqtresultqtunused1 Int)

(declare-const kqtunused Int)

(declare-const int__contentqtresultqtunused4 Int)

(declare-const o4 Bool)

(declare-const infix_lseqqtresultqtunused2 Bool)

(declare-const o5 Bool)

(declare-const infix_lseqqtresultqtunused3 Bool)

(declare-const andbqtresultqtunused1 Bool)

;; "H"
(assert
  (=>
    (= o2 true)
    (and
      (= o3 arg2)
      (and
        (= int__contentqtresultqtunused2 j)
        (and
          (= (__cdiv (* j o3) o3) j)
          (and
            (not (= (* arg2 j) arg1))
            (and
              (and
                (= anyqtresultqtunused1 usf)
                (and
                  (= kqtunused usf)
                  (and
                    (= int__contentqtresultqtunused4 j)
                    (and
                      (= o4 (ite (<= usf j) true false))
                      (and
                        (= infix_lseqqtresultqtunused2 o4)
                        (and
                          (= o5 (ite (<= 1 usf) true false))
                          (and
                            (= infix_lseqqtresultqtunused3 o5)
                            (= andbqtresultqtunused1 (and o5 o4)))))))))
              (and
                (= usfqtunused (ite (forall ((k Int))
                                      (=>
                                        (and (<= 1 k) (<= k j))
                                        (not (= (* arg2 k) arg1))))
                                 true
                                 false))
                (and
                  (= anyqtresultqtunused (ite (forall ((k Int))
                                                (=>
                                                  (and (<= 1 k) (<= k j))
                                                  (not (= (* arg2 k) arg1))))
                                           true
                                           false))
                  (and
                    (= jqtunused1 (int__refqtmk j1))
                    (and
                      (forall ((k Int))
                        (=>
                          (and (<= 1 k) (<= k j1))
                          (not (= (* arg2 k) arg1))))
                      (and
                        (and (<= 1 j1) (<= j1 2147483647))
                        (and
                          (= int__contentqtresultqtunused3 j1)
                          (and
                            (= infix_eqqtresultqtunused (ite (= j1 2147483647)
                                                          true
                                                          false))
                            (= j1 2147483647)))))))))))))))

;; Goal "def'vc"
;; File "math_simple_abstract.adb", line 12, characters 0-0
(assert
  (not (not (= (divides arg2 arg1) true))))

(check-sat)