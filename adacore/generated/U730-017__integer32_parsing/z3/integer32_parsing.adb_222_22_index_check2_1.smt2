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

;; "is_integer_32"
(declare-fun is_integer_32 (us_t
  Int
  Int
  Int) Bool)

(declare-const s us_t)

(declare-const tens (Array Int integer_32))

(declare-const is_pos Bool)

(declare-const firstz Int)

(declare-const r70b Int)

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

(declare-const v Int)

(declare-const first1 Int)

;; "first'unused"
(define-fun firstqtunused () int__ref
  (int__refqtmk first1))

;; "Assume"
(assert true)

(declare-const temp___559 (Array Int integer_32))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert (= (select temp___559 1) rliteral))

;; "H"
(assert (= (select temp___559 2) rliteral1))

;; "H"
(assert (= (select temp___559 3) rliteral2))

;; "H"
(assert (= (select temp___559 4) rliteral3))

;; "H"
(assert (= (select temp___559 5) rliteral4))

;; "H"
(assert (= (select temp___559 6) rliteral5))

;; "H"
(assert (= (select temp___559 7) rliteral6))

;; "H"
(assert (= (select temp___559 8) rliteral7))

;; "H"
(assert (= (select temp___559 9) rliteral8))

;; "H"
(assert (= (select temp___559 10) rliteral9))

;; "H"
(assert
  (= temp___559 (integer32_parsing__tens__aggregate_def
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
  temp___559)

;; "Assume"
(assert (= temp___559 tens))

;; "Assume"
(assert (dynamic_invariant s true false true true))

;; "Assume"
(assert (in_range3 v))

;; "Assume"
(assert (< (last s) 2147483647))

(declare-const integer32_parsing__parse_int_32__2__is_pos__assume Bool)

(declare-const o Int)

;; "H"
(assert (= o (length s)))

(declare-const lengthqtresultqtunused Int)

;; "H"
(assert (= lengthqtresultqtunused o))

(declare-const infix_eqqtresultqtunused Bool)

;; "H"
(assert (= infix_eqqtresultqtunused (ite (= o 0) true false)))

(declare-const temp___522 Int)

(declare-const firstqtresultqtunused Int)

(declare-const o1 (Array Int character))

(declare-const to_arrayqtresultqtunused (Array Int character))

(declare-const o2 character)

(declare-const getqtresultqtunused character)

(declare-const o3 Int)

(declare-const to_repqtresultqtunused Int)

(declare-const infix_eqqtresultqtunused1 Bool)

;; "H"
(assert
  (ite (= o 0)
    (= integer32_parsing__parse_int_32__2__is_pos__assume true)
    (and
      (= temp___522 (first s))
      (and
        (= firstqtresultqtunused temp___522)
        (and
          (and (<= (first s) temp___522) (<= temp___522 (last s)))
          (and
            (= o1 (to_array s))
            (and
              (= to_arrayqtresultqtunused o1)
              (and
                (= o2 (select o1 temp___522))
                (and
                  (= getqtresultqtunused o2)
                  (and
                    (= (to_rep o2) o3)
                    (and
                      (= to_repqtresultqtunused o3)
                      (and
                        (= infix_eqqtresultqtunused1 (ite (= o3 45)
                                                       true
                                                       false))
                        (= integer32_parsing__parse_int_32__2__is_pos__assume 
                        (ite (= o3 45)
                          false
                          true))))))))))))))

;; "Assume"
(assert (= integer32_parsing__parse_int_32__2__is_pos__assume is_pos))

(declare-const integer32_parsing__parse_int_32__2__firstz__assume Int)

(declare-const o4 Int)

(declare-const firstqtresultqtunused1 Int)

(declare-const o5 Int)

(declare-const infix_plqtresultqtunused Int)

(declare-const range_check_qtresultqtunused Int)

(declare-const firstqtresultqtunused2 Int)

;; "H"
(assert
  (ite (= is_pos true)
    (and
      (= integer32_parsing__parse_int_32__2__firstz__assume (first s))
      (= firstqtresultqtunused2 integer32_parsing__parse_int_32__2__firstz__assume))
    (and
      (= o4 (first s))
      (and
        (= firstqtresultqtunused1 o4)
        (and
          (= o5 (+ o4 1))
          (and
            (= infix_plqtresultqtunused o5)
            (and
              (= integer32_parsing__parse_int_32__2__firstz__assume o5)
              (and
                (in_range o5)
                (= range_check_qtresultqtunused integer32_parsing__parse_int_32__2__firstz__assume)))))))))

;; "Assume"
(assert (= integer32_parsing__parse_int_32__2__firstz__assume firstz))

;; "Assume"
(assert (in_range firstz))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range first1))

