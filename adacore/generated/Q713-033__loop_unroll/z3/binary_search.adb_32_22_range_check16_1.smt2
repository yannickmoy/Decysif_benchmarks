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

;; "to_rep"
(define-fun to_rep ((x integer)) Int
  (integerqtint x))

;; "of_rep"
(declare-fun of_rep (Int) integer)

;; "inversion_axiom"
(assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

(declare-const a (Array Int integer))

(declare-const i Int)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 10)))

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

(declare-const left Int)

(declare-const right Int)

(declare-const med Int)

;; "med'unused"
(define-fun medqtunused () int__ref
  (int__refqtmk med))

;; "right'unused"
(define-fun rightqtunused () int__ref
  (int__refqtmk right))

;; "left'unused"
(define-fun leftqtunused () int__ref
  (int__refqtmk left))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range i))

;; "Assume"
(assert
  (forall ((i1 Int))
    (=>
      (and (<= 1 i1) (<= i1 10))
      (forall ((i2 Int))
        (=>
          (and (<= i1 i2) (<= i2 10))
          (<= (to_rep (select a i1)) (to_rep (select a i2))))))))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 left))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 right))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 med))

(declare-const left1 Int)

;; "left'unused"
(define-fun leftqtunused1 () int__ref
  (int__refqtmk left1))

;; "H"
(assert (= left1 1))

(declare-const right1 Int)

;; "right'unused"
(define-fun rightqtunused1 () int__ref
  (int__refqtmk right1))

;; "H"
(assert (= right1 10))

(declare-const o Bool)

(declare-const int__contentqtresultqtunused Int)

;; "H"
(assert (= int__contentqtresultqtunused left1))

(declare-const o1 integer)

;; "H"
(assert (= o1 (select a left1)))

(declare-const getqtresultqtunused integer)

;; "H"
(assert (= getqtresultqtunused o1))

(declare-const o2 Int)

;; "Ensures"
(assert (= (to_rep o1) o2))

(declare-const to_repqtresultqtunused Int)

;; "H"
(assert (= to_repqtresultqtunused o2))

(declare-const infix_gtqtresultqtunused Bool)

;; "H"
(assert (= infix_gtqtresultqtunused (ite (< i o2) true false)))

(declare-const int__contentqtresultqtunused1 Int)

(declare-const o3 integer)

(declare-const getqtresultqtunused1 integer)

(declare-const o4 Int)

(declare-const to_repqtresultqtunused1 Int)

(declare-const infix_lsqtresultqtunused Bool)

;; "H"
(assert
  (ite (< i o2)
    (= o true)
    (and
      (= int__contentqtresultqtunused1 right1)
      (and
        (= o3 (select a right1))
        (and
          (= getqtresultqtunused1 o3)
          (and
            (= (to_rep o3) o4)
            (and
              (= to_repqtresultqtunused1 o4)
              (and
                (= o (ite (< o4 i) true false))
                (= infix_lsqtresultqtunused o)))))))))

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

;; "temp___loop_entry_204'unused"
(define-fun temp___loop_entry_204qtunused () Int
  med)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  med)

;; "temp___loop_entry_203'unused"
(define-fun temp___loop_entry_203qtunused () Int
  right1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  right1)

;; "temp___loop_entry_202'unused"
(define-fun temp___loop_entry_202qtunused () Int
  left1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused4 () Int
  left1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  left1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  right1)

;; "o"
(define-fun o5 () Int
  (- right1 left1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused () Int
  o5)

;; "o"
(define-fun o6 () Int
  (__cdiv o5 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused () Int
  o6)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  left1)

;; "o"
(define-fun o7 () Int
  (+ left1 o6))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o7)

;; "Ensures"
(assert (in_range1 o7))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o7)

(declare-const med1 Int)

;; "med'unused"
(define-fun medqtunused1 () int__ref
  (int__refqtmk med1))

;; "H"
(assert (= med1 o7))

(declare-const spark__branch1 Bool)

(declare-const left2 Int)

(declare-const right2 Int)

;; "right'unused"
(define-fun rightqtunused2 () int__ref
  (int__refqtmk right2))

;; "left'unused"
(define-fun leftqtunused2 () int__ref
  (int__refqtmk left2))

;; "spark__branch'unused"
(define-fun spark__branchqtunused1 () bool__ref
  (bool__refqtmk spark__branch1))

