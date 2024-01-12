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

(declare-const spark__branch1 Bool)

;; "H"
(assert (smallest_divisor__function_guard (smallest_divisor c169b) c169b))

;; "H"
(assert (smallest_divisor__function_guard (smallest_divisor c169b) c169b))

;; "H"
(assert (smallest_divisor__function_guard (smallest_divisor c169b) c169b))

;; "H"
(assert (smallest_divisor__function_guard (smallest_divisor c169b) c169b))

(declare-const o12 Int)

;; "H"
(assert (= o12 (+ c169b 1)))

(declare-const infix_plqtresultqtunused Int)

;; "H"
(assert (= infix_plqtresultqtunused o12))

;; "Ensures"
(assert (in_range o12))

(declare-const range_check_qtresultqtunused Int)

;; "H"
(assert (= range_check_qtresultqtunused o12))

(declare-const v Int)

(declare-const vqtunused1 int__ref)

;; "H"
(assert (= vqtunused1 (int__refqtmk v)))

;; "H"
(assert (= v o12))

(declare-const int__contentqtresultqtunused7 Int)

;; "H"
(assert (= int__contentqtresultqtunused7 v))

(declare-const o13 Bool)

;; "H"
(assert (= o13 (ite (<= v 100000) true false)))

(declare-const infix_lseqqtresultqtunused4 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused4 o13))

(declare-const int__contentqtresultqtunused8 Int)

;; "H"
(assert (= int__contentqtresultqtunused8 v))

(declare-const o14 Bool)

;; "H"
(assert (= o14 (ite (<= o12 v) true false)))

(declare-const infix_lseqqtresultqtunused5 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused5 o14))

(declare-const o15 Bool)

;; "H"
(assert (= o15 (and o14 o13)))

(declare-const andbqtresultqtunused2 Bool)

;; "H"
(assert (= andbqtresultqtunused2 o15))

(declare-const spark__branch2 Bool)

(declare-const s1 Int)

(declare-const d2 Int)

(declare-const r1 Int)

(declare-const dd1 Int)

(declare-const ds1 Int)

(declare-const dsqtunused1 int__ref)

(declare-const ddqtunused1 int__ref)

(declare-const rqtunused1 int__ref)

(declare-const dqtunused2 int__ref)

(declare-const sqtunused1 int__ref)

(declare-const spark__branchqtunused1 bool__ref)

(declare-const usfqtunused1 Bool)

(declare-const anyqtresultqtunused2 Bool)

(declare-const v1 Int)

(declare-const vqtunused2 int__ref)

(declare-const int__contentqtresultqtunused9 Int)

(declare-const infix_eqqtresultqtunused Bool)

(declare-const usf1 Int)

(declare-const anyqtresultqtunused3 Int)

(declare-const wqtunused Int)

(declare-const int__contentqtresultqtunused10 Int)

(declare-const o16 Bool)

(declare-const infix_lseqqtresultqtunused6 Bool)

(declare-const o17 Int)

(declare-const infix_plqtresultqtunused1 Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const o18 Bool)

(declare-const infix_lseqqtresultqtunused7 Bool)

(declare-const andbqtresultqtunused3 Bool)

(declare-const int__contentqtresultqtunused11 Int)

(declare-const o19 Int)

(declare-const mod_qtresultqtunused Int)

(declare-const o20 Bool)

(declare-const infix_eqqtresultqtunused1 Bool)

(declare-const bool__contentqtresultqtunused1 Bool)

(declare-const o21 Int)

(declare-const o22 Int)

(declare-const smallest_divisorqtresultqtunused Int)

(declare-const int__contentqtresultqtunused12 Int)

(declare-const int__contentqtresultqtunused13 Int)

(declare-const o23 Int)

(declare-const div_qtresultqtunused Int)

(declare-const range_check_qtresultqtunused2 Int)

(declare-const int__contentqtresultqtunused14 Int)

(declare-const int__contentqtresultqtunused15 Int)

(declare-const o24 Int)

(declare-const mod_qtresultqtunused1 Int)

(declare-const range_check_qtresultqtunused3 Int)

(declare-const int__contentqtresultqtunused16 Int)

(declare-const o25 Int)

(declare-const div_qtresultqtunused1 Int)

(declare-const range_check_qtresultqtunused4 Int)

