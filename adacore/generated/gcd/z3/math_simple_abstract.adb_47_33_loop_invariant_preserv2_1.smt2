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

;; "min"
(define-fun min ((x Int) (y Int)) Int
  (ite (<= x y) x y))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "divides"
(define-fun divides ((param__a Int) (param__b Int)) Bool
  (ite (exists ((c Int))
         (and (and (<= 1 c) (<= c 2147483647)) (= (* param__a c) param__b)))
    true
    false))

(declare-const a Int)

(declare-const b Int)

;; "Assume"
(assert (in_range a))

;; "Assume"
(assert (in_range b))

;; "o"
(define-fun o () Int
  (min a b))

;; "int_min'result'unused"
(define-fun int_minqtresultqtunused () Int
  o)

;; "Ensures"
(assert (in_range o))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o)

(declare-const c Int)

;; "c'unused"
(define-fun cqtunused () int__ref
  (int__refqtmk c))

;; "H"
(assert (= c o))

;; "Assume"
(assert (in_range c))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  c)

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused () Bool
  (ite (< 1 c) true false))

;; "H"
(assert (< 1 c))

;; "temp___loop_entry_171'unused"
(define-fun temp___loop_entry_171qtunused () Int
  c)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  c)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  c)

;; "o"
(define-fun o1 () Int
  (mod1 b c))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused () Int
  o1)

;; "o"
(define-fun o2 () Bool
  (ite (= o1 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  o2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  c)

;; "o"
(define-fun o3 () Int
  (mod1 a c))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused1 () Int
  o3)

;; "o"
(define-fun o4 () Bool
  (ite (= o3 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused1 () Bool
  o4)

;; "o"
(define-fun o5 () Bool
  (and o4 o2))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o5)

;; "H"
(assert (not (= o5 true)))

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

(declare-const int__contentqtresultqtunused4 Int)

;; "H"
(assert (= int__contentqtresultqtunused4 c))

(declare-const o6 Int)

;; "H"
(assert (= o6 (mod1 a c)))

(declare-const mod_qtresultqtunused2 Int)

;; "H"
(assert (= mod_qtresultqtunused2 o6))

(declare-const infix_eqqtresultqtunused2 Bool)

;; "H"
(assert (= infix_eqqtresultqtunused2 (ite (= o6 0) true false)))

;; "H"
(assert (= spark__branch (ite (= o6 0) false true)))

(declare-const bool__contentqtresultqtunused Bool)

;; "H"
(assert (= bool__contentqtresultqtunused spark__branch))

(declare-const int__contentqtresultqtunused5 Int)

(declare-const int__contentqtresultqtunused6 Int)

;; "H"
(assert
  (ite (= spark__branch true)
    (and (= int__contentqtresultqtunused6 c) (not (= (divides c a) true)))
    (and (= int__contentqtresultqtunused5 c) (not (= (divides c b) true)))))

(declare-const int__contentqtresultqtunused7 Int)

;; "H"
(assert (= int__contentqtresultqtunused7 c))

(declare-const infix_gtqtresultqtunused1 Bool)

;; "H"
(assert (= infix_gtqtresultqtunused1 (ite (< 1 c) true false)))

(declare-const usfqtunused Bool)

(declare-const anyqtresultqtunused Bool)

(declare-const usf Int)

(declare-const anyqtresultqtunused1 Int)

(declare-const xqtunused Int)

(declare-const o7 Int)

(declare-const int_minqtresultqtunused1 Int)

(declare-const o8 Bool)

(declare-const infix_lseqqtresultqtunused Bool)

(declare-const int__contentqtresultqtunused8 Int)

(declare-const o9 Bool)

(declare-const infix_lseqqtresultqtunused1 Bool)

(declare-const andbqtresultqtunused1 Bool)

;; "H"
(assert
  (=>
    (< 1 c)
    (and
      (and
        (= anyqtresultqtunused1 usf)
        (and
          (= xqtunused usf)
          (and
            (= o7 (min a b))
            (and
              (= int_minqtresultqtunused1 o7)
              (and
                (= o8 (ite (<= usf o7) true false))
                (and
                  (= infix_lseqqtresultqtunused o8)
                  (and
                    (= int__contentqtresultqtunused8 c)
                    (and
                      (= o9 (ite (<= c usf) true false))
                      (and
                        (= infix_lseqqtresultqtunused1 o9)
                        (= andbqtresultqtunused1 (and o9 o8)))))))))))
      (and
        (= usfqtunused (ite (forall ((x Int))
                              (=>
                                (and (<= c x) (<= x (min a b)))
                                (not
                                  (and
                                    (= (divides x a) true)
                                    (= (divides x b) true)))))
                         true
                         false))
        (= anyqtresultqtunused (ite (forall ((x Int))
                                      (=>
                                        (and (<= c x) (<= x (min a b)))
                                        (not
                                          (and
                                            (= (divides x a) true)
                                            (= (divides x b) true)))))
                                 true
                                 false))))))

(declare-const c1 Int)

;; "c'unused"
(define-fun cqtunused1 () int__ref
  (int__refqtmk c1))

;; "LoopInvariant"
(assert
  (and
    (< 1 c1)
    (forall ((x Int))
      (=>
        (and (<= c1 x) (<= x (min a b)))
        (not (and (= (divides x a) true) (= (divides x b) true)))))))

;; "loop_var___1836'unused"
(define-fun loop_var___1836qtunused () Int
  c1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  c1)

;; "Assume"
(assert (in_range c1))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  c1)

;; "o"
(define-fun o10 () Int
  (- c1 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused () Int
  o10)

;; "Ensures"
(assert (in_range o10))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o10)

(declare-const c2 Int)

;; "c'unused"
(define-fun cqtunused2 () int__ref
  (int__refqtmk c2))

;; "H"
(assert (= c2 o10))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused11 () Int
  c2)

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused2 () Bool
  (ite (< 1 c2) true false))

