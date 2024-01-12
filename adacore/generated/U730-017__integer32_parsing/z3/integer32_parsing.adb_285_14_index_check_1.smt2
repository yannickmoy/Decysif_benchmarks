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

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int character))))))

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

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))

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

(declare-const first Int)

;; "first'unused"
(define-fun firstqtunused () int__ref
  (int__refqtmk first))

;; "Assume"
(assert true)

;; "temp___613"
(define-fun temp___613 () (Array Int character)
  (temp___String_Literal_169 Tuple0))

;; "temp___String_Literal_169'result'unused"
(define-fun temp___String_Literal_169qtresultqtunused () (Array Int character)
  temp___613)

;; "Assume"
(assert (= temp___613 last32))

;; "Assume"
(assert true)

(declare-const temp___627 (Array Int integer_32))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert (= (select temp___627 1) rliteral))

;; "H"
(assert (= (select temp___627 2) rliteral1))

;; "H"
(assert (= (select temp___627 3) rliteral2))

;; "H"
(assert (= (select temp___627 4) rliteral3))

;; "H"
(assert (= (select temp___627 5) rliteral4))

;; "H"
(assert (= (select temp___627 6) rliteral5))

;; "H"
(assert (= (select temp___627 7) rliteral6))

;; "H"
(assert (= (select temp___627 8) rliteral7))

;; "H"
(assert (= (select temp___627 9) rliteral8))

;; "H"
(assert (= (select temp___627 10) rliteral9))

;; "H"
(assert
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

;; "integer32_parsing__tens__aggregate_def'result'unused"
(define-fun integer32_parsing__tens__aggregate_defqtresultqtunused () (Array Int integer_32)
  temp___627)

;; "Assume"
(assert (= temp___627 tens))

;; "Assume"
(assert (in_range3 v))

(declare-const temp___567 (Array Int character))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert
  (forall ((temp___566 Int))
    (! (=>
         (and (<= 1 temp___566) (<= temp___566 11))
         (=> (in_range2 48) (= (to_rep (select temp___567 temp___566)) 48))) :pattern ((select 
    temp___567 temp___566)) )))

;; "H"
(assert
  (= temp___567 (integer32_parsing__print_int_32__res__aggregate_def 48)))

;; "integer32_parsing__print_int_32__res__aggregate_def'result'unused"
(define-fun integer32_parsing__print_int_32__res__aggregate_defqtresultqtunused 
  () (Array Int character)
  temp___567)

(declare-const res (Array Int character))

;; "res'unused"
(define-fun resqtunused () map__ref
  (map__refqtmk res))

;; "H"
(assert (= res temp___567))

;; "Assume"
(assert true)

(declare-const x Int)

;; "x'unused"
(define-fun xqtunused () int__ref
  (int__refqtmk x))

;; "H"
(assert (= x v))

;; "Assume"
(assert (in_range3 x))

(declare-const top Int)

;; "top'unused"
(define-fun topqtunused () int__ref
  (int__refqtmk top))

;; "H"
(assert (= top 11))

;; "Assume"
(assert (in_range1 top))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range1 first))

;; "o"
(define-fun o () Bool
  (ite (= v 0) true false))

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  o)

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

(declare-const res1 (Array Int character))

(declare-const top1 Int)

;; "top'unused"
(define-fun topqtunused1 () int__ref
  (int__refqtmk top1))

;; "res'unused"
(define-fun resqtunused1 () map__ref
  (map__refqtmk res1))

(declare-const i Int)

(declare-const iqtunused int__ref)

;; "H"
(assert (= iqtunused (int__refqtmk i)))

;; "H"
(assert (= i 1))

(declare-const int__contentqtresultqtunused Int)

;; "H"
(assert (= int__contentqtresultqtunused i))

(declare-const o1 Bool)

;; "H"
(assert (= o1 (ite (<= i 10) true false)))

(declare-const infix_lseqqtresultqtunused Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused o1))

(declare-const int__contentqtresultqtunused1 Int)

;; "H"
(assert (= int__contentqtresultqtunused1 i))

(declare-const o2 Bool)

;; "H"
(assert (= o2 (ite (<= 1 i) true false)))

(declare-const infix_lseqqtresultqtunused1 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused1 o2))

(declare-const o3 Bool)

;; "H"
(assert (= o3 (and o2 o1)))

(declare-const andbqtresultqtunused Bool)

;; "H"
(assert (= andbqtresultqtunused o3))

(declare-const temp___loop_entry_583qtunused Int)

(declare-const int__contentqtresultqtunused2 Int)

(declare-const temp___loop_entry_582qtunused Int)

(declare-const int__contentqtresultqtunused3 Int)

(declare-const temp___loop_entry_580qtunused (Array Int character))

(declare-const map__contentqtresultqtunused (Array Int character))