(declare-const int__contentqtresultqtunused17 Int)

(declare-const o26 Int)

(declare-const div_qtresultqtunused2 Int)

(declare-const range_check_qtresultqtunused5 Int)

;; "H"
(assert
  (ite (= o15 true)
    (and
      (= dsqtunused1 (int__refqtmk ds1))
      (and
        (= ddqtunused1 (int__refqtmk dd1))
        (and
          (= rqtunused1 (int__refqtmk r1))
          (and
            (= dqtunused2 (int__refqtmk d2))
            (and
              (= sqtunused1 (int__refqtmk s1))
              (and
                (= spark__branchqtunused1 (bool__refqtmk spark__branch2))
                (and
                  (and
                    (= int__contentqtresultqtunused11 v)
                    (and
                      (= o19 (mod1 v c169b))
                      (and
                        (= mod_qtresultqtunused o19)
                        (and
                          (= o20 (ite (= o19 0) true false))
                          (and
                            (= infix_eqqtresultqtunused1 o20)
                            (and
                              (= spark__branch2 o20)
                              (and
                                (= bool__contentqtresultqtunused1 spark__branch2)
                                (ite (= spark__branch2 true)
                                  (and
                                    (= o21 c169b)
                                    (and
                                      (= o22 (smallest_divisor o21))
                                      (and
                                        (and
                                          (smallest_divisor__function_guard
                                            o22
                                            o21)
                                          (and
                                            (in_range1 o22)
                                            (and
                                              (and
                                                (<= 2 o22)
                                                (<= o22 (- o21 1)))
                                              (= o21 (* o22 (__cdiv o21 
                                              o22))))))
                                        (and
                                          (= smallest_divisorqtresultqtunused 
                                          o22)
                                          (and
                                            (= s1 o22)
                                            (and
                                              (in_range1 s1)
                                              (and
                                                (= int__contentqtresultqtunused12 
                                                s1)
                                                (and
                                                  (= int__contentqtresultqtunused13 
                                                  v)
                                                  (and
                                                    (= o23 (__cdiv v 
                                                    s1))
                                                    (and
                                                      (= div_qtresultqtunused 
                                                      o23)
                                                      (and
                                                        (in_range1 o23)
                                                        (and
                                                          (= range_check_qtresultqtunused2 
                                                          o23)
                                                          (and
                                                            (= d2 o23)
                                                            (and
                                                              (in_range1 d2)
                                                              (and
                                                                (= int__contentqtresultqtunused14 
                                                                s1)
                                                                (and
                                                                  (= 
                                                                  int__contentqtresultqtunused15 
                                                                  v)
                                                                  (and
                                                                    (= 
                                                                    o24 
                                                                    (mod1
                                                                    v
                                                                    s1))
                                                                    (and
                                                                    (= 
                                                                    mod_qtresultqtunused1 
                                                                    o24)
                                                                    (and
                                                                    (in_range1
                                                                    o24)
                                                                    (and
                                                                    (= 
                                                                    range_check_qtresultqtunused3 
                                                                    o24)
                                                                    (and
                                                                    (= 
                                                                    r1 
                                                                    o24)
                                                                    (and
                                                                    (in_range1
                                                                    r1)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused16 
                                                                    v)
                                                                    (and
                                                                    (= 
                                                                    o25 (__cdiv 
                                                                    v c169b))
                                                                    (and
                                                                    (= 
                                                                    div_qtresultqtunused1 
                                                                    o25)
                                                                    (and
                                                                    (in_range1
                                                                    o25)
                                                                    (and
                                                                    (= 
                                                                    range_check_qtresultqtunused4 
                                                                    o25)
                                                                    (and
                                                                    (= 
                                                                    dd1 
                                                                    o25)
                                                                    (and
                                                                    (in_range1
                                                                    dd1)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused17 
                                                                    s1)
                                                                    (and
                                                                    (= 
                                                                    o26 (__cdiv 
                                                                    c169b 
                                                                    s1))
                                                                    (and
                                                                    (= 
                                                                    div_qtresultqtunused2 
                                                                    o26)
                                                                    (and
                                                                    (in_range1
                                                                    o26)
                                                                    (and
                                                                    (= 
                                                                    range_check_qtresultqtunused5 
                                                                    o26)
                                                                    (and
                                                                    (= 
                                                                    ds1 
                                                                    o26)
                                                                    (and
                                                                    (in_range1
                                                                    ds1)
                                                                    (and
                                                                    (= 
                                                                    v (+ (* 
                                                                    d2 
                                                                    s1) 
                                                                    r1))
                                                                    (and
                                                                    (= 
                                                                    v (* 
                                                                    dd1 
                                                                    c169b))
                                                                    (and
                                                                    (= 
                                                                    c169b (* 
                                                                    s1 
                                                                    ds1))
                                                                    (and
                                                                    (= 
                                                                    r1 (* 
                                                                    s1 (- (* 
                                                                    dd1 
                                                                    ds1) 
                                                                    d2)))
                                                                    (and
                                                                    (< 
                                                                    r1 
                                                                    s1)
                                                                    (= 
                                                                    r1 0))))))))))))))))))))))))))))))))))))))))))
                                  (and
                                    (and
                                      (and (and (= s1 s) (= d2 d)) (= r1 r))
                                      (= dd1 dd))
                                    (= ds1 ds))))))))))
                  (and
                    (=>
                      (= (mod1 v c169b) 0)
                      (= (mod1 v (smallest_divisor c169b)) 0))
                    (and
                      (and
                        (= anyqtresultqtunused3 usf1)
                        (and
                          (= wqtunused usf1)
                          (and
                            (= int__contentqtresultqtunused10 v)
                            (and
                              (= o16 (ite (<= usf1 v) true false))
                              (and
                                (= infix_lseqqtresultqtunused6 o16)
                                (and
                                  (= o17 (+ c169b 1))
                                  (and
                                    (= infix_plqtresultqtunused1 o17)
                                    (and
                                      (in_range o17)
                                      (and
                                        (= range_check_qtresultqtunused1 
                                        o17)
                                        (and
                                          (= o18 (ite (<= o17 usf1)
                                                   true
                                                   false))
                                          (and
                                            (= infix_lseqqtresultqtunused7 
                                            o18)
                                            (= andbqtresultqtunused3 (and 
                                            o18 o16)))))))))))))
                      (and
                        (= usfqtunused1 (ite (forall ((w Int))
                                               (=>
                                                 (and
                                                   (<= (+ c169b 1) w)
                                                   (<= w v))
                                                 (=>
                                                   (= (mod1 w c169b) 0)
                                                   (= (mod1
                                                        w
                                                        (smallest_divisor
                                                          c169b)) 0))))
                                          true
                                          false))
                        (and
                          (= anyqtresultqtunused2 (ite (forall ((w Int))
                                                         (=>
                                                           (and
                                                             (<= (+ c169b 1) w)
                                                             (<= w v))
                                                           (=>
                                                             (= (mod1
                                                                  w
                                                                  c169b) 0)
                                                             (= (mod1
                                                                  w
                                                                  (smallest_divisor
                                                                    c169b)) 0))))
                                                    true
                                                    false))
                          (and
                            (= vqtunused2 (int__refqtmk v1))
                            (and
                              (forall ((w Int))
                                (=>
                                  (and (<= (+ c169b 1) w) (<= w v1))
                                  (=>
                                    (= (mod1 w c169b) 0)
                                    (= (mod1 w (smallest_divisor c169b)) 0))))
                              (and
                                (and (<= (+ c169b 1) v1) (<= v1 100000))
                                (and
                                  (= int__contentqtresultqtunused9 v1)
                                  (and
                                    (= infix_eqqtresultqtunused (ite (= 
                                                                  v1 100000)
                                                                  true
                                                                  false))
                                    (= v1 100000)))))))))))))))))
    (= spark__branch1 spark__branch)))

