;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(define-fun __cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))
(define-fun __cmod ((x Int) (y Int)) Int (ite (>= x 0) (mod x y) (- (mod (- x) y))))
(declare-datatypes ((tuple0 0))
  (((Tuple0))))

(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

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

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

(declare-sort character 0)

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 255)))

;; "to_rep"
(declare-fun to_rep (character) Int)

;; "of_rep"
(declare-fun of_rep (Int) character)

;; "inversion_axiom"
(assert
  (forall ((x character))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x character)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

;; "to_rep"
(define-fun to_rep1 ((x integer)) Int
  (integerqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) integer)

;; "inversion_axiom"
(assert
  (forall ((x integer))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x integer)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                 (of_rep1 x))) )))

(declare-datatypes ((t 0))
  (((tqtmk (rec__first integer)(rec__last integer)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int character))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int character)
  (elts a))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep1 (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep1 (rec__last (rt a))))

;; "length"
(define-fun length ((a us_t)) Int
  (ite (<= (first a) (last a)) (+ (- (last a) (first a)) 1) 0))

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

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_110 us_t) (temp___is_init_106 Bool) (temp___skip_constant_107 Bool) (temp___do_toplevel_108 Bool) (temp___do_typ_inv_109 Bool)) Bool
  (=>
    (not (= temp___skip_constant_107 true))
    (dynamic_property
      1
      2147483647
      (first temp___expr_110)
      (last temp___expr_110))))

;; "valid_int_32"
(declare-fun valid_int_32 (us_t) Bool)

;; "valid_int_32__function_guard"
(declare-fun valid_int_32__function_guard (Bool
  us_t) Bool)

;; "valid_int"
(declare-fun valid_int (us_t) Bool)

;; "valid_int__function_guard"
(declare-fun valid_int__function_guard (Bool
  us_t) Bool)

(declare-const last32 (Array Int character))

;; "is_less_than_max"
(define-fun is_less_than_max ((param__s us_t) (param__is_pos Bool) (param__first Int)) Bool
  (or (< (to_rep (select (to_array param__s) param__first)) 50) (and (= 
  (to_rep
    (select (to_array param__s) param__first)) 50) (or (< (to_rep
                                                            (select (to_array
                                                                    param__s) (+ param__first 1))) 49) (and (= 
  (to_rep
    (select (to_array param__s) (+ param__first 1))) 49) (or (< (to_rep
                                                                  (select 
                                                                  (to_array
                                                                    param__s) (+ param__first 2))) 52) (and (= 
  (to_rep
    (select (to_array param__s) (+ param__first 2))) 52) (or (< (to_rep
                                                                  (select 
                                                                  (to_array
                                                                    param__s) (+ param__first 3))) 55) (and (= 
  (to_rep
    (select (to_array param__s) (+ param__first 3))) 55) (or (< (to_rep
                                                                  (select 
                                                                  (to_array
                                                                    param__s) (+ param__first 4))) 52) (and (= 
  (to_rep
    (select (to_array param__s) (+ param__first 4))) 52) (or (< (to_rep
                                                                  (select 
                                                                  (to_array
                                                                    param__s) (+ param__first 5))) 56) (and (= 
  (to_rep
    (select (to_array param__s) (+ param__first 5))) 56) (or (< (to_rep
                                                                  (select 
                                                                  (to_array
                                                                    param__s) (+ param__first 6))) 51) (and (= 
  (to_rep
    (select (to_array param__s) (+ param__first 6))) 51) (or (< (to_rep
                                                                  (select 
                                                                  (to_array
                                                                    param__s) (+ param__first 7))) 54) (and (= 
  (to_rep
    (select (to_array param__s) (+ param__first 7))) 54) (or (< (to_rep
                                                                  (select 
                                                                  (to_array
                                                                    param__s) (+ param__first 8))) 52) (and (= 
  (to_rep
    (select (to_array param__s) (+ param__first 8))) 52) (<= (to_rep
                                                               (select 
                                                               (to_array
                                                                 param__s) (+ param__first 9))) 
  (ite (= param__is_pos true)
    55
    (+ (to_rep (select last32 10)) 1))))))))))))))))))))))

(declare-sort integer_32 0)

;; "integer_32'int"
(declare-fun integer_32qtint (integer_32) Int)

;; "integer_32'axiom"
(assert
  (forall ((i integer_32))
    (and
      (<= (- 2147483648) (integer_32qtint i))
      (<= (integer_32qtint i) 2147483647))))

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

