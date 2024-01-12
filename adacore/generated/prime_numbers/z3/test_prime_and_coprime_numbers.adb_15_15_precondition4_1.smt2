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

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

(declare-const max_value Int)

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int Bool))))))

;; "valid_prime_data"
(declare-fun valid_prime_data ((Array Int Bool)) Bool)

;; "mod"
(define-fun mod1 ((x Int) (y Int)) Int
  (ite (<= 0 y) (mod x y) (- (mod (- x) y))))

;; "min"
(define-fun min ((x Int) (y Int)) Int
  (ite (<= x y) x y))

;; "max"
(define-fun max ((x Int) (y Int)) Int
  (ite (<= x y) y x))

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

;; "initialize_coprime_list"
(declare-fun initialize_coprime_list (Int) (Array Int Bool))

;; "initialize_coprime_list__function_guard"
(declare-fun initialize_coprime_list__function_guard ((Array Int Bool)
  Int) Bool)

;; "has_true"
(define-fun has_true ((param__number_list (Array Int Bool)) (param__low Int) (param__high Int)) Bool
  (ite (exists ((v Int))
         (and
           (and (<= param__low v) (<= v param__high))
           (= (select param__number_list v) true)))
    true
    false))

;; "is_prime"
(define-fun is_prime ((param__value Int)) Bool
  (and (>= param__value 2) (ite (forall ((v Int))
                                  (=>
                                    (and (<= 2 v) (<= v (- param__value 1)))
                                    (not (= (mod1 param__value v) 0))))
                             true
                             false)))

;; "nearest_prime_number"
(declare-fun nearest_prime_number (Int
  Int
  (Array Int Bool)) Int)

;; "nearest_prime_number__function_guard"
(declare-fun nearest_prime_number__function_guard (Int
  Int
  Int
  (Array Int Bool)) Bool)

;; "valid_prime_data__post_axiom"
(assert true)

;; "valid_prime_data__def_axiom"
(assert
  (forall ((Test_prime_and_coprime_numbers__p__set__is_prime___is_prime___ (Array Int Bool)))
    (! (=
         (= (valid_prime_data
              Test_prime_and_coprime_numbers__p__set__is_prime___is_prime___) true)
         (forall ((v Int))
           (=>
             (and (<= 0 v) (<= v 100000))
             (=
               (= (select Test_prime_and_coprime_numbers__p__set__is_prime___is_prime___ v) true)
               (= (is_prime v) true))))) :pattern ((valid_prime_data
                                                     Test_prime_and_coprime_numbers__p__set__is_prime___is_prime___)) )))

(declare-const is_prime1 (Array Int Bool))

(declare-const coprimes (Array Int Bool))

(declare-const result__ Int)

;; "result__'unused"
(define-fun result__qtunused () int__ref
  (int__refqtmk result__))

;; "coprimes'unused"
(define-fun coprimesqtunused () map__ref
  (map__refqtmk coprimes))

;; "is_prime'unused"
(define-fun is_primeqtunused () map__ref
  (map__refqtmk is_prime1))

;; "Assume"
(assert (in_range max_value))

;; "Assume"
(assert (= 100000 max_value))

;; "Assume"
(assert (= (valid_prime_data is_prime1) true))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 result__))

;; "o"
(define-fun o () Int
  (nearest_prime_number 555 1 is_prime1))

;; "H"
(assert (nearest_prime_number__function_guard o 555 1 is_prime1))

;; "H"
(assert (in_range o))

;; "H"
(assert (<= 0 o))

;; "H"
(assert (<= o 100000))

;; "H"
(assert (= (is_prime o) true))

;; "H"
(assert
  (ite (= (is_prime 555) true)
    (= o 555)
    (ite (= (and (not (is_prime 555)) (= 1 0)) true)
      (and
        (< 555 o)
        (forall ((v Int))
          (=> (and (<= 555 v) (<= v (- o 1))) (not (= (is_prime v) true)))))
      (ite (= (and (not (is_prime 555)) (= 1 1)) true)
        (and
          (< o 555)
          (forall ((v Int))
            (=> (and (<= (+ o 1) v) (<= v 555)) (not (= (is_prime v) true)))))
        (=>
          (= (and (not (is_prime 555)) (= 1 2)) true)
          (and
            (forall ((v Int))
              (=>
                (and (<= (max 0 (+ (- 555 (abs (- 555 o))) 1)) v) (<= v 555))
                (not (= (is_prime v) true))))
            (forall ((v Int))
              (=>
                (and
                  (<= 555 v)
                  (<= v (min 100000 (- (+ 555 (abs (- 555 o))) 1))))
                (not (= (is_prime v) true))))))))))

;; "nearest_prime_number'result'unused"
(define-fun nearest_prime_numberqtresultqtunused () Int
  o)

;; "Ensures"
(assert (in_range1 o))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o)

;; "o"
(define-fun o1 () (Array Int Bool)
  (initialize_coprime_list 2000))

;; "H"
(assert (initialize_coprime_list__function_guard o1 2000))

;; "H"
(assert true)

;; "H"
(assert
  (forall ((v Int))
    (=>
      (and (<= 0 v) (<= v 100000))
      (= (= (select o1 v) true) (= (are_coprime 2000 v) true)))))

;; "initialize_coprime_list'result'unused"
(define-fun initialize_coprime_listqtresultqtunused () (Array Int Bool)
  o1)

(declare-const coprimes1 (Array Int Bool))

;; "coprimes'unused"
(define-fun coprimesqtunused1 () map__ref
  (map__refqtmk coprimes1))

;; "H"
(assert (= coprimes1 o1))

;; "Assert"
(assert (= (are_coprime 2000 1) true))

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused () (Array Int Bool)
  coprimes1)

;; "H"
(assert (not (= 1 0)))

;; Goal "def'vc"
;; File "test_prime_and_coprime_numbers.adb", line 3, characters 0-0
(assert
  (not (= (has_true coprimes1 0 555) true)))

(check-sat)