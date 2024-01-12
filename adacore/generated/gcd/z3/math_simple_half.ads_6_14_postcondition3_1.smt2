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

(declare-const math_simple_half__gcd__result Int)

;; "math_simple_half__gcd__result'unused"
(define-fun math_simple_half__gcd__resultqtunused () int__ref
  (int__refqtmk math_simple_half__gcd__result))

(declare-const o Int)

;; "H"
(assert (= o (min a b)))

(declare-const int_minqtresultqtunused Int)

;; "H"
(assert (= int_minqtresultqtunused o))

;; "Ensures"
(assert (in_range o))

(declare-const range_check_qtresultqtunused Int)

;; "H"
(assert (= range_check_qtresultqtunused o))

(declare-const c Int)

(declare-const cqtunused int__ref)

;; "H"
(assert (= cqtunused (int__refqtmk c)))

;; "H"
(assert (= c o))

;; "Assume"
(assert (in_range c))

(declare-const int__contentqtresultqtunused Int)

;; "H"
(assert (= int__contentqtresultqtunused c))

(declare-const o1 Int)

;; "H"
(assert (= o1 (mod1 b c)))

(declare-const mod_qtresultqtunused Int)

;; "H"
(assert (= mod_qtresultqtunused o1))

(declare-const o2 Bool)

;; "H"
(assert (= o2 (ite (= o1 0) true false)))

(declare-const infix_eqqtresultqtunused Bool)

;; "H"
(assert (= infix_eqqtresultqtunused o2))

(declare-const int__contentqtresultqtunused1 Int)

;; "H"
(assert (= int__contentqtresultqtunused1 c))

(declare-const o3 Int)

;; "H"
(assert (= o3 (mod1 a c)))

(declare-const mod_qtresultqtunused1 Int)

;; "H"
(assert (= mod_qtresultqtunused1 o3))

(declare-const o4 Bool)

;; "H"
(assert (= o4 (ite (= o3 0) true false)))

(declare-const infix_eqqtresultqtunused1 Bool)

;; "H"
(assert (= infix_eqqtresultqtunused1 o4))

(declare-const o5 Bool)

;; "H"
(assert (= o5 (and o4 o2)))

(declare-const andbqtresultqtunused Bool)

;; "H"
(assert (= andbqtresultqtunused o5))

(declare-const spark__branch Bool)

(declare-const spark__branchqtunused bool__ref)

;; "H"
(assert (= spark__branchqtunused (bool__refqtmk spark__branch)))

;; "H"
(assert (= spark__branch o5))

(declare-const bool__contentqtresultqtunused Bool)

;; "H"
(assert (= bool__contentqtresultqtunused spark__branch))

(declare-const int__contentqtresultqtunused2 Int)

(declare-const o6 Int)

(declare-const div_qtresultqtunused Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const c1 Int)

(declare-const cqtunused1 int__ref)

(declare-const int__contentqtresultqtunused3 Int)

(declare-const math_simple_half__gcd__L_1__R4b__assume Int)

(declare-const infix_plqtresultqtunused Int)

(declare-const c2 Int)

(declare-const cqtunused2 int__ref)

(declare-const int__contentqtresultqtunused4 Int)

(declare-const int__contentqtresultqtunused5 Int)

(declare-const infix_gtqtresultqtunused Bool)

(declare-const temp___loop_entry_175qtunused Int)

(declare-const int__contentqtresultqtunused6 Int)

(declare-const int__contentqtresultqtunused7 Int)

(declare-const o7 Int)

(declare-const mod_qtresultqtunused2 Int)

(declare-const o8 Bool)

(declare-const infix_eqqtresultqtunused2 Bool)

(declare-const int__contentqtresultqtunused8 Int)

(declare-const o9 Int)

(declare-const mod_qtresultqtunused3 Int)

(declare-const o10 Bool)

(declare-const infix_eqqtresultqtunused3 Bool)

(declare-const o11 Bool)

(declare-const andbqtresultqtunused1 Bool)

(declare-const int__contentqtresultqtunused9 Int)

(declare-const infix_gtqtresultqtunused1 Bool)

(declare-const c3 Int)

(declare-const cqtunused3 int__ref)

(declare-const loop_var___3185qtunused Int)

(declare-const int__contentqtresultqtunused10 Int)

(declare-const int__contentqtresultqtunused11 Int)

(declare-const o12 Int)

(declare-const infix_mnqtresultqtunused Int)

(declare-const range_check_qtresultqtunused2 Int)

(declare-const int__contentqtresultqtunused12 Int)

(declare-const infix_gtqtresultqtunused2 Bool)

(declare-const int__contentqtresultqtunused13 Int)

(declare-const o13 Int)

(declare-const mod_qtresultqtunused4 Int)

