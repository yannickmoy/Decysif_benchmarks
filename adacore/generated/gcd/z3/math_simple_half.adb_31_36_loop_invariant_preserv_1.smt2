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

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "divides"
(define-fun divides ((param__a Int) (param__b Int)) Bool
  (= (mod1 param__b param__a) 0))

(declare-const a Int)

(declare-const b Int)

(declare-const r4b Int)

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
(define-fun int__contentqtresultqtunused1 () Int
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

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch o5))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (not (= spark__branch true)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  c)

;; "o"
(define-fun o6 () Int
  (__cdiv c 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused () Int
  o6)

;; "Ensures"
(assert (in_range o6))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o6)

(declare-const c1 Int)

;; "c'unused"
(define-fun cqtunused1 () int__ref
  (int__refqtmk c1))

;; "H"
(assert (= c1 o6))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  c1)

;; "math_simple_half__gcd__L_1__R4b__assume"
(define-fun math_simple_half__gcd__L_1__R4b__assume () Int
  (+ c1 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  math_simple_half__gcd__L_1__R4b__assume)

;; "Assume"
(assert (= math_simple_half__gcd__L_1__R4b__assume r4b))

;; "Assume"
(assert (in_range1 r4b))

(declare-const temp___171 Int)

;; "H"
(assert (= temp___171 r4b))

(declare-const o7 Int)

;; "H"
(assert (= o7 (min a b)))

(declare-const int_minqtresultqtunused1 Int)

;; "H"
(assert (= int_minqtresultqtunused1 o7))

(declare-const temp___172 Int)

;; "H"
(assert (= temp___172 (- o7 1)))

(declare-const infix_mnqtresultqtunused Int)

;; "H"
(assert (= infix_mnqtresultqtunused temp___172))

(declare-const j Int)

(declare-const jqtunused int__ref)

;; "H"
(assert (= jqtunused (int__refqtmk j)))

;; "H"
(assert (= j temp___171))

(declare-const int__contentqtresultqtunused4 Int)

;; "H"
(assert (= int__contentqtresultqtunused4 j))

(declare-const o8 Bool)

;; "H"
(assert (= o8 (ite (<= j temp___172) true false)))

(declare-const infix_lseqqtresultqtunused Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused o8))

(declare-const int__contentqtresultqtunused5 Int)

;; "H"
(assert (= int__contentqtresultqtunused5 j))

(declare-const o9 Bool)

;; "H"
(assert (= o9 (ite (<= temp___171 j) true false)))

(declare-const infix_lseqqtresultqtunused1 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused1 o9))

(declare-const o10 Bool)

;; "H"
(assert (= o10 (and o9 o8)))

(declare-const andbqtresultqtunused1 Bool)

;; "H"
(assert (= andbqtresultqtunused1 o10))

(declare-const o11 Int)

(declare-const int_minqtresultqtunused2 Int)

(declare-const int__contentqtresultqtunused6 Int)

(declare-const range_check_qtresultqtunused2 Int)

(declare-const usfqtunused Bool)

(declare-const anyqtresultqtunused Bool)

(declare-const j1 Int)

(declare-const jqtunused1 int__ref)

(declare-const int__contentqtresultqtunused7 Int)

(declare-const infix_eqqtresultqtunused2 Bool)

(declare-const usf Int)

(declare-const anyqtresultqtunused1 Int)

(declare-const xqtunused Int)

(declare-const int__contentqtresultqtunused8 Int)

(declare-const o12 Bool)

(declare-const infix_lseqqtresultqtunused2 Bool)

(declare-const int__contentqtresultqtunused9 Int)

(declare-const o13 Int)

(declare-const infix_plqtresultqtunused1 Int)

(declare-const o14 Bool)

(declare-const infix_lseqqtresultqtunused3 Bool)

(declare-const andbqtresultqtunused2 Bool)

