;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
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

;; "bool_eq"
(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int) (b (Array Int character)) (b__first Int) (b__last Int)) Bool
  (ite (and
         (ite (<= a__first a__last)
           (and
             (<= b__first b__last)
             (= (- a__last a__first) (- b__last b__first)))
           (< b__last b__first))
         (forall ((temp___idx_105 Int))
           (=>
             (and (<= a__first temp___idx_105) (<= temp___idx_105 a__last))
             (= (to_rep (select a temp___idx_105)) (to_rep
                                                     (select b (+ (- b__first a__first) temp___idx_105)))))))
    true
    false))

;; "bool_eq_rev"
(assert
  (forall ((a (Array Int character)) (b (Array Int character)))
    (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
      (=>
        (= (bool_eq b b__first b__last a a__first a__last) true)
        (and
          (ite (<= a__first a__last)
            (and
              (<= b__first b__last)
              (= (- a__last a__first) (- b__last b__first)))
            (< b__last b__first))
          (forall ((temp___idx_105 Int))
            (=>
              (and (<= a__first temp___idx_105) (<= temp___idx_105 a__last))
              (= (to_rep (select a temp___idx_105)) (to_rep
                                                      (select b (+ (- b__first a__first) temp___idx_105)))))))))))

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

(declare-const s1 us_t)

(declare-const s2 us_t)

(declare-const is_pos Bool)

(declare-const firstz1 Int)

(declare-const firstz2 Int)

(declare-const first1 Int)

(declare-const first2 Int)

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
         (let ((first3 (ite (= (or (= (length param__s) 0) (not (= (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    param__s) 
                                                                    (first
                                                                    param__s))) 45))) true)
                         (first param__s)
                         (+ (first param__s) 1))))
           (and
             (not (< (last param__s) first3))
             (forall ((i Int))
               (=>
                 (and (<= first3 i) (<= i (last param__s)))
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
           (let ((firstz (ite (= is_pos1 true)
                           (first param__s)
                           (+ (first param__s) 1))))
             (let ((first3 (ite (or
                                  (< (last param__s) firstz)
                                  (<= (- (last param__s) firstz) 9))
                             firstz
                             (- (last param__s) 9))))
               (and
                 (not (< (last param__s) firstz))
                 (and
                   (and
                     (forall ((i Int))
                       (=>
                         (and (<= firstz i) (<= i (- first3 1)))
                         (= (to_rep (select (to_array param__s) i)) 48)))
                     (forall ((i Int))
                       (=>
                         (and (<= first3 i) (<= i (last param__s)))
                         (let ((temp___232 (to_rep
                                             (select (to_array param__s) i))))
                           (and (<= 48 temp___232) (<= temp___232 57))))))
                   (or
                     (< (- (last param__s) first3) 9)
                     (= (is_less_than_max param__s is_pos1 first3) true)))))))) :pattern (
    (valid_int_32
      param__s)) )))