(declare-const o14 Bool)

(declare-const infix_eqqtresultqtunused4 Bool)

(declare-const int__contentqtresultqtunused14 Int)

(declare-const o15 Int)

(declare-const mod_qtresultqtunused5 Int)

(declare-const o16 Bool)

(declare-const infix_eqqtresultqtunused5 Bool)

(declare-const o17 Bool)

(declare-const andbqtresultqtunused2 Bool)

(declare-const temp___171 Int)

(declare-const o18 Int)

(declare-const int_minqtresultqtunused1 Int)

(declare-const temp___172 Int)

(declare-const infix_mnqtresultqtunused1 Int)

(declare-const j Int)

(declare-const jqtunused int__ref)

(declare-const int__contentqtresultqtunused15 Int)

(declare-const o19 Bool)

(declare-const infix_lseqqtresultqtunused Bool)

(declare-const int__contentqtresultqtunused16 Int)

(declare-const o20 Bool)

(declare-const infix_lseqqtresultqtunused1 Bool)

(declare-const o21 Bool)

(declare-const andbqtresultqtunused3 Bool)

(declare-const o22 Int)

(declare-const int_minqtresultqtunused2 Int)

(declare-const int__contentqtresultqtunused17 Int)

(declare-const range_check_qtresultqtunused3 Int)

(declare-const usfqtunused Bool)

(declare-const anyqtresultqtunused Bool)

(declare-const j1 Int)

(declare-const jqtunused1 int__ref)

(declare-const int__contentqtresultqtunused18 Int)

(declare-const infix_eqqtresultqtunused6 Bool)

(declare-const usf Int)

(declare-const anyqtresultqtunused1 Int)

(declare-const xqtunused Int)

(declare-const int__contentqtresultqtunused19 Int)

(declare-const o23 Bool)

(declare-const infix_lseqqtresultqtunused2 Bool)

(declare-const int__contentqtresultqtunused20 Int)

(declare-const o24 Int)

(declare-const infix_plqtresultqtunused1 Int)

(declare-const o25 Bool)

(declare-const infix_lseqqtresultqtunused3 Bool)

(declare-const andbqtresultqtunused4 Bool)

(declare-const int__contentqtresultqtunused21 Int)