(declare-const res2 (Array Int character))

(declare-const x1 Int)

(declare-const top2 Int)

(declare-const i1 Int)

(declare-const iqtunused1 int__ref)

(declare-const topqtunused2 int__ref)

(declare-const xqtunused1 int__ref)

(declare-const resqtunused2 map__ref)

(declare-const int__contentqtresultqtunused4 Int)

(declare-const o4 Int)

(declare-const rem_qtresultqtunused Int)

(declare-const o5 Int)

(declare-const absqtresultqtunused Int)

(declare-const o6 Int)

(declare-const int_to_charqtresultqtunused Int)

(declare-const o7 character)

(declare-const of_repqtresultqtunused character)

(declare-const int__contentqtresultqtunused5 Int)

(declare-const map__contentqtresultqtunused1 (Array Int character))

(declare-const o8 (Array Int character))

(declare-const setqtresultqtunused (Array Int character))

(declare-const int__contentqtresultqtunused6 Int)

(declare-const o9 Int)

(declare-const infix_mnqtresultqtunused Int)

(declare-const range_check_qtresultqtunused Int)

(declare-const int__contentqtresultqtunused7 Int)

(declare-const o10 Int)

(declare-const div_qtresultqtunused Int)

(declare-const x2 Int)

(declare-const xqtunused2 int__ref)

(declare-const int__contentqtresultqtunused8 Int)

(declare-const infix_eqqtresultqtunused1 Bool)

(declare-const int__contentqtresultqtunused9 Int)

(declare-const infix_eqqtresultqtunused2 Bool)