;; "H"
(assert (smallest_divisor__function_guard (smallest_divisor c169b) c169b))

;; "Assert"
(assert
  (forall ((v2 Int))
    (=>
      (and (<= (+ c169b 1) v2) (<= v2 100000))
      (=> (= (mod1 v2 c169b) 0) (= (mod1 v2 (smallest_divisor c169b)) 0)))))

;; "o"
(define-fun o27 () Int
  (+ c169b 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused2 () Int
  o27)

;; "Ensures"
(assert (in_range o27))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused6 () Int
  o27)

(declare-const v2 Int)

;; "v'unused"
(define-fun vqtunused3 () int__ref
  (int__refqtmk v2))

;; "H"
(assert (= v2 o27))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused18 () Int
  v2)

;; "o"
(define-fun o28 () Bool
  (ite (<= v2 100000) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused8 () Bool
  o28)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused19 () Int
  v2)

;; "o"
(define-fun o29 () Bool
  (ite (<= o27 v2) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused9 () Bool
  o29)

;; "o"
(define-fun o30 () Bool
  (and o29 o28))

;; "andb'result'unused"
(define-fun andbqtresultqtunused4 () Bool
  o30)

;; "H"
(assert (= o30 true))

(declare-const spark__branch3 Bool)

(declare-const d3 Int)

;; "d'unused"
(define-fun dqtunused3 () int__ref
  (int__refqtmk d3))

;; "spark__branch'unused"
(define-fun spark__branchqtunused2 () bool__ref
  (bool__refqtmk spark__branch3))

(declare-const usf2 Int)

(declare-const anyqtresultqtunused4 Int)

;; "H"
(assert (= anyqtresultqtunused4 usf2))

(declare-const divqtunused Int)

;; "H"
(assert (= divqtunused usf2))

(declare-const o31 Int)

;; "H"
(assert (= o31 (- c169b 1)))

(declare-const infix_mnqtresultqtunused1 Int)

;; "H"
(assert (= infix_mnqtresultqtunused1 o31))

(declare-const o32 Bool)

;; "H"
(assert (= o32 (ite (<= usf2 o31) true false)))

(declare-const infix_lseqqtresultqtunused10 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused10 o32))