(declare-const v1 Int)

;; "v'unused"
(define-fun vqtunused () int__ref
  (int__refqtmk v1))

;; "H"
(assert (= v1 0))

;; "o"
(define-fun o6 () Bool
  (distinct 1 0))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused () Bool
  o6)

(declare-const error Bool)

;; "error'unused"
(define-fun errorqtunused () bool__ref
  (bool__refqtmk error))

;; "H"
(assert (= error o6))

;; "o"
(define-fun o7 () Int
  (last s))

;; "last'result'unused"
(define-fun lastqtresultqtunused () Int
  o7)

;; "o"
(define-fun o8 () Bool
  (ite (< o7 firstz) true false))

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused () Bool
  o8)

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch o8))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (not (= spark__branch true)))

(declare-const o9 Int)

(declare-const o10 Int)

;; "H"
(assert (= o10 (last s)))

(declare-const lastqtresultqtunused1 Int)

;; "H"
(assert (= lastqtresultqtunused1 o10))

(declare-const infix_gtqtresultqtunused1 Bool)

;; "H"
(assert (= infix_gtqtresultqtunused1 (ite (< o10 firstz) true false)))

(declare-const o11 Bool)

(declare-const o12 Int)

(declare-const lastqtresultqtunused2 Int)

(declare-const o13 Int)

(declare-const infix_mnqtresultqtunused Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const infix_lseqqtresultqtunused Bool)

;; "H"
(assert
  (ite (< o10 firstz)
    (= o11 true)
    (and
      (= o12 (last s))
      (and
        (= lastqtresultqtunused2 o12)
        (and
          (= o13 (- o12 firstz))
          (and
            (= infix_mnqtresultqtunused o13)
            (and
              (in_range o13)
              (and
                (= range_check_qtresultqtunused1 o13)
                (and
                  (= o11 (ite (<= o13 9) true false))
                  (= infix_lseqqtresultqtunused o11))))))))))

(declare-const o14 Int)

(declare-const lastqtresultqtunused3 Int)

(declare-const o15 Int)

(declare-const infix_mnqtresultqtunused1 Int)

(declare-const range_check_qtresultqtunused2 Int)

;; "H"
(assert
  (ite (= o11 true)
    (= o9 firstz)
    (and
      (= o14 (last s))
      (and
        (= lastqtresultqtunused3 o14)
        (and
          (= o15 (- o14 9))
          (and
            (= infix_mnqtresultqtunused1 o15)
            (and
              (= o9 o15)
              (and (in_range o15) (= range_check_qtresultqtunused2 o9)))))))))

(declare-const first2 Int)

;; "first'unused"
(define-fun firstqtunused1 () int__ref
  (int__refqtmk first2))

;; "H"
(assert (= first2 o9))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  first2)

;; "o"
(define-fun o16 () Int
  (- first2 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused2 () Int
  o16)

;; "integer32_parsing__parse_int_32__2__L_3__R70b__assume'unused"
(define-fun integer32_parsing__parse_int_32__2__L_3__R70b__assumeqtunused 
  () Int
  o16)

;; "Ensures"
(assert (in_range o16))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o16)

