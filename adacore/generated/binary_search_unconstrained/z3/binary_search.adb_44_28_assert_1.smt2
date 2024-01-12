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

(declare-sort topt_indexB 0)

;; "topt_indexB'int"
(declare-fun topt_indexBqtint (topt_indexB) Int)

;; "topt_indexB'axiom"
(assert
  (forall ((i topt_indexB))
    (and
      (<= (- 2147483648) (topt_indexBqtint i))
      (<= (topt_indexBqtint i) 2147483647))))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "to_rep"
(define-fun to_rep1 ((x topt_indexB)) Int
  (topt_indexBqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) topt_indexB)

;; "inversion_axiom"
(assert
  (forall ((x topt_indexB))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x topt_indexB))
    (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483646)))

(declare-datatypes ()
  ((t (tqtmk (rec__first topt_indexB)(rec__last topt_indexB)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range1 low)
    (and
      (in_range1 high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int integer)
  (elts a))

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

;; "empty"
(define-fun empty ((param__a us_t)) Bool
  (> (first param__a) (last param__a)))

;; "sorted"
(define-fun sorted ((param__a us_t)) Bool
  (ite (forall ((i1 Int))
         (=>
           (and (<= (first param__a) i1) (<= i1 (last param__a)))
           (forall ((i2 Int))
             (=>
               (and (<= i1 i2) (<= i2 (last param__a)))
               (<= (to_rep (select (to_array param__a) i1)) (to_rep
                                                              (select 
                                                              (to_array
                                                                param__a) i2)))))))
    true
    false))

(declare-const a us_t)

(declare-const i Int)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_190 us_t) (temp___is_init_186 Bool) (temp___skip_constant_187 Bool) (temp___do_toplevel_188 Bool) (temp___do_typ_inv_189 Bool)) Bool
  (=>
    (not (= temp___skip_constant_187 true))
    (dynamic_property
      1
      2147483646
      (first temp___expr_190)
      (last temp___expr_190))))

(declare-const left Int)

(declare-const right Int)

(declare-const med Int)

(declare-const binary_search__search__result Int)

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
(assert (dynamic_invariant a true false true true))

;; "Assume"
(assert (in_range i))

;; "Assume"
(assert (= (sorted a) true))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range2 left))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range2 right))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range2 med))

;; "o"
(define-fun o () us_t
  a)

;; "o"
(define-fun o1 () Bool
  (empty o))

;; "Ensures"
(assert (= (= o1 true) (< (last o) (first o))))

;; "empty'result'unused"
(define-fun emptyqtresultqtunused () Bool
  o1)

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch o1))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (not (= spark__branch true)))

;; "o"
(define-fun o2 () Int
  (first a))

;; "first'result'unused"
(define-fun firstqtresultqtunused () Int
  o2)

;; "Ensures"
(assert (in_range2 o2))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o2)

(declare-const left1 Int)

;; "left'unused"
(define-fun leftqtunused1 () int__ref
  (int__refqtmk left1))

;; "H"
(assert (= left1 o2))

;; "o"
(define-fun o3 () Int
  (last a))

;; "last'result'unused"
(define-fun lastqtresultqtunused () Int
  o3)

;; "Ensures"
(assert (in_range2 o3))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o3)

(declare-const right1 Int)

;; "right'unused"
(define-fun rightqtunused1 () int__ref
  (int__refqtmk right1))

;; "H"
(assert (= right1 o3))

;; "Assert"
(assert (and (<= (first a) left1) (<= left1 (last a))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  left1)

;; "o"
(define-fun o4 () (Array Int integer)
  (to_array a))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused () (Array Int integer)
  o4)

;; "o"
(define-fun o5 () integer
  (select o4 left1))

;; "get'result'unused"
(define-fun getqtresultqtunused () integer
  o5)

(declare-const o6 Int)

;; "Ensures"
(assert (= (to_rep o5) o6))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused () Int
  o6)

;; "o"
(define-fun o7 () Bool
  (ite (= o6 i) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  o7)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  right1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  left1)

;; "o"
(define-fun o8 () Bool
  (ite (= left1 right1) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused1 () Bool
  o8)

;; "o"
(define-fun o9 () Bool
  (and o8 o7))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o9)

(declare-const spark__branch1 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused1 () bool__ref
  (bool__refqtmk spark__branch1))

;; "H"
(assert (= spark__branch1 o9))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused1 () Bool
  spark__branch1)

;; "H"
(assert (not (= spark__branch1 true)))

