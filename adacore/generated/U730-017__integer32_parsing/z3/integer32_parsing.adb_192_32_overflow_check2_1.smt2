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
(declare-datatypes ()
  ((tuple0 (Tuple0))))

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

(declare-datatypes ()
  ((t (tqtmk (rec__first integer)(rec__last integer)))))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))

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
  (= last32 (let ((temp___170 (temp___String_Literal_169 Tuple0)))
              (let ((temp___171 temp___170)) temp___171))))

;; "tens__def_axiom"
(assert
  (= tens (let ((temp___195 (integer32_parsing__tens__aggregate_def
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
            (let ((temp___196 temp___195)) temp___196))))

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
           (and
             (valid_int__function_guard (valid_int param__s) param__s)
             (=>
               (valid_int_32__function_guard result param__s)
               (=> (= result true) (= (valid_int param__s) true)))))) :pattern (
    (valid_int_32
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

;; "Assume"
(assert true)

(declare-const temp___519 (Array Int integer_32))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert (= (select temp___519 1) rliteral))

;; "H"
(assert (= (select temp___519 2) rliteral1))

;; "H"
(assert (= (select temp___519 3) rliteral2))

;; "H"
(assert (= (select temp___519 4) rliteral3))

;; "H"
(assert (= (select temp___519 5) rliteral4))

;; "H"
(assert (= (select temp___519 6) rliteral5))

;; "H"
(assert (= (select temp___519 7) rliteral6))

;; "H"
(assert (= (select temp___519 8) rliteral7))

;; "H"
(assert (= (select temp___519 9) rliteral8))

;; "H"
(assert (= (select temp___519 10) rliteral9))

;; "H"
(assert
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

;; "integer32_parsing__tens__aggregate_def'result'unused"
(define-fun integer32_parsing__tens__aggregate_defqtresultqtunused () (Array Int integer_32)
  temp___519)

;; "Assume"
(assert (= temp___519 tens))

;; "Assume"
(assert (dynamic_invariant s true false true true))

;; "H"
(assert (valid_int_32__function_guard (valid_int_32 s) s))

;; "Assume"
(assert (and (< (last s) 2147483647) (= (valid_int_32 s) true)))

;; "temp___491"
(define-fun temp___491 () Int
  (first s))

;; "first'result'unused"
(define-fun firstqtresultqtunused () Int
  temp___491)

;; "Assert"
(assert (and (<= (first s) temp___491) (<= temp___491 (last s))))

;; "o"
(define-fun o () (Array Int character)
  (to_array s))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused () (Array Int character)
  o)

;; "o"
(define-fun o1 () character
  (select o temp___491))

;; "get'result'unused"
(define-fun getqtresultqtunused () character
  o1)

(declare-const o2 Int)

;; "Ensures"
(assert (= (to_rep o1) o2))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused () Int
  o2)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  (ite (= o2 45) true false))

;; "integer32_parsing__parse_int_32__is_pos__assume'unused"
(define-fun integer32_parsing__parse_int_32__is_pos__assumeqtunused () Bool
  (ite (= o2 45) false true))

;; "Assume"
(assert (= (ite (= o2 45) false true) is_pos))

(declare-const integer32_parsing__parse_int_32__firstz__assume Int)

(declare-const o3 Int)

(declare-const firstqtresultqtunused1 Int)

(declare-const o4 Int)

(declare-const infix_plqtresultqtunused Int)

(declare-const range_check_qtresultqtunused Int)

(declare-const firstqtresultqtunused2 Int)

;; "H"
(assert
  (ite (= is_pos true)
    (and
      (= integer32_parsing__parse_int_32__firstz__assume (first s))
      (= firstqtresultqtunused2 integer32_parsing__parse_int_32__firstz__assume))
    (and
      (= o3 (first s))
      (and
        (= firstqtresultqtunused1 o3)
        (and
          (= o4 (+ o3 1))
          (and
            (= infix_plqtresultqtunused o4)
            (and
              (= integer32_parsing__parse_int_32__firstz__assume o4)
              (and
                (in_range o4)
                (= range_check_qtresultqtunused integer32_parsing__parse_int_32__firstz__assume)))))))))

;; "Assume"
(assert (= integer32_parsing__parse_int_32__firstz__assume firstz))

;; "Assume"
(assert (in_range firstz))

(declare-const integer32_parsing__parse_int_32__first__assume Int)

