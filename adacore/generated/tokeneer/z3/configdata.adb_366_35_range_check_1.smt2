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

(declare-datatypes ()
  ((bool__ref (bool__refqtmk (bool__content Bool)))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 255)))

(declare-sort us_rep 0)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const dummy us_rep)

(declare-datatypes ()
  ((t__ref (t__refqtmk (t__content us_rep)))))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 864000)))

(declare-const thefile us_rep)

(declare-const success Bool)

(declare-const theduration Int)

(declare-const rawhours Int)

(declare-const rawminutes Int)

(declare-const char1 Int)

;; "char'unused"
(define-fun charqtunused () int__ref
  (int__refqtmk char1))

;; "rawminutes'unused"
(define-fun rawminutesqtunused () int__ref
  (int__refqtmk rawminutes))

;; "rawhours'unused"
(define-fun rawhoursqtunused () int__ref
  (int__refqtmk rawhours))

;; "thefile'unused"
(define-fun thefileqtunused () t__ref
  (t__refqtmk thefile))

;; "Assume"
(assert (in_range2 theduration))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range rawhours))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range rawminutes))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 char1))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused () us_rep
  thefile)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  rawhours)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  success)

(declare-const thefile1 us_rep)

(declare-const success1 Bool)

(declare-const rawhours1 Int)

;; "rawhours'unused"
(define-fun rawhoursqtunused1 () int__ref
  (int__refqtmk rawhours1))

;; "success'unused"
(define-fun successqtunused () bool__ref
  (bool__refqtmk success1))

;; "thefile'unused"
(define-fun thefileqtunused1 () t__ref
  (t__refqtmk thefile1))

;; "H"
(assert true)

;; "H"
(assert (in_range rawhours1))

;; "H"
(assert true)

;; "H"
(assert true)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  rawhours1)

;; "o"
(define-fun o () Bool
  (ite (<= rawhours1 23) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused () Bool
  o)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  rawhours1)

;; "o"
(define-fun o1 () Bool
  (ite (<= 0 rawhours1) true false))

;; "infix >='result'unused"
(define-fun infix_gteqqtresultqtunused () Bool
  o1)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused1 () Bool
  success1)

;; "o"
(define-fun o2 () Bool
  (and success1 o1))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o2)

;; "o"
(define-fun o3 () Bool
  (and o2 o))

;; "andb'result'unused"
(define-fun andbqtresultqtunused1 () Bool
  o3)

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch o3))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused2 () Bool
  spark__branch)

;; "H"
(assert (= spark__branch true))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused1 () us_rep
  thefile1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  char1)

(declare-const thefile2 us_rep)

(declare-const char2 Int)

;; "char'unused"
(define-fun charqtunused1 () int__ref
  (int__refqtmk char2))

;; "thefile'unused"
(define-fun thefileqtunused2 () t__ref
  (t__refqtmk thefile2))

;; "H"
(assert true)

;; "H"
(assert (in_range1 char2))

;; "H"
(assert true)

;; "H"
(assert true)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused2 () us_rep
  thefile2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused4 () Int
  rawminutes)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused3 () Bool
  success1)

(declare-const thefile3 us_rep)

(declare-const success2 Bool)

(declare-const rawminutes1 Int)

;; "rawminutes'unused"
(define-fun rawminutesqtunused1 () int__ref
  (int__refqtmk rawminutes1))

;; "H"
(assert true)

;; "H"
(assert (in_range rawminutes1))

;; "H"
(assert true)

;; "H"
(assert true)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  rawminutes1)

;; "o"
(define-fun o4 () Bool
  (ite (<= rawminutes1 59) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused1 () Bool
  o4)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  rawminutes1)

;; "o"
(define-fun o5 () Bool
  (ite (<= 0 rawminutes1) true false))

;; "infix >='result'unused"
(define-fun infix_gteqqtresultqtunused1 () Bool
  o5)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  char2)

;; "o"
(define-fun o6 () Bool
  (ite (= char2 58) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  o6)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused4 () Bool
  success2)

;; "o"
(define-fun o7 () Bool
  (and success2 o6))

;; "andb'result'unused"
(define-fun andbqtresultqtunused2 () Bool
  o7)

;; "o"
(define-fun o8 () Bool
  (and o7 o5))

;; "andb'result'unused"
(define-fun andbqtresultqtunused3 () Bool
  o8)

;; "o"
(define-fun o9 () Bool
  (and o8 o4))

;; "andb'result'unused"
(define-fun andbqtresultqtunused4 () Bool
  o9)

(declare-const spark__branch1 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused1 () bool__ref
  (bool__refqtmk spark__branch1))

;; "H"
(assert (= spark__branch1 o9))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused5 () Bool
  spark__branch1)

;; "H"
(assert (= spark__branch1 true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused8 () Int
  rawminutes1)

;; "Ensures"
(assert (in_range2 rawminutes1))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  rawminutes1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  rawhours1)

;; Goal "def'vc"
;; File "configdata.adb", line 342, characters 0-0
(assert
  (not (<= 0 rawhours1)))

(check-sat)
