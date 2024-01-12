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
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int Bool))))))

;; "is_prime"
(define-fun is_prime ((param__value Int)) Bool
  (and (>= param__value 2) (ite (forall ((v Int))
                                  (=>
                                    (and (<= 2 v) (<= v (- param__value 1)))
                                    (not (= (mod1 param__value v) 0))))
                             true
                             false)))

;; "smallest_divisor"
(declare-fun smallest_divisor (Int) Int)

;; "smallest_divisor__function_guard"
(declare-fun smallest_divisor__function_guard (Int
  Int) Bool)

(declare-const c169b Int)

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

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

;; "temp_____aggregate_def_293"
(declare-fun temp_____aggregate_def_293 (Bool) (Array Int Bool))

(declare-const is_prime1 (Array Int Bool))

(declare-const index_1 Int)

(declare-const index_3 Int)

;; "index_3'unused"
(define-fun index_3qtunused () int__ref
  (int__refqtmk index_3))

;; "index_1'unused"
(define-fun index_1qtunused () int__ref
  (int__refqtmk index_1))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 index_1))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range index_3))

;; "o"
(define-fun o () Bool
  (distinct 1 0))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused () Bool
  o)

(declare-const temp___297 (Array Int Bool))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert
  (forall ((temp___296 Int))
    (! (=>
         (and (<= 0 temp___296) (<= temp___296 100000))
         (= (select temp___297 temp___296) o)) :pattern ((select temp___297 temp___296)) )))

;; "H"
(assert (= temp___297 (temp_____aggregate_def_293 o)))

;; "temp_____aggregate_def_293'result'unused"
(define-fun temp_____aggregate_def_293qtresultqtunused () (Array Int Bool)
  temp___297)

(declare-const is_prime2 (Array Int Bool))

;; "is_prime'unused"
(define-fun is_primeqtunused () map__ref
  (map__refqtmk is_prime2))

;; "H"
(assert (= is_prime2 temp___297))

;; "o"
(define-fun o1 () Bool
  (distinct 0 0))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused1 () Bool
  o1)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused () (Array Int Bool)
  is_prime2)

;; "o"
(define-fun o2 () (Array Int Bool)
  (store is_prime2 0 o1))

;; "set'result'unused"
(define-fun setqtresultqtunused () (Array Int Bool)
  o2)

(declare-const is_prime3 (Array Int Bool))

;; "is_prime'unused"
(define-fun is_primeqtunused1 () map__ref
  (map__refqtmk is_prime3))

;; "H"
(assert (= is_prime3 o2))

;; "o"
(define-fun o3 () Bool
  (distinct 0 0))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused2 () Bool
  o3)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused1 () (Array Int Bool)
  is_prime3)

;; "o"
(define-fun o4 () (Array Int Bool)
  (store is_prime3 1 o3))

;; "set'result'unused"
(define-fun setqtresultqtunused1 () (Array Int Bool)
  o4)

(declare-const is_prime4 (Array Int Bool))

;; "is_prime'unused"
(define-fun is_primeqtunused2 () map__ref
  (map__refqtmk is_prime4))

;; "H"
(assert (= is_prime4 o4))

(declare-const index_2 Int)

;; "index_2'unused"
(define-fun index_2qtunused () int__ref
  (int__refqtmk index_2))

;; "H"
(assert (= index_2 2))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  index_2)

;; "o"
(define-fun o5 () Bool
  (ite (<= index_2 100000) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused () Bool
  o5)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  index_2)

;; "o"
(define-fun o6 () Bool
  (ite (<= 2 index_2) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused1 () Bool
  o6)

;; "o"
(define-fun o7 () Bool
  (and o6 o5))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o7)

;; "H"
(assert (= o7 true))

;; "temp___loop_entry_328'unused"
(define-fun temp___loop_entry_328qtunused () Int
  index_3)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  index_3)

;; "temp___loop_entry_327'unused"
(define-fun temp___loop_entry_327qtunused () Int
  index_1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  index_1)

;; "temp___loop_entry_325'unused"
(define-fun temp___loop_entry_325qtunused () (Array Int Bool)
  is_prime4)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused2 () (Array Int Bool)
  is_prime4)

(declare-const usf Int)

(declare-const anyqtresultqtunused Int)

;; "H"
(assert (= anyqtresultqtunused usf))

(declare-const vqtunused Int)

;; "H"
(assert (= vqtunused usf))