(declare-const o5 Int)

;; "H"
(assert (= o5 (last s)))

(declare-const lastqtresultqtunused Int)

;; "H"
(assert (= lastqtresultqtunused o5))

(declare-const infix_gtqtresultqtunused Bool)

;; "H"
(assert (= infix_gtqtresultqtunused (ite (< o5 firstz) true false)))

(declare-const o6 Bool)

(declare-const o7 Int)

(declare-const lastqtresultqtunused1 Int)

(declare-const o8 Int)

(declare-const infix_mnqtresultqtunused Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const infix_lseqqtresultqtunused Bool)

;; "H"
(assert
  (ite (< o5 firstz)
    (= o6 true)
    (and
      (= o7 (last s))
      (and
        (= lastqtresultqtunused1 o7)
        (and
          (= o8 (- o7 firstz))
          (and
            (= infix_mnqtresultqtunused o8)
            (and
              (in_range o8)
              (and
                (= range_check_qtresultqtunused1 o8)
                (and
                  (= o6 (ite (<= o8 9) true false))
                  (= infix_lseqqtresultqtunused o6))))))))))

(declare-const o9 Int)

(declare-const lastqtresultqtunused2 Int)

(declare-const o10 Int)

(declare-const infix_mnqtresultqtunused1 Int)

(declare-const range_check_qtresultqtunused2 Int)

;; "H"
(assert
  (ite (= o6 true)
    (= integer32_parsing__parse_int_32__first__assume firstz)
    (and
      (= o9 (last s))
      (and
        (= lastqtresultqtunused2 o9)
        (and
          (= o10 (- o9 9))
          (and
            (= infix_mnqtresultqtunused1 o10)
            (and
              (= integer32_parsing__parse_int_32__first__assume o10)
              (and
                (in_range o10)
                (= range_check_qtresultqtunused2 integer32_parsing__parse_int_32__first__assume)))))))))

;; "Assume"
(assert (= integer32_parsing__parse_int_32__first__assume first1))

;; "Assume"
(assert (in_range first1))

(declare-const res Int)

;; "res'unused"
(define-fun resqtunused () int__ref
  (int__refqtmk res))

;; "H"
(assert (= res 0))

;; "Assume"
(assert (in_range3 res))

(declare-const temp___492 Int)

;; "H"
(assert (= temp___492 firstz))

(declare-const o11 Int)

;; "H"
(assert (= o11 (- first1 1)))

(declare-const infix_mnqtresultqtunused2 Int)

;; "H"
(assert (= infix_mnqtresultqtunused2 o11))

;; "Ensures"
(assert (in_range o11))

(declare-const range_check_qtresultqtunused3 Int)

;; "H"
(assert (= range_check_qtresultqtunused3 o11))

(declare-const i Int)

(declare-const iqtunused int__ref)

;; "H"
(assert (= iqtunused (int__refqtmk i)))

;; "H"
(assert (= i temp___492))

(declare-const int__contentqtresultqtunused Int)

;; "H"
(assert (= int__contentqtresultqtunused i))

(declare-const o12 Bool)

;; "H"
(assert (= o12 (ite (<= i o11) true false)))

(declare-const infix_lseqqtresultqtunused1 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused1 o12))

(declare-const int__contentqtresultqtunused1 Int)

;; "H"
(assert (= int__contentqtresultqtunused1 i))

(declare-const o13 Bool)

;; "H"
(assert (= o13 (ite (<= temp___492 i) true false)))

(declare-const infix_lseqqtresultqtunused2 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused2 o13))

(declare-const o14 Bool)

;; "H"
(assert (= o14 (and o13 o12)))

(declare-const andbqtresultqtunused Bool)

;; "H"
(assert (= andbqtresultqtunused o14))

(declare-const int__contentqtresultqtunused2 Int)

(declare-const int__contentqtresultqtunused3 Int)

(declare-const range_check_qtresultqtunused4 Int)

(declare-const o15 Int)

(declare-const range_check_qtresultqtunused5 Int)

(declare-const o16 us_t)

(declare-const temp___inv_494 Bool)

(declare-const is_integer_32qtresultqtunused Bool)

(declare-const i1 Int)

(declare-const iqtunused1 int__ref)

(declare-const int__contentqtresultqtunused4 Int)

(declare-const infix_eqqtresultqtunused1 Bool)

