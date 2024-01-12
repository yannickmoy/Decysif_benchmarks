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

;; "min"
(define-fun min ((x Int) (y Int)) Int
  (ite (<= x y) x y))

;; "are_coprime"
(define-fun are_coprime ((param__v1 Int) (param__v2 Int)) Bool
  (and (and (> param__v1 0) (> param__v2 0)) (ite (forall ((v Int))
                                                    (=>
                                                      (and
                                                        (<= 2 v)
                                                        (<= v (min
                                                                param__v1
                                                                param__v2)))
                                                      (not
                                                        (and
                                                          (= (mod1
                                                               param__v1
                                                               v) 0)
                                                          (= (mod1
                                                               param__v2
                                                               v) 0)))))
                                               true
                                               false)))

(declare-const left Int)

(declare-const right Int)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

(declare-const a Int)

(declare-const b Int)

(declare-const r Int)

;; "r'unused"
(define-fun rqtunused () int__ref
  (int__refqtmk r))

;; "b'unused"
(define-fun bqtunused () int__ref
  (int__refqtmk b))

;; "a'unused"
(define-fun aqtunused () int__ref
  (int__refqtmk a))

;; "Assume"
(assert (in_range left))

;; "Assume"
(assert (in_range right))

;; "Assume"
(assert (and (<= 2 left) (<= 0 right)))

;; "o"
(define-fun o () Int
  right)

;; "o"
(define-fun o1 () Int
  left)

;; "temp___278"
(define-fun temp___278 () Bool
  (are_coprime o1 o))

;; "Ensures"
(assert
  (=
    (= temp___278 true)
    (and
      (and (< 0 o1) (< 0 o))
      (forall ((v Int))
        (=>
          (and (<= 2 v) (<= v (min o1 o)))
          (not (and (= (mod1 o1 v) 0) (= (mod1 o v) 0))))))))

;; "are_coprime'result'unused"
(define-fun are_coprimeqtresultqtunused () Bool
  temp___278)

(declare-const test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result Int)

;; "test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result'unused"
(define-fun test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__resultqtunused 
  () int__ref
  (int__refqtmk
    test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 a))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range2 b))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range3 r))

(declare-const o2 Bool)

;; "H"
(assert (= o2 (ite (= left 0) true false)))

(declare-const infix_eqqtresultqtunused Bool)

;; "H"
(assert (= infix_eqqtresultqtunused o2))

(declare-const spark__branch Bool)

(declare-const spark__branchqtunused bool__ref)

;; "H"
(assert (= spark__branchqtunused (bool__refqtmk spark__branch)))

;; "H"
(assert (= spark__branch o2))

(declare-const bool__contentqtresultqtunused Bool)

;; "H"
(assert (= bool__contentqtresultqtunused spark__branch))

(declare-const o3 Bool)

(declare-const infix_eqqtresultqtunused1 Bool)

(declare-const spark__branch1 Bool)

(declare-const spark__branchqtunused1 bool__ref)

(declare-const bool__contentqtresultqtunused1 Bool)

(declare-const o4 Int)

(declare-const range_check_qtresultqtunused Int)

(declare-const a1 Int)

(declare-const aqtunused1 int__ref)

(declare-const o5 Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const b1 Int)

(declare-const bqtunused1 int__ref)

(declare-const a2 Int)

(declare-const b2 Int)

(declare-const bqtunused2 int__ref)

(declare-const aqtunused2 int__ref)

(declare-const int__contentqtresultqtunused Int)

(declare-const temp___loop_entry_287qtunused Int)

(declare-const int__contentqtresultqtunused1 Int)

(declare-const temp___loop_entry_286qtunused Int)

(declare-const int__contentqtresultqtunused2 Int)

(declare-const temp___loop_entry_285qtunused Int)

(declare-const int__contentqtresultqtunused3 Int)

(declare-const int__contentqtresultqtunused4 Int)

(declare-const o6 Bool)

(declare-const infix_gtqtresultqtunused Bool)

(declare-const int__contentqtresultqtunused5 Int)

(declare-const o7 Bool)

(declare-const infix_gtqtresultqtunused1 Bool)

(declare-const andbqtresultqtunused Bool)

(declare-const a3 Int)

(declare-const b3 Int)

(declare-const r1 Int)

(declare-const bqtunused3 int__ref)

(declare-const aqtunused3 int__ref)

(declare-const loop_var___32405qtunused Int)

(declare-const int__contentqtresultqtunused6 Int)

(declare-const int__contentqtresultqtunused7 Int)

(declare-const int__contentqtresultqtunused8 Int)

(declare-const o8 Int)

(declare-const mod_qtresultqtunused Int)

(declare-const r2 Int)

(declare-const rqtunused1 int__ref)

(declare-const int__contentqtresultqtunused9 Int)

(declare-const infix_eqqtresultqtunused2 Bool)

(declare-const int__contentqtresultqtunused10 Int)

(declare-const int__contentqtresultqtunused11 Int)

(declare-const range_check_qtresultqtunused2 Int)