(declare-const int__contentqtresultqtunused8 Int)

;; "H"
(assert (= int__contentqtresultqtunused8 med1))

(declare-const o8 integer)

;; "H"
(assert (= o8 (select a med1)))

(declare-const getqtresultqtunused2 integer)

;; "H"
(assert (= getqtresultqtunused2 o8))

(declare-const o9 Int)

;; "Ensures"
(assert (= (to_rep o8) o9))

(declare-const to_repqtresultqtunused2 Int)

;; "H"
(assert (= to_repqtresultqtunused2 o9))

(declare-const o10 Bool)

;; "H"
(assert (= o10 (ite (< o9 i) true false)))

(declare-const infix_lsqtresultqtunused1 Bool)

;; "H"
(assert (= infix_lsqtresultqtunused1 o10))

(declare-const spark__branch2 Bool)

(declare-const spark__branchqtunused2 bool__ref)

;; "H"
(assert (= spark__branchqtunused2 (bool__refqtmk spark__branch2)))

;; "H"
(assert (= spark__branch2 o10))

(declare-const bool__contentqtresultqtunused1 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused1 spark__branch2))

(declare-const int__contentqtresultqtunused9 Int)

(declare-const o11 integer)

(declare-const getqtresultqtunused3 integer)

(declare-const o12 Int)

(declare-const to_repqtresultqtunused3 Int)

(declare-const o13 Bool)

(declare-const infix_gtqtresultqtunused1 Bool)

(declare-const bool__contentqtresultqtunused2 Bool)

(declare-const int__contentqtresultqtunused10 Int)

(declare-const o14 Int)

(declare-const infix_mnqtresultqtunused1 Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const int__contentqtresultqtunused11 Int)

(declare-const o15 Int)

(declare-const infix_plqtresultqtunused1 Int)

(declare-const range_check_qtresultqtunused2 Int)

;; "H"
(assert
  (ite (= spark__branch2 true)
    (and
      (and
        (and
          (= int__contentqtresultqtunused11 med1)
          (and
            (= o15 (+ med1 1))
            (and
              (= infix_plqtresultqtunused1 o15)
              (and
                (in_range1 o15)
                (and (= range_check_qtresultqtunused2 o15) (= left2 o15))))))
        (= spark__branch1 spark__branch2))
      (= right2 right1))
    (and
      (and
        (= int__contentqtresultqtunused9 med1)
        (and
          (= o11 (select a med1))
          (and
            (= getqtresultqtunused3 o11)
            (and
              (= (to_rep o11) o12)
              (and
                (= to_repqtresultqtunused3 o12)
                (and
                  (= o13 (ite (< i o12) true false))
                  (and
                    (= infix_gtqtresultqtunused1 o13)
                    (and
                      (= spark__branch1 o13)
                      (and
                        (= bool__contentqtresultqtunused2 spark__branch1)
                        (and
                          (= spark__branch1 true)
                          (and
                            (= int__contentqtresultqtunused10 med1)
                            (and
                              (= o14 (- med1 1))
                              (and
                                (= infix_mnqtresultqtunused1 o14)
                                (and
                                  (in_range1 o14)
                                  (and
                                    (= range_check_qtresultqtunused1 
                                    o14)
                                    (= right2 o14))))))))))))))))
      (= left2 left1))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused12 () Int
  left2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused13 () Int
  right2)

;; "o"
(define-fun o16 () Int
  (- right2 left2))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused2 () Int
  o16)

;; "o"
(define-fun o17 () Int
  (__cdiv o16 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused1 () Int
  o17)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused14 () Int
  left2)

;; "o"
(define-fun o18 () Int
  (+ left2 o17))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused2 () Int
  o18)

;; "Ensures"
(assert (in_range1 o18))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o18)

(declare-const med2 Int)

;; "med'unused"
(define-fun medqtunused2 () int__ref
  (int__refqtmk med2))

;; "H"
(assert (= med2 o18))

(declare-const spark__branch3 Bool)

(declare-const left3 Int)

(declare-const right3 Int)

;; "right'unused"
(define-fun rightqtunused3 () int__ref
  (int__refqtmk right3))

;; "left'unused"
(define-fun leftqtunused3 () int__ref
  (int__refqtmk left3))

;; "spark__branch'unused"
(define-fun spark__branchqtunused3 () bool__ref
  (bool__refqtmk spark__branch3))