;; "H"
(assert
  (=>
    (= o14 true)
    (and
      (= int__contentqtresultqtunused2 res)
      (and
        (= int__contentqtresultqtunused3 i)
        (and
          (in_range1 i)
          (and
            (= range_check_qtresultqtunused4 i)
            (and
              (= o15 firstz)
              (and
                (in_range1 o15)
                (and
                  (= range_check_qtresultqtunused5 o15)
                  (and
                    (= o16 s)
                    (and
                      (= temp___inv_494 (is_integer_32 o16 o15 i res))
                      (and
                        (=
                          (= temp___inv_494 true)
                          (and
                            (= (char_to_int
                                 (to_rep (select (to_array o16) i))) (abs (__cmod 
                            res 10)))
                            (ite (not (= i o15))
                              (= (is_integer_32
                                   o16
                                   o15
                                   (- i 1)
                                   (__cdiv res 10)) true)
                              (and (<= (- 9) res) (<= res 9)))))
                        (and
                          (= is_integer_32qtresultqtunused temp___inv_494)
                          (and
                            (= iqtunused1 (int__refqtmk i1))
                            (and
                              (= (is_integer_32 s firstz i1 res) true)
                              (and
                                (and (<= firstz i1) (<= i1 (- first1 1)))
                                (and
                                  (= int__contentqtresultqtunused4 i1)
                                  (and
                                    (= infix_eqqtresultqtunused1 (ite (= 
                                                                   i1 
                                                                   o11)
                                                                   true
                                                                   false))
                                    (= i1 o11)))))))))))))))))))

;; "Assert"
(assert
  (=>
    (not (= firstz first1))
    (= (is_integer_32 s firstz (- first1 1) res) true)))

(declare-const i2 Int)

;; "i'unused"
(define-fun iqtunused2 () int__ref
  (int__refqtmk i2))

;; "H"
(assert (= i2 1))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  i2)

;; "o"
(define-fun o17 () Bool
  (ite (<= i2 10) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused3 () Bool
  o17)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  i2)

;; "o"
(define-fun o18 () Bool
  (ite (<= 1 i2) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused4 () Bool
  o18)

;; "o"
(define-fun o19 () Bool
  (and o18 o17))

;; "andb'result'unused"
(define-fun andbqtresultqtunused1 () Bool
  o19)

;; "H"
(assert (= o19 true))

;; "temp___loop_entry_505'unused"
(define-fun temp___loop_entry_505qtunused () Int
  res)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  res)

(declare-const res1 Int)

(declare-const i3 Int)

;; "i'unused"
(define-fun iqtunused3 () int__ref
  (int__refqtmk i3))

;; "res'unused"
(define-fun resqtunused1 () int__ref
  (int__refqtmk res1))

;; "Assume"
(assert
  (= (and (ite (in_range3 res1) true false) (ite (and (<= 1 i3) (<= i3 10))
                                              true
                                              false)) true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused8 () Int
  i3)

;; "o"
(define-fun o20 () Int
  (- i3 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused3 () Int
  o20)

;; "o"
(define-fun o21 () Int
  (+ o20 first1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o21)

;; "Ensures"
(assert (in_range o21))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused6 () Int
  o21)

;; "Assert"
(assert (and (<= (first s) o21) (<= o21 (last s))))

;; "o"
(define-fun o22 () (Array Int character)
  (to_array s))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused1 () (Array Int character)
  o22)

;; "o"
(define-fun o23 () character
  (select o22 o21))

;; "get'result'unused"
(define-fun getqtresultqtunused1 () character
  o23)

(declare-const o24 Int)

;; "Ensures"
(assert (= (to_rep o23) o24))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused1 () Int
  o24)

;; "o"
(define-fun o25 () Int
  (char_to_int o24))

;; "H"
(assert (in_range3 o25))

;; "H"
(assert
  (= o25 (ite (= o24 48)
           0
           (ite (= o24 49)
             1
             (ite (= o24 50)
               2
               (ite (= o24 51)
                 3
                 (ite (= o24 52)
                   4
                   (ite (= o24 53)
                     5
                     (ite (= o24 54)
                       6
                       (ite (= o24 55)
                         7
                         (ite (= o24 56)
                           8
                           (ite (= o24 57) 9 (to_rep2 dummy)))))))))))))

;; "char_to_int'result'unused"
(define-fun char_to_intqtresultqtunused () Int
  o25)

