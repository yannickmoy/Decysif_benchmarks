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

(declare-datatypes ()
  ((bool__ref (bool__refqtmk (bool__content Bool)))))

(declare-const two_power_size_minus_one Int)

(declare-datatypes ()
  ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))

(declare-const two_power_size_minus_one1 Int)

(declare-datatypes ()
  ((t__ref1 (t__refqtmk1 (t__content1 (_ BitVec 32))))))

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

(declare-datatypes ()
  ((character__init_wrapper
   (character__init_wrapperqtmk (rec__value character)(us_attr__init Bool)))))

(declare-const dummy character__init_wrapper)

;; "dummy__def"
(assert (= (us_attr__init dummy) false))

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

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_112 us_t) (temp___is_init_108 Bool) (temp___skip_constant_109 Bool) (temp___do_toplevel_110 Bool) (temp___do_typ_inv_111 Bool)) Bool
  (=>
    (not (= temp___skip_constant_109 true))
    (dynamic_property
      1
      2147483647
      (first temp___expr_112)
      (last temp___expr_112))))

;; "valid_ipv4"
(declare-fun valid_ipv4 (us_t) Bool)

;; "valid_byte_10"
(declare-fun valid_byte_10 (us_t
  Int
  Int) Bool)

;; "find_first_dot"
(declare-fun find_first_dot (us_t
  Int) Int)

;; "find_first_dot__function_guard"
(declare-fun find_first_dot__function_guard (Int
  us_t
  Int) Bool)

;; "is_byte_10"
(declare-fun is_byte_10 (us_t
  Int
  Int
  (_ BitVec 8)) Bool)

;; "is_byte_10__function_guard"
(declare-fun is_byte_10__function_guard (Bool
  us_t
  Int
  Int
  (_ BitVec 8)) Bool)

(declare-const s us_t)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 32))

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

;; "less_than_byte_max_10"
(define-fun less_than_byte_max_10 ((param__s us_t) (param__first Int) (param__last Int)) Bool
  (or (< (to_rep (select (to_array param__s) param__first)) 50) (and (= 
  (to_rep
    (select (to_array param__s) param__first)) 50) (or (< (to_rep
                                                            (select (to_array
                                                                    param__s) (+ param__first 1))) 53) (and (= 
  (to_rep
    (select (to_array param__s) (+ param__first 1))) 53) (< (to_rep
                                                              (select 
                                                              (to_array
                                                                param__s) (+ param__first 2))) 54))))))

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 48 x) (<= x 57)))

;; "valid_byte_10__post_axiom"
(assert true)

;; "valid_byte_10__def_axiom"
(assert
  (forall ((param__s us_t))
    (forall ((param__first Int) (param__last Int))
      (! (=
           (= (valid_byte_10 param__s param__first param__last) true)
           (and
             (and
               (and
                 (<= param__first param__last)
                 (<= (- param__last param__first) 2))
               (forall ((i Int))
                 (=>
                   (and (<= param__first i) (<= i param__last))
                   (in_range3 (to_rep (select (to_array param__s) i))))))
             (=>
               (= (- param__last param__first) 2)
               (= (less_than_byte_max_10 param__s param__first param__last) true)))) :pattern (
      (valid_byte_10
        param__s
        param__first
        param__last)) ))))

;; "is_byte_10__post_axiom"
(assert
  (forall ((param__s us_t))
    (forall ((param__first Int) (param__last Int))
      (forall ((param__v (_ BitVec 8)))
        (! (=>
             (and
               (and
                 (and
                   (dynamic_invariant param__s true false true true)
                   (in_range param__first))
                 (in_range param__last))
               (and
                 (and
                   (<= (first param__s) param__first)
                   (<= param__first (last param__s)))
                 (and
                   (<= (first param__s) param__last)
                   (<= param__last (last param__s)))))
             (let ((result (is_byte_10
                             param__s
                             param__first
                             param__last
                             param__v)))
               (=>
                 (is_byte_10__function_guard
                   result
                   param__s
                   param__first
                   param__last
                   param__v)
                 (=>
                   (= result true)
                   (= (valid_byte_10 param__s param__first param__last) true))))) :pattern (
        (is_byte_10
          param__s
          param__first
          param__last
          param__v)) )))))