(declare-const int__contentqtresultqtunused15 Int)

;; "H"
(assert (= int__contentqtresultqtunused15 med2))

(declare-const o19 integer)

;; "H"
(assert (= o19 (select a med2)))

(declare-const getqtresultqtunused4 integer)

;; "H"
(assert (= getqtresultqtunused4 o19))

(declare-const o20 Int)

;; "Ensures"
(assert (= (to_rep o19) o20))

(declare-const to_repqtresultqtunused4 Int)

;; "H"
(assert (= to_repqtresultqtunused4 o20))

(declare-const o21 Bool)

;; "H"
(assert (= o21 (ite (< o20 i) true false)))

(declare-const infix_lsqtresultqtunused2 Bool)

;; "H"
(assert (= infix_lsqtresultqtunused2 o21))

(declare-const spark__branch4 Bool)

(declare-const spark__branchqtunused4 bool__ref)

;; "H"
(assert (= spark__branchqtunused4 (bool__refqtmk spark__branch4)))

;; "H"
(assert (= spark__branch4 o21))

(declare-const bool__contentqtresultqtunused3 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused3 spark__branch4))

(declare-const int__contentqtresultqtunused16 Int)

(declare-const o22 integer)

(declare-const getqtresultqtunused5 integer)

(declare-const o23 Int)

(declare-const to_repqtresultqtunused5 Int)

(declare-const o24 Bool)

(declare-const infix_gtqtresultqtunused2 Bool)

(declare-const bool__contentqtresultqtunused4 Bool)

(declare-const int__contentqtresultqtunused17 Int)

(declare-const o25 Int)

(declare-const infix_mnqtresultqtunused3 Int)

(declare-const range_check_qtresultqtunused4 Int)

(declare-const int__contentqtresultqtunused18 Int)

(declare-const o26 Int)

(declare-const infix_plqtresultqtunused3 Int)

(declare-const range_check_qtresultqtunused5 Int)

;; "H"
(assert
  (ite (= spark__branch4 true)
    (and
      (and
        (and
          (= int__contentqtresultqtunused18 med2)
          (and
            (= o26 (+ med2 1))
            (and
              (= infix_plqtresultqtunused3 o26)
              (and
                (in_range1 o26)
                (and (= range_check_qtresultqtunused5 o26) (= left3 o26))))))
        (= spark__branch3 spark__branch4))
      (= right3 right2))
    (and
      (and
        (= int__contentqtresultqtunused16 med2)
        (and
          (= o22 (select a med2))
          (and
            (= getqtresultqtunused5 o22)
            (and
              (= (to_rep o22) o23)
              (and
                (= to_repqtresultqtunused5 o23)
                (and
                  (= o24 (ite (< i o23) true false))
                  (and
                    (= infix_gtqtresultqtunused2 o24)
                    (and
                      (= spark__branch3 o24)
                      (and
                        (= bool__contentqtresultqtunused4 spark__branch3)
                        (and
                          (= spark__branch3 true)
                          (and
                            (= int__contentqtresultqtunused17 med2)
                            (and
                              (= o25 (- med2 1))
                              (and
                                (= infix_mnqtresultqtunused3 o25)
                                (and
                                  (in_range1 o25)
                                  (and
                                    (= range_check_qtresultqtunused4 
                                    o25)
                                    (= right3 o25))))))))))))))))
      (= left3 left2))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused19 () Int
  left3)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused20 () Int
  right3)

;; "o"
(define-fun o27 () Int
  (- right3 left3))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused4 () Int
  o27)

;; "o"
(define-fun o28 () Int
  (__cdiv o27 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused2 () Int
  o28)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused21 () Int
  left3)

;; "o"
(define-fun o29 () Int
  (+ left3 o28))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused4 () Int
  o29)

;; "Ensures"
(assert (in_range1 o29))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused6 () Int
  o29)

(declare-const med3 Int)

;; "med'unused"
(define-fun medqtunused3 () int__ref
  (int__refqtmk med3))

;; "H"
(assert (= med3 o29))

(declare-const spark__branch5 Bool)

(declare-const left4 Int)

(declare-const right4 Int)

;; "right'unused"
(define-fun rightqtunused4 () int__ref
  (int__refqtmk right4))

;; "left'unused"
(define-fun leftqtunused4 () int__ref
  (int__refqtmk left4))