;; Goal "def'vc"
;; File "integer32_parsing.ads", line 31, characters 0-0
(assert
  (not
  (=>
    (dynamic_invariant s1 true false true true)
    (=>
      (dynamic_invariant s2 true false true true)
      (=>
        (valid_int_32__function_guard (valid_int_32 s1) s1)
        (=>
          (and
            (and
              (and (< (last s1) 2147483647) (< (last s2) 2147483647))
              (= (valid_int_32 s1) true))
            (= (bool_eq
                 (to_array s1)
                 (first s1)
                 (last s1)
                 (to_array s2)
                 (first s2)
                 (last s2)) true))
          (let ((temp___475 (first s1)))
            (=>
              (and (<= (first s1) temp___475) (<= temp___475 (last s1)))
              (forall ((o Int))
                (=>
                  (= (to_rep (select (to_array s1) temp___475)) o)
                  (=>
                    (= (ite (= o 45) false true) is_pos)
                    (forall ((integer32_parsing__lemma_is_valid_extensional__firstz1__assume Int))
                      (=>
                        (ite (= is_pos true)
                          (= integer32_parsing__lemma_is_valid_extensional__firstz1__assume 
                          (first
                            s1))
                          (let ((o1 (+ (first s1) 1)))
                            (and
                              (= integer32_parsing__lemma_is_valid_extensional__firstz1__assume o1)
                              (in_range o1))))
                        (=>
                          (= integer32_parsing__lemma_is_valid_extensional__firstz1__assume 
                          firstz1)
                          (=>
                            (in_range firstz1)
                            (forall ((integer32_parsing__lemma_is_valid_extensional__firstz2__assume Int))
                              (=>
                                (ite (= is_pos true)
                                  (= integer32_parsing__lemma_is_valid_extensional__firstz2__assume 
                                  (first
                                    s2))
                                  (let ((o1 (+ (first s2) 1)))
                                    (and
                                      (= integer32_parsing__lemma_is_valid_extensional__firstz2__assume o1)
                                      (in_range o1))))
                                (=>
                                  (= integer32_parsing__lemma_is_valid_extensional__firstz2__assume 
                                  firstz2)
                                  (=>
                                    (in_range firstz2)
                                    (forall ((integer32_parsing__lemma_is_valid_extensional__first1__assume Int))
                                      (=>
                                        (exists ((o1 Bool))
                                          (and
                                            (ite (< (last s1) firstz1)
                                              (= o1 true)
                                              (let ((o2 (- (last s1) 
                                                firstz1)))
                                                (and
                                                  (in_range o2)
                                                  (= o1 (ite (<= o2 9)
                                                          true
                                                          false)))))
                                            (ite (= o1 true)
                                              (= integer32_parsing__lemma_is_valid_extensional__first1__assume 
                                              firstz1)
                                              (let ((o2 (- (last s1) 9)))
                                                (and
                                                  (= integer32_parsing__lemma_is_valid_extensional__first1__assume o2)
                                                  (in_range o2))))))
                                        (=>
                                          (= integer32_parsing__lemma_is_valid_extensional__first1__assume 
                                          first1)
                                          (=>
                                            (in_range first1)
                                            (forall ((integer32_parsing__lemma_is_valid_extensional__first2__assume Int))
                                              (=>
                                                (exists ((o1 Bool))
                                                  (and
                                                    (ite (< (last s2) 
                                                      firstz2)
                                                      (= o1 true)
                                                      (let ((o2 (- (last s2) 
                                                        firstz2)))
                                                        (and
                                                          (in_range o2)
                                                          (= o1 (ite (<= o2 9)
                                                                  true
                                                                  false)))))
                                                    (ite (= o1 true)
                                                      (= integer32_parsing__lemma_is_valid_extensional__first2__assume 
                                                      firstz2)
                                                      (let ((o2 (- (last s2) 9)))
                                                        (and
                                                          (= integer32_parsing__lemma_is_valid_extensional__first2__assume o2)
                                                          (in_range o2))))))
                                                (=>
                                                  (= integer32_parsing__lemma_is_valid_extensional__first2__assume 
                                                  first2)
                                                  (=>
                                                    (in_range first2)
                                                    (=>
                                                      (exists ((o1 Bool))
                                                        (and
                                                          (ite (<= firstz1 
                                                            (last
                                                              s1))
                                                            (let ((o2 (- 
                                                              (last
                                                                s1) first1)))
                                                              (and
                                                                (in_range o2)
                                                                (= o1 
                                                                (ite (= o2 9)
                                                                  true
                                                                  false))))
                                                            (= o1 false))
                                                          (exists ((spark__branch Bool))
                                                            (and
                                                              (= spark__branch o1)
                                                              (=>
                                                                (= spark__branch true)
                                                                (and
                                                                  (= 
                                                                  (is_less_than_max
                                                                    s1
                                                                    is_pos
                                                                    first1) true)
                                                                  (= 
                                                                  (is_less_than_max
                                                                    s2
                                                                    is_pos
                                                                    first2) true)))))))
                                                      (=>
                                                        (forall ((i Int))
                                                          (=>
                                                            (and
                                                              (<= firstz2 i)
                                                              (<= i (- 
                                                              first2 1)))
                                                            (= (to_rep
                                                                 (select 
                                                                 (to_array
                                                                   s2) i)) 48)))
                                                        (forall ((i Int))
                                                          (=>
                                                            (and
                                                              (<= first2 i)
                                                              (<= i (last s2)))
                                                            (<= (to_rep
                                                                  (select 
                                                                  (to_array
                                                                    s2) i)) 57))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