;; "is_byte_10__def_axiom"
(assert
  (forall ((param__s us_t))
    (forall ((param__first Int) (param__last Int))
      (forall ((param__v (_ BitVec 8)))
        (! (=
             (= (is_byte_10 param__s param__first param__last param__v) true)
             (and
               (and
                 (and
                   (and
                     (<= (- param__last 2) param__first)
                     (<= param__first param__last))
                   (= (char_of_byte_10 (bvurem param__v #x0A)) (to_rep
                                                                 (select 
                                                                 (to_array
                                                                   param__s) param__last))))
                 (= (char_of_byte_10 (bvurem (bvudiv param__v #x0A) #x0A)) 
                 (ite (< param__first param__last)
                   (to_rep (select (to_array param__s) (- param__last 1)))
                   48)))
               (= (char_of_byte_10 (bvudiv param__v #x64)) (ite (< param__first (- param__last 1))
                                                             (to_rep
                                                               (select 
                                                               (to_array
                                                                 param__s) (- param__last 2)))
                                                             48)))) :pattern (
        (is_byte_10
          param__s
          param__first
          param__last
          param__v)) )))))

;; "find_first_dot__post_axiom"
(assert
  (forall ((param__s us_t))
    (forall ((param__first Int))
      (! (=>
           (and
             (and
               (dynamic_invariant param__s true false true true)
               (in_range param__first))
             (and
               (< (last param__s) 2147483647)
               (and
                 (<= (first param__s) param__first)
                 (<= param__first (+ (last param__s) 1)))))
           (let ((result (find_first_dot param__s param__first)))
             (=>
               (find_first_dot__function_guard result param__s param__first)
               (and
                 (and
                   (and
                     (and
                       (<= param__first result)
                       (<= result (+ (last param__s) 1)))
                     (=>
                       (and
                         (<= (first param__s) result)
                         (<= result (last param__s)))
                       (= (to_rep (select (to_array param__s) result)) 46)))
                   (forall ((k Int))
                     (=>
                       (and (<= param__first k) (<= k (- result 1)))
                       (not (= (to_rep (select (to_array param__s) k)) 46)))))
                 (in_range result))))) :pattern ((find_first_dot
                                                   param__s
                                                   param__first)) ))))

;; "valid_ipv4__post_axiom"
(assert true)

;; "valid_ipv4__def_axiom"
(assert
  (forall ((param__s us_t))
    (! (and
         (forall ((temp___233 Int))
           (find_first_dot__function_guard
             (find_first_dot param__s temp___233)
             param__s
             temp___233))
         (and
           (forall ((temp___231 Int))
             (find_first_dot__function_guard
               (find_first_dot param__s temp___231)
               param__s
               temp___231))
           (and
             (forall ((temp___229 Int))
               (find_first_dot__function_guard
                 (find_first_dot param__s temp___229)
                 param__s
                 temp___229))
             (=
               (= (valid_ipv4 param__s) true)
               (and
                 (< 0 (length param__s))
                 (let ((d1 (let ((temp___233 (first param__s)))
                             (find_first_dot param__s temp___233))))
                   (let ((d2 (ite (= d1 (+ (last param__s) 1))
                               (+ (last param__s) 1)
                               (let ((temp___231 (+ d1 1)))
                                 (find_first_dot param__s temp___231)))))
                     (let ((d3 (ite (= d2 (+ (last param__s) 1))
                                 (+ (last param__s) 1)
                                 (let ((temp___229 (+ d2 1)))
                                   (find_first_dot param__s temp___229)))))
                       (and
                         (and
                           (and
                             (and
                               (and
                                 (and
                                   (<= d1 (last param__s))
                                   (= (valid_byte_10
                                        param__s
                                        (first param__s)
                                        (- d1 1)) true))
                                 (<= d2 (last param__s)))
                               (= (valid_byte_10 param__s (+ d1 1) (- d2 1)) true))
                             (<= d3 (last param__s)))
                           (= (valid_byte_10 param__s (+ d2 1) (- d3 1)) true))
                         (= (valid_byte_10 param__s (+ d3 1) (last param__s)) true)))))))))) :pattern (
    (valid_ipv4
      param__s)) )))

(declare-const byte (_ BitVec 8))

(declare-const error Bool)

;; "error'unused"
(define-fun errorqtunused () bool__ref
  (bool__refqtmk error))

;; "byte'unused"
(define-fun byteqtunused () t__ref
  (t__refqtmk byte))

;; "Assume"
(assert (dynamic_invariant s true false true true))

;; "Assume"
(assert (and (< (last s) 2147483647) (= (valid_ipv4 s) true)))

(declare-const v (_ BitVec 32))

;; "v'unused"
(define-fun vqtunused () t__ref1
  (t__refqtmk1 v))

;; "H"
(assert (= v #x00000000))

;; "Assume"
(assert true)

;; "o"
(define-fun o () Int
  (first s))

;; "first'result'unused"
(define-fun firstqtresultqtunused () Int
  o)

(declare-const first1 Int)

;; "first'unused"
(define-fun firstqtunused () int__ref
  (int__refqtmk first1))

;; "H"
(assert (= first1 o))

;; "Assume"
(assert (in_range first1))

;; "Assume"
(assert true)

;; "Assume"
(assert true)

;; "temp___loop_entry_534'unused"
(define-fun temp___loop_entry_534qtunused () Bool
  error)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  error)

;; "temp___loop_entry_533'unused"
(define-fun temp___loop_entry_533qtunused () (_ BitVec 8)
  byte)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused () (_ BitVec 8)
  byte)

;; "temp___loop_entry_532'unused"
(define-fun temp___loop_entry_532qtunused () Int
  first1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  first1)

;; "temp___loop_entry_531'unused"
(define-fun temp___loop_entry_531qtunused () (_ BitVec 32)
  v)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused1 () (_ BitVec 32)
  v)

(declare-const i Int)

;; "i'unused"
(define-fun iqtunused () int__ref
  (int__refqtmk i))

;; "H"
(assert (= i 1))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  first1)

;; "Ensures"
(assert (in_range1 first1))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  first1)

;; "param__first"
(define-fun param__first () int__ref
  (int__refqtmk first1))

;; "int__ref'mk'result'unused"
(define-fun int__refqtmkqtresultqtunused () int__ref
  param__first)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused2 () (_ BitVec 8)
  byte)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused1 () Bool
  error)