(declare-const dummy integer_32)

;; "to_rep"
(define-fun to_rep2 ((x integer_32)) Int
  (integer_32qtint x))

;; "of_rep"
(declare-fun of_rep2 (Int) integer_32)

;; "inversion_axiom"
(assert
  (forall ((x integer_32))
    (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; "range_axiom"
(assert
  (forall ((x integer_32))
    (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                  (of_rep2 x))) )))

;; "char_to_int"
(define-fun char_to_int ((param__c Int)) Int
  (ite (= param__c 48)
    0
    (ite (= param__c 49)
      1
      (ite (= param__c 50)
        2
        (ite (= param__c 51)
          3
          (ite (= param__c 52)
            4
            (ite (= param__c 53)
              5
              (ite (= param__c 54)
                6
                (ite (= param__c 55)
                  7
                  (ite (= param__c 56)
                    8
                    (ite (= param__c 57) 9 (to_rep2 dummy))))))))))))

;; "is_integer_32"
(declare-fun is_integer_32 (us_t
  Int
  Int
  Int) Bool)

(declare-const s us_t)

(declare-const tens (Array Int integer_32))

(declare-const is_pos Bool)

(declare-const firstz Int)

(declare-const first1 Int)

;; "in_range"
(define-fun in_range4 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

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

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size2 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "component__size_axiom"
(assert (<= 0 component__size2))

;; "alignment_axiom"
(assert (<= 0 alignment2))

;; "integer32_parsing__tens__aggregate_def"
(declare-fun integer32_parsing__tens__aggregate_def (Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int
  Int) (Array Int integer_32))

;; "temp___String_Literal_169"
(declare-fun temp___String_Literal_169 (tuple0) (Array Int character))

;; "temp___String_Literal_169__def_axiom"
(assert
  (forall ((us_void_param tuple0))
    (! (and
         (and
           (= (to_rep (select (temp___String_Literal_169 us_void_param) 1)) 50)
           (= (to_rep (select (temp___String_Literal_169 us_void_param) 2)) 49))
         (and
           (and
             (and
               (= (to_rep
                    (select (temp___String_Literal_169 us_void_param) 3)) 52)
               (= (to_rep
                    (select (temp___String_Literal_169 us_void_param) 4)) 55))
             (and
               (= (to_rep
                    (select (temp___String_Literal_169 us_void_param) 5)) 52)
               (= (to_rep
                    (select (temp___String_Literal_169 us_void_param) 6)) 56)))
           (and
             (and
               (= (to_rep
                    (select (temp___String_Literal_169 us_void_param) 7)) 51)
               (= (to_rep
                    (select (temp___String_Literal_169 us_void_param) 8)) 54))
             (and
               (= (to_rep
                    (select (temp___String_Literal_169 us_void_param) 9)) 52)
               (= (to_rep
                    (select (temp___String_Literal_169 us_void_param) 10)) 55))))) :pattern (
    (temp___String_Literal_169
      us_void_param)) )))

;; "last32__def_axiom"
(assert
  (= last32 (let ((temp___170qtunused (temp___String_Literal_169 Tuple0)))
              (temp___String_Literal_169 Tuple0))))

;; "tens__def_axiom"
(assert
  (= tens (let ((temp___195qtunused (integer32_parsing__tens__aggregate_def
                                      1
                                      10
                                      100
                                      1000
                                      10000
                                      100000
                                      1000000
                                      10000000
                                      100000000
                                      1000000000)))
            (integer32_parsing__tens__aggregate_def
              1
              10
              100
              1000
              10000
              100000
              1000000
              10000000
              100000000
              1000000000))))

(declare-const rliteral integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral) 1))

(declare-const rliteral1 integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral1) 10))

(declare-const rliteral2 integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral2) 100))

(declare-const rliteral3 integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral3) 1000))

(declare-const rliteral4 integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral4) 10000))

(declare-const rliteral5 integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral5) 100000))

(declare-const rliteral6 integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral6) 1000000))

(declare-const rliteral7 integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral7) 10000000))

(declare-const rliteral8 integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral8) 100000000))

(declare-const rliteral9 integer_32)

;; "rliteral_axiom"
(assert (= (integer_32qtint rliteral9) 1000000000))