(declare-const int__contentqtresultqtunused4 Int)

;; "H"
(assert (= int__contentqtresultqtunused4 index_2))

(declare-const o8 Int)

;; "H"
(assert (= o8 (- index_2 1)))

(declare-const infix_mnqtresultqtunused Int)

;; "H"
(assert (= infix_mnqtresultqtunused o8))

(declare-const o9 Bool)

;; "H"
(assert (= o9 (ite (<= usf o8) true false)))

(declare-const infix_lseqqtresultqtunused2 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused2 o9))

(declare-const o10 Bool)

;; "H"
(assert (= o10 (ite (<= 0 usf) true false)))

(declare-const infix_lseqqtresultqtunused3 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused3 o10))

(declare-const andbqtresultqtunused1 Bool)

;; "H"
(assert (= andbqtresultqtunused1 (and o10 o9)))

;; "_f'unused"
(define-fun usfqtunused () Bool
  (ite (forall ((v Int))
         (=>
           (and (<= 0 v) (<= v (- index_2 1)))
           (= (= (select is_prime4 v) true) (= (is_prime v) true))))
    true
    false))

;; "any'result'unused"
(define-fun anyqtresultqtunused1 () Bool
  (ite (forall ((v Int))
         (=>
           (and (<= 0 v) (<= v (- index_2 1)))
           (= (= (select is_prime4 v) true) (= (is_prime v) true))))
    true
    false))

(declare-const is_prime5 (Array Int Bool))

(declare-const index_11 Int)

(declare-const index_31 Int)

(declare-const index_21 Int)

(declare-const s Int)

(declare-const d Int)

(declare-const r Int)

(declare-const dd Int)

(declare-const ds Int)

(declare-const d1 Int)

;; "d'unused"
(define-fun dqtunused () int__ref
  (int__refqtmk d1))

;; "ds'unused"
(define-fun dsqtunused () int__ref
  (int__refqtmk ds))

;; "dd'unused"
(define-fun ddqtunused () int__ref
  (int__refqtmk dd))

;; "r'unused"
(define-fun rqtunused () int__ref
  (int__refqtmk r))

;; "d'unused"
(define-fun dqtunused1 () int__ref
  (int__refqtmk d))

;; "s'unused"
(define-fun sqtunused () int__ref
  (int__refqtmk s))

;; "index_2'unused"
(define-fun index_2qtunused1 () int__ref
  (int__refqtmk index_21))

;; "is_prime'unused"
(define-fun is_primeqtunused3 () map__ref
  (map__refqtmk is_prime5))

;; "LoopInvariant"
(assert
  (forall ((v Int))
    (=>
      (and (<= 0 v) (<= v (- index_21 1)))
      (= (= (select is_prime5 v) true) (= (is_prime v) true)))))

;; "LoopInvariant"
(assert
  (forall ((v Int))
    (=>
      (and (<= index_21 v) (<= v 100000))
      (=
        (= (select is_prime5 v) true)
        (forall ((div1 Int))
          (=>
            (and (<= 2 div1) (<= div1 (- index_21 1)))
            (not (= (mod1 v div1) 0))))))))

;; "Assume"
(assert
  (= (and (ite (and (in_range1 index_11) (in_range index_31)) true false) 
  (ite (and (<= 2 index_21) (<= index_21 100000))
    true
    false)) true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  index_21)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused3 () (Array Int Bool)
  is_prime5)

;; "o"
(define-fun o11 () Bool
  (select is_prime5 index_21))

;; "get'result'unused"
(define-fun getqtresultqtunused () Bool
  o11)

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch o11))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (not (= spark__branch true)))

;; "test_prime_and_coprime_numbers__p__eratosthenes__L_10__C169b__assume'unused"
(define-fun test_prime_and_coprime_numbers__p__eratosthenes__L_10__C169b__assumeqtunused 
  () Int
  index_21)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  index_21)

;; "Assume"
(assert (= index_21 c169b))

;; "Assume"
(assert (in_range1 c169b))

;; "o"
(define-fun o12 () Int
  (+ c169b 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o12)

;; "Ensures"
(assert (in_range o12))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o12)

(declare-const v Int)

;; "v'unused"
(define-fun vqtunused1 () int__ref
  (int__refqtmk v))

;; "H"
(assert (= v o12))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  v)