;; "o"
(define-fun o1 () us_t
  s)

;; "param__first'unused"
(define-fun param__firstqtunused () int__ref
  param__first)

(declare-const byte1 (_ BitVec 8))

(declare-const error1 Bool)

(declare-const param__first1 Int)

;; "param__first'unused"
(define-fun param__firstqtunused1 () int__ref
  (int__refqtmk param__first1))

;; "error'unused"
(define-fun errorqtunused1 () bool__ref
  (bool__refqtmk error1))

;; "byte'unused"
(define-fun byteqtunused1 () t__ref
  (t__refqtmk byte1))

;; "H"
(assert
  (forall ((o2 us_t))
    (find_first_dot__function_guard (find_first_dot o2 first1) o2 first1)))

;; "H"
(assert
  (forall ((o2 us_t))
    (find_first_dot__function_guard (find_first_dot o2 first1) o2 first1)))

;; "H"
(assert
  (forall ((o2 us_t) (temp___339 Int))
    (is_byte_10__function_guard
      (is_byte_10 o2 first1 temp___339 byte1)
      o2
      first1
      temp___339
      byte1)))

;; "H"
(assert (<= first1 param__first1))

;; "H"
(assert (<= param__first1 (+ (last o1) 1)))

;; "H"
(assert (<= (- param__first1 first1) 3))

;; "H"
(assert
  (=
    (= error1 true)
    (not (= (valid_byte_10 o1 first1 (- (find_first_dot o1 first1) 1)) true))))

;; "H"
(assert
  (=>
    (not (= error1 true))
    (and
      (= param__first1 (find_first_dot o1 first1))
      (= (let ((temp___339 (- param__first1 1)))
           (is_byte_10 o1 first1 temp___339 byte1)) true))))

;; "H"
(assert (in_range1 param__first1))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert true)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  param__first1)

;; "Ensures"
(assert (in_range param__first1))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  param__first1)

(declare-const first2 Int)

;; "first'unused"
(define-fun firstqtunused1 () int__ref
  (int__refqtmk first2))

;; "H"
(assert (= first2 param__first1))

;; "Assert"
(assert (not (= error1 true)))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused3 () (_ BitVec 8)
  byte1)

;; "o"
(define-fun o2 () (_ BitVec 32)
  ((_ zero_extend 24) byte1))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused () (_ BitVec 32)
  o2)