(declare-const o33 Bool)

;; "H"
(assert (= o33 (ite (<= 2 usf2) true false)))

(declare-const infix_lseqqtresultqtunused11 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused11 o33))

(declare-const andbqtresultqtunused5 Bool)

;; "H"
(assert (= andbqtresultqtunused5 (and o33 o32)))

(declare-const usf3 Bool)

;; "H"
(assert
  (= usf3 (ite (forall ((div1 Int))
                 (=>
                   (and (<= 2 div1) (<= div1 (- c169b 1)))
                   (not (= (mod1 v2 div1) 0))))
            true
            false)))

(declare-const anyqtresultqtunused5 Bool)

;; "H"
(assert (= anyqtresultqtunused5 usf3))

;; "H"
(assert (= spark__branch3 usf3))

(declare-const bool__contentqtresultqtunused2 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused2 spark__branch3))

(declare-const o34 Int)

(declare-const o35 Int)

(declare-const smallest_divisorqtresultqtunused1 Int)

;; "H"
(assert
  (ite (= spark__branch3 true)
    (and
      (= o34 c169b)
      (and
        (= o35 (smallest_divisor o34))
        (and
          (and
            (smallest_divisor__function_guard o35 o34)
            (and
              (in_range1 o35)
              (and
                (and (<= 2 o35) (<= o35 (- o34 1)))
                (= o34 (* o35 (__cdiv o34 o35))))))
          (and
            (= smallest_divisorqtresultqtunused1 o35)
            (and
              (= d3 o35)
              (and
                (in_range1 d3)
                (and
                  (and (<= 2 d3) (<= d3 (- c169b 1)))
                  (and (not (= (mod1 v2 d3) 0)) (not (= (mod1 v2 c169b) 0))))))))))
    (= d3 d1)))

;; "Assert"
(assert
  (=>
    (forall ((div1 Int))
      (=> (and (<= 2 div1) (<= div1 (- c169b 1))) (not (= (mod1 v2 div1) 0))))
    (not (= (mod1 v2 c169b) 0))))

(declare-const usf4 Int)

(declare-const anyqtresultqtunused6 Int)

;; "H"
(assert (= anyqtresultqtunused6 usf4))

(declare-const wqtunused1 Int)

;; "H"
(assert (= wqtunused1 usf4))

(declare-const int__contentqtresultqtunused20 Int)

;; "H"
(assert (= int__contentqtresultqtunused20 v2))

(declare-const o36 Bool)

;; "H"
(assert (= o36 (ite (<= usf4 v2) true false)))

(declare-const infix_lseqqtresultqtunused12 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused12 o36))

(declare-const o37 Int)

;; "H"
(assert (= o37 (+ c169b 1)))

(declare-const infix_plqtresultqtunused3 Int)