;; "H"
(assert
  (ite (= spark__branch true)
    (and
      (= int__contentqtresultqtunused21 c)
      (= math_simple_half__gcd__result c))
    (and
      (= int__contentqtresultqtunused2 c)
      (and
        (= o6 (__cdiv c 2))
        (and
          (= div_qtresultqtunused o6)
          (and
            (in_range o6)
            (and
              (= range_check_qtresultqtunused1 o6)
              (and
                (= cqtunused1 (int__refqtmk c1))
                (and
                  (= c1 o6)
                  (and
                    (= int__contentqtresultqtunused3 c1)
                    (and
                      (= math_simple_half__gcd__L_1__R4b__assume (+ c1 1))
                      (and
                        (= infix_plqtresultqtunused math_simple_half__gcd__L_1__R4b__assume)
                        (and
                          (= math_simple_half__gcd__L_1__R4b__assume 
                          r4b)
                          (and
                            (in_range1 r4b)
                            (and
                              (and
                                (= temp___171 r4b)
                                (and
                                  (= o18 (min a b))
                                  (and
                                    (= int_minqtresultqtunused1 o18)
                                    (and
                                      (= temp___172 (- o18 1))
                                      (and
                                        (= infix_mnqtresultqtunused1 
                                        temp___172)
                                        (and
                                          (= jqtunused (int__refqtmk j))
                                          (and
                                            (= j temp___171)
                                            (and
                                              (= int__contentqtresultqtunused15 
                                              j)
                                              (and
                                                (= o19 (ite (<= j temp___172)
                                                         true
                                                         false))
                                                (and
                                                  (= infix_lseqqtresultqtunused 
                                                  o19)
                                                  (and
                                                    (= int__contentqtresultqtunused16 
                                                    j)
                                                    (and
                                                      (= o20 (ite (<= 
                                                               temp___171 
                                                               j)
                                                               true
                                                               false))
                                                      (and
                                                        (= infix_lseqqtresultqtunused1 
                                                        o20)
                                                        (and
                                                          (= o21 (and 
                                                          o20 o19))
                                                          (and
                                                            (= andbqtresultqtunused3 
                                                            o21)
                                                            (=>
                                                              (= o21 true)
                                                              (and
                                                                (= o22 
                                                                (min
                                                                  a
                                                                  b))
                                                                (and
                                                                  (= 
                                                                  int_minqtresultqtunused2 
                                                                  o22)
                                                                  (and
                                                                    (= 
                                                                    int__contentqtresultqtunused17 
                                                                    j)
                                                                    (and
                                                                    (in_range
                                                                    j)
                                                                    (and
                                                                    (= 
                                                                    range_check_qtresultqtunused3 
                                                                    j)
                                                                    (and
                                                                    (not
                                                                    (= 
                                                                    (divides
                                                                    j
                                                                    o22) true))
                                                                    (and
                                                                    (and
                                                                    (= 
                                                                    anyqtresultqtunused1 
                                                                    usf)
                                                                    (and
                                                                    (= 
                                                                    xqtunused 
                                                                    usf)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused19 
                                                                    j)
                                                                    (and
                                                                    (= 
                                                                    o23 
                                                                    (ite (<= 
                                                                    usf 
                                                                    j)
                                                                    true
                                                                    false))
                                                                    (and
                                                                    (= 
                                                                    infix_lseqqtresultqtunused2 
                                                                    o23)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused20 
                                                                    c1)
                                                                    (and
                                                                    (= 
                                                                    o24 (+ 
                                                                    c1 1))
                                                                    (and
                                                                    (= 
                                                                    infix_plqtresultqtunused1 
                                                                    o24)
                                                                    (and
                                                                    (= 
                                                                    o25 
                                                                    (ite (<= 
                                                                    o24 
                                                                    usf)
                                                                    true
                                                                    false))
                                                                    (and
                                                                    (= 
                                                                    infix_lseqqtresultqtunused3 
                                                                    o25)
                                                                    (= 
                                                                    andbqtresultqtunused4 (and 
                                                                    o25 
                                                                    o23))))))))))))
                                                                    (and
                                                                    (= 
                                                                    usfqtunused 
                                                                    (ite 
                                                                    (forall 
                                                                    ((x Int))
                                                                    (=>
                                                                    (and
                                                                    (<= (+ 
                                                                    c1 1) x)
                                                                    (<= x 
                                                                    j))
                                                                    (not
                                                                    (= 
                                                                    (divides
                                                                    x
                                                                    (min a b)) true))))
                                                                    true
                                                                    false))
                                                                    (and
                                                                    (= 
                                                                    anyqtresultqtunused 
                                                                    (ite 
                                                                    (forall 
                                                                    ((x Int))
                                                                    (=>
                                                                    (and
                                                                    (<= (+ 
                                                                    c1 1) x)
                                                                    (<= x 
                                                                    j))
                                                                    (not
                                                                    (= 
                                                                    (divides
                                                                    x
                                                                    (min a b)) true))))
                                                                    true
                                                                    false))
                                                                    (and
                                                                    (= 
                                                                    jqtunused1 
                                                                    (int__refqtmk
                                                                    j1))
                                                                    (and
                                                                    (forall 
                                                                    ((x Int))
                                                                    (=>
                                                                    (and
                                                                    (<= (+ 
                                                                    c1 1) x)
                                                                    (<= x 
                                                                    j1))
                                                                    (not
                                                                    (= 
                                                                    (divides
                                                                    x
                                                                    (min a b)) true))))
                                                                    (and
                                                                    (and
                                                                    (<= 
                                                                    r4b 
                                                                    j1)
                                                                    (<= 
                                                                    j1 (- 
                                                                    (min
                                                                    a
                                                                    b) 1)))
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused18 
                                                                    j1)
                                                                    (and
                                                                    (= 
                                                                    infix_eqqtresultqtunused6 
                                                                    (ite (= 
                                                                    j1 
                                                                    temp___172)
                                                                    true
                                                                    false))
                                                                    (= 
                                                                    j1 
                                                                    temp___172)))))))))))))))))))))))))))))))
                              (and
                                (= cqtunused2 (int__refqtmk c2))
                                (and
                                  (and
                                    (= int__contentqtresultqtunused5 
                                    c1)
                                    (and
                                      (= infix_gtqtresultqtunused (ite (< 1 
                                                                    c1)
                                                                    true
                                                                    false))
                                      (ite (< 1 c1)
                                        (and
                                          (= temp___loop_entry_175qtunused 
                                          c1)
                                          (and
                                            (= int__contentqtresultqtunused6 
                                            c1)
                                            (and
                                              (= int__contentqtresultqtunused7 
                                              c1)
                                              (and
                                                (= o7 (mod1 b c1))
                                                (and
                                                  (= mod_qtresultqtunused2 
                                                  o7)
                                                  (and
                                                    (= o8 (ite (= o7 0)
                                                            true
                                                            false))
                                                    (and
                                                      (= infix_eqqtresultqtunused2 
                                                      o8)
                                                      (and
                                                        (= int__contentqtresultqtunused8 
                                                        c1)
                                                        (and
                                                          (= o9 (mod1 a c1))
                                                          (and
                                                            (= mod_qtresultqtunused3 
                                                            o9)
                                                            (and
                                                              (= o10 
                                                              (ite (= 
                                                                o9 0)
                                                                true
                                                                false))
                                                              (and
                                                                (= infix_eqqtresultqtunused3 
                                                                o10)
                                                                (and
                                                                  (= 
                                                                  o11 (and 
                                                                  o10 
                                                                  o8))
                                                                  (and
                                                                    (= 
                                                                    andbqtresultqtunused1 
                                                                    o11)
                                                                    (ite (= 
                                                                    o11 true)
                                                                    (= 
                                                                    c2 
                                                                    c1)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused9 
                                                                    c1)
                                                                    (and
                                                                    (= 
                                                                    infix_gtqtresultqtunused1 
                                                                    (ite (< 1 
                                                                    c1)
                                                                    true
                                                                    false))
                                                                    (and
                                                                    (= 
                                                                    cqtunused3 
                                                                    (int__refqtmk
                                                                    c3))
                                                                    (and
                                                                    (and
                                                                    (< 1 
                                                                    c3)
                                                                    (forall 
                                                                    ((x Int))
                                                                    (=>
                                                                    (and
                                                                    (<= 
                                                                    c3 x)
                                                                    (<= x 
                                                                    (min
                                                                    a
                                                                    b)))
                                                                    (not
                                                                    (and
                                                                    (= 
                                                                    (divides
                                                                    x
                                                                    a) true)
                                                                    (= 
                                                                    (divides
                                                                    x
                                                                    b) true))))))
                                                                    (and
                                                                    (= 
                                                                    loop_var___3185qtunused 
                                                                    c3)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused10 
                                                                    c3)
                                                                    (and
                                                                    (in_range
                                                                    c3)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused11 
                                                                    c3)
                                                                    (and
                                                                    (= 
                                                                    o12 (- 
                                                                    c3 1))
                                                                    (and
                                                                    (= 
                                                                    infix_mnqtresultqtunused 
                                                                    o12)
                                                                    (and
                                                                    (in_range
                                                                    o12)
                                                                    (and
                                                                    (= 
                                                                    range_check_qtresultqtunused2 
                                                                    o12)
                                                                    (and
                                                                    (= 
                                                                    c2 
                                                                    o12)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused12 
                                                                    c2)
                                                                    (and
                                                                    (= 
                                                                    infix_gtqtresultqtunused2 
                                                                    (ite (< 1 
                                                                    c2)
                                                                    true
                                                                    false))
                                                                    (=>
                                                                    (< 1 
                                                                    c2)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused13 
                                                                    c2)
                                                                    (and
                                                                    (= 
                                                                    o13 
                                                                    (mod1
                                                                    b
                                                                    c2))
                                                                    (and
                                                                    (= 
                                                                    mod_qtresultqtunused4 
                                                                    o13)
                                                                    (and
                                                                    (= 
                                                                    o14 
                                                                    (ite (= 
                                                                    o13 0)
                                                                    true
                                                                    false))
                                                                    (and
                                                                    (= 
                                                                    infix_eqqtresultqtunused4 
                                                                    o14)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused14 
                                                                    c2)
                                                                    (and
                                                                    (= 
                                                                    o15 
                                                                    (mod1
                                                                    a
                                                                    c2))
                                                                    (and
                                                                    (= 
                                                                    mod_qtresultqtunused5 
                                                                    o15)
                                                                    (and
                                                                    (= 
                                                                    o16 
                                                                    (ite (= 
                                                                    o15 0)
                                                                    true
                                                                    false))
                                                                    (and
                                                                    (= 
                                                                    infix_eqqtresultqtunused5 
                                                                    o16)
                                                                    (and
                                                                    (= 
                                                                    o17 (and 
                                                                    o16 
                                                                    o14))
                                                                    (and
                                                                    (= 
                                                                    andbqtresultqtunused2 
                                                                    o17)
                                                                    (= 
                                                                    o17 true))))))))))))))))))))))))))))))))))))))))))))
                                        (= c2 c1))))
                                  (and
                                    (= int__contentqtresultqtunused4 
                                    c2)
                                    (= math_simple_half__gcd__result 
                                    c2)))))))))))))))))))

;; "result'unused"
(define-fun resultqtunused () Int
  math_simple_half__gcd__result)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused22 () Int
  math_simple_half__gcd__result)

(declare-const x Int)

;; "H"
(assert (<= (+ math_simple_half__gcd__result 1) x))

;; "H"
(assert (<= x (min a b)))

;; Goal "def'vc"
;; File "math_simple_half.ads", line 5, characters 0-0
(assert
  (not (not (and (= (divides x a) true) (= (divides x b) true)))))

(check-sat)