;; "def_axiom"
(assert
  (forall ((temp___182 Int) (temp___183 Int) (temp___184 Int) (temp___185 Int) (temp___186 Int) (temp___187 Int) (temp___188 Int) (temp___189 Int) (temp___190 Int) (temp___191 Int))
    (let ((temp___192 (integer32_parsing__tens__aggregate_def
                        temp___182
                        temp___183
                        temp___184
                        temp___185
                        temp___186
                        temp___187
                        temp___188
                        temp___189
                        temp___190
                        temp___191)))
      (and
        (and
          (= (select temp___192 1) rliteral)
          (= (select temp___192 2) rliteral1))
        (and
          (and
            (and
              (= (select temp___192 3) rliteral2)
              (= (select temp___192 4) rliteral3))
            (and
              (= (select temp___192 5) rliteral4)
              (= (select temp___192 6) rliteral5)))
          (and
            (and
              (= (select temp___192 7) rliteral6)
              (= (select temp___192 8) rliteral7))
            (and
              (= (select temp___192 9) rliteral8)
              (= (select temp___192 10) rliteral9))))))))

;; "valid_int__post_axiom"
(assert
  (forall ((param__s us_t))
    (! (=>
         (and
           (dynamic_invariant param__s true false true true)
           (< (last param__s) 2147483647))
         (let ((result (valid_int param__s)))
           (=>
             (valid_int__function_guard result param__s)
             (=>
               (= result true)
               (and
                 (and
                   (< 0 (length param__s))
                   (let ((temp___209 (to_rep
                                       (select (to_array param__s) (first
                                                                    param__s)))))
                     (or
                       (= temp___209 45)
                       (and (<= 48 temp___209) (<= temp___209 57)))))
                 (forall ((i Int))
                   (=>
                     (and
                       (<= (+ (first param__s) 1) i)
                       (<= i (last param__s)))
                     (let ((temp___212 (to_rep
                                         (select (to_array param__s) i))))
                       (and (<= 48 temp___212) (<= temp___212 57)))))))))) :pattern (
    (valid_int
      param__s)) )))

;; "valid_int__def_axiom"
(assert
  (forall ((param__s us_t))
    (! (=
         (= (valid_int param__s) true)
         (let ((first2 (ite (= (or (= (length param__s) 0) (not (= (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    param__s) 
                                                                    (first
                                                                    param__s))) 45))) true)
                         (first param__s)
                         (+ (first param__s) 1))))
           (and
             (not (< (last param__s) first2))
             (forall ((i Int))
               (=>
                 (and (<= first2 i) (<= i (last param__s)))
                 (let ((temp___215 (to_rep (select (to_array param__s) i))))
                   (and (<= 48 temp___215) (<= temp___215 57)))))))) :pattern (
    (valid_int
      param__s)) )))

;; "valid_int_32__post_axiom"
(assert
  (forall ((param__s us_t))
    (! (=>
         (and
           (dynamic_invariant param__s true false true true)
           (< (last param__s) 2147483647))
         (let ((result (valid_int_32 param__s)))
           (=>
             (valid_int_32__function_guard result param__s)
             (=>
               (= result true)
               (and
                 (valid_int__function_guard (valid_int param__s) param__s)
                 (= (valid_int param__s) true)))))) :pattern ((valid_int_32
                                                                param__s)) )))

;; "valid_int_32__def_axiom"
(assert
  (forall ((param__s us_t))
    (! (=
         (= (valid_int_32 param__s) true)
         (let ((is_pos1 (or (= (length param__s) 0) (not (= (to_rep
                                                              (select 
                                                              (to_array
                                                                param__s) 
                                                              (first
                                                                param__s))) 45)))))
           (let ((firstz1 (ite (= is_pos1 true)
                            (first param__s)
                            (+ (first param__s) 1))))
             (let ((first2 (ite (or
                                  (< (last param__s) firstz1)
                                  (<= (- (last param__s) firstz1) 9))
                             firstz1
                             (- (last param__s) 9))))
               (and
                 (not (< (last param__s) firstz1))
                 (and
                   (and
                     (forall ((i Int))
                       (=>
                         (and (<= firstz1 i) (<= i (- first2 1)))
                         (= (to_rep (select (to_array param__s) i)) 48)))
                     (forall ((i Int))
                       (=>
                         (and (<= first2 i) (<= i (last param__s)))
                         (let ((temp___232 (to_rep
                                             (select (to_array param__s) i))))
                           (and (<= 48 temp___232) (<= temp___232 57))))))
                   (or
                     (< (- (last param__s) first2) 9)
                     (= (is_less_than_max param__s is_pos1 first2) true)))))))) :pattern (
    (valid_int_32
      param__s)) )))

;; "is_integer_32__post_axiom"
(assert true)