;; "H"
(assert (= infix_plqtresultqtunused3 o37))

;; "Ensures"
(assert (in_range o37))

(declare-const range_check_qtresultqtunused7 Int)

;; "H"
(assert (= range_check_qtresultqtunused7 o37))

(declare-const o38 Bool)

;; "H"
(assert (= o38 (ite (<= o37 usf4) true false)))

(declare-const infix_lseqqtresultqtunused13 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused13 o38))

(declare-const andbqtresultqtunused6 Bool)

;; "H"
(assert (= andbqtresultqtunused6 (and o38 o36)))

;; "_f'unused"
(define-fun usfqtunused2 () Bool
  (ite (forall ((w Int))
         (=>
           (and (<= (+ c169b 1) w) (<= w v2))
           (=>
             (forall ((div1 Int))
               (=>
                 (and (<= 2 div1) (<= div1 (- c169b 1)))
                 (not (= (mod1 w div1) 0))))
             (not (= (mod1 w c169b) 0)))))
    true
    false))

;; "any'result'unused"
(define-fun anyqtresultqtunused7 () Bool
  (ite (forall ((w Int))
         (=>
           (and (<= (+ c169b 1) w) (<= w v2))
           (=>
             (forall ((div1 Int))
               (=>
                 (and (<= 2 div1) (<= div1 (- c169b 1)))
                 (not (= (mod1 w div1) 0))))
             (not (= (mod1 w c169b) 0)))))
    true
    false))

(declare-const v3 Int)

;; "v'unused"
(define-fun vqtunused4 () int__ref
  (int__refqtmk v3))

;; "LoopInvariant"
(assert
  (forall ((w Int))
    (=>
      (and (<= (+ c169b 1) w) (<= w v3))
      (=>
        (forall ((div1 Int))
          (=>
            (and (<= 2 div1) (<= div1 (- c169b 1)))
            (not (= (mod1 w div1) 0))))
        (not (= (mod1 w c169b) 0))))))

;; "Assume"
(assert (and (<= (+ c169b 1) v3) (<= v3 100000)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused21 () Int
  v3)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused2 () Bool
  (ite (= v3 100000) true false))

;; "H"
(assert (not (= v3 100000)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused22 () Int
  v3)

;; "o"
(define-fun o39 () Int
  (+ v3 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused4 () Int
  o39)

(declare-const v4 Int)

;; "v'unused"
(define-fun vqtunused5 () int__ref
  (int__refqtmk v4))

;; "H"
(assert (= v4 o39))

(declare-const usf5 Int)

(declare-const anyqtresultqtunused8 Int)

;; "H"
(assert (= anyqtresultqtunused8 usf5))

(declare-const divqtunused1 Int)

;; "H"
(assert (= divqtunused1 usf5))

(declare-const o40 Int)

;; "H"
(assert (= o40 (- c169b 1)))

(declare-const infix_mnqtresultqtunused2 Int)

;; "H"
(assert (= infix_mnqtresultqtunused2 o40))

(declare-const o41 Bool)

;; "H"
(assert (= o41 (ite (<= usf5 o40) true false)))

(declare-const infix_lseqqtresultqtunused14 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused14 o41))

(declare-const o42 Bool)

;; "H"
(assert (= o42 (ite (<= 2 usf5) true false)))

(declare-const infix_lseqqtresultqtunused15 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused15 o42))

(declare-const andbqtresultqtunused7 Bool)

;; "H"
(assert (= andbqtresultqtunused7 (and o42 o41)))

;; "_f"
(define-fun usf6 () Bool
  (ite (forall ((div1 Int))
         (=>
           (and (<= 2 div1) (<= div1 (- c169b 1)))
           (not (= (mod1 v4 div1) 0))))
    true
    false))

;; "any'result'unused"
(define-fun anyqtresultqtunused9 () Bool
  usf6)

(declare-const spark__branch4 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused3 () bool__ref
  (bool__refqtmk spark__branch4))

;; "H"
(assert (= spark__branch4 usf6))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused3 () Bool
  spark__branch4)

;; "H"
(assert (= spark__branch4 true))

;; "o"
(define-fun o43 () Int
  c169b)

;; Goal "def'vc"
;; File "prime_and_coprime_numbers.adb", line 201, characters 0-0
(assert
  (not (not (= (is_prime o43) true))))

(check-sat)