;; "Assert"
(assert (and (<= (first a) right1) (<= right1 (last a))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  right1)

;; "o"
(define-fun o10 () (Array Int integer)
  (to_array a))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused1 () (Array Int integer)
  o10)

;; "o"
(define-fun o11 () integer
  (select o10 right1))

;; "get'result'unused"
(define-fun getqtresultqtunused1 () integer
  o11)

(declare-const o12 Int)

;; "Ensures"
(assert (= (to_rep o11) o12))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused1 () Int
  o12)

;; "o"
(define-fun o13 () Bool
  (ite (< o12 i) true false))

;; "infix <'result'unused"
(define-fun infix_lsqtresultqtunused () Bool
  o13)

;; "Assert"
(assert (and (<= (first a) left1) (<= left1 (last a))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused4 () Int
  left1)

;; "o"
(define-fun o14 () (Array Int integer)
  (to_array a))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused2 () (Array Int integer)
  o14)

;; "o"
(define-fun o15 () integer
  (select o14 left1))

;; "get'result'unused"
(define-fun getqtresultqtunused2 () integer
  o15)

(declare-const o16 Int)

;; "Ensures"
(assert (= (to_rep o15) o16))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused2 () Int
  o16)

;; "o"
(define-fun o17 () Bool
  (ite (< i o16) true false))

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused () Bool
  o17)

;; "o"
(define-fun o18 () Bool
  (or o17 o13))

;; "orb'result'unused"
(define-fun orbqtresultqtunused () Bool
  o18)

(declare-const spark__branch2 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused2 () bool__ref
  (bool__refqtmk spark__branch2))

;; "H"
(assert (= spark__branch2 o18))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused2 () Bool
  spark__branch2)

;; "H"
(assert (not (= spark__branch2 true)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  right1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  left1)

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused () Bool
  (ite (<= left1 right1) true false))

;; "H"
(assert (<= left1 right1))

;; "temp___loop_entry_214'unused"
(define-fun temp___loop_entry_214qtunused () Int
  left1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  left1)

;; "temp___loop_entry_213'unused"
(define-fun temp___loop_entry_213qtunused () Int
  med)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused8 () Int
  med)

;; "temp___loop_entry_212'unused"
(define-fun temp___loop_entry_212qtunused () Int
  right1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  right1)

;; "o"
(define-fun o19 () Int
  (last a))

;; "last'result'unused"
(define-fun lastqtresultqtunused1 () Int
  o19)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  right1)

;; "o"
(define-fun o20 () Bool
  (ite (<= right1 o19) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused1 () Bool
  o20)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused11 () Int
  right1)

;; "o"
(define-fun o21 () Int
  (first a))

;; "first'result'unused"
(define-fun firstqtresultqtunused1 () Int
  o21)

;; "o"
(define-fun o22 () Bool
  (ite (<= o21 right1) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused2 () Bool
  o22)

;; "o"
(define-fun o23 () Bool
  (and o22 o20))

;; "andb'result'unused"
(define-fun andbqtresultqtunused1 () Bool
  o23)

;; "o"
(define-fun o24 () Int
  (last a))

;; "last'result'unused"
(define-fun lastqtresultqtunused2 () Int
  o24)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused12 () Int
  left1)

;; "o"
(define-fun o25 () Bool
  (ite (<= left1 o24) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused3 () Bool
  o25)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused13 () Int
  left1)

;; "o"
(define-fun o26 () Int
  (first a))

;; "first'result'unused"
(define-fun firstqtresultqtunused2 () Int
  o26)