;; "spark__branch'unused"
(define-fun spark__branchqtunused5 () bool__ref
  (bool__refqtmk spark__branch5))

(declare-const int__contentqtresultqtunused22 Int)

;; "H"
(assert (= int__contentqtresultqtunused22 med3))

(declare-const o30 integer)

;; "H"
(assert (= o30 (select a med3)))

(declare-const getqtresultqtunused6 integer)

;; "H"
(assert (= getqtresultqtunused6 o30))

(declare-const o31 Int)

;; "Ensures"
(assert (= (to_rep o30) o31))

(declare-const to_repqtresultqtunused6 Int)

;; "H"
(assert (= to_repqtresultqtunused6 o31))

(declare-const o32 Bool)

;; "H"
(assert (= o32 (ite (< o31 i) true false)))

(declare-const infix_lsqtresultqtunused3 Bool)

;; "H"
(assert (= infix_lsqtresultqtunused3 o32))

(declare-const spark__branch6 Bool)

(declare-const spark__branchqtunused6 bool__ref)

;; "H"
(assert (= spark__branchqtunused6 (bool__refqtmk spark__branch6)))

;; "H"
(assert (= spark__branch6 o32))

(declare-const bool__contentqtresultqtunused5 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused5 spark__branch6))

(declare-const int__contentqtresultqtunused23 Int)

(declare-const o33 integer)

(declare-const getqtresultqtunused7 integer)

(declare-const o34 Int)

(declare-const to_repqtresultqtunused7 Int)

(declare-const o35 Bool)

(declare-const infix_gtqtresultqtunused3 Bool)

(declare-const bool__contentqtresultqtunused6 Bool)

(declare-const int__contentqtresultqtunused24 Int)

(declare-const o36 Int)

(declare-const infix_mnqtresultqtunused5 Int)

(declare-const range_check_qtresultqtunused7 Int)

(declare-const int__contentqtresultqtunused25 Int)

(declare-const o37 Int)

(declare-const infix_plqtresultqtunused5 Int)

(declare-const range_check_qtresultqtunused8 Int)

;; "H"
(assert
  (ite (= spark__branch6 true)
    (and
      (and
        (and
          (= int__contentqtresultqtunused25 med3)
          (and
            (= o37 (+ med3 1))
            (and
              (= infix_plqtresultqtunused5 o37)
              (and
                (in_range1 o37)
                (and (= range_check_qtresultqtunused8 o37) (= left4 o37))))))
        (= spark__branch5 spark__branch6))
      (= right4 right3))
    (and
      (and
        (= int__contentqtresultqtunused23 med3)
        (and
          (= o33 (select a med3))
          (and
            (= getqtresultqtunused7 o33)
            (and
              (= (to_rep o33) o34)
              (and
                (= to_repqtresultqtunused7 o34)
                (and
                  (= o35 (ite (< i o34) true false))
                  (and
                    (= infix_gtqtresultqtunused3 o35)
                    (and
                      (= spark__branch5 o35)
                      (and
                        (= bool__contentqtresultqtunused6 spark__branch5)
                        (and
                          (= spark__branch5 true)
                          (and
                            (= int__contentqtresultqtunused24 med3)
                            (and
                              (= o36 (- med3 1))
                              (and
                                (= infix_mnqtresultqtunused5 o36)
                                (and
                                  (in_range1 o36)
                                  (and
                                    (= range_check_qtresultqtunused7 
                                    o36)
                                    (= right4 o36))))))))))))))))
      (= left4 left3))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused26 () Int
  left4)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused27 () Int
  right4)

;; "o"
(define-fun o38 () Int
  (- right4 left4))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused6 () Int
  o38)

;; "o"
(define-fun o39 () Int
  (__cdiv o38 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused3 () Int
  o39)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused28 () Int
  left4)

;; "o"
(define-fun o40 () Int
  (+ left4 o39))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused6 () Int
  o40)

;; "Ensures"
(assert (in_range1 o40))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused9 () Int
  o40)

(declare-const med4 Int)

;; "med'unused"
(define-fun medqtunused4 () int__ref
  (int__refqtmk med4))

;; "H"
(assert (= med4 o40))

(declare-const spark__branch7 Bool)

(declare-const left5 Int)

(declare-const right5 Int)

;; "right'unused"
(define-fun rightqtunused5 () int__ref
  (int__refqtmk right5))

;; "left'unused"
(define-fun leftqtunused5 () int__ref
  (int__refqtmk left5))

