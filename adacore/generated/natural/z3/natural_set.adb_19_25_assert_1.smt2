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
  ((bool__ref (bool__refqtmk (bool__content Bool)))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

(declare-sort set_length 0)

;; "set_length'int"
(declare-fun set_lengthqtint (set_length) Int)

;; "set_length'axiom"
(assert
  (forall ((i set_length))
    (and (<= 0 (set_lengthqtint i)) (<= (set_lengthqtint i) 10))))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 10)))

;; "to_rep"
(define-fun to_rep ((x set_length)) Int
  (set_lengthqtint x))

;; "of_rep"
(declare-fun of_rep (Int) set_length)

;; "inversion_axiom"
(assert
  (forall ((x set_length))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x set_length)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-sort element_t 0)

;; "element_t'int"
(declare-fun element_tqtint (element_t) Int)

;; "element_t'axiom"
(assert
  (forall ((i element_t))
    (and (<= (- 1) (element_tqtint i)) (<= (element_tqtint i) 2147483647))))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= (- 1) x) (<= x 2147483647)))

;; "to_rep"
(define-fun to_rep1 ((x element_t)) Int
  (element_tqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) element_t)

;; "inversion_axiom"
(assert
  (forall ((x element_t))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x element_t))
    (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

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
  ((us_split_fields
   (us_split_fieldsqtmk
   (rec__natural_set__t__len set_length)(rec__natural_set__t__m (Array Int element_t))))))

(declare-datatypes ()
  ((us_split_fields__ref
   (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))

(declare-datatypes ()
  ((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const natural_set__t__len__first__bit Int)

(declare-const natural_set__t__len__last__bit Int)

(declare-const natural_set__t__len__position Int)

;; "natural_set__t__len__first__bit_axiom"
(assert (<= 0 natural_set__t__len__first__bit))

;; "natural_set__t__len__last__bit_axiom"
(assert (< natural_set__t__len__first__bit natural_set__t__len__last__bit))

;; "natural_set__t__len__position_axiom"
(assert (<= 0 natural_set__t__len__position))

(declare-const natural_set__t__m__first__bit Int)

(declare-const natural_set__t__m__last__bit Int)

(declare-const natural_set__t__m__position Int)

;; "natural_set__t__m__first__bit_axiom"
(assert (<= 0 natural_set__t__m__first__bit))

;; "natural_set__t__m__last__bit_axiom"
(assert (< natural_set__t__m__first__bit natural_set__t__m__last__bit))

;; "natural_set__t__m__position_axiom"
(assert (<= 0 natural_set__t__m__position))

(declare-const dummy us_rep)

;; "valid"
(define-fun valid ((param__s us_rep)) Bool
  (and (ite (forall ((i Int))
              (=>
                (and
                  (<= 1 i)
                  (<= i (to_rep
                          (rec__natural_set__t__len
                            (us_split_fields1 param__s)))))
                (in_range
                  (to_rep1
                    (let ((temp___170 (rec__natural_set__t__m
                                        (us_split_fields1 param__s))))
                      (select temp___170 i))))))
         true
         false) (ite (forall ((i Int))
                       (=>
                         (and
                           (<= (+ (to_rep
                                    (rec__natural_set__t__len
                                      (us_split_fields1 param__s))) 1) i)
                           (<= i 10))
                         (= (to_rep1
                              (let ((temp___172 (rec__natural_set__t__m
                                                  (us_split_fields1 param__s))))
                                (select temp___172 i))) (- 1))))
                  true
                  false)))

;; "full"
(declare-fun full (us_rep) Bool)

;; "members"
(declare-fun members (us_rep) Int)

;; "members__function_guard"
(declare-fun members__function_guard (Int
  us_rep) Bool)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_212 us_rep) (temp___is_init_208 Bool) (temp___skip_constant_209 Bool) (temp___do_toplevel_210 Bool) (temp___do_typ_inv_211 Bool)) Bool
  true)

;; "contains"
(define-fun contains ((param__s us_rep) (param__value Int)) Bool
  (ite (exists ((i Int))
         (and
           (and
             (<= 1 i)
             (<= i (to_rep
                     (rec__natural_set__t__len (us_split_fields1 param__s)))))
           (= (to_rep1
                (let ((temp___176 (rec__natural_set__t__m
                                    (us_split_fields1 param__s))))
                  (select temp___176 i))) param__value)))
    true
    false))

(declare-const value Int)

;; "members__post_axiom"
(assert
  (forall ((param__s us_rep))
    (! (=>
         (dynamic_invariant param__s true false true true)
         (let ((result (members param__s)))
           (=>
             (members__function_guard result param__s)
             (and (and (<= 0 result) (<= result 10)) (in_range result))))) :pattern (
    (members
      param__s)) )))

;; "members__def_axiom"
(assert
  (forall ((param__s us_rep))
    (! (= (members param__s) (to_rep
                               (rec__natural_set__t__len
                                 (us_split_fields1 param__s)))) :pattern (
    (members
      param__s)) )))

;; "full__post_axiom"
(assert true)

;; "full__def_axiom"
(assert
  (forall ((param__s us_rep))
    (! (and
         (forall ((temp___229 us_rep))
           (members__function_guard (members temp___229) temp___229))
         (=
           (= (full param__s) true)
           (= (let ((temp___229 param__s)) (members temp___229)) 10))) :pattern (
    (full
      param__s)) )))

(declare-const s__split_fields us_split_fields)

;; "s__split_fields'unused"
(define-fun s__split_fieldsqtunused () us_split_fields__ref
  (us_split_fields__refqtmk s__split_fields))

;; "Assume"
(assert
  (dynamic_invariant (us_repqtmk s__split_fields) true false true true))

;; "Assume"
(assert (in_range value))

;; "Assume"
(assert
  (and
    (= (valid (us_repqtmk s__split_fields)) true)
    (not (= (full (us_repqtmk s__split_fields)) true))))

;; "o"
(define-fun o () Int
  value)

;; "__split_fields__content'result'unused"
(define-fun us_split_fields__contentqtresultqtunused () us_split_fields
  s__split_fields)

;; "o"
(define-fun o1 () us_rep
  (us_repqtmk s__split_fields))

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused () us_rep
  o1)

