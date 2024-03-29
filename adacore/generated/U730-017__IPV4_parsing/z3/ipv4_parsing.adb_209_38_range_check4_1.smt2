;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-datatypes ()
  ((int__ref (int__refqtmk (int__content Int)))))

(declare-const two_power_size_minus_one Int)

(declare-const two_power_size_minus_one1 Int)

(declare-datatypes ()
  ((t__ref (t__refqtmk (t__content (_ BitVec 32))))))

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

(declare-sort positive 0)

;; "positive'int"
(declare-fun positiveqtint (positive) Int)

;; "positive'axiom"
(assert
  (forall ((i positive))
    (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

(declare-datatypes ()
  ((positive__init_wrapper
   (positive__init_wrapperqtmk (rec__value positive)(us_attr__init Bool)))))

(declare-const dummy positive__init_wrapper)

;; "dummy__def"
(assert (= (us_attr__init dummy) false))

;; "to_rep"
(define-fun to_rep ((x positive)) Int
  (positiveqtint x))

;; "of_rep"
(declare-fun of_rep (Int) positive)

;; "inversion_axiom"
(assert
  (forall ((x positive))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x positive)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-sort character 0)

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 255)))

(declare-datatypes ()
  ((character__init_wrapper
   (character__init_wrapperqtmk (rec__value1 character)(us_attr__init1 Bool)))))

(declare-const dummy1 character__init_wrapper)

;; "dummy__def"
(assert (= (us_attr__init1 dummy1) false))

;; "to_rep"
(declare-fun to_rep1 (character) Int)

;; "of_rep"
(declare-fun of_rep1 (Int) character)

;; "inversion_axiom"
(assert
  (forall ((x character))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x character))
    (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-datatypes ()
  ((map__ref
   (map__refqtmk (map__content (Array Int character__init_wrapper))))))

;; "slide"
(declare-fun slide ((Array Int character__init_wrapper)
  Int
  Int) (Array Int character__init_wrapper))

;; "slide_eq"
(assert
  (forall ((a (Array Int character__init_wrapper)))
    (forall ((first Int))
      (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; "slide_def"
(assert
  (forall ((a (Array Int character__init_wrapper)))
    (forall ((old_first Int))
      (forall ((new_first Int))
        (forall ((i Int))
          (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
          (slide
            a
            old_first
            new_first) i)) ))))))

;; "convert"
(declare-fun convert ((Array Int character__init_wrapper)) (Array Int character))

;; "convert__def"
(assert
  (forall ((a (Array Int character__init_wrapper)))
    (forall ((temp___106 Int))
      (= (to_rep1 (of_rep1 (to_rep1 (rec__value1 (select a temp___106))))) 
      (to_rep1
        (select (convert a) temp___106))))))

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
  (forall ((x integer)) (! (in_range (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                 (of_rep2 x))) )))

(declare-datatypes ()
  ((t (tqtmk (rec__first integer)(rec__last integer)))))

;; "mk"
(declare-fun mk (Int
  Int) t)

;; "mk_def"
(assert
  (forall ((f Int) (l Int))
    (! (=>
         (in_range f)
         (=>
           (in_range l)
           (and
             (= (to_rep2 (rec__first (mk f l))) f)
             (= (to_rep2 (rec__last (mk f l))) l)))) :pattern ((mk f l)) )))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int character)
  (elts a))

;; "of_array"
(define-fun of_array ((a (Array Int character)) (f Int) (l Int)) us_t
  (us_tqtmk a (mk f l)))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep2 (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep2 (rec__last (rt a))))

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

(declare-datatypes ()
  ((t1 (tqtmk1 (rec__first1 integer)(rec__last1 integer)))))

;; "mk"
(declare-fun mk1 (Int
  Int) t1)