;; "spark__branch'unused"
(define-fun spark__branchqtunused7 () bool__ref
  (bool__refqtmk spark__branch7))

(declare-const int__contentqtresultqtunused29 Int)

;; "H"
(assert (= int__contentqtresultqtunused29 med4))

(declare-const o41 integer)

;; "H"
(assert (= o41 (select a med4)))

(declare-const getqtresultqtunused8 integer)

;; "H"
(assert (= getqtresultqtunused8 o41))

(declare-const o42 Int)

;; "Ensures"
(assert (= (to_rep o41) o42))

(declare-const to_repqtresultqtunused8 Int)

;; "H"
(assert (= to_repqtresultqtunused8 o42))

(declare-const o43 Bool)

;; "H"
(assert (= o43 (ite (< o42 i) true false)))

(declare-const infix_lsqtresultqtunused4 Bool)

;; "H"
(assert (= infix_lsqtresultqtunused4 o43))

(declare-const spark__branch8 Bool)

(declare-const spark__branchqtunused8 bool__ref)

;; "H"
(assert (= spark__branchqtunused8 (bool__refqtmk spark__branch8)))

;; "H"
(assert (= spark__branch8 o43))

(declare-const bool__contentqtresultqtunused7 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused7 spark__branch8))

(declare-const int__contentqtresultqtunused30 Int)

(declare-const o44 integer)

(declare-const getqtresultqtunused9 integer)

(declare-const o45 Int)

(declare-const to_repqtresultqtunused9 Int)

(declare-const o46 Bool)

(declare-const infix_gtqtresultqtunused4 Bool)

(declare-const bool__contentqtresultqtunused8 Bool)

(declare-const int__contentqtresultqtunused31 Int)

(declare-const o47 Int)

(declare-const infix_mnqtresultqtunused7 Int)

(declare-const range_check_qtresultqtunused10 Int)

(declare-const int__contentqtresultqtunused32 Int)

(declare-const o48 Int)

(declare-const infix_plqtresultqtunused7 Int)

(declare-const range_check_qtresultqtunused11 Int)

;; "H"
(assert
  (ite (= spark__branch8 true)
    (and
      (and
        (and
          (= int__contentqtresultqtunused32 med4)
          (and
            (= o48 (+ med4 1))
            (and
              (= infix_plqtresultqtunused7 o48)
              (and
                (in_range1 o48)
                (and (= range_check_qtresultqtunused11 o48) (= left5 o48))))))
        (= spark__branch7 spark__branch8))
      (= right5 right4))
    (and
      (and
        (= int__contentqtresultqtunused30 med4)
        (and
          (= o44 (select a med4))
          (and
            (= getqtresultqtunused9 o44)
            (and
              (= (to_rep o44) o45)
              (and
                (= to_repqtresultqtunused9 o45)
                (and
                  (= o46 (ite (< i o45) true false))
                  (and
                    (= infix_gtqtresultqtunused4 o46)
                    (and
                      (= spark__branch7 o46)
                      (and
                        (= bool__contentqtresultqtunused8 spark__branch7)
                        (and
                          (= spark__branch7 true)
                          (and
                            (= int__contentqtresultqtunused31 med4)
                            (and
                              (= o47 (- med4 1))
                              (and
                                (= infix_mnqtresultqtunused7 o47)
                                (and
                                  (in_range1 o47)
                                  (and
                                    (= range_check_qtresultqtunused10 
                                    o47)
                                    (= right5 o47))))))))))))))))
      (= left5 left4))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused33 () Int
  left5)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused34 () Int
  right5)

;; "o"
(define-fun o49 () Int
  (- right5 left5))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused8 () Int
  o49)

;; "o"
(define-fun o50 () Int
  (__cdiv o49 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused4 () Int
  o50)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused35 () Int
  left5)

;; "o"
(define-fun o51 () Int
  (+ left5 o50))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused8 () Int
  o51)

;; "Ensures"
(assert (in_range1 o51))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused12 () Int
  o51)

(declare-const med5 Int)

;; "med'unused"
(define-fun medqtunused5 () int__ref
  (int__refqtmk med5))

;; "H"
(assert (= med5 o51))

(declare-const spark__branch9 Bool)

(declare-const left6 Int)

(declare-const right6 Int)

;; "right'unused"
(define-fun rightqtunused6 () int__ref
  (int__refqtmk right6))