;; "Assume"
(assert (= o16 r70b))

;; "Assume"
(assert (in_range r70b))

(declare-const spark__branch1 Bool)

(declare-const temp___526 Int)

;; "H"
(assert (= temp___526 firstz))

(declare-const temp___527 Int)

;; "H"
(assert (= temp___527 r70b))

(declare-const i Int)

(declare-const iqtunused int__ref)

;; "H"
(assert (= iqtunused (int__refqtmk i)))

;; "H"
(assert (= i temp___526))

(declare-const int__contentqtresultqtunused1 Int)

;; "H"
(assert (= int__contentqtresultqtunused1 i))

(declare-const o17 Bool)

;; "H"
(assert (= o17 (ite (<= i temp___527) true false)))

(declare-const infix_lseqqtresultqtunused1 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused1 o17))

(declare-const int__contentqtresultqtunused2 Int)

;; "H"
(assert (= int__contentqtresultqtunused2 i))

(declare-const o18 Bool)

;; "H"
(assert (= o18 (ite (<= temp___526 i) true false)))

(declare-const infix_lseqqtresultqtunused2 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused2 o18))

(declare-const o19 Bool)

;; "H"
(assert (= o19 (and o18 o17)))

(declare-const andbqtresultqtunused Bool)

;; "H"
(assert (= andbqtresultqtunused o19))

(declare-const int__contentqtresultqtunused3 Int)

(declare-const o20 (Array Int character))

(declare-const to_arrayqtresultqtunused1 (Array Int character))

(declare-const o21 character)

(declare-const getqtresultqtunused1 character)

(declare-const o22 Int)

(declare-const to_repqtresultqtunused1 Int)

(declare-const infix_eqqtresultqtunused2 Bool)

(declare-const spark__branch2 Bool)

(declare-const spark__branchqtunused1 bool__ref)

(declare-const bool__contentqtresultqtunused1 Bool)

(declare-const usfqtunused Bool)

(declare-const anyqtresultqtunused Bool)

(declare-const i1 Int)

(declare-const iqtunused1 int__ref)

(declare-const int__contentqtresultqtunused4 Int)

(declare-const infix_eqqtresultqtunused3 Bool)

(declare-const usf Int)

(declare-const anyqtresultqtunused1 Int)

(declare-const kqtunused Int)

(declare-const int__contentqtresultqtunused5 Int)

(declare-const o23 Bool)

(declare-const infix_lseqqtresultqtunused3 Bool)

(declare-const o24 Bool)

(declare-const infix_lseqqtresultqtunused4 Bool)

(declare-const andbqtresultqtunused1 Bool)