;; "o"
(define-fun o2 () Bool
  (contains o1 o))

;; "Ensures"
(assert
  (=
    (= o2 true)
    (exists ((i Int))
      (and
        (and
          (<= 1 i)
          (<= i (to_rep (rec__natural_set__t__len s__split_fields))))
        (= (to_rep1 (select (rec__natural_set__t__m s__split_fields) i)) 
        o)))))

;; "contains'result'unused"
(define-fun containsqtresultqtunused () Bool
  o2)

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch (ite (= o2 true) false true)))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (= spark__branch true))

;; "__split_fields__content'result'unused"
(define-fun us_split_fields__contentqtresultqtunused1 () us_split_fields
  s__split_fields)

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused1 () us_rep
  (us_repqtmk s__split_fields))

;; "_q 'unused"
(define-fun usq_qtunused () us_split_fields
  s__split_fields)

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused () us_split_fields
  s__split_fields)

;; "o"
(define-fun o3 () (Array Int element_t)
  (rec__natural_set__t__m s__split_fields))

;; "rec__natural_set__t__m'result'unused"
(define-fun rec__natural_set__t__mqtresultqtunused () (Array Int element_t)
  o3)

;; "__split_fields__content'result'unused"
(define-fun us_split_fields__contentqtresultqtunused2 () us_split_fields
  s__split_fields)

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused2 () us_rep
  (us_repqtmk s__split_fields))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused1 () us_split_fields
  s__split_fields)

;; "o"
(define-fun o4 () set_length
  (rec__natural_set__t__len s__split_fields))

;; "rec__natural_set__t__len'result'unused"
(define-fun rec__natural_set__t__lenqtresultqtunused () set_length
  o4)

(declare-const o5 Int)

;; "Ensures"
(assert (= (to_rep o4) o5))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused () Int
  o5)