;; "left'unused"
(define-fun leftqtunused6 () int__ref
  (int__refqtmk left6))

;; "spark__branch'unused"
(define-fun spark__branchqtunused9 () bool__ref
  (bool__refqtmk spark__branch9))

(declare-const int__contentqtresultqtunused36 Int)

;; "H"
(assert (= int__contentqtresultqtunused36 med5))

(declare-const o52 integer)

;; "H"
(assert (= o52 (select a med5)))

(declare-const getqtresultqtunused10 integer)

;; "H"
(assert (= getqtresultqtunused10 o52))

(declare-const o53 Int)

;; "Ensures"
(assert (= (to_rep o52) o53))

(declare-const to_repqtresultqtunused10 Int)

;; "H"
(assert (= to_repqtresultqtunused10 o53))

(declare-const o54 Bool)

;; "H"
(assert (= o54 (ite (< o53 i) true false)))

(declare-const infix_lsqtresultqtunused5 Bool)

;; "H"
(assert (= infix_lsqtresultqtunused5 o54))

(declare-const spark__branch10 Bool)

(declare-const spark__branchqtunused10 bool__ref)

;; "H"
(assert (= spark__branchqtunused10 (bool__refqtmk spark__branch10)))

;; "H"
(assert (= spark__branch10 o54))

(declare-const bool__contentqtresultqtunused9 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused9 spark__branch10))

(declare-const int__contentqtresultqtunused37 Int)

(declare-const o55 integer)

(declare-const getqtresultqtunused11 integer)

(declare-const o56 Int)

(declare-const to_repqtresultqtunused11 Int)

(declare-const o57 Bool)

(declare-const infix_gtqtresultqtunused5 Bool)

(declare-const bool__contentqtresultqtunused10 Bool)

(declare-const int__contentqtresultqtunused38 Int)

(declare-const o58 Int)

(declare-const infix_mnqtresultqtunused9 Int)

(declare-const range_check_qtresultqtunused13 Int)

(declare-const int__contentqtresultqtunused39 Int)

(declare-const o59 Int)

(declare-const infix_plqtresultqtunused9 Int)

(declare-const range_check_qtresultqtunused14 Int)

;; "H"
(assert
  (ite (= spark__branch10 true)
    (and
      (and
        (and
          (= int__contentqtresultqtunused39 med5)
          (and
            (= o59 (+ med5 1))
            (and
              (= infix_plqtresultqtunused9 o59)
              (and
                (in_range1 o59)
                (and (= range_check_qtresultqtunused14 o59) (= left6 o59))))))
        (= spark__branch9 spark__branch10))
      (= right6 right5))
    (and
      (and
        (= int__contentqtresultqtunused37 med5)
        (and
          (= o55 (select a med5))
          (and
            (= getqtresultqtunused11 o55)
            (and
              (= (to_rep o55) o56)
              (and
                (= to_repqtresultqtunused11 o56)
                (and
                  (= o57 (ite (< i o56) true false))
                  (and
                    (= infix_gtqtresultqtunused5 o57)
                    (and
                      (= spark__branch9 o57)
                      (and
                        (= bool__contentqtresultqtunused10 spark__branch9)
                        (and
                          (= spark__branch9 true)
                          (and
                            (= int__contentqtresultqtunused38 med5)
                            (and
                              (= o58 (- med5 1))
                              (and
                                (= infix_mnqtresultqtunused9 o58)
                                (and
                                  (in_range1 o58)
                                  (and
                                    (= range_check_qtresultqtunused13 
                                    o58)
                                    (= right6 o58))))))))))))))))
      (= left6 left5))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused40 () Int
  left6)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused41 () Int
  right6)

;; "o"
(define-fun o60 () Int
  (- right6 left6))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused10 () Int
  o60)

;; "o"
(define-fun o61 () Int
  (__cdiv o60 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused5 () Int
  o61)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused42 () Int
  left6)

;; "o"
(define-fun o62 () Int
  (+ left6 o61))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused10 () Int
  o62)

;; "Ensures"
(assert (in_range1 o62))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused15 () Int
  o62)

(declare-const med6 Int)

;; "med'unused"
(define-fun medqtunused6 () int__ref
  (int__refqtmk med6))

;; "H"
(assert (= med6 o62))

(declare-const spark__branch11 Bool)

(declare-const left7 Int)