;; "o"
(define-fun o27 () Bool
  (ite (<= o26 left1) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused4 () Bool
  o27)

;; "o"
(define-fun o28 () Bool
  (and o27 o25))

;; "andb'result'unused"
(define-fun andbqtresultqtunused2 () Bool
  o28)

;; "andb'result'unused"
(define-fun andbqtresultqtunused3 () Bool
  (and o28 o23))

(declare-const left2 Int)

(declare-const right2 Int)

(declare-const med1 Int)

;; "right'unused"
(define-fun rightqtunused2 () int__ref
  (int__refqtmk right2))

;; "left'unused"
(define-fun leftqtunused2 () int__ref
  (int__refqtmk left2))

;; "LoopInvariant"
(assert
  (and
    (and (<= (first a) left2) (<= left2 (last a)))
    (and (<= (first a) right2) (<= right2 (last a)))))

;; "LoopInvariant"
(assert
  (forall ((index Int))
    (=>
      (and (<= (first a) index) (<= index (- left2 1)))
      (< (to_rep (select (to_array a) index)) i))))

;; "LoopInvariant"
(assert
  (forall ((index Int))
    (=>
      (and (<= (first a) index) (<= index (last a)))
      (=> (< right2 index) (< i (to_rep (select (to_array a) index)))))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused14 () Int
  left2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused15 () Int
  right2)

;; "loop_var___7490"
(define-fun loop_var___7490 () Int
  (- right2 left2))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused () Int
  loop_var___7490)

;; "Assume"
(assert
  (= (and (ite (and
                 (and (in_range2 right2) (in_range2 med1))
                 (in_range2 left2))
            true
            false) (ite (<= left2 right2) true false)) true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused16 () Int
  left2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused17 () Int
  right2)

;; "o"
(define-fun o29 () Int
  (- right2 left2))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused1 () Int
  o29)

;; "o"
(define-fun o30 () Int
  (__cdiv o29 2))

;; "div_'result'unused"
(define-fun div_qtresultqtunused () Int
  o30)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused18 () Int
  left2)

;; "o"
(define-fun o31 () Int
  (+ left2 o30))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o31)

;; "Ensures"
(assert (in_range1 o31))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused2 () Int
  o31)

;; "Ensures"
(assert (in_range2 o31))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o31)

(declare-const med2 Int)

;; "med'unused"
(define-fun medqtunused1 () int__ref
  (int__refqtmk med2))

;; "H"
(assert (= med2 o31))

;; "Assert"
(assert
  (forall ((i1 Int))
    (=>
      (and (<= (first a) i1) (<= i1 (last a)))
      (forall ((i2 Int))
        (=>
          (and (<= i1 i2) (<= i2 (last a)))
          (<= (to_rep (select (to_array a) i1)) (to_rep
                                                  (select (to_array a) i2))))))))

;; "Assert"
(assert (and (<= (first a) med2) (<= med2 (last a))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused19 () Int
  med2)

;; "o"
(define-fun o32 () (Array Int integer)
  (to_array a))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused3 () (Array Int integer)
  o32)

;; "o"
(define-fun o33 () integer
  (select o32 med2))

;; "get'result'unused"
(define-fun getqtresultqtunused3 () integer
  o33)

(declare-const o34 Int)

;; "Ensures"
(assert (= (to_rep o33) o34))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused3 () Int
  o34)

;; "o"
(define-fun o35 () Bool
  (ite (< o34 i) true false))

;; "infix <'result'unused"
(define-fun infix_lsqtresultqtunused1 () Bool
  o35)

(declare-const spark__branch3 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused3 () bool__ref
  (bool__refqtmk spark__branch3))

;; "H"
(assert (= spark__branch3 o35))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused3 () Bool
  spark__branch3)

;; "H"
(assert (not (= spark__branch3 true)))

;; "Assert"
(assert (and (<= (first a) med2) (<= med2 (last a))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused20 () Int
  med2)

;; "o"
(define-fun o36 () (Array Int integer)
  (to_array a))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused4 () (Array Int integer)
  o36)

;; "o"
(define-fun o37 () integer
  (select o36 med2))

;; "get'result'unused"
(define-fun getqtresultqtunused4 () integer
  o37)

(declare-const o38 Int)

;; "Ensures"
(assert (= (to_rep o37) o38))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused4 () Int
  o38)

;; "o"
(define-fun o39 () Bool
  (ite (< i o38) true false))

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused1 () Bool
  o39)

(declare-const spark__branch4 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused4 () bool__ref
  (bool__refqtmk spark__branch4))

;; "H"
(assert (= spark__branch4 o39))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused4 () Bool
  spark__branch4)

;; "H"
(assert (= spark__branch4 true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused21 () Int
  med2)

;; "o"
(define-fun o40 () Int
  (- med2 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused2 () Int
  o40)

;; "Ensures"
(assert (in_range2 o40))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused4 () Int
  o40)

(declare-const right3 Int)

;; "H"
(assert (= right3 o40))

;; "Assert"
(assert (and (<= (first a) med2) (<= med2 (last a))))

(declare-const i2 Int)

;; "H"
(assert (<= med2 i2))

;; "H"
(assert (<= i2 (last a)))

;; Goal "def'vc"
;; File "binary_search.ads", line 30, characters 0-0
(assert
  (not
  (<= (to_rep (select (to_array a) med2)) (to_rep (select (to_array a) i2)))))

(check-sat)