;; "o"
(define-fun o6 () Int
  (+ o5 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o6)

;; "Ensures"
(assert (in_range1 o6))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o6)

(declare-const o7 set_length)

;; "Ensures"
(assert (= (to_rep o7) o6))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused () set_length
  o7)

;; "o"
(define-fun o8 () us_split_fields
  (us_split_fieldsqtmk o7 o3))

;; "__split_fields'mk'result'unused"
(define-fun us_split_fieldsqtmkqtresultqtunused () us_split_fields
  o8)

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused3 () us_rep
  (us_repqtmk o8))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused2 () us_split_fields
  o8)

(declare-const s__split_fields1 us_split_fields)

;; "s__split_fields'unused"
(define-fun s__split_fieldsqtunused1 () us_split_fields__ref
  (us_split_fields__refqtmk s__split_fields1))

;; "H"
(assert (= s__split_fields1 o8))

;; "__split_fields__content'result'unused"
(define-fun us_split_fields__contentqtresultqtunused3 () us_split_fields
  s__split_fields1)

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused4 () us_rep
  (us_repqtmk s__split_fields1))

;; "_q 'unused"
(define-fun usq_qtunused1 () us_split_fields
  s__split_fields1)

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused3 () us_split_fields
  s__split_fields1)

;; "__split_fields__content'result'unused"
(define-fun us_split_fields__contentqtresultqtunused4 () us_split_fields
  s__split_fields1)

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused5 () us_rep
  (us_repqtmk s__split_fields1))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused4 () us_split_fields
  s__split_fields1)

;; "temp___266"
(define-fun temp___266 () (Array Int element_t)
  (rec__natural_set__t__m s__split_fields1))

;; "rec__natural_set__t__m'result'unused"
(define-fun rec__natural_set__t__mqtresultqtunused1 () (Array Int element_t)
  temp___266)

(declare-const o9 element_t)

;; "Ensures"
(assert (= (to_rep1 o9) value))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused1 () element_t
  o9)

;; "__split_fields__content'result'unused"
(define-fun us_split_fields__contentqtresultqtunused5 () us_split_fields
  s__split_fields1)

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused6 () us_rep
  (us_repqtmk s__split_fields1))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused5 () us_split_fields
  s__split_fields1)

;; "o"
(define-fun o10 () set_length
  (rec__natural_set__t__len s__split_fields1))

;; "rec__natural_set__t__len'result'unused"
(define-fun rec__natural_set__t__lenqtresultqtunused1 () set_length
  o10)

(declare-const temp___268 Int)

;; "Ensures"
(assert (= (to_rep o10) temp___268))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused1 () Int
  temp___268)

;; "Assert"
(assert (and (<= 1 temp___268) (<= temp___268 10)))

;; "o"
(define-fun o11 () (Array Int element_t)
  (store temp___266 temp___268 o9))

;; "set'result'unused"
(define-fun setqtresultqtunused () (Array Int element_t)
  o11)

;; "o"
(define-fun o12 () set_length
  (rec__natural_set__t__len s__split_fields1))

;; "rec__natural_set__t__len'result'unused"
(define-fun rec__natural_set__t__lenqtresultqtunused2 () set_length
  o12)

;; "o"
(define-fun o13 () us_split_fields
  (us_split_fieldsqtmk o12 o11))

;; "__split_fields'mk'result'unused"
(define-fun us_split_fieldsqtmkqtresultqtunused1 () us_split_fields
  o13)

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused7 () us_rep
  (us_repqtmk o13))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused6 () us_split_fields
  o13)

(declare-const s__split_fields2 us_split_fields)

;; "s__split_fields'unused"
(define-fun s__split_fieldsqtunused2 () us_split_fields__ref
  (us_split_fields__refqtmk s__split_fields2))

;; "H"
(assert (= s__split_fields2 o13))

;; Goal "def'vc"
;; File "natural_set.ads", line 36, characters 0-0
(assert
  (not (= (contains (us_repqtmk s__split_fields2) value) true)))

(check-sat)