(declare-const right7 Int)

;; "right'unused"
(define-fun rightqtunused7 () int__ref
  (int__refqtmk right7))

;; "left'unused"
(define-fun leftqtunused7 () int__ref
  (int__refqtmk left7))

;; "spark__branch'unused"
(define-fun spark__branchqtunused11 () bool__ref
  (bool__refqtmk spark__branch11))

(declare-const int__contentqtresultqtunused43 Int)

;; "H"
(assert (= int__contentqtresultqtunused43 med6))

(declare-const o63 integer)

;; "H"
(assert (= o63 (select a med6)))

(declare-const getqtresultqtunused12 integer)

;; "H"
(assert (= getqtresultqtunused12 o63))

(declare-const o64 Int)

;; "Ensures"
(assert (= (to_rep o63) o64))

(declare-const to_repqtresultqtunused12 Int)

;; "H"
(assert (= to_repqtresultqtunused12 o64))

(declare-const o65 Bool)

;; "H"
(assert (= o65 (ite (< o64 i) true false)))

(declare-const infix_lsqtresultqtunused6 Bool)

;; "H"
(assert (= infix_lsqtresultqtunused6 o65))

(declare-const spark__branch12 Bool)

(declare-const spark__branchqtunused12 bool__ref)

;; "H"
(assert (= spark__branchqtunused12 (bool__refqtmk spark__branch12)))

;; "H"
(assert (= spark__branch12 o65))

(declare-const bool__contentqtresultqtunused11 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused11 spark__branch12))

(declare-const int__contentqtresultqtunused44 Int)

(declare-const o66 integer)

(declare-const getqtresultqtunused13 integer)

(declare-const o67 Int)

(declare-const to_repqtresultqtunused13 Int)

(declare-const o68 Bool)

(declare-const infix_gtqtresultqtunused6 Bool)

(declare-const bool__contentqtresultqtunused12 Bool)

(declare-const int__contentqtresultqtunused45 Int)

(declare-const o69 Int)

(declare-const infix_mnqtresultqtunused11 Int)

(declare-const range_check_qtresultqtunused16 Int)

(declare-const int__contentqtresultqtunused46 Int)

(declare-const o70 Int)

(declare-const infix_plqtresultqtunused11 Int)

(declare-const range_check_qtresultqtunused17 Int)

;; "H"
(assert
  (ite (= spark__branch12 true)
    (and
      (and
        (and
          (= int__contentqtresultqtunused46 med6)
          (and
            (= o70 (+ med6 1))
            (and
              (= infix_plqtresultqtunused11 o70)
              (and
                (in_range1 o70)
                (and (= range_check_qtresultqtunused17 o70) (= left7 o70))))))
        (= spark__branch11 spark__branch12))
      (= right7 right6))
    (and
      (and
        (= int__contentqtresultqtunused44 med6)
        (and
          (= o66 (select a med6))
          (and
            (= getqtresultqtunused13 o66)
            (and
              (= (to_rep o66) o67)
              (and
                (= to_repqtresultqtunused13 o67)
                (and
                  (= o68 (ite (< i o67) true false))
                  (and
                    (= infix_gtqtresultqtunused6 o68)
                    (and
                      (= spark__branch11 o68)
                      (and
                        (= bool__contentqtresultqtunused12 spark__branch11)
                        (and
                          (= spark__branch11 true)
                          (and
                            (= int__contentqtresultqtunused45 med6)
                            (and
                              (= o69 (- med6 1))
                              (and
                                (= infix_mnqtresultqtunused11 o69)
                                (and
                                  (in_range1 o69)
                                  (and
                                    (= range_check_qtresultqtunused16 
                                    o69)
                                    (= right7 o69))))))))))))))))
      (= left7 left6))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused47 () Int
  left7)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused48 () Int
  right7)

;; "o"
(define-fun o71 () Int
  (- right7 left7))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused12 () Int
  o71)

;; "o"
(define-fun o72 () Int
  (__cdiv o71 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused6 () Int
  o72)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused49 () Int
  left7)

;; "o"
(define-fun o73 () Int
  (+ left7 o72))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused12 () Int
  o73)

;; "Ensures"
(assert (in_range1 o73))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused18 () Int
  o73)

(declare-const med7 Int)

;; "med'unused"
(define-fun medqtunused7 () int__ref
  (int__refqtmk med7))

;; "H"
(assert (= med7 o73))