;; "H"
(assert
  (=>
    (= o10 true)
    (and
      (= o11 (min a b))
      (and
        (= int_minqtresultqtunused2 o11)
        (and
          (= int__contentqtresultqtunused6 j)
          (and
            (in_range j)
            (and
              (= range_check_qtresultqtunused2 j)
              (and
                (not (= (divides j o11) true))
                (and
                  (and
                    (= anyqtresultqtunused1 usf)
                    (and
                      (= xqtunused usf)
                      (and
                        (= int__contentqtresultqtunused8 j)
                        (and
                          (= o12 (ite (<= usf j) true false))
                          (and
                            (= infix_lseqqtresultqtunused2 o12)
                            (and
                              (= int__contentqtresultqtunused9 c1)
                              (and
                                (= o13 (+ c1 1))
                                (and
                                  (= infix_plqtresultqtunused1 o13)
                                  (and
                                    (= o14 (ite (<= o13 usf) true false))
                                    (and
                                      (= infix_lseqqtresultqtunused3 
                                      o14)
                                      (= andbqtresultqtunused2 (and o14 
                                      o12))))))))))))
                  (and
                    (= usfqtunused (ite (forall ((x Int))
                                          (=>
                                            (and (<= (+ c1 1) x) (<= x j))
                                            (not
                                              (= (divides x (min a b)) true))))
                                     true
                                     false))
                    (and
                      (= anyqtresultqtunused (ite (forall ((x Int))
                                                    (=>
                                                      (and
                                                        (<= (+ c1 1) x)
                                                        (<= x j))
                                                      (not
                                                        (= (divides
                                                             x
                                                             (min a b)) true))))
                                               true
                                               false))
                      (and
                        (= jqtunused1 (int__refqtmk j1))
                        (and
                          (forall ((x Int))
                            (=>
                              (and (<= (+ c1 1) x) (<= x j1))
                              (not (= (divides x (min a b)) true))))
                          (and
                            (and (<= r4b j1) (<= j1 (- (min a b) 1)))
                            (and
                              (= int__contentqtresultqtunused7 j1)
                              (and
                                (= infix_eqqtresultqtunused2 (ite (= 
                                                               j1 temp___172)
                                                               true
                                                               false))
                                (= j1 temp___172)))))))))))))))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  c1)

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused () Bool
  (ite (< 1 c1) true false))

;; "H"
(assert (< 1 c1))

;; "temp___loop_entry_175'unused"
(define-fun temp___loop_entry_175qtunused () Int
  c1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused11 () Int
  c1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused12 () Int
  c1)

;; "o"
(define-fun o15 () Int
  (mod1 b c1))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused2 () Int
  o15)

;; "o"
(define-fun o16 () Bool
  (ite (= o15 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused3 () Bool
  o16)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused13 () Int
  c1)

;; "o"
(define-fun o17 () Int
  (mod1 a c1))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused3 () Int
  o17)

;; "o"
(define-fun o18 () Bool
  (ite (= o17 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused4 () Bool
  o18)

;; "o"
(define-fun o19 () Bool
  (and o18 o16))

;; "andb'result'unused"
(define-fun andbqtresultqtunused3 () Bool
  o19)

;; "H"
(assert (not (= o19 true)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused14 () Int
  c1)

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused1 () Bool
  (ite (< 1 c1) true false))

(declare-const c2 Int)

;; "c'unused"
(define-fun cqtunused2 () int__ref
  (int__refqtmk c2))

;; "LoopInvariant"
(assert (< 1 c2))

;; "LoopInvariant"
(assert
  (forall ((x Int))
    (=>
      (and (<= c2 x) (<= x (min a b)))
      (not (and (= (divides x a) true) (= (divides x b) true))))))

;; "loop_var___3185'unused"
(define-fun loop_var___3185qtunused () Int
  c2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused15 () Int
  c2)

;; "Assume"
(assert (in_range c2))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused16 () Int
  c2)

;; "o"
(define-fun o20 () Int
  (- c2 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused1 () Int
  o20)

;; "Ensures"
(assert (in_range o20))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o20)

(declare-const c3 Int)

;; "c'unused"
(define-fun cqtunused3 () int__ref
  (int__refqtmk c3))

;; "H"
(assert (= c3 o20))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused17 () Int
  c3)

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused2 () Bool
  (ite (< 1 c3) true false))

;; "H"
(assert (< 1 c3))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused18 () Int
  c3)

;; "o"
(define-fun o21 () Int
  (mod1 b c3))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused4 () Int
  o21)

;; "o"
(define-fun o22 () Bool
  (ite (= o21 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused5 () Bool
  o22)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused19 () Int
  c3)

;; "o"
(define-fun o23 () Int
  (mod1 a c3))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused5 () Int
  o23)

;; "o"
(define-fun o24 () Bool
  (ite (= o23 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused6 () Bool
  o24)

;; "o"
(define-fun o25 () Bool
  (and o24 o22))

;; "andb'result'unused"
(define-fun andbqtresultqtunused4 () Bool
  o25)

;; "H"
(assert (not (= o25 true)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused20 () Int
  c3)

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused3 () Bool
  (ite (< 1 c3) true false))

;; "loop_var_new___3185'unused"
(define-fun loop_var_new___3185qtunused () Int
  c3)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused21 () Int
  c3)

;; "H"
(assert (< c3 c2))

;; "LoopInvariant"
(assert (< 1 c3))

(declare-const x Int)

;; "H"
(assert (<= c3 x))

;; "H"
(assert (<= x (min a b)))

;; Goal "def'vc"
;; File "math_simple_half.ads", line 5, characters 0-0
(assert
  (not (not (and (= (divides x a) true) (= (divides x b) true)))))

(check-sat)