;; "H"
(assert
  (ite (= o3 true)
    (and
      (= temp___loop_entry_583qtunused top)
      (and
        (= int__contentqtresultqtunused2 top)
        (and
          (= temp___loop_entry_582qtunused x)
          (and
            (= int__contentqtresultqtunused3 x)
            (and
              (= temp___loop_entry_580qtunused res)
              (and
                (= map__contentqtresultqtunused res)
                (and
                  (= iqtunused1 (int__refqtmk i1))
                  (and
                    (= topqtunused2 (int__refqtmk top2))
                    (and
                      (= xqtunused1 (int__refqtmk x1))
                      (and
                        (= resqtunused2 (map__refqtmk res2))
                        (and
                          (= (and (ite (and (in_range3 x1) (in_range1 top2))
                                    true
                                    false) (ite (and (<= 1 i1) (<= i1 10))
                                             true
                                             false)) true)
                          (and
                            (= int__contentqtresultqtunused4 x1)
                            (and
                              (= o4 (__cmod x1 10))
                              (and
                                (= rem_qtresultqtunused o4)
                                (and
                                  (= o5 (abs o4))
                                  (and
                                    (= absqtresultqtunused o5)
                                    (and
                                      (= o6 (int_to_char o5))
                                      (and
                                        (and
                                          (in_range2 o6)
                                          (= o6 (ite (= o5 0)
                                                  48
                                                  (ite (= o5 1)
                                                    49
                                                    (ite (= o5 2)
                                                      50
                                                      (ite (= o5 3)
                                                        51
                                                        (ite (= o5 4)
                                                          52
                                                          (ite (= o5 5)
                                                            53
                                                            (ite (= o5 6)
                                                              54
                                                              (ite (= 
                                                                o5 7)
                                                                55
                                                                (ite (= 
                                                                  o5 8)
                                                                  56
                                                                  57)))))))))))
                                        (and
                                          (= int_to_charqtresultqtunused 
                                          o6)
                                          (and
                                            (= (to_rep o7) o6)
                                            (and
                                              (= of_repqtresultqtunused 
                                              o7)
                                              (and
                                                (and
                                                  (<= 1 top2)
                                                  (<= top2 11))
                                                (and
                                                  (= int__contentqtresultqtunused5 
                                                  top2)
                                                  (and
                                                    (= map__contentqtresultqtunused1 
                                                    res2)
                                                    (and
                                                      (= o8 (store res2 
                                                      top2 o7))
                                                      (and
                                                        (= setqtresultqtunused 
                                                        o8)
                                                        (and
                                                          (= res1 o8)
                                                          (and
                                                            (= int__contentqtresultqtunused6 
                                                            top2)
                                                            (and
                                                              (= o9 (- 
                                                              top2 1))
                                                              (and
                                                                (= infix_mnqtresultqtunused 
                                                                o9)
                                                                (and
                                                                  (in_range1
                                                                    o9)
                                                                  (and
                                                                    (= 
                                                                    range_check_qtresultqtunused 
                                                                    o9)
                                                                    (and
                                                                    (= 
                                                                    top1 
                                                                    o9)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused7 
                                                                    x1)
                                                                    (and
                                                                    (= 
                                                                    o10 (__cdiv 
                                                                    x1 10))
                                                                    (and
                                                                    (= 
                                                                    div_qtresultqtunused 
                                                                    o10)
                                                                    (and
                                                                    (= 
                                                                    xqtunused2 
                                                                    (int__refqtmk
                                                                    x2))
                                                                    (and
                                                                    (= 
                                                                    x2 
                                                                    o10)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused8 
                                                                    x2)
                                                                    (and
                                                                    (= 
                                                                    infix_eqqtresultqtunused1 
                                                                    (ite (= 
                                                                    x2 0)
                                                                    true
                                                                    false))
                                                                    (=>
                                                                    (not
                                                                    (= 
                                                                    x2 0))
                                                                    (and
                                                                    (= 
                                                                    top1 (- 11 
                                                                    i1))
                                                                    (and
                                                                    (and
                                                                    (<= (- (__cdiv 2147483647 
                                                                    (to_rep2
                                                                    (select 
                                                                    tens 
                                                                    i1)))) 
                                                                    x2)
                                                                    (<= 
                                                                    x2 (__cdiv 2147483647 
                                                                    (to_rep2
                                                                    (select 
                                                                    tens 
                                                                    i1)))))
                                                                    (and
                                                                    (= 
                                                                    x2 (__cdiv (__cdiv 
                                                                    v (to_rep2
                                                                    (select 
                                                                    tens 
                                                                    i1))) 10))
                                                                    (and
                                                                    (= 
                                                                    x2 (__cdiv 
                                                                    v (to_rep2
                                                                    (select 
                                                                    tens (+ 
                                                                    i1 1)))))
                                                                    (and
                                                                    (= 
                                                                    (char_to_int
                                                                    (to_rep
                                                                    (select 
                                                                    res1 (- 12 
                                                                    i1)))) (abs (__cmod (__cdiv 
                                                                    v (to_rep2
                                                                    (select 
                                                                    tens 
                                                                    i1))) 10)))
                                                                    (and
                                                                    (=>
                                                                    (= (__cdiv 
                                                                    v (to_rep2
                                                                    (select 
                                                                    tens (+ 
                                                                    i1 1)))) (__cdiv 2147483647 
                                                                    (to_rep2
                                                                    (select 
                                                                    tens 
                                                                    i1))))
                                                                    (<= 
                                                                    (to_rep
                                                                    (select 
                                                                    res1 (- 12 
                                                                    i1))) 
                                                                    (to_rep
                                                                    (select 
                                                                    last32 (- 11 
                                                                    i1)))))
                                                                    (and
                                                                    (=>
                                                                    (= (__cdiv 
                                                                    v (to_rep2
                                                                    (select 
                                                                    tens (+ 
                                                                    i1 1)))) (- (__cdiv 2147483647 
                                                                    (to_rep2
                                                                    (select 
                                                                    tens 
                                                                    i1)))))
                                                                    (or
                                                                    (<= 
                                                                    (to_rep
                                                                    (select 
                                                                    res1 (- 12 
                                                                    i1))) 
                                                                    (to_rep
                                                                    (select 
                                                                    last32 (- 11 
                                                                    i1))))
                                                                    (and
                                                                    (= 
                                                                    i1 1)
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    res1 (- 12 
                                                                    i1))) (+ 
                                                                    (to_rep
                                                                    (select 
                                                                    last32 (- 11 
                                                                    i1))) 1)))))
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused9 
                                                                    i1)
                                                                    (and
                                                                    (= 
                                                                    infix_eqqtresultqtunused2 
                                                                    (ite (= 
                                                                    i1 10)
                                                                    true
                                                                    false))
                                                                    (= 
                                                                    i1 10)))))))))))))))))))))))))))))))))))))))))))))))))))
    (and (= res1 res) (= top1 top))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  top1)

;; "o"
(define-fun o11 () Int
  (+ top1 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o11)

;; "Ensures"
(assert (in_range o11))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o11)

(declare-const first1 Int)

;; "first'unused"
(define-fun firstqtunused1 () int__ref
  (int__refqtmk first1))

;; "H"
(assert (= first1 o11))

;; "o"
(define-fun o12 () Bool
  (ite (< v 0) true false))

;; "infix <'result'unused"
(define-fun infix_lsqtresultqtunused () Bool
  o12)

(declare-const spark__branch1 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused1 () bool__ref
  (bool__refqtmk spark__branch1))

;; "H"
(assert (= spark__branch1 o12))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused1 () Bool
  spark__branch1)

;; "H"
(assert (= spark__branch1 true))

(declare-const o13 character)

;; "Ensures"
(assert (= (to_rep o13) 45))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused1 () character
  o13)

;; Goal "def'vc"
;; File "integer32_parsing.ads", line 65, characters 0-0
(assert
  (not (<= 1 top1)))

(check-sat)