(declare-const o26 Int)

;; "H"
(assert (ite (= is_pos true) (= o26 1) (= o26 (- 1))))

;; "o"
(define-fun o27 () Int
  (* o26 o25))

;; "infix *'result'unused"
(define-fun infix_asqtresultqtunused () Int
  o27)

;; "Ensures"
(assert (in_range4 o27))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused7 () Int
  o27)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  res1)

;; "o"
(define-fun o28 () Int
  (* res1 10))

;; "infix *'result'unused"
(define-fun infix_asqtresultqtunused1 () Int
  o28)

;; "Ensures"
(assert (in_range4 o28))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused8 () Int
  o28)

;; "o"
(define-fun o29 () Int
  (+ o28 o27))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused2 () Int
  o29)

;; "Ensures"
(assert (in_range4 o29))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused9 () Int
  o29)

(declare-const res2 Int)

;; "res'unused"
(define-fun resqtunused2 () int__ref
  (int__refqtmk res2))

;; "H"
(assert (= res2 o29))

;; "Assert"
(assert (ite (= is_pos true) (<= 0 res2) (<= res2 0)))

;; "Assert"
(assert
  (= (* (ite (= is_pos true) 1 (- 1)) (char_to_int
                                        (to_rep
                                          (select (to_array s) (+ (- 
                                          i3 1) first1))))) (__cmod res2 10)))

;; "Assert"
(assert
  (= (char_to_int (to_rep (select (to_array s) (+ (- i3 1) first1)))) (abs (__cmod 
  res2 10))))

;; "Assert"
(assert (= (is_integer_32 s firstz (+ (- i3 1) first1) res2) true))

;; "o"
(define-fun o30 () Int
  (last s))

;; "last'result'unused"
(define-fun lastqtresultqtunused3 () Int
  o30)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  i3)

;; "o"
(define-fun o31 () Int
  (- i3 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused4 () Int
  o31)

;; "o"
(define-fun o32 () Int
  (+ o31 first1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused3 () Int
  o32)

;; "Ensures"
(assert (in_range o32))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused10 () Int
  o32)

;; "o"
(define-fun o33 () Bool
  (ite (= o32 o30) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused2 () Bool
  o33)

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch o33))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (not (= spark__branch true)))

;; "Assert"
(assert
  (=>
    (= (- (last s) first1) 9)
    (and
      (<= (- (__cdiv 2147483647 (to_rep2 (select tens (- 10 i3))))) res2)
      (<= res2 (__cdiv 2147483647 (to_rep2 (select tens (- 10 i3))))))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused11 () Int
  i3)

;; "temp___504"
(define-fun temp___504 () Int
  (+ i3 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused4 () Int
  temp___504)

;; "Assert"
(assert (and (<= 1 temp___504) (<= temp___504 10)))

;; "o"
(define-fun o34 () integer_32
  (select tens temp___504))

;; "get'result'unused"
(define-fun getqtresultqtunused2 () integer_32
  o34)

(declare-const o35 Int)

;; "Ensures"
(assert (= (to_rep2 o34) o35))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused2 () Int
  o35)

;; "o"
(define-fun o36 () Int
  (- o35 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused5 () Int
  o36)

;; "Ensures"
(assert (in_range4 o36))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused11 () Int
  o36)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused12 () Int
  res2)

;; "o"
(define-fun o37 () Bool
  (ite (<= res2 o36) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused5 () Bool
  o37)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused13 () Int
  res2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused14 () Int
  i3)

;; "temp___503"
(define-fun temp___503 () Int
  (+ i3 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused5 () Int
  temp___503)

;; "Assert"
(assert (and (<= 1 temp___503) (<= temp___503 10)))

;; "o"
(define-fun o38 () integer_32
  (select tens temp___503))

;; "get'result'unused"
(define-fun getqtresultqtunused3 () integer_32
  o38)

(declare-const o39 Int)

;; "Ensures"
(assert (= (to_rep2 o38) o39))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused3 () Int
  o39)

;; "o"
(define-fun o40 () Int
  (- o39))

;; "prefix -'result'unused"
(define-fun prefix_mnqtresultqtunused () Int
  o40)

;; Goal "def'vc"
;; File "integer32_parsing.ads", line 43, characters 0-0
(assert
  (not (<= o40 2147483647)))

(check-sat)