;; "H"
(assert
  (ite (= o19 true)
    (and
      (and (<= (first s) i) (<= i (last s)))
      (and
        (= int__contentqtresultqtunused3 i)
        (and
          (= o20 (to_array s))
          (and
            (= to_arrayqtresultqtunused1 o20)
            (and
              (= o21 (select o20 i))
              (and
                (= getqtresultqtunused1 o21)
                (and
                  (= (to_rep o21) o22)
                  (and
                    (= to_repqtresultqtunused1 o22)
                    (and
                      (= infix_eqqtresultqtunused2 (ite (= o22 48)
                                                     true
                                                     false))
                      (and
                        (= spark__branchqtunused1 (bool__refqtmk
                                                    spark__branch2))
                        (and
                          (= spark__branch2 (ite (= o22 48) false true))
                          (and
                            (= bool__contentqtresultqtunused1 spark__branch2)
                            (and
                              (not (= spark__branch2 true))
                              (and
                                (and
                                  (= anyqtresultqtunused1 usf)
                                  (and
                                    (= kqtunused usf)
                                    (and
                                      (= int__contentqtresultqtunused5 
                                      i)
                                      (and
                                        (= o23 (ite (<= usf i) true false))
                                        (and
                                          (= infix_lseqqtresultqtunused3 
                                          o23)
                                          (and
                                            (= o24 (ite (<= firstz usf)
                                                     true
                                                     false))
                                            (and
                                              (= infix_lseqqtresultqtunused4 
                                              o24)
                                              (= andbqtresultqtunused1 (and 
                                              o24 o23)))))))))
                                (and
                                  (= usfqtunused (ite (forall ((k Int))
                                                        (=>
                                                          (and
                                                            (<= firstz k)
                                                            (<= k i))
                                                          (= (to_rep
                                                               (select 
                                                               (to_array
                                                                 s) k)) 48)))
                                                   true
                                                   false))
                                  (and
                                    (= anyqtresultqtunused (ite (forall 
                                                                  ((k Int))
                                                                  (=>
                                                                    (and
                                                                    (<= 
                                                                    firstz k)
                                                                    (<= k 
                                                                    i))
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    s) k)) 48)))
                                                             true
                                                             false))
                                    (and
                                      (= iqtunused1 (int__refqtmk i1))
                                      (and
                                        (and
                                          (forall ((k Int))
                                            (=>
                                              (and (<= firstz k) (<= k i1))
                                              (= (to_rep
                                                   (select (to_array s) k)) 48)))
                                          (= (is_integer_32 s firstz i1 v1) true))
                                        (and
                                          (and (<= firstz i1) (<= i1 r70b))
                                          (and
                                            (= int__contentqtresultqtunused4 
                                            i1)
                                            (and
                                              (= infix_eqqtresultqtunused3 
                                              (ite (= i1 temp___527)
                                                true
                                                false))
                                              (= i1 temp___527))))))))))))))))))))))
    (= spark__branch1 spark__branch)))

;; "Assert"
(assert
  (=>
    (not (= firstz first2))
    (= (is_integer_32 s firstz (- first2 1) v1) true)))

(declare-const i2 Int)

;; "i'unused"
(define-fun iqtunused2 () int__ref
  (int__refqtmk i2))

;; "H"
(assert (= i2 1))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  i2)

;; "o"
(define-fun o25 () Bool
  (ite (<= i2 10) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused5 () Bool
  o25)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  i2)

;; "o"
(define-fun o26 () Bool
  (ite (<= 1 i2) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused6 () Bool
  o26)

;; "o"
(define-fun o27 () Bool
  (and o26 o25))

;; "andb'result'unused"
(define-fun andbqtresultqtunused2 () Bool
  o27)

;; "H"
(assert (= o27 true))

;; "temp___loop_entry_546'unused"
(define-fun temp___loop_entry_546qtunused () Bool
  error)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused2 () Bool
  error)

;; "temp___loop_entry_545'unused"
(define-fun temp___loop_entry_545qtunused () Int
  v1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused8 () Int
  v1)

(declare-const v2 Int)

(declare-const error1 Bool)

(declare-const i3 Int)

;; "i'unused"
(define-fun iqtunused3 () int__ref
  (int__refqtmk i3))

;; "v'unused"
(define-fun vqtunused1 () int__ref
  (int__refqtmk v2))

;; "Assume"
(assert
  (= (and (ite (and (in_range3 v2) (= error1 error)) true false) (ite 
                                                                   (and
                                                                    (<= 1 
                                                                    i3)
                                                                    (<= 
                                                                    i3 10))
                                                                   true
                                                                   false)) true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  first2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  i3)

;; "o"
(define-fun o28 () Int
  (- i3 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused3 () Int
  o28)

;; "o"
(define-fun o29 () Int
  (+ o28 first2))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o29)

;; "Ensures"
(assert (in_range o29))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused4 () Int
  o29)

;; Goal "def'vc"
;; File "integer32_parsing.ads", line 47, characters 0-0
(assert
  (not (<= o29 (last s))))

(check-sat)