;; "is_integer_32__def_axiom"
(assert
  (forall ((param__s us_t))
    (forall ((param__first Int) (param__last Int) (param__v Int))
      (! (=
           (= (is_integer_32 param__s param__first param__last param__v) true)
           (and
             (= (char_to_int
                  (to_rep (select (to_array param__s) param__last))) (abs (__cmod param__v 10)))
             (ite (not (= param__last param__first))
               (= (is_integer_32
                    param__s
                    param__first
                    (- param__last 1)
                    (__cdiv param__v 10)) true)
               (and (<= (- 9) param__v) (<= param__v 9))))) :pattern (
      (is_integer_32
        param__s
        param__first
        param__last
        param__v)) ))))

;; Goal "def'vc"
;; File "integer32_parsing.ads", line 43, characters 0-0
(assert
  (not
  (forall ((temp___519 (Array Int integer_32)))
    (=>
      (and
        (and
          (and
            (= (select temp___519 1) rliteral)
            (= (select temp___519 2) rliteral1))
          (and
            (and
              (and
                (= (select temp___519 3) rliteral2)
                (= (select temp___519 4) rliteral3))
              (and
                (= (select temp___519 5) rliteral4)
                (= (select temp___519 6) rliteral5)))
            (and
              (and
                (= (select temp___519 7) rliteral6)
                (= (select temp___519 8) rliteral7))
              (and
                (= (select temp___519 9) rliteral8)
                (= (select temp___519 10) rliteral9)))))
        (= temp___519 (integer32_parsing__tens__aggregate_def
                        1
                        10
                        100
                        1000
                        10000
                        100000
                        1000000
                        10000000
                        100000000
                        1000000000)))
      (=>
        (= temp___519 tens)
        (=>
          (dynamic_invariant s true false true true)
          (=>
            (valid_int_32__function_guard (valid_int_32 s) s)
            (=>
              (and (< (last s) 2147483647) (= (valid_int_32 s) true))
              (let ((temp___491 (first s)))
                (=>
                  (and (<= (first s) temp___491) (<= temp___491 (last s)))
                  (forall ((o Int))
                    (=>
                      (= (to_rep (select (to_array s) temp___491)) o)
                      (=>
                        (= (ite (= o 45) false true) is_pos)
                        (forall ((integer32_parsing__parse_int_32__firstz__assume Int))
                          (=>
                            (ite (= is_pos true)
                              (= integer32_parsing__parse_int_32__firstz__assume 
                              (first
                                s))
                              (let ((o1 (+ (first s) 1)))
                                (and
                                  (= integer32_parsing__parse_int_32__firstz__assume o1)
                                  (in_range o1))))
                            (=>
                              (= integer32_parsing__parse_int_32__firstz__assume 
                              firstz)
                              (=>
                                (in_range firstz)
                                (forall ((integer32_parsing__parse_int_32__first__assume Int))
                                  (=>
                                    (exists ((o1 Bool))
                                      (and
                                        (ite (< (last s) firstz)
                                          (= o1 true)
                                          (let ((o2 (- (last s) firstz)))
                                            (and
                                              (in_range o2)
                                              (= o1 (ite (<= o2 9)
                                                      true
                                                      false)))))
                                        (ite (= o1 true)
                                          (= integer32_parsing__parse_int_32__first__assume 
                                          firstz)
                                          (let ((o2 (- (last s) 9)))
                                            (and
                                              (= integer32_parsing__parse_int_32__first__assume o2)
                                              (in_range o2))))))
                                    (=>
                                      (= integer32_parsing__parse_int_32__first__assume 
                                      first1)
                                      (=>
                                        (in_range first1)
                                        (forall ((res Int))
                                          (=>
                                            (= res 0)
                                            (=>
                                              (in_range3 res)
                                              (=>
                                                (let ((temp___492 firstz))
                                                  (let ((o1 (- first1 1)))
                                                    (and
                                                      (in_range o1)
                                                      (exists ((i Int))
                                                        (and
                                                          (= i temp___492)
                                                          (=>
                                                            (= (and (ite (<= temp___492 i)
                                                                    true
                                                                    false) 
                                                            (ite (<= i o1)
                                                              true
                                                              false)) true)
                                                            (and
                                                              (in_range1 i)
                                                              (let ((o2 
                                                                firstz))
                                                                (and
                                                                  (in_range1
                                                                    o2)
                                                                  (let ((o3 
                                                                    s))
                                                                    (and
                                                                    (=
                                                                    (= 
                                                                    (is_integer_32
                                                                    o3
                                                                    o2
                                                                    i
                                                                    res) true)
                                                                    (and
                                                                    (= 
                                                                    (char_to_int
                                                                    (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    o3) i))) (abs (__cmod res 10)))
                                                                    (ite 
                                                                    (not
                                                                    (= i o2))
                                                                    (= 
                                                                    (is_integer_32
                                                                    o3
                                                                    o2
                                                                    (- i 1)
                                                                    (__cdiv res 10)) true)
                                                                    (and
                                                                    (<= (- 9) res)
                                                                    (<= res 9)))))
                                                                    (exists 
                                                                    ((i1 Int))
                                                                    (and
                                                                    (= 
                                                                    (is_integer_32
                                                                    s
                                                                    firstz
                                                                    i1
                                                                    res) true)
                                                                    (and
                                                                    (and
                                                                    (<= 
                                                                    firstz i1)
                                                                    (<= i1 (- 
                                                                    first1 1)))
                                                                    (= i1 o1)))))))))))))))
                                                (=>
                                                  (=>
                                                    (not (= firstz first1))
                                                    (= (is_integer_32
                                                         s
                                                         firstz
                                                         (- first1 1)
                                                         res) true))
                                                  (forall ((i Int))
                                                    (=>
                                                      (= i 1)
                                                      (=>
                                                        (= (and (ite (<= 1 i)
                                                                  true
                                                                  false) 
                                                        (ite (<= i 10)
                                                          true
                                                          false)) true)
                                                        (forall ((res1 Int) (i1 Int))
                                                          (=>
                                                            (= (and (ite 
                                                                    (in_range3
                                                                    res1)
                                                                    true
                                                                    false) 
                                                            (ite (and
                                                                   (<= 1 i1)
                                                                   (<= i1 10))
                                                              true
                                                              false)) true)
                                                            (let ((o1 (+ (- i1 1) 
                                                              first1)))
                                                              (=>
                                                                (in_range o1)
                                                                (=>
                                                                  (and
                                                                    (<= 
                                                                    (first
                                                                    s) o1)
                                                                    (<= o1 
                                                                    (last
                                                                    s)))
                                                                  (forall 
                                                                    ((o2 Int))
                                                                    (=>
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    s) o1)) o2)
                                                                    (let ((o3 
                                                                    (char_to_int
                                                                    o2)))
                                                                    (=>
                                                                    (and
                                                                    (in_range3
                                                                    o3)
                                                                    (= o3 
                                                                    (ite (= o2 48)
                                                                    0
                                                                    (ite (= o2 49)
                                                                    1
                                                                    (ite (= o2 50)
                                                                    2
                                                                    (ite (= o2 51)
                                                                    3
                                                                    (ite (= o2 52)
                                                                    4
                                                                    (ite (= o2 53)
                                                                    5
                                                                    (ite (= o2 54)
                                                                    6
                                                                    (ite (= o2 55)
                                                                    7
                                                                    (ite (= o2 56)
                                                                    8
                                                                    (ite (= o2 57)
                                                                    9
                                                                    (to_rep2
                                                                    dummy)))))))))))))
                                                                    (forall 
                                                                    ((o4 Int))
                                                                    (=>
                                                                    (ite (= 
                                                                    is_pos true)
                                                                    (= o4 1)
                                                                    (= o4 (- 1)))
                                                                    (let ((o5 (* o4 o3)))
                                                                    (=>
                                                                    (in_range4
                                                                    o5)
                                                                    (let ((o6 (* res1 10)))
                                                                    (=>
                                                                    (in_range4
                                                                    o6)
                                                                    (let ((o7 (+ o6 o5)))
                                                                    (=>
                                                                    (in_range4
                                                                    o7)
                                                                    (forall 
                                                                    ((res2 Int))
                                                                    (=>
                                                                    (= res2 o7)
                                                                    (=>
                                                                    (ite (= 
                                                                    is_pos true)
                                                                    (<= 0 res2)
                                                                    (<= res2 0))
                                                                    (=>
                                                                    (= (* 
                                                                    (ite (= 
                                                                    is_pos true)
                                                                    1
                                                                    (- 1)) 
                                                                    (char_to_int
                                                                    (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    s) (+ (- i1 1) 
                                                                    first1))))) (__cmod res2 10))
                                                                    (= 
                                                                    (char_to_int
                                                                    (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    s) (+ (- i1 1) 
                                                                    first1)))) (abs (__cmod res2 10)))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