;; "o"
(define-fun o3 () (_ BitVec 32)
  ((_ int2bv 32) 8))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused () (_ BitVec 32)
  o3)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused4 () (_ BitVec 32)
  v)

;; "o"
(define-fun o4 () (_ BitVec 32)
  (bvshl v o3))

;; "lsl_bv'result'unused"
(define-fun lsl_bvqtresultqtunused () (_ BitVec 32)
  o4)

;; "o"
(define-fun o5 () (_ BitVec 32)
  (bvor o4 o2))

;; "bw_or'result'unused"
(define-fun bw_orqtresultqtunused () (_ BitVec 32)
  o5)

(declare-const v1 (_ BitVec 32))

;; "v'unused"
(define-fun vqtunused1 () t__ref1
  (t__refqtmk1 v1))

;; "H"
(assert (= v1 o5))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  i)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  (ite (= i 4) true false))

;; "H"
(assert (not (= i 4)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused4 () Int
  first2)

;; "o"
(define-fun o6 () Int
  (+ first2 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o6)

;; "Ensures"
(assert (in_range o6))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused2 () Int
  o6)

(declare-const first3 Int)

;; "first'unused"
(define-fun firstqtunused2 () int__ref
  (int__refqtmk first3))

;; "H"
(assert (= first3 o6))

(declare-const i1 Int)

;; "i'unused"
(define-fun iqtunused1 () int__ref
  (int__refqtmk i1))

;; "H"
(assert (= i1 2))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  first3)

;; "Ensures"
(assert (in_range1 first3))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  first3)

;; "param__first"
(define-fun param__first2 () int__ref
  (int__refqtmk first3))

;; "int__ref'mk'result'unused"
(define-fun int__refqtmkqtresultqtunused1 () int__ref
  param__first2)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused5 () (_ BitVec 8)
  byte1)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused2 () Bool
  error1)

;; "o"
(define-fun o7 () us_t
  s)

;; "param__first'unused"
(define-fun param__firstqtunused2 () int__ref
  param__first2)

(declare-const byte2 (_ BitVec 8))

(declare-const error2 Bool)

(declare-const param__first3 Int)

;; "param__first'unused"
(define-fun param__firstqtunused3 () int__ref
  (int__refqtmk param__first3))

;; "error'unused"
(define-fun errorqtunused2 () bool__ref
  (bool__refqtmk error2))

;; "byte'unused"
(define-fun byteqtunused2 () t__ref
  (t__refqtmk byte2))

;; "H"
(assert
  (forall ((o8 us_t))
    (find_first_dot__function_guard (find_first_dot o8 first3) o8 first3)))

;; "H"
(assert
  (forall ((o8 us_t))
    (find_first_dot__function_guard (find_first_dot o8 first3) o8 first3)))

;; "H"
(assert
  (forall ((o8 us_t) (temp___339 Int))
    (is_byte_10__function_guard
      (is_byte_10 o8 first3 temp___339 byte2)
      o8
      first3
      temp___339
      byte2)))

;; "H"
(assert (<= first3 param__first3))

;; "H"
(assert (<= param__first3 (+ (last o7) 1)))

;; "H"
(assert (<= (- param__first3 first3) 3))

;; "H"
(assert
  (=
    (= error2 true)
    (not (= (valid_byte_10 o7 first3 (- (find_first_dot o7 first3) 1)) true))))

;; "H"
(assert
  (=>
    (not (= error2 true))
    (and
      (= param__first3 (find_first_dot o7 first3))
      (= (let ((temp___339 (- param__first3 1)))
           (is_byte_10 o7 first3 temp___339 byte2)) true))))

;; "H"
(assert (in_range1 param__first3))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert true)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  param__first3)

;; "Ensures"
(assert (in_range param__first3))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused4 () Int
  param__first3)

(declare-const first4 Int)

;; "first'unused"
(define-fun firstqtunused3 () int__ref
  (int__refqtmk first4))

;; "H"
(assert (= first4 param__first3))

;; "Assert"
(assert (not (= error2 true)))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused6 () (_ BitVec 8)
  byte2)

;; "o"
(define-fun o8 () (_ BitVec 32)
  ((_ zero_extend 24) byte2))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused1 () (_ BitVec 32)
  o8)