;; "mk_def"
(assert
  (forall ((f Int) (l Int))
    (! (=>
         (in_range f)
         (=>
           (in_range l)
           (and
             (= (to_rep2 (rec__first1 (mk1 f l))) f)
             (= (to_rep2 (rec__last1 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(declare-datatypes ()
  ((us_t1 (us_tqtmk1 (elts1 (Array Int character__init_wrapper))(rt1 t1)))))

;; "to_array"
(define-fun to_array1 ((a us_t1)) (Array Int character__init_wrapper)
  (elts1 a))

;; "of_array"
(define-fun of_array1 ((a (Array Int character__init_wrapper)) (f Int) (l Int)) us_t1
  (us_tqtmk1 a (mk1 f l)))

;; "first"
(define-fun first1 ((a us_t1)) Int
  (to_rep2 (rec__first1 (rt1 a))))

;; "last"
(define-fun last1 ((a us_t1)) Int
  (to_rep2 (rec__last1 (rt1 a))))

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

(declare-const v (_ BitVec 32))

;; "is_smallest_byte_10"
(declare-fun is_smallest_byte_10 (us_t
  (_ BitVec 8)) Bool)

(declare-datatypes ()
  ((map__ref1
   (map__refqtmk1 (map__content1 (Array Int positive__init_wrapper))))))

(declare-const lst Int)

(declare-const res__first integer)

(declare-const res__last integer)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 32))

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

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_112 us_t) (temp___is_init_108 Bool) (temp___skip_constant_109 Bool) (temp___do_toplevel_110 Bool) (temp___do_typ_inv_111 Bool)) Bool
  (=>
    (not (= temp___skip_constant_109 true))
    (dynamic_property
      1
      2147483647
      (first temp___expr_112)
      (last temp___expr_112))))

;; "char_of_byte_10"
(define-fun char_of_byte_10 ((param__i (_ BitVec 8))) Int
  (ite (= param__i #x00)
    48
    (ite (= param__i #x01)
      49
      (ite (= param__i #x02)
        50
        (ite (= param__i #x03)
          51
          (ite (= param__i #x04)
            52
            (ite (= param__i #x05)
              53
              (ite (= param__i #x06)
                54
                (ite (= param__i #x07) 55 (ite (= param__i #x08) 56 57))))))))))

;; "is_smallest_byte_10__post_axiom"
(assert true)

;; "is_smallest_byte_10__def_axiom"
(assert
  (forall ((param__s us_t))
    (forall ((param__v (_ BitVec 8)))
      (! (=
           (= (is_smallest_byte_10 param__s param__v) true)
           (and
             (and
               (and
                 (= (length param__s) (ite (bvuge param__v #x64)
                                        3
                                        (ite (bvuge param__v #x0A) 2 1)))
                 (= (to_rep1 (select (to_array param__s) (last param__s))) 
                 (char_of_byte_10
                   (bvurem param__v #x0A))))
               (=>
                 (bvuge param__v #x0A)
                 (= (to_rep1
                      (select (to_array param__s) (- (last param__s) 1))) 
                 (char_of_byte_10
                   (bvurem (bvudiv param__v #x0A) #x0A)))))
             (=>
               (bvuge param__v #x64)
               (= (to_rep1 (select (to_array param__s) (first param__s))) 
               (char_of_byte_10
                 (bvudiv param__v #x64)))))) :pattern ((is_smallest_byte_10
                                                         param__s
                                                         param__v)) ))))

(declare-const s (Array Int character__init_wrapper))

(declare-const ds (Array Int positive__init_wrapper))

;; "ds'unused"
(define-fun dsqtunused () map__ref1
  (map__refqtmk1 ds))

;; "s'unused"
(define-fun sqtunused () map__ref
  (map__refqtmk s))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

(declare-const last2 Int)

;; "last"
(define-fun last3 () int__ref
  (int__refqtmk last2))

;; "H"
(assert (= last2 15))

;; "Assume"
(assert (in_range1 last2))

(declare-const w (_ BitVec 32))

;; "w'unused"
(define-fun wqtunused () t__ref
  (t__refqtmk w))

;; "H"
(assert (= w v))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "temp___loop_entry_566'unused"
(define-fun temp___loop_entry_566qtunused () (Array Int positive__init_wrapper)
  ds)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused () (Array Int positive__init_wrapper)
  ds)

;; "temp___loop_entry_563'unused"
(define-fun temp___loop_entry_563qtunused () (_ BitVec 32)
  w)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused () (_ BitVec 32)
  w)

;; "temp___loop_entry_562'unused"
(define-fun temp___loop_entry_562qtunused () Int
  last2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  last2)

;; "temp___loop_entry_561'unused"
(define-fun temp___loop_entry_561qtunused () (Array Int character__init_wrapper)
  s)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused1 () (Array Int character__init_wrapper)
  s)

(declare-const i Int)

;; "i'unused"
(define-fun iqtunused () int__ref
  (int__refqtmk i))

;; "H"
(assert (= i 1))

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused2 () (Array Int character__init_wrapper)
  s)

;; "temp___compl_549"
(define-fun temp___compl_549 () us_t1
  (of_array1 s 1 15))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused () us_t1
  temp___compl_549)

;; "o"
(define-fun o () (Array Int character__init_wrapper)
  s)

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused () (Array Int character__init_wrapper)
  o)

;; "param__s"
(define-fun param__s () map__ref
  (map__refqtmk o))

;; "map__ref'mk'result'unused"
(define-fun map__refqtmkqtresultqtunused () map__ref
  param__s)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  last2)

;; "o"
(define-fun o1 () Int
  15)

;; "last'result'unused"
(define-fun lastqtresultqtunused () Int
  o1)

(declare-const o2 integer)

;; "Ensures"
(assert (= (to_rep2 o2) o1))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused () integer
  o2)

;; "o"
(define-fun o3 () Int
  1)

;; "first'result'unused"
(define-fun firstqtresultqtunused () Int
  o3)

(declare-const o4 integer)

;; "Ensures"
(assert (= (to_rep2 o4) o3))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused1 () integer
  o4)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused1 () (_ BitVec 32)
  w)

;; "o"
(define-fun o5 () (_ BitVec 32)
  (bvand w #x000000FF))

;; "bw_and'result'unused"
(define-fun bw_andqtresultqtunused () (_ BitVec 32)
  o5)

;; "o"
(define-fun o6 () (_ BitVec 32)
  ((_ zero_extend 24) #xFF))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused () (_ BitVec 32)
  o6)

;; "o"
(define-fun o7 () (_ BitVec 32)
  ((_ zero_extend 24) #x00))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused1 () (_ BitVec 32)
  o7)

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () (_ BitVec 32)
  o5)

;; "o"
(define-fun o8 () (_ BitVec 8)
  ((_ extract 7 0) o5))

;; "toSmall'result'unused"
(define-fun toSmallqtresultqtunused () (_ BitVec 8)
  o8)

;; "param__s'unused"
(define-fun param__sqtunused () map__ref
  param__s)

;; "param__last'unused"
(define-fun param__lastqtunused () int__ref
  last3)

(declare-const last4 Int)

(declare-const param__s1 (Array Int character__init_wrapper))

;; "param__s'unused"
(define-fun param__sqtunused1 () map__ref
  (map__refqtmk param__s1))

;; "last'unused"
(define-fun lastqtunused () int__ref
  (int__refqtmk last4))

;; "H"
(assert (<= (- (to_rep2 o4) 1) last4))

;; "H"
(assert (<= last4 last2))

;; "H"
(assert (<= (- last2 last4) 3))

;; "H"
(assert
  (let ((temp___390 (let ((temp___388 (+ last4 1)))
                      (of_array1 param__s1 temp___388 last2))))
    (forall ((temp___391 Int))
      (=>
        (and
          (<= (first1 temp___390) temp___391)
          (<= temp___391 (last1 temp___390)))
        (= (us_attr__init1 (select (to_array1 temp___390) temp___391)) true)))))

;; "H"
(assert
  (= (is_smallest_byte_10
       (let ((temp___398 (let ((temp___396 (+ last4 1)))
                           (of_array1 param__s1 temp___396 last2))))
         (of_array
           (convert (to_array1 temp___398))
           (first1 temp___398)
           (last1 temp___398)))
       o8) true))

;; "H"
(assert
  (forall ((k Int))
    (=>
      (and (<= (to_rep2 o4) k) (<= k (to_rep2 o2)))
      (=>
        (= (not (and (ite (<= (+ last4 1) k) true false) (ite (<= k last2)
                                                           true
                                                           false))) true)
        (=
          (= (us_attr__init1 (select param__s1 k)) true)
          (= (us_attr__init1 (select o k)) true))))))

;; "H"
(assert
  (forall ((k Int))
    (=>
      (and (<= (to_rep2 o4) k) (<= k (to_rep2 o2)))
      (=>
        (and
          (= (not (and (ite (<= (+ last4 1) k) true false) (ite (<= k 
                                                             last2)
                                                             true
                                                             false))) true)
          (= (us_attr__init1 (select param__s1 k)) true))
        (= (to_rep1 (rec__value1 (select param__s1 k))) (to_rep1
                                                          (rec__value1
                                                            (select o k))))))))

;; "H"
(assert true)

;; "H"
(assert (in_range1 last4))

;; "H"
(assert true)

;; "H"
(assert true)

;; "o"
(define-fun o9 () Int
  15)

;; "last'result'unused"
(define-fun lastqtresultqtunused1 () Int
  o9)

;; "o"
(define-fun o10 () Int
  1)

;; "first'result'unused"
(define-fun firstqtresultqtunused1 () Int
  o10)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused3 () (Array Int character__init_wrapper)
  param__s1)

;; "temp___552"
(define-fun temp___552 () us_t1
  (of_array1 param__s1 o10 o9))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused1 () us_t1
  temp___552)

;; "o"
(define-fun o11 () Int
  o10)

;; "first'result'unused"
(define-fun firstqtresultqtunused2 () Int
  o11)

;; "o"
(define-fun o12 () (Array Int character__init_wrapper)
  param__s1)

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused1 () (Array Int character__init_wrapper)
  o12)

;; "temp___553"
(define-fun temp___553 () (Array Int character__init_wrapper)
  (slide o12 o11 1))

;; "slide'result'unused"
(define-fun slideqtresultqtunused () (Array Int character__init_wrapper)
  temp___553)

(declare-const s1 (Array Int character__init_wrapper))

;; "s'unused"
(define-fun sqtunused1 () map__ref
  (map__refqtmk s1))

;; "H"
(assert (= s1 temp___553))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  i)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  (ite (= i 4) true false))

;; "H"
(assert (not (= i 4)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  last4)

;; "Ensures"
(assert (in_range2 last4))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  last4)

(declare-const o13 positive)

;; "Ensures"
(assert (= (to_rep o13) last4))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused2 () positive
  o13)

;; "o"
(define-fun o14 () positive__init_wrapper
  (positive__init_wrapperqtmk o13 true))

;; "to_wrapper'result'unused"
(define-fun to_wrapperqtresultqtunused () positive__init_wrapper
  o14)

;; "Assert"
(assert (and (<= 1 i) (<= i 3)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused4 () Int
  i)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused4 () (Array Int positive__init_wrapper)
  ds)

;; "o"
(define-fun o15 () (Array Int positive__init_wrapper)
  (store ds i o14))

;; "set'result'unused"
(define-fun setqtresultqtunused () (Array Int positive__init_wrapper)
  o15)

(declare-const ds1 (Array Int positive__init_wrapper))

;; "ds'unused"
(define-fun dsqtunused1 () map__ref1
  (map__refqtmk1 ds1))

;; "H"
(assert (= ds1 o15))

(declare-const o16 character)

;; "Ensures"
(assert (= (to_rep1 o16) 46))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused3 () character
  o16)

;; "o"
(define-fun o17 () character__init_wrapper
  (character__init_wrapperqtmk o16 true))

;; "to_wrapper'result'unused"
(define-fun to_wrapperqtresultqtunused1 () character__init_wrapper
  o17)

;; "Assert"
(assert (and (<= 1 last4) (<= last4 15)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  last4)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused5 () (Array Int character__init_wrapper)
  s1)

;; "o"
(define-fun o18 () (Array Int character__init_wrapper)
  (store s1 last4 o17))

;; "set'result'unused"
(define-fun setqtresultqtunused1 () (Array Int character__init_wrapper)
  o18)

(declare-const s2 (Array Int character__init_wrapper))

;; "s'unused"
(define-fun sqtunused2 () map__ref
  (map__refqtmk s2))

;; "H"
(assert (= s2 o18))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  last4)

;; "o"
(define-fun o19 () Int
  (- last4 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused () Int
  o19)

;; "Ensures"
(assert (in_range1 o19))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused2 () Int
  o19)

(declare-const last5 Int)

;; "last'unused"
(define-fun lastqtunused1 () int__ref
  (int__refqtmk last5))

;; "H"
(assert (= last5 o19))

;; "o"
(define-fun o20 () (_ BitVec 32)
  ((_ int2bv 32) 8))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused () (_ BitVec 32)
  o20)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused2 () (_ BitVec 32)
  w)

;; "o"
(define-fun o21 () (_ BitVec 32)
  (bvlshr w o20))

;; "lsr_bv'result'unused"
(define-fun lsr_bvqtresultqtunused () (_ BitVec 32)
  o21)

(declare-const w1 (_ BitVec 32))

;; "w'unused"
(define-fun wqtunused1 () t__ref
  (t__refqtmk w1))

;; "H"
(assert (= w1 o21))

(declare-const i1 Int)

;; "i'unused"
(define-fun iqtunused1 () int__ref
  (int__refqtmk i1))

;; "H"
(assert (= i1 2))

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused6 () (Array Int character__init_wrapper)
  s2)

;; "temp___compl_549"
(define-fun temp___compl_5491 () us_t1
  (of_array1 s2 1 15))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused2 () us_t1
  temp___compl_5491)

;; "o"
(define-fun o22 () (Array Int character__init_wrapper)
  s2)

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused2 () (Array Int character__init_wrapper)
  o22)

;; "param__s"
(define-fun param__s2 () map__ref
  (map__refqtmk o22))

;; "map__ref'mk'result'unused"
(define-fun map__refqtmkqtresultqtunused1 () map__ref
  param__s2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  last5)

;; "o"
(define-fun o23 () Int
  15)

;; "last'result'unused"
(define-fun lastqtresultqtunused2 () Int
  o23)

(declare-const o24 integer)

;; "Ensures"
(assert (= (to_rep2 o24) o23))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused4 () integer
  o24)

;; "o"
(define-fun o25 () Int
  1)

;; "first'result'unused"
(define-fun firstqtresultqtunused3 () Int
  o25)

(declare-const o26 integer)

;; "Ensures"
(assert (= (to_rep2 o26) o25))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused5 () integer
  o26)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused3 () (_ BitVec 32)
  w1)

;; "o"
(define-fun o27 () (_ BitVec 32)
  (bvand w1 #x000000FF))

;; "bw_and'result'unused"
(define-fun bw_andqtresultqtunused1 () (_ BitVec 32)
  o27)

;; "o"
(define-fun o28 () (_ BitVec 32)
  ((_ zero_extend 24) #xFF))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused2 () (_ BitVec 32)
  o28)

;; "o"
(define-fun o29 () (_ BitVec 32)
  ((_ zero_extend 24) #x00))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused3 () (_ BitVec 32)
  o29)

;; Goal "def'vc"
;; File "ipv4_parsing.ads", line 118, characters 0-0
(assert
  (not (bvule o27 o28)))

(check-sat)