;; "H"
(assert
  (ite (= spark__branch true)
    (= test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result 
    right)
    (and
      (= o3 (ite (= right 0) true false))
      (and
        (= infix_eqqtresultqtunused1 o3)
        (and
          (= spark__branchqtunused1 (bool__refqtmk spark__branch1))
          (and
            (= spark__branch1 o3)
            (and
              (= bool__contentqtresultqtunused1 spark__branch1)
              (ite (= spark__branch1 true)
                (= test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result 
                left)
                (and
                  (= o4 left)
                  (and
                    (in_range1 o4)
                    (and
                      (= range_check_qtresultqtunused o4)
                      (and
                        (= aqtunused1 (int__refqtmk a1))
                        (and
                          (= a1 o4)
                          (and
                            (= o5 right)
                            (and
                              (in_range2 o5)
                              (and
                                (= range_check_qtresultqtunused1 o5)
                                (and
                                  (= bqtunused1 (int__refqtmk b1))
                                  (and
                                    (= b1 o5)
                                    (and
                                      (= bqtunused2 (int__refqtmk b2))
                                      (and
                                        (= aqtunused2 (int__refqtmk a2))
                                        (and
                                          (and
                                            (= temp___loop_entry_287qtunused 
                                            r)
                                            (and
                                              (= int__contentqtresultqtunused1 
                                              r)
                                              (and
                                                (= temp___loop_entry_286qtunused 
                                                b1)
                                                (and
                                                  (= int__contentqtresultqtunused2 
                                                  b1)
                                                  (and
                                                    (= temp___loop_entry_285qtunused 
                                                    a1)
                                                    (and
                                                      (= int__contentqtresultqtunused3 
                                                      a1)
                                                      (and
                                                        (= int__contentqtresultqtunused4 
                                                        b1)
                                                        (and
                                                          (= o6 (ite (< 0 
                                                                  b1)
                                                                  true
                                                                  false))
                                                          (and
                                                            (= infix_gtqtresultqtunused 
                                                            o6)
                                                            (and
                                                              (= int__contentqtresultqtunused5 
                                                              a1)
                                                              (and
                                                                (= o7 
                                                                (ite (< 0 
                                                                  a1)
                                                                  true
                                                                  false))
                                                                (and
                                                                  (= 
                                                                  infix_gtqtresultqtunused1 
                                                                  o7)
                                                                  (and
                                                                    (= 
                                                                    andbqtresultqtunused (and 
                                                                    o7 
                                                                    o6))
                                                                    (and
                                                                    (= 
                                                                    bqtunused3 
                                                                    (int__refqtmk
                                                                    b3))
                                                                    (and
                                                                    (= 
                                                                    aqtunused3 
                                                                    (int__refqtmk
                                                                    a3))
                                                                    (and
                                                                    (and
                                                                    (and
                                                                    (< 0 
                                                                    a3)
                                                                    (< 0 
                                                                    b3))
                                                                    (and
                                                                    (not
                                                                    (and
                                                                    (= 
                                                                    a3 1)
                                                                    (= 
                                                                    b3 1)))
                                                                    (=
                                                                    (= 
                                                                    (are_coprime
                                                                    a3
                                                                    b3) true)
                                                                    (= 
                                                                    (are_coprime
                                                                    left
                                                                    right) true))))
                                                                    (and
                                                                    (= 
                                                                    loop_var___32405qtunused 
                                                                    b3)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused6 
                                                                    b3)
                                                                    (and
                                                                    (and
                                                                    (and
                                                                    (in_range1
                                                                    a3)
                                                                    (in_range2
                                                                    b3))
                                                                    (in_range3
                                                                    r1))
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused7 
                                                                    b3)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused8 
                                                                    a3)
                                                                    (and
                                                                    (= 
                                                                    o8 
                                                                    (mod1
                                                                    a3
                                                                    b3))
                                                                    (and
                                                                    (= 
                                                                    mod_qtresultqtunused 
                                                                    o8)
                                                                    (and
                                                                    (= 
                                                                    rqtunused1 
                                                                    (int__refqtmk
                                                                    r2))
                                                                    (and
                                                                    (= 
                                                                    r2 
                                                                    o8)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused9 
                                                                    r2)
                                                                    (and
                                                                    (= 
                                                                    infix_eqqtresultqtunused2 
                                                                    (ite (= 
                                                                    r2 0)
                                                                    true
                                                                    false))
                                                                    (and
                                                                    (= 
                                                                    r2 0)
                                                                    (and
                                                                    (= 
                                                                    a2 
                                                                    a3)
                                                                    (= 
                                                                    b2 
                                                                    b3))))))))))))))))))))))))))))))
                                          (and
                                            (not (and (= a2 1) (< 0 b2)))
                                            (and
                                              (= int__contentqtresultqtunused 
                                              b2)
                                              (= test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result 
                                              b2))))))))))))))))))))))))

;; "H"
(assert (= temp___278 true))

;; Goal "def'vc"
;; File "prime_and_coprime_numbers.adb", line 29, characters 0-0
(assert
  (not
  (= test_prime_and_coprime_numbers__p__initialize_coprime_list__euclid__result 1)))

(check-sat)