;; "o"
(define-fun o9 () (_ BitVec 32)
  ((_ int2bv 32) 8))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused1 () (_ BitVec 32)
  o9)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused7 () (_ BitVec 32)
  v1)

;; "o"
(define-fun o10 () (_ BitVec 32)
  (bvshl v1 o9))

;; "lsl_bv'result'unused"
(define-fun lsl_bvqtresultqtunused1 () (_ BitVec 32)
  o10)

;; "o"
(define-fun o11 () (_ BitVec 32)
  (bvor o10 o8))

;; "bw_or'result'unused"
(define-fun bw_orqtresultqtunused1 () (_ BitVec 32)
  o11)

(declare-const v2 (_ BitVec 32))

;; "v'unused"
(define-fun vqtunused2 () t__ref1
  (t__refqtmk1 v2))

;; "H"
(assert (= v2 o11))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  i1)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused1 () Bool
  (ite (= i1 4) true false))

;; "H"
(assert (not (= i1 4)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused8 () Int
  first4)

;; "o"
(define-fun o12 () Int
  (+ first4 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o12)

;; "Ensures"
(assert (in_range o12))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused5 () Int
  o12)

(declare-const first5 Int)

;; "first'unused"
(define-fun firstqtunused4 () int__ref
  (int__refqtmk first5))

;; "H"
(assert (= first5 o12))

(declare-const i2 Int)

;; "i'unused"
(define-fun iqtunused2 () int__ref
  (int__refqtmk i2))

;; "H"
(assert (= i2 3))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  first5)

;; "Ensures"
(assert (in_range1 first5))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused6 () Int
  first5)

;; "param__first"
(define-fun param__first4 () int__ref
  (int__refqtmk first5))

;; "int__ref'mk'result'unused"
(define-fun int__refqtmkqtresultqtunused2 () int__ref
  param__first4)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused8 () (_ BitVec 8)
  byte2)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused3 () Bool
  error2)

;; "o"
(define-fun o13 () us_t
  s)

;; "param__first'unused"
(define-fun param__firstqtunused4 () int__ref
  param__first4)

(declare-const byte3 (_ BitVec 8))

(declare-const error3 Bool)

(declare-const param__first5 Int)

;; "param__first'unused"
(define-fun param__firstqtunused5 () int__ref
  (int__refqtmk param__first5))

;; "error'unused"
(define-fun errorqtunused3 () bool__ref
  (bool__refqtmk error3))

;; "byte'unused"
(define-fun byteqtunused3 () t__ref
  (t__refqtmk byte3))

;; "H"
(assert
  (forall ((o14 us_t))
    (find_first_dot__function_guard (find_first_dot o14 first5) o14 first5)))

;; "H"
(assert
  (forall ((o14 us_t))
    (find_first_dot__function_guard (find_first_dot o14 first5) o14 first5)))

;; "H"
(assert
  (forall ((o14 us_t) (temp___339 Int))
    (is_byte_10__function_guard
      (is_byte_10 o14 first5 temp___339 byte3)
      o14
      first5
      temp___339
      byte3)))

;; "H"
(assert (<= first5 param__first5))

;; "H"
(assert (<= param__first5 (+ (last o13) 1)))

;; "H"
(assert (<= (- param__first5 first5) 3))

;; "H"
(assert
  (=
    (= error3 true)
    (not
      (= (valid_byte_10 o13 first5 (- (find_first_dot o13 first5) 1)) true))))

;; "H"
(assert
  (=>
    (not (= error3 true))
    (and
      (= param__first5 (find_first_dot o13 first5))
      (= (let ((temp___339 (- param__first5 1)))
           (is_byte_10 o13 first5 temp___339 byte3)) true))))

;; "H"
(assert (in_range1 param__first5))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert true)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  param__first5)

;; "Ensures"
(assert (in_range param__first5))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused7 () Int
  param__first5)

(declare-const first6 Int)

;; "first'unused"
(define-fun firstqtunused5 () int__ref
  (int__refqtmk first6))

;; "H"
(assert (= first6 param__first5))

;; "Assert"
(assert (not (= error3 true)))

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused9 () (_ BitVec 8)
  byte3)

;; "o"
(define-fun o14 () (_ BitVec 32)
  ((_ zero_extend 24) byte3))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused2 () (_ BitVec 32)
  o14)