;; "o"
(define-fun o13 () Bool
  (ite (<= v 100000) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused4 () Bool
  o13)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused8 () Int
  v)

;; "o"
(define-fun o14 () Bool
  (ite (<= o12 v) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused5 () Bool
  o14)

;; "o"
(define-fun o15 () Bool
  (and o14 o13))

;; "andb'result'unused"
(define-fun andbqtresultqtunused2 () Bool
  o15)

;; "H"
(assert (= o15 true))

;; "o"
(define-fun o16 () Int
  c169b)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  v)

;; "o"
(define-fun o17 () Int
  (mod1 v o16))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused () Int
  o17)

;; "o"
(define-fun o18 () Bool
  (ite (= o17 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  o18)

(declare-const spark__branch1 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused1 () bool__ref
  (bool__refqtmk spark__branch1))

;; "H"
(assert (= spark__branch1 o18))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused1 () Bool
  spark__branch1)

;; "H"
(assert (= spark__branch1 true))

;; "o"
(define-fun o19 () Int
  c169b)

;; "o"
(define-fun o20 () Int
  (smallest_divisor o19))

;; "H"
(assert (smallest_divisor__function_guard o20 o19))

;; "H"
(assert (in_range1 o20))

;; "H"
(assert (<= 2 o20))

;; "H"
(assert (<= o20 (- o19 1)))

;; "H"
(assert (= o19 (* o20 (__cdiv o19 o20))))

;; "smallest_divisor'result'unused"
(define-fun smallest_divisorqtresultqtunused () Int
  o20)

(declare-const s1 Int)

;; "s'unused"
(define-fun sqtunused1 () int__ref
  (int__refqtmk s1))

;; "H"
(assert (= s1 o20))

;; "Assume"
(assert (in_range1 s1))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  s1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused11 () Int
  v)

;; "o"
(define-fun o21 () Int
  (__cdiv v s1))

;; "div_'result'unused"
(define-fun div_qtresultqtunused () Int
  o21)

;; "Ensures"
(assert (in_range1 o21))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o21)

(declare-const d2 Int)

;; "d'unused"
(define-fun dqtunused2 () int__ref
  (int__refqtmk d2))

;; "H"
(assert (= d2 o21))

;; "Assume"
(assert (in_range1 d2))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused12 () Int
  s1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused13 () Int
  v)

;; "o"
(define-fun o22 () Int
  (mod1 v s1))

;; "mod_'result'unused"
(define-fun mod_qtresultqtunused1 () Int
  o22)

;; "Ensures"
(assert (in_range1 o22))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused2 () Int
  o22)

(declare-const r1 Int)

;; "r'unused"
(define-fun rqtunused1 () int__ref
  (int__refqtmk r1))

;; "H"
(assert (= r1 o22))

;; "Assume"
(assert (in_range1 r1))

;; "o"
(define-fun o23 () Int
  c169b)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused14 () Int
  v)

;; "o"
(define-fun o24 () Int
  (__cdiv v o23))

;; "div_'result'unused"
(define-fun div_qtresultqtunused1 () Int
  o24)

;; "Ensures"
(assert (in_range1 o24))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o24)

(declare-const dd1 Int)

;; "dd'unused"
(define-fun ddqtunused1 () int__ref
  (int__refqtmk dd1))

;; "H"
(assert (= dd1 o24))

;; "Assume"
(assert (in_range1 dd1))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused15 () Int
  s1)

;; "o"
(define-fun o25 () Int
  (__cdiv c169b s1))

;; "div_'result'unused"
(define-fun div_qtresultqtunused2 () Int
  o25)

;; "Ensures"
(assert (in_range1 o25))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused4 () Int
  o25)

(declare-const ds1 Int)

;; "ds'unused"
(define-fun dsqtunused1 () int__ref
  (int__refqtmk ds1))

;; "H"
(assert (= ds1 o25))

;; "Assume"
(assert (in_range1 ds1))

;; "Assert"
(assert (= v (+ (* d2 s1) r1)))

;; "Assert"
(assert (= v (* dd1 c169b)))

;; "Assert"
(assert (= c169b (* s1 ds1)))

;; "Assert"
(assert (= r1 (* s1 (- (* dd1 ds1) d2))))

;; "Assert"
(assert (< r1 s1))

;; Goal "def'vc"
;; File "prime_and_coprime_numbers.adb", line 201, characters 0-0
(assert
  (not (= r1 0)))

(check-sat)