;; "H"
(assert (< 1 c2))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused12 () Int
  c2)

;; "o"
(define-fun o11 () Int
  (mod1 b c2))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused3 () Int
  o11)

;; "o"
(define-fun o12 () Bool
  (ite (= o11 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused3 () Bool
  o12)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused13 () Int
  c2)

;; "o"
(define-fun o13 () Int
  (mod1 a c2))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused4 () Int
  o13)

;; "o"
(define-fun o14 () Bool
  (ite (= o13 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused4 () Bool
  o14)

;; "o"
(define-fun o15 () Bool
  (and o14 o12))

;; "andb'result'unused"
(define-fun andbqtresultqtunused2 () Bool
  o15)

;; "H"
(assert (not (= o15 true)))

(declare-const int__contentqtresultqtunused14 Int)

;; "H"
(assert (= int__contentqtresultqtunused14 c2))

(declare-const o16 Int)

;; "H"
(assert (= o16 (mod1 a c2)))

(declare-const mod_qtresultqtunused5 Int)

;; "H"
(assert (= mod_qtresultqtunused5 o16))

(declare-const infix_eqqtresultqtunused5 Bool)

;; "H"
(assert (= infix_eqqtresultqtunused5 (ite (= o16 0) true false)))

(declare-const spark__branch1 Bool)

(declare-const spark__branchqtunused1 bool__ref)

;; "H"
(assert (= spark__branchqtunused1 (bool__refqtmk spark__branch1)))

;; "H"
(assert (= spark__branch1 (ite (= o16 0) false true)))

(declare-const bool__contentqtresultqtunused1 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused1 spark__branch1))

(declare-const int__contentqtresultqtunused15 Int)

(declare-const int__contentqtresultqtunused16 Int)

;; "H"
(assert
  (ite (= spark__branch1 true)
    (and (= int__contentqtresultqtunused16 c2) (not (= (divides c2 a) true)))
    (and (= int__contentqtresultqtunused15 c2) (not (= (divides c2 b) true)))))

(declare-const int__contentqtresultqtunused17 Int)

;; "H"
(assert (= int__contentqtresultqtunused17 c2))

(declare-const infix_gtqtresultqtunused3 Bool)

;; "H"
(assert (= infix_gtqtresultqtunused3 (ite (< 1 c2) true false)))

(declare-const usfqtunused1 Bool)

(declare-const anyqtresultqtunused2 Bool)

(declare-const usf1 Int)

(declare-const anyqtresultqtunused3 Int)

(declare-const xqtunused1 Int)

(declare-const o17 Int)

(declare-const int_minqtresultqtunused2 Int)

(declare-const o18 Bool)

(declare-const infix_lseqqtresultqtunused2 Bool)

(declare-const int__contentqtresultqtunused18 Int)

(declare-const o19 Bool)

(declare-const infix_lseqqtresultqtunused3 Bool)

(declare-const andbqtresultqtunused3 Bool)

;; "H"
(assert
  (=>
    (< 1 c2)
    (and
      (and
        (= anyqtresultqtunused3 usf1)
        (and
          (= xqtunused1 usf1)
          (and
            (= o17 (min a b))
            (and
              (= int_minqtresultqtunused2 o17)
              (and
                (= o18 (ite (<= usf1 o17) true false))
                (and
                  (= infix_lseqqtresultqtunused2 o18)
                  (and
                    (= int__contentqtresultqtunused18 c2)
                    (and
                      (= o19 (ite (<= c2 usf1) true false))
                      (and
                        (= infix_lseqqtresultqtunused3 o19)
                        (= andbqtresultqtunused3 (and o19 o18)))))))))))
      (and
        (= usfqtunused1 (ite (forall ((x Int))
                               (=>
                                 (and (<= c2 x) (<= x (min a b)))
                                 (not
                                   (and
                                     (= (divides x a) true)
                                     (= (divides x b) true)))))
                          true
                          false))
        (= anyqtresultqtunused2 (ite (forall ((x Int))
                                       (=>
                                         (and (<= c2 x) (<= x (min a b)))
                                         (not
                                           (and
                                             (= (divides x a) true)
                                             (= (divides x b) true)))))
                                  true
                                  false))))))

;; "loop_var_new___1836'unused"
(define-fun loop_var_new___1836qtunused () Int
  c2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused19 () Int
  c2)

;; "H"
(assert (< c2 c1))

(declare-const x Int)

;; "H"
(assert (<= c2 x))

;; "H"
(assert (<= x (min a b)))

;; Goal "def'vc"
;; File "math_simple_abstract.ads", line 7, characters 0-0
(assert
  (not (not (and (= (divides x a) true) (= (divides x b) true)))))

(check-sat)