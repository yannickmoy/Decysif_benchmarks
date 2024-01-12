;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "length"
(define-fun length ((x Int) (y Int)) Int
  (ite (<= x y) (+ (- y x) 1) 0))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

(declare-sort less_than_max 0)

;; "less_than_max'int"
(declare-fun less_than_maxqtint (less_than_max) Int)

;; "less_than_max'axiom"
(assert
  (forall ((i less_than_max))
    (and (<= 0 (less_than_maxqtint i)) (<= (less_than_maxqtint i) 100))))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 100)))

;; "to_rep"
(define-fun to_rep ((x less_than_max)) Int
  (less_than_maxqtint x))

;; "of_rep"
(declare-fun of_rep (Int) less_than_max)

;; "inversion_axiom"
(assert
  (forall ((x less_than_max))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x less_than_max))
    (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-sort element 0)

;; "element'int"
(declare-fun elementqtint (element) Int)

;; "element'axiom"
(assert
  (forall ((i element))
    (and (<= 0 (elementqtint i)) (<= (elementqtint i) 2147483647))))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "to_rep"
(define-fun to_rep1 ((x element)) Int
  (elementqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) element)

;; "inversion_axiom"
(assert
  (forall ((x element))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x element)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

;; "slide"
(declare-fun slide ((Array Int element)
  Int
  Int) (Array Int element))

;; "slide_eq"
(assert
  (forall ((a (Array Int element)))
    (forall ((first Int))
      (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; "slide_def"
(assert
  (forall ((a (Array Int element)))
    (forall ((old_first Int))
      (forall ((new_first Int))
        (forall ((i Int))
          (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
          (slide
            a
            old_first
            new_first) i)) ))))))

;; "concat"
(declare-fun concat1 ((Array Int element)
  Int
  Int
  (Array Int element)
  Int
  Int) (Array Int element))

;; "concat_def"
(assert
  (forall ((a (Array Int element)) (b (Array Int element)))
    (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
      (forall ((i Int))
        (! (and
             (=>
               (and (<= a_first i) (<= i a_last))
               (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
             (=>
               (< a_last i)
               (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
        (concat1
          a
          a_first
          a_last
          b
          b_first
          b_last) i)) )))))

;; "concat_singleton_left"
(declare-fun concat_singleton_left (element
  Int
  (Array Int element)
  Int
  Int) (Array Int element))

;; "concat_singleton_left_val"
(assert
  (forall ((a element))
    (forall ((b (Array Int element)))
      (forall ((a_first Int) (b_first Int) (b_last Int))
        (! (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a) :pattern (
        (concat_singleton_left
          a
          a_first
          b
          b_first
          b_last)) )))))

;; "concat_singleton_left_def_eq"
(assert
  (forall ((a element))
    (forall ((b (Array Int element)))
      (forall ((a_first Int) (b_last Int))
        (forall ((i Int))
          (! (=>
               (< a_first i)
               (= (select (concat_singleton_left a a_first b a_first b_last) i) (select b (- i 1)))) :pattern ((select 
          (concat_singleton_left
            a
            a_first
            b
            a_first
            b_last) i)) ))))))

;; "concat_singleton_left_def"
(assert
  (forall ((a element))
    (forall ((b (Array Int element)))
      (forall ((a_first Int) (b_first Int) (b_last Int))
        (forall ((i Int))
          (! (=>
               (< a_first i)
               (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
          (concat_singleton_left
            a
            a_first
            b
            b_first
            b_last) i)) ))))))

;; "bool_eq"
(define-fun bool_eq ((a (Array Int element)) (a__first Int) (a__last Int) (b (Array Int element)) (b__first Int) (b__last Int)) Bool
  (ite (and
         (ite (<= a__first a__last)
           (and
             (<= b__first b__last)
             (= (- a__last a__first) (- b__last b__first)))
           (< b__last b__first))
         (forall ((temp___idx_168 Int))
           (=>
             (and (<= a__first temp___idx_168) (<= temp___idx_168 a__last))
             (= (to_rep1 (select a temp___idx_168)) (to_rep1
                                                      (select b (+ (- b__first a__first) temp___idx_168)))))))
    true
    false))

;; "bool_eq_rev"
(assert
  (forall ((a (Array Int element)) (b (Array Int element)))
    (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
      (=>
        (= (bool_eq b b__first b__last a a__first a__last) true)
        (and
          (ite (<= a__first a__last)
            (and
              (<= b__first b__last)
              (= (- a__last a__first) (- b__last b__first)))
            (< b__last b__first))
          (forall ((temp___idx_168 Int))
            (=>
              (and (<= a__first temp___idx_168) (<= temp___idx_168 a__last))
              (= (to_rep1 (select a temp___idx_168)) (to_rep1
                                                       (select b (+ (- b__first a__first) temp___idx_168)))))))))))

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

(declare-sort us_ext_type 0)

(declare-const null__ext__ us_ext_type)

(declare-datatypes ((us_split_fields 0))
  (((us_split_fieldsqtmk
    (rec__stacks__stack_root__content (Array Int element))(rec__stacks__stack_root__length less_than_max)(rec__ext__ us_ext_type)))))

(declare-datatypes ((us_rep 0))
  (((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const stacks__stack_root__content__first__bit Int)

(declare-const stacks__stack_root__content__last__bit Int)

(declare-const stacks__stack_root__content__position Int)

;; "stacks__stack_root__content__first__bit_axiom"
(assert (<= 0 stacks__stack_root__content__first__bit))

;; "stacks__stack_root__content__last__bit_axiom"
(assert
  (< stacks__stack_root__content__first__bit stacks__stack_root__content__last__bit))

;; "stacks__stack_root__content__position_axiom"
(assert (<= 0 stacks__stack_root__content__position))

(declare-const stacks__stack_root__length__first__bit Int)

(declare-const stacks__stack_root__length__last__bit Int)

(declare-const stacks__stack_root__length__position Int)

;; "stacks__stack_root__length__first__bit_axiom"
(assert (<= 0 stacks__stack_root__length__first__bit))

;; "stacks__stack_root__length__last__bit_axiom"
(assert
  (< stacks__stack_root__length__first__bit stacks__stack_root__length__last__bit))

;; "stacks__stack_root__length__position_axiom"
(assert (<= 0 stacks__stack_root__length__position))

(declare-const dummy us_rep)

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
(define-fun in_range3 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "to_rep"
(define-fun to_rep2 ((x integer)) Int
  (integerqtint x))

;; "of_rep"
(declare-fun of_rep2 (Int) integer)

;; "inversion_axiom"
(assert
  (forall ((x integer))
    (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; "range_axiom"
(assert
  (forall ((x integer)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                  (of_rep2 x))) )))

(declare-datatypes ((t 0))
  (((tqtmk (rec__first integer)(rec__last integer)))))

;; "mk"
(declare-fun mk (Int
  Int) t)

;; "mk_def"
(assert
  (forall ((f Int) (l Int))
    (! (=>
         (in_range3 f)
         (=>
           (in_range3 l)
           (and
             (= (to_rep2 (rec__first (mk f l))) f)
             (= (to_rep2 (rec__last (mk f l))) l)))) :pattern ((mk f l)) )))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range3 low)
    (and
      (in_range3 high)
      (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int element))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int element)
  (elts a))

;; "of_array"
(define-fun of_array ((a (Array Int element)) (f Int) (l Int)) us_t
  (us_tqtmk a (mk f l)))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep2 (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep2 (rec__last (rt a))))

;; "length"
(define-fun length1 ((a us_t)) Int
  (ite (<= (first a) (last a)) (+ (- (last a) (first a)) 1) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment2))

;; "is_full"
(declare-fun is_full (us_rep) Bool)

(declare-sort positive_less_than_max 0)

;; "positive_less_than_max'int"
(declare-fun positive_less_than_maxqtint (positive_less_than_max) Int)

;; "positive_less_than_max'axiom"
(assert
  (forall ((i positive_less_than_max))
    (and
      (<= 1 (positive_less_than_maxqtint i))
      (<= (positive_less_than_maxqtint i) 100))))

;; "in_range"
(define-fun in_range4 ((x Int)) Bool
  (and (<= 1 x) (<= x 100)))

;; "to_rep"
(define-fun to_rep3 ((x positive_less_than_max)) Int
  (positive_less_than_maxqtint x))

;; "of_rep"
(declare-fun of_rep3 (Int) positive_less_than_max)

;; "inversion_axiom"
(assert
  (forall ((x positive_less_than_max))
    (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; "range_axiom"
(assert
  (forall ((x positive_less_than_max))
    (! (in_range4 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range4 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                                  (of_rep3 x))) )))

(declare-sort us_ext_type1 0)

(declare-const null__ext__1 us_ext_type1)

(declare-datatypes ((us_split_fields2 0))
  (((us_split_fieldsqtmk1
    (rec__stacks__stack_root__content1 (Array Int element))(rec__stacks__stack_root__length1 less_than_max)(rec__stacks__buffer__first positive_less_than_max)(rec__ext__1 us_ext_type1)))))

(declare-datatypes ((us_rep1 0))
  (((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))

;; "hide_ext__"
(declare-fun hide_ext__ (positive_less_than_max
  us_ext_type1) us_ext_type)

;; "extract__ext__"
(declare-fun extract__ext__ (us_ext_type) us_ext_type1)

;; "to_base"
(define-fun to_base ((a us_rep1)) us_rep
  (us_repqtmk
    (us_split_fieldsqtmk
      (rec__stacks__stack_root__content1 (us_split_fields3 a))
      (rec__stacks__stack_root__length1 (us_split_fields3 a))
      (hide_ext__
        (rec__stacks__buffer__first (us_split_fields3 a))
        (rec__ext__1 (us_split_fields3 a))))
    (attr__tag1 a)))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "alignment_axiom"
(assert (<= 0 alignment3))

(declare-const stacks__stack_root__content__first__bit1 Int)

(declare-const stacks__stack_root__content__last__bit1 Int)

(declare-const stacks__stack_root__content__position1 Int)

;; "stacks__stack_root__content__first__bit_axiom"
(assert (<= 0 stacks__stack_root__content__first__bit1))

;; "stacks__stack_root__content__last__bit_axiom"
(assert
  (< stacks__stack_root__content__first__bit1 stacks__stack_root__content__last__bit1))

;; "stacks__stack_root__content__position_axiom"
(assert (<= 0 stacks__stack_root__content__position1))

(declare-const stacks__stack_root__length__first__bit1 Int)

(declare-const stacks__stack_root__length__last__bit1 Int)

(declare-const stacks__stack_root__length__position1 Int)

;; "stacks__stack_root__length__first__bit_axiom"
(assert (<= 0 stacks__stack_root__length__first__bit1))

;; "stacks__stack_root__length__last__bit_axiom"
(assert
  (< stacks__stack_root__length__first__bit1 stacks__stack_root__length__last__bit1))

;; "stacks__stack_root__length__position_axiom"
(assert (<= 0 stacks__stack_root__length__position1))

(declare-const stacks__buffer__first__first__bit Int)

(declare-const stacks__buffer__first__last__bit Int)

(declare-const stacks__buffer__first__position Int)

;; "stacks__buffer__first__first__bit_axiom"
(assert (<= 0 stacks__buffer__first__first__bit))

;; "stacks__buffer__first__last__bit_axiom"
(assert
  (< stacks__buffer__first__first__bit stacks__buffer__first__last__bit))

;; "stacks__buffer__first__position_axiom"
(assert (<= 0 stacks__buffer__first__position))

(declare-const dummy1 us_rep1)

(declare-const s__attr__tag Int)

(declare-datatypes ((ext__ 0))
  (((ext__qtmk
    (rec__stacks__buffer__first__ext__ positive_less_than_max)(rec__hidden_ext__ us_private)))))

;; "__open"
(declare-fun us_open (us_ext_type) ext__)

;; "__close"
(declare-fun us_close (ext__) us_ext_type)

;; "close_open"
(assert
  (forall ((x us_ext_type))
    (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; "open_close"
(assert
  (forall ((x ext__))
    (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(declare-datatypes ((ext__1 0))
  (((ext__qtmk1 (rec__hidden_ext__1 us_private)))))

;; "__open"
(declare-fun us_open1 (us_ext_type1) ext__1)

;; "__close"
(declare-fun us_close1 (ext__1) us_ext_type1)

;; "close_open"
(assert
  (forall ((x us_ext_type1))
    (! (= (us_close1 (us_open1 x)) x) :pattern ((us_open1 x)) )))

;; "open_close"
(assert
  (forall ((x ext__1))
    (! (= (us_open1 (us_close1 x)) x) :pattern ((us_close1 x)) )))

;; "hide_ext__def"
(assert
  (forall ((temp___first_593 positive_less_than_max))
    (forall ((temp___ext_594 us_ext_type1))
      (= (us_open (hide_ext__ temp___first_593 temp___ext_594)) (ext__qtmk
                                                                  temp___first_593
                                                                  (rec__hidden_ext__1
                                                                    (us_open1
                                                                    temp___ext_594)))))))

;; "extract__ext__def"
(assert
  (forall ((temp___ext_595 us_ext_type))
    (= (us_open1 (extract__ext__ temp___ext_595)) (ext__qtmk1
                                                    (rec__hidden_ext__
                                                      (us_open
                                                        temp___ext_595))))))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_600 us_rep1) (temp___is_init_596 Bool) (temp___skip_constant_597 Bool) (temp___do_toplevel_598 Bool) (temp___do_typ_inv_599 Bool)) Bool
  true)

(declare-const e Int)

;; "get_model"
(declare-fun get_model (us_rep1) us_t)

;; "get_model__function_guard"
(declare-fun get_model__function_guard (us_t
  us_rep1) Bool)

;; "size"
(define-fun size ((param__s us_rep)) Int
  (to_rep (rec__stacks__stack_root__length (us_split_fields1 param__s))))

;; "dynamic_invariant"
(define-fun dynamic_invariant1 ((temp___expr_214 us_rep) (temp___is_init_210 Bool) (temp___skip_constant_211 Bool) (temp___do_toplevel_212 Bool) (temp___do_typ_inv_213 Bool)) Bool
  true)

;; "wraps_around"
(define-fun wraps_around ((param__s us_rep1)) Bool
  (> (- (+ (to_rep3 (rec__stacks__buffer__first (us_split_fields3 param__s))) 
  (to_rep
    (rec__stacks__stack_root__length1 (us_split_fields3 param__s)))) 1) 100))

;; "last"
(declare-fun last1 (us_rep1) Int)

;; "last__function_guard"
(declare-fun last__function_guard (Int
  us_rep1) Bool)

(declare-datatypes ((t1 0))
  (((tqtmk1 (rec__first1 integer)(rec__last1 integer)))))

;; "mk"
(declare-fun mk1 (Int
  Int) t1)

;; "mk_def"
(assert
  (forall ((f Int) (l Int))
    (! (=>
         (in_range3 f)
         (=>
           (in_range3 l)
           (and
             (= (to_rep2 (rec__first1 (mk1 f l))) f)
             (= (to_rep2 (rec__last1 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(declare-datatypes ((us_t1 0))
  (((us_tqtmk1 (elts1 (Array Int element))(rt1 t1)))))

;; "to_array"
(define-fun to_array1 ((a us_t1)) (Array Int element)
  (elts1 a))

;; "of_array"
(define-fun of_array1 ((a (Array Int element)) (f Int) (l Int)) us_t1
  (us_tqtmk1 a (mk1 f l)))

;; "first"
(define-fun first1 ((a us_t1)) Int
  (to_rep2 (rec__first1 (rt1 a))))

;; "last"
(define-fun last2 ((a us_t1)) Int
  (to_rep2 (rec__last1 (rt1 a))))

;; "length"
(define-fun length2 ((a us_t1)) Int
  (ite (<= (first1 a) (last2 a)) (+ (- (last2 a) (first1 a)) 1) 0))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const component__size2 Int)

(declare-const alignment4 Int)

;; "value__size_axiom"
(assert (<= 0 value__size4))

;; "object__size_axiom"
(assert (<= 0 object__size4))

;; "component__size_axiom"
(assert (<= 0 component__size2))

;; "alignment_axiom"
(assert (<= 0 alignment4))

;; "dynamic_invariant"
(define-fun dynamic_invariant2 ((temp___expr_230 us_t) (temp___is_init_226 Bool) (temp___skip_constant_227 Bool) (temp___do_toplevel_228 Bool) (temp___do_typ_inv_229 Bool)) Bool
  (=>
    (not (= temp___skip_constant_227 true))
    (dynamic_property
      1
      2147483647
      (first temp___expr_230)
      (last temp___expr_230))))

;; "is_full__post_axiom"
(assert true)

;; "is_full__def_axiom"
(assert
  (forall ((param__s us_rep))
    (! (= (= (is_full param__s) true) (= (size param__s) 100)) :pattern (
    (is_full
      param__s)) )))

;; "last__post_axiom"
(assert
  (forall ((param__s us_rep1))
    (! (=>
         (dynamic_invariant param__s true false true true)
         (let ((result (last1 param__s)))
           (=> (last__function_guard result param__s) (in_range1 result)))) :pattern (
    (last1
      param__s)) )))

;; "last__def_axiom"
(assert
  (forall ((param__s us_rep1))
    (! (= (last1 param__s) (ite (not (= (wraps_around param__s) true))
                             (- (+ (to_rep3
                                     (rec__stacks__buffer__first
                                       (us_split_fields3 param__s))) 
                             (to_rep
                               (rec__stacks__stack_root__length1
                                 (us_split_fields3 param__s)))) 1)
                             (- (- (+ (to_rep3
                                        (rec__stacks__buffer__first
                                          (us_split_fields3 param__s))) 
                             (to_rep
                               (rec__stacks__stack_root__length1
                                 (us_split_fields3 param__s)))) 1) 100))) :pattern (
    (last1
      param__s)) )))

;; "get_model__post_axiom"
(assert
  (forall ((param__s us_rep1))
    (! (=>
         (dynamic_invariant param__s true false true true)
         (let ((result (get_model param__s)))
           (=>
             (get_model__function_guard result param__s)
             (and
               (and
                 (and (in_range1 (first result)) (in_range1 (last result)))
                 (= (length1 result) (size (to_base param__s))))
               (dynamic_invariant2 result true false true true))))) :pattern (
    (get_model
      param__s)) )))

;; "get_model__def_axiom"
(assert
  (forall ((param__s us_rep1))
    (! (and
         (forall ((temp___649 us_rep1))
           (last__function_guard (last1 temp___649) temp___649))
         (and
           (forall ((temp___649 us_rep1))
             (last__function_guard (last1 temp___649) temp___649))
           (and
             (forall ((temp___661 us_rep1))
               (last__function_guard (last1 temp___661) temp___661))
             (= (get_model param__s) (ite (= (wraps_around param__s) true)
                                       (let ((temp___656 (let ((temp___655 
                                                           (let ((temp___650 
                                                             (let ((temp___649 param__s))
                                                               (last1
                                                                 temp___649))))
                                                             (let ((temp___647 1))
                                                               (let ((temp___646 
                                                                 (rec__stacks__stack_root__content1
                                                                   (us_split_fields3
                                                                    param__s))))
                                                                 (of_array1
                                                                   temp___646
                                                                   temp___647
                                                                   temp___650))))))
                                                           (let ((temp___654 
                                                             (let ((temp___653 100))
                                                               (let ((temp___652 
                                                                 (to_rep3
                                                                   (rec__stacks__buffer__first
                                                                    (us_split_fields3
                                                                    param__s)))))
                                                                 (let ((temp___651 
                                                                   (rec__stacks__stack_root__content1
                                                                    (us_split_fields3
                                                                    param__s))))
                                                                   (of_array1
                                                                    temp___651
                                                                    temp___652
                                                                    temp___653))))))
                                                             (ite (= 
                                                               (length2
                                                                 temp___654) 0)
                                                               (let ((temp___650 
                                                                 (let ((temp___649 param__s))
                                                                   (last1
                                                                    temp___649))))
                                                                 (let ((temp___647 1))
                                                                   (let ((temp___646 
                                                                    (rec__stacks__stack_root__content1
                                                                    (us_split_fields3
                                                                    param__s))))
                                                                    (of_array1
                                                                    temp___646
                                                                    temp___647
                                                                    temp___650))))
                                                               (of_array1
                                                                 (slide
                                                                   (concat1
                                                                    (to_array1
                                                                    temp___654)
                                                                    (first1
                                                                    temp___654)
                                                                    (last2
                                                                    temp___654)
                                                                    (to_array1
                                                                    temp___655)
                                                                    (first1
                                                                    temp___655)
                                                                    (last2
                                                                    temp___655))
                                                                   (first1
                                                                    temp___654)
                                                                   1)
                                                                 1
                                                                 (- (+ 1 (+ 
                                                                 (length
                                                                   (first1
                                                                    temp___654)
                                                                   (last2
                                                                    temp___654)) 
                                                                 (length
                                                                   (first1
                                                                    temp___655)
                                                                   (last2
                                                                    temp___655)))) 1)))))))
                                         (let ((temp___657 (to_array1
                                                             temp___656)))
                                           (of_array
                                             temp___657
                                             (first1 temp___656)
                                             (last2 temp___656))))
                                       (let ((temp___663 (let ((temp___662 
                                                           (let ((temp___661 param__s))
                                                             (last1
                                                               temp___661))))
                                                           (let ((temp___659 
                                                             (to_rep3
                                                               (rec__stacks__buffer__first
                                                                 (us_split_fields3
                                                                   param__s)))))
                                                             (let ((temp___658 
                                                               (rec__stacks__stack_root__content1
                                                                 (us_split_fields3
                                                                   param__s))))
                                                               (of_array1
                                                                 temp___658
                                                                 temp___659
                                                                 temp___662))))))
                                         (let ((temp___664 (to_array1
                                                             temp___663)))
                                           (of_array
                                             temp___664
                                             (first1 temp___663)
                                             (last2 temp___663))))))))) :pattern (
    (get_model
      param__s)) )))

(declare-const rliteral positive_less_than_max)

;; "rliteral_axiom"
(assert (= (positive_less_than_maxqtint rliteral) 100))

;; Goal "def'vc"
;; File "stacks.ads", line 60, characters 0-0
(assert
  (not
  (forall ((s__split_fields us_split_fields2))
    (=>
      (dynamic_invariant
        (us_repqtmk1 s__split_fields s__attr__tag)
        true
        false
        true
        true)
      (=>
        (in_range2 e)
        (=>
          (not
            (= (is_full (to_base (us_repqtmk1 s__split_fields s__attr__tag))) true))
          (forall ((o Int))
            (=>
              (= (to_rep (rec__stacks__stack_root__length1 s__split_fields)) o)
              (let ((o1 (+ o 1)))
                (=>
                  (in_range1 o1)
                  (forall ((o2 less_than_max))
                    (=>
                      (= (to_rep o2) o1)
                      (forall ((s__split_fields1 us_split_fields2))
                        (=>
                          (= s__split_fields1 (us_split_fieldsqtmk1
                                                (rec__stacks__stack_root__content1
                                                  s__split_fields)
                                                o2
                                                (rec__stacks__buffer__first
                                                  s__split_fields)
                                                (rec__ext__1 s__split_fields)))
                          (forall ((s__split_fields2 us_split_fields2))
                            (=>
                              (exists ((o3 Int))
                                (and
                                  (= (to_rep3
                                       (rec__stacks__buffer__first
                                         s__split_fields1)) o3)
                                  (exists ((spark__branch Bool))
                                    (and
                                      (= spark__branch (ite (= o3 1)
                                                         true
                                                         false))
                                      (ite (= spark__branch true)
                                        (= s__split_fields2 (us_split_fieldsqtmk1
                                                              (rec__stacks__stack_root__content1
                                                                s__split_fields1)
                                                              (rec__stacks__stack_root__length1
                                                                s__split_fields1)
                                                              rliteral
                                                              (rec__ext__1
                                                                s__split_fields1)))
                                        (exists ((o4 Int))
                                          (and
                                            (= (to_rep3
                                                 (rec__stacks__buffer__first
                                                   s__split_fields1)) o4)
                                            (let ((o5 (- o4 1)))
                                              (and
                                                (in_range4 o5)
                                                (exists ((o6 positive_less_than_max))
                                                  (and
                                                    (= (to_rep3 o6) o5)
                                                    (= s__split_fields2 
                                                    (us_split_fieldsqtmk1
                                                      (rec__stacks__stack_root__content1
                                                        s__split_fields1)
                                                      (rec__stacks__stack_root__length1
                                                        s__split_fields1)
                                                      o6
                                                      (rec__ext__1
                                                        s__split_fields1))))))))))))))
                              (forall ((o3 element))
                                (=>
                                  (= (to_rep1 o3) e)
                                  (forall ((o4 Int))
                                    (=>
                                      (= (to_rep3
                                           (rec__stacks__buffer__first
                                             s__split_fields2)) o4)
                                      (forall ((s__split_fields3 us_split_fields2))
                                        (=>
                                          (= s__split_fields3 (us_split_fieldsqtmk1
                                                                (store 
                                                                (rec__stacks__stack_root__content1
                                                                  s__split_fields2) o4 o3)
                                                                (rec__stacks__stack_root__length1
                                                                  s__split_fields2)
                                                                (rec__stacks__buffer__first
                                                                  s__split_fields2)
                                                                (rec__ext__1
                                                                  s__split_fields2)))
                                          (=>
                                            (forall ((temp___1021 us_rep1))
                                              (get_model__function_guard
                                                (get_model temp___1021)
                                                temp___1021))
                                            (=>
                                              (forall ((temp___1019 us_rep1))
                                                (get_model__function_guard
                                                  (get_model temp___1019)
                                                  temp___1019))
                                              (= (let ((temp___1026 (let ((temp___1022 
                                                                    (let ((temp___1021 
                                                                    (us_repqtmk1
                                                                    s__split_fields
                                                                    s__attr__tag)))
                                                                    (get_model
                                                                    temp___1021))))
                                                                    (of_array
                                                                    (concat_singleton_left
                                                                    (of_rep1
                                                                    e)
                                                                    1
                                                                    (to_array
                                                                    temp___1022)
                                                                    (first
                                                                    temp___1022)
                                                                    (last
                                                                    temp___1022))
                                                                    1
                                                                    (- (+ 1 (+ 1 
                                                                    (length
                                                                    (first
                                                                    temp___1022)
                                                                    (last
                                                                    temp___1022)))) 1)))))
                                                   (let ((temp___1024 
                                                     (let ((temp___1019 
                                                       (us_repqtmk1
                                                         s__split_fields3
                                                         s__attr__tag)))
                                                       (get_model
                                                         temp___1019))))
                                                     (bool_eq
                                                       (to_array temp___1024)
                                                       (first temp___1024)
                                                       (last temp___1024)
                                                       (to_array temp___1026)
                                                       (first temp___1026)
                                                       (last temp___1026)))) true)))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)