(declare-const spark__branch13 Bool)

(declare-const left8 Int)

(declare-const right8 Int)

;; "right'unused"
(define-fun rightqtunused8 () int__ref
  (int__refqtmk right8))

;; "left'unused"
(define-fun leftqtunused8 () int__ref
  (int__refqtmk left8))

;; "spark__branch'unused"
(define-fun spark__branchqtunused13 () bool__ref
  (bool__refqtmk spark__branch13))

(declare-const int__contentqtresultqtunused50 Int)

;; "H"
(assert (= int__contentqtresultqtunused50 med7))

(declare-const o74 integer)

;; "H"
(assert (= o74 (select a med7)))

(declare-const getqtresultqtunused14 integer)

;; "H"
(assert (= getqtresultqtunused14 o74))

(declare-const o75 Int)

;; "Ensures"
(assert (= (to_rep o74) o75))

(declare-const to_repqtresultqtunused14 Int)

;; "H"
(assert (= to_repqtresultqtunused14 o75))

(declare-const o76 Bool)

;; "H"
(assert (= o76 (ite (< o75 i) true false)))

(declare-const infix_lsqtresultqtunused7 Bool)

;; "H"
(assert (= infix_lsqtresultqtunused7 o76))

(declare-const spark__branch14 Bool)

(declare-const spark__branchqtunused14 bool__ref)

;; "H"
(assert (= spark__branchqtunused14 (bool__refqtmk spark__branch14)))

;; "H"
(assert (= spark__branch14 o76))

(declare-const bool__contentqtresultqtunused13 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused13 spark__branch14))

(declare-const int__contentqtresultqtunused51 Int)

(declare-const o77 integer)

(declare-const getqtresultqtunused15 integer)

(declare-const o78 Int)

(declare-const to_repqtresultqtunused15 Int)

(declare-const o79 Bool)

(declare-const infix_gtqtresultqtunused7 Bool)

(declare-const bool__contentqtresultqtunused14 Bool)

(declare-const int__contentqtresultqtunused52 Int)

(declare-const o80 Int)

(declare-const infix_mnqtresultqtunused13 Int)

(declare-const range_check_qtresultqtunused19 Int)

(declare-const int__contentqtresultqtunused53 Int)

(declare-const o81 Int)

(declare-const infix_plqtresultqtunused13 Int)

(declare-const range_check_qtresultqtunused20 Int)

;; "H"
(assert
  (ite (= spark__branch14 true)
    (and
      (and
        (and
          (= int__contentqtresultqtunused53 med7)
          (and
            (= o81 (+ med7 1))
            (and
              (= infix_plqtresultqtunused13 o81)
              (and
                (in_range1 o81)
                (and (= range_check_qtresultqtunused20 o81) (= left8 o81))))))
        (= spark__branch13 spark__branch14))
      (= right8 right7))
    (and
      (and
        (= int__contentqtresultqtunused51 med7)
        (and
          (= o77 (select a med7))
          (and
            (= getqtresultqtunused15 o77)
            (and
              (= (to_rep o77) o78)
              (and
                (= to_repqtresultqtunused15 o78)
                (and
                  (= o79 (ite (< i o78) true false))
                  (and
                    (= infix_gtqtresultqtunused7 o79)
                    (and
                      (= spark__branch13 o79)
                      (and
                        (= bool__contentqtresultqtunused14 spark__branch13)
                        (and
                          (= spark__branch13 true)
                          (and
                            (= int__contentqtresultqtunused52 med7)
                            (and
                              (= o80 (- med7 1))
                              (and
                                (= infix_mnqtresultqtunused13 o80)
                                (and
                                  (in_range1 o80)
                                  (and
                                    (= range_check_qtresultqtunused19 
                                    o80)
                                    (= right8 o80))))))))))))))))
      (= left8 left7))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused54 () Int
  left8)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused55 () Int
  right8)

;; "o"
(define-fun o82 () Int
  (- right8 left8))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused14 () Int
  o82)

;; "o"
(define-fun o83 () Int
  (__cdiv o82 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused7 () Int
  o83)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused56 () Int
  left8)

;; "o"
(define-fun o84 () Int
  (+ left8 o83))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused14 () Int
  o84)

;; Goal "def'vc"
;; File "binary_search.ads", line 17, characters 0-0
(assert
  (not (<= o84 10)))

(check-sat)
