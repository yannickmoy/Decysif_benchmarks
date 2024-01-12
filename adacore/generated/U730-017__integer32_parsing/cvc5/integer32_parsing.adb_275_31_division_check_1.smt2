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
  (and (<= 0 x) (<= x 2147483647)))

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

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int character))(rt t)))))

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

(declare-const last32 (Array Int character))

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

(declare-const v Int)

;; "int_to_char"
(define-fun int_to_char ((param__v Int)) Int
  (ite (= param__v 0)
    48
    (ite (= param__v 1)
      49
      (ite (= param__v 2)
        50
        (ite (= param__v 3)
          51
          (ite (= param__v 4)
            52
            (ite (= param__v 5)
              53
              (ite (= param__v 6)
                54
                (ite (= param__v 7) 55 (ite (= param__v 8) 56 57))))))))))

(declare-const tens (Array Int integer_32))

(declare-const last Int)

(declare-const res0 us_t)

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

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size3 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "component__size_axiom"
(assert (<= 0 component__size3))

;; "alignment_axiom"
(assert (<= 0 alignment3))

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

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const component__size4 Int)

(declare-const alignment4 Int)

;; "value__size_axiom"
(assert (<= 0 value__size4))

;; "object__size_axiom"
(assert (<= 0 object__size4))

;; "component__size_axiom"
(assert (<= 0 component__size4))

;; "alignment_axiom"
(assert (<= 0 alignment4))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const component__size5 Int)

(declare-const alignment5 Int)

;; "value__size_axiom"
(assert (<= 0 value__size5))

;; "object__size_axiom"
(assert (<= 0 object__size5))

;; "component__size_axiom"
(assert (<= 0 component__size5))

;; "alignment_axiom"
(assert (<= 0 alignment5))

;; "integer32_parsing__print_int_32__res__aggregate_def"
(declare-fun integer32_parsing__print_int_32__res__aggregate_def (Int) (Array Int character))

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

;; Goal "def'vc"
;; File "integer32_parsing.ads", line 65, characters 0-0
(assert
  (not
  (forall ((first Int))
    (=>
      (= (temp___String_Literal_169 Tuple0) last32)
      (forall ((temp___627 (Array Int integer_32)))
        (=>
          (and
            (and
              (and
                (= (select temp___627 1) rliteral)
                (= (select temp___627 2) rliteral1))
              (and
                (and
                  (and
                    (= (select temp___627 3) rliteral2)
                    (= (select temp___627 4) rliteral3))
                  (and
                    (= (select temp___627 5) rliteral4)
                    (= (select temp___627 6) rliteral5)))
                (and
                  (and
                    (= (select temp___627 7) rliteral6)
                    (= (select temp___627 8) rliteral7))
                  (and
                    (= (select temp___627 9) rliteral8)
                    (= (select temp___627 10) rliteral9)))))
            (= temp___627 (integer32_parsing__tens__aggregate_def
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
            (= temp___627 tens)
            (=>
              (in_range3 v)
              (forall ((temp___567 (Array Int character)))
                (=>
                  (and
                    (forall ((temp___566 Int))
                      (! (=>
                           (and (<= 1 temp___566) (<= temp___566 11))
                           (=>
                             (in_range2 48)
                             (= (to_rep (select temp___567 temp___566)) 48))) :pattern ((select temp___567 temp___566)) ))
                    (= temp___567 (integer32_parsing__print_int_32__res__aggregate_def
                                    48)))
                  (forall ((res (Array Int character)))
                    (=>
                      (= res temp___567)
                      (forall ((x Int))
                        (=>
                          (= x v)
                          (=>
                            (in_range3 x)
                            (forall ((top Int))
                              (=>
                                (= top 11)
                                (=>
                                  (in_range1 top)
                                  (=>
                                    (in_range1 first)
                                    (forall ((spark__branch Bool))
                                      (=>
                                        (= spark__branch (ite (= v 0)
                                                           true
                                                           false))
                                        (=>
                                          (not (= spark__branch true))
                                          (forall ((i Int))
                                            (=>
                                              (= i 1)
                                              (=>
                                                (= (and (ite (<= 1 i)
                                                          true
                                                          false) (ite (<= i 10)
                                                                   true
                                                                   false)) true)
                                                (forall ((res1 (Array Int character)) (x1 Int) (top1 Int) (i1 Int))
                                                  (=>
                                                    (= (and (ite (and
                                                                   (in_range3
                                                                    x1)
                                                                   (in_range1
                                                                    top1))
                                                              true
                                                              false) 
                                                    (ite (and
                                                           (<= 1 i1)
                                                           (<= i1 10))
                                                      true
                                                      false)) true)
                                                    (let ((o (abs (__cmod x1 10))))
                                                      (let ((o1 (int_to_char
                                                                  o)))
                                                        (=>
                                                          (and
                                                            (in_range2 o1)
                                                            (= o1 (ite (= o 0)
                                                                    48
                                                                    (ite (= o 1)
                                                                    49
                                                                    (ite (= o 2)
                                                                    50
                                                                    (ite (= o 3)
                                                                    51
                                                                    (ite (= o 4)
                                                                    52
                                                                    (ite (= o 5)
                                                                    53
                                                                    (ite (= o 6)
                                                                    54
                                                                    (ite (= o 7)
                                                                    55
                                                                    (ite (= o 8)
                                                                    56
                                                                    57)))))))))))
                                                          (forall ((o2 character))
                                                            (=>
                                                              (= (to_rep o2) o1)
                                                              (=>
                                                                (and
                                                                  (<= 1 top1)
                                                                  (<= top1 11))
                                                                (forall 
                                                                  ((res2 (Array Int character)))
                                                                  (=>
                                                                    (= res2 (store res1 top1 o2))
                                                                    (let ((o3 (- top1 1)))
                                                                    (=>
                                                                    (in_range1
                                                                    o3)
                                                                    (forall 
                                                                    ((top2 Int))
                                                                    (=>
                                                                    (= top2 o3)
                                                                    (forall 
                                                                    ((x2 Int))
                                                                    (=>
                                                                    (= x2 (__cdiv x1 10))
                                                                    (=>
                                                                    (not
                                                                    (= x2 0))
                                                                    (=>
                                                                    (= top2 (- 11 i1))
                                                                    (=>
                                                                    (and
                                                                    (<= (- (__cdiv 2147483647 
                                                                    (to_rep2
                                                                    (select 
                                                                    tens i1)))) x2)
                                                                    (<= x2 (__cdiv 2147483647 
                                                                    (to_rep2
                                                                    (select 
                                                                    tens i1)))))
                                                                    (=>
                                                                    (= x2 (__cdiv (__cdiv 
                                                                    v (to_rep2
                                                                    (select 
                                                                    tens i1))) 10))
                                                                    (let ((temp___577 (+ i1 1)))
                                                                    (=>
                                                                    (and
                                                                    (<= 1 temp___577)
                                                                    (<= temp___577 10))
                                                                    (forall 
                                                                    ((o4 Int))
                                                                    (=>
                                                                    (= 
                                                                    (to_rep2
                                                                    (select 
                                                                    tens temp___577)) o4)
                                                                    (not
                                                                    (= o4 0)))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