;; "o"
(define-fun o15 () (_ BitVec 32)
  ((_ int2bv 32) 8))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused2 () (_ BitVec 32)
  o15)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused10 () (_ BitVec 32)
  v2)

;; "o"
(define-fun o16 () (_ BitVec 32)
  (bvshl v2 o15))

;; "lsl_bv'result'unused"
(define-fun lsl_bvqtresultqtunused2 () (_ BitVec 32)
  o16)

;; "o"
(define-fun o17 () (_ BitVec 32)
  (bvor o16 o14))

;; "bw_or'result'unused"
(define-fun bw_orqtresultqtunused2 () (_ BitVec 32)
  o17)

(declare-const v3 (_ BitVec 32))

;; "v'unused"
(define-fun vqtunused3 () t__ref1
  (t__refqtmk1 v3))

;; "H"
(assert (= v3 o17))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused11 () Int
  i2)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused2 () Bool
  (ite (= i2 4) true false))

;; "H"
(assert (not (= i2 4)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused12 () Int
  first6)

;; "o"
(define-fun o18 () Int
  (+ first6 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused2 () Int
  o18)

;; "Ensures"
(assert (in_range o18))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused8 () Int
  o18)

(declare-const first7 Int)

;; "first'unused"
(define-fun firstqtunused6 () int__ref
  (int__refqtmk first7))

;; "H"
(assert (= first7 o18))

(declare-const i3 Int)

;; "i'unused"
(define-fun iqtunused3 () int__ref
  (int__refqtmk i3))

;; "H"
(assert (= i3 4))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused13 () Int
  first7)

;; "Ensures"
(assert (in_range1 first7))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused9 () Int
  first7)

;; "param__first"
(define-fun param__first6 () int__ref
  (int__refqtmk first7))

;; "int__ref'mk'result'unused"
(define-fun int__refqtmkqtresultqtunused3 () int__ref
  param__first6)

;; "t__content'result'unused"
(define-fun t__contentqtresultqtunused11 () (_ BitVec 8)
  byte3)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused4 () Bool
  error3)

;; "o"
(define-fun o19 () us_t
  s)

;; "param__first'unused"
(define-fun param__firstqtunused6 () int__ref
  param__first6)

(declare-const byte4 (_ BitVec 8))

(declare-const error4 Bool)

(declare-const param__first7 Int)

;; "param__first'unused"
(define-fun param__firstqtunused7 () int__ref
  (int__refqtmk param__first7))

;; "error'unused"
(define-fun errorqtunused4 () bool__ref
  (bool__refqtmk error4))

;; "byte'unused"
(define-fun byteqtunused4 () t__ref
  (t__refqtmk byte4))

;; "H"
(assert
  (forall ((o20 us_t))
    (find_first_dot__function_guard (find_first_dot o20 first7) o20 first7)))

;; "H"
(assert
  (forall ((o20 us_t))
    (find_first_dot__function_guard (find_first_dot o20 first7) o20 first7)))

;; "H"
(assert
  (forall ((o20 us_t) (temp___339 Int))
    (is_byte_10__function_guard
      (is_byte_10 o20 first7 temp___339 byte4)
      o20
      first7
      temp___339
      byte4)))

;; "H"
(assert (<= first7 param__first7))

;; "H"
(assert (<= param__first7 (+ (last o19) 1)))

;; "H"
(assert (<= (- param__first7 first7) 3))

;; "H"
(assert
  (=
    (= error4 true)
    (not
      (= (valid_byte_10 o19 first7 (- (find_first_dot o19 first7) 1)) true))))

;; "H"
(assert
  (=>
    (not (= error4 true))
    (and
      (= param__first7 (find_first_dot o19 first7))
      (= (let ((temp___339 (- param__first7 1)))
           (is_byte_10 o19 first7 temp___339 byte4)) true))))

;; "H"
(assert (in_range1 param__first7))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert true)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused14 () Int
  param__first7)

;; "Ensures"
(assert (in_range param__first7))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused10 () Int
  param__first7)

(declare-const first8 Int)

;; "first'unused"
(define-fun firstqtunused7 () int__ref
  (int__refqtmk first8))

;; "H"
(assert (= first8 param__first7))

;; Goal "def'vc"
;; File "ipv4_parsing.ads", line 113, characters 0-0
(assert
  (not (not (= error4 true))))

(check-sat)