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

(declare-const two_power_size_minus_one Int)

(declare-const two_power_size_minus_one1 Int)

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

;; "valid_byte_10"
(declare-fun valid_byte_10 (us_t
  Int
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

;; "find_first_dot"
(declare-fun find_first_dot (us_t
  Int) Int)

;; "find_first_dot__function_guard"
(declare-fun find_first_dot__function_guard (Int
  us_t
  Int) Bool)

;; "valid_ipv4"
(declare-fun valid_ipv4 (us_t) Bool)

(declare-const s us_t)

(declare-const v (_ BitVec 32))

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 32))

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

;; "Assume"
(assert (dynamic_invariant s true false true true))

;; "Assume"
(assert true)

;; "Assume"
(assert (and (< (last s) 2147483647) (= (valid_ipv4 s) true)))

;; "o"
(define-fun o () Int
  (first s))

;; "first'result'unused"
(define-fun firstqtresultqtunused () Int
  o)

;; "o"
(define-fun o1 () us_t
  s)

;; "o"
(define-fun o2 () Int
  (find_first_dot o1 o))

;; "H"
(assert (find_first_dot__function_guard o2 o1 o))

;; "H"
(assert (in_range o2))

;; "H"
(assert (<= o o2))

;; "H"
(assert (<= o2 (+ (last o1) 1)))

;; "H"
(assert
  (=>
    (and (<= (first o1) o2) (<= o2 (last o1)))
    (= (to_rep (select (to_array o1) o2)) 46)))

;; "H"
(assert
  (forall ((k Int))
    (=>
      (and (<= o k) (<= k (- o2 1)))
      (not (= (to_rep (select (to_array o1) k)) 46)))))

;; "find_first_dot'result'unused"
(define-fun find_first_dotqtresultqtunused () Int
  o2)

;; "d1'unused"
(define-fun d1qtunused () Int
  o2)

;; "Ensures"
(assert (in_range1 o2))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o2)

;; "o"
(define-fun o3 () Int
  (+ o2 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o3)

;; "Ensures"
(assert (in_range o3))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o3)

;; "o"
(define-fun o4 () us_t
  s)

;; "o"
(define-fun o5 () Int
  (find_first_dot o4 o3))

;; "H"
(assert (find_first_dot__function_guard o5 o4 o3))

;; "H"
(assert (in_range o5))

;; "H"
(assert (<= o3 o5))

;; "H"
(assert (<= o5 (+ (last o4) 1)))

;; "H"
(assert
  (=>
    (and (<= (first o4) o5) (<= o5 (last o4)))
    (= (to_rep (select (to_array o4) o5)) 46)))

;; "H"
(assert
  (forall ((k Int))
    (=>
      (and (<= o3 k) (<= k (- o5 1)))
      (not (= (to_rep (select (to_array o4) k)) 46)))))

;; "find_first_dot'result'unused"
(define-fun find_first_dotqtresultqtunused1 () Int
  o5)

;; "d2'unused"
(define-fun d2qtunused () Int
  o5)

;; "Ensures"
(assert (in_range1 o5))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused2 () Int
  o5)

;; "o"
(define-fun o6 () Int
  (+ o5 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o6)

;; "Ensures"
(assert (in_range o6))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o6)

;; "o"
(define-fun o7 () us_t
  s)

;; "o"
(define-fun o8 () Int
  (find_first_dot o7 o6))

;; "H"
(assert (find_first_dot__function_guard o8 o7 o6))

;; "H"
(assert (in_range o8))

;; "H"
(assert (<= o6 o8))

;; "H"
(assert (<= o8 (+ (last o7) 1)))

;; "H"
(assert
  (=>
    (and (<= (first o7) o8) (<= o8 (last o7)))
    (= (to_rep (select (to_array o7) o8)) 46)))

;; "H"
(assert
  (forall ((k Int))
    (=>
      (and (<= o6 k) (<= k (- o8 1)))
      (not (= (to_rep (select (to_array o7) k)) 46)))))

;; "find_first_dot'result'unused"
(define-fun find_first_dotqtresultqtunused2 () Int
  o8)

;; "d3'unused"
(define-fun d3qtunused () Int
  o8)

;; "Ensures"
(assert (in_range1 o8))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused4 () Int
  o8)

(declare-const o9 Bool)

(declare-const o10 (_ BitVec 32))

;; "H"
(assert (= o10 ((_ int2bv 32) 24)))

(declare-const of_intqtresultqtunused (_ BitVec 32))

;; "H"
(assert (= of_intqtresultqtunused o10))

(declare-const o11 (_ BitVec 32))

;; "H"
(assert (= o11 (bvlshr v o10)))

(declare-const lsr_bvqtresultqtunused (_ BitVec 32))

;; "H"
(assert (= lsr_bvqtresultqtunused o11))

(declare-const toBigqtresultqtunused (_ BitVec 32))

;; "H"
(assert (= toBigqtresultqtunused ((_ zero_extend 24) #xFF)))

(declare-const toBigqtresultqtunused1 (_ BitVec 32))

;; "H"
(assert (= toBigqtresultqtunused1 ((_ zero_extend 24) #x00)))

(declare-const range_check_qtresultqtunused5 (_ BitVec 32))

;; "H"
(assert (= range_check_qtresultqtunused5 o11))

(declare-const o12 (_ BitVec 8))

;; "H"
(assert (= o12 ((_ extract 7 0) o11)))

(declare-const toSmallqtresultqtunused (_ BitVec 8))

;; "H"
(assert (= toSmallqtresultqtunused o12))

(declare-const o13 Int)

;; "H"
(assert (= o13 (- o2 1)))

(declare-const infix_mnqtresultqtunused Int)

;; "H"
(assert (= infix_mnqtresultqtunused o13))

(declare-const o14 Int)

;; "H"
(assert (= o14 (first s)))

(declare-const firstqtresultqtunused1 Int)

;; "H"
(assert (= firstqtresultqtunused1 o14))

(declare-const o15 us_t)

;; "H"
(assert (= o15 s))

(declare-const o16 Bool)

;; "H"
(assert (= o16 (is_byte_10 o15 o14 o13 o12)))

;; "H"
(assert (is_byte_10__function_guard o16 o15 o14 o13 o12))

;; "H"
(assert
  (=
    (= o16 true)
    (and
      (and
        (and
          (and (<= (- o13 2) o14) (<= o14 o13))
          (= (char_of_byte_10 (bvurem o12 #x0A)) (to_rep
                                                   (select (to_array o15) 
                                                   o13))))
        (= (char_of_byte_10 (bvurem (bvudiv o12 #x0A) #x0A)) (ite (< 
                                                               o14 o13)
                                                               (to_rep
                                                                 (select 
                                                                 (to_array
                                                                   o15) (- 
                                                                 o13 1)))
                                                               48)))
      (= (char_of_byte_10 (bvudiv o12 #x64)) (ite (< o14 (- o13 1))
                                               (to_rep
                                                 (select (to_array o15) (- 
                                                 o13 2)))
                                               48)))))

;; "H"
(assert (=> (= o16 true) (= (valid_byte_10 o15 o14 o13) true)))

(declare-const is_byte_10qtresultqtunused Bool)

;; "H"
(assert (= is_byte_10qtresultqtunused o16))

(declare-const o17 Bool)

(declare-const o18 (_ BitVec 32))

(declare-const of_intqtresultqtunused1 (_ BitVec 32))

(declare-const o19 (_ BitVec 32))

(declare-const lsr_bvqtresultqtunused1 (_ BitVec 32))

(declare-const o20 (_ BitVec 32))

(declare-const bw_andqtresultqtunused (_ BitVec 32))

(declare-const toBigqtresultqtunused2 (_ BitVec 32))

(declare-const toBigqtresultqtunused3 (_ BitVec 32))

(declare-const range_check_qtresultqtunused6 (_ BitVec 32))

(declare-const o21 (_ BitVec 8))

(declare-const toSmallqtresultqtunused1 (_ BitVec 8))

(declare-const o22 Int)

(declare-const infix_mnqtresultqtunused1 Int)

(declare-const o23 Int)

(declare-const infix_plqtresultqtunused2 Int)

(declare-const range_check_qtresultqtunused7 Int)

(declare-const o24 us_t)

(declare-const is_byte_10qtresultqtunused1 Bool)

;; "H"
(assert
  (ite (= o16 true)
    (and
      (= o18 ((_ int2bv 32) 16))
      (and
        (= of_intqtresultqtunused1 o18)
        (and
          (= o19 (bvlshr v o18))
          (and
            (= lsr_bvqtresultqtunused1 o19)
            (and
              (= o20 (bvand o19 #x000000FF))
              (and
                (= bw_andqtresultqtunused o20)
                (and
                  (= toBigqtresultqtunused2 ((_ zero_extend 24) #xFF))
                  (and
                    (= toBigqtresultqtunused3 ((_ zero_extend 24) #x00))
                    (and
                      (= range_check_qtresultqtunused6 o20)
                      (and
                        (= o21 ((_ extract 7 0) o20))
                        (and
                          (= toSmallqtresultqtunused1 o21)
                          (and
                            (= o22 (- o5 1))
                            (and
                              (= infix_mnqtresultqtunused1 o22)
                              (and
                                (= o23 (+ o2 1))
                                (and
                                  (= infix_plqtresultqtunused2 o23)
                                  (and
                                    (in_range o23)
                                    (and
                                      (= range_check_qtresultqtunused7 
                                      o23)
                                      (and
                                        (= o24 s)
                                        (and
                                          (= o17 (is_byte_10 o24 o23 o22 o21))
                                          (and
                                            (and
                                              (is_byte_10__function_guard
                                                o17
                                                o24
                                                o23
                                                o22
                                                o21)
                                              (and
                                                (=
                                                  (= o17 true)
                                                  (and
                                                    (and
                                                      (and
                                                        (and
                                                          (<= (- o22 2) 
                                                          o23)
                                                          (<= o23 o22))
                                                        (= (char_of_byte_10
                                                             (bvurem 
                                                             o21 #x0A)) 
                                                        (to_rep
                                                          (select (to_array
                                                                    o24) 
                                                          o22))))
                                                      (= (char_of_byte_10
                                                           (bvurem (bvudiv 
                                                           o21 #x0A) #x0A)) 
                                                      (ite (< o23 o22)
                                                        (to_rep
                                                          (select (to_array
                                                                    o24) (- 
                                                          o22 1)))
                                                        48)))
                                                    (= (char_of_byte_10
                                                         (bvudiv o21 #x64)) 
                                                    (ite (< o23 (- o22 1))
                                                      (to_rep
                                                        (select (to_array
                                                                  o24) (- 
                                                        o22 2)))
                                                      48))))
                                                (=>
                                                  (= o17 true)
                                                  (= (valid_byte_10
                                                       o24
                                                       o23
                                                       o22) true))))
                                            (= is_byte_10qtresultqtunused1 
                                            o17)))))))))))))))))))))
    (= o17 false)))

(declare-const o25 (_ BitVec 32))

(declare-const of_intqtresultqtunused2 (_ BitVec 32))

(declare-const o26 (_ BitVec 32))

(declare-const lsr_bvqtresultqtunused2 (_ BitVec 32))

(declare-const o27 (_ BitVec 32))

(declare-const bw_andqtresultqtunused1 (_ BitVec 32))

(declare-const toBigqtresultqtunused4 (_ BitVec 32))

(declare-const toBigqtresultqtunused5 (_ BitVec 32))

(declare-const range_check_qtresultqtunused8 (_ BitVec 32))

(declare-const o28 (_ BitVec 8))

(declare-const toSmallqtresultqtunused2 (_ BitVec 8))

(declare-const o29 Int)

(declare-const infix_mnqtresultqtunused2 Int)

(declare-const o30 Int)

(declare-const infix_plqtresultqtunused3 Int)

(declare-const range_check_qtresultqtunused9 Int)

(declare-const o31 us_t)

(declare-const is_byte_10qtresultqtunused2 Bool)

;; "H"
(assert
  (ite (= o17 true)
    (and
      (= o25 ((_ int2bv 32) 8))
      (and
        (= of_intqtresultqtunused2 o25)
        (and
          (= o26 (bvlshr v o25))
          (and
            (= lsr_bvqtresultqtunused2 o26)
            (and
              (= o27 (bvand o26 #x000000FF))
              (and
                (= bw_andqtresultqtunused1 o27)
                (and
                  (= toBigqtresultqtunused4 ((_ zero_extend 24) #xFF))
                  (and
                    (= toBigqtresultqtunused5 ((_ zero_extend 24) #x00))
                    (and
                      (= range_check_qtresultqtunused8 o27)
                      (and
                        (= o28 ((_ extract 7 0) o27))
                        (and
                          (= toSmallqtresultqtunused2 o28)
                          (and
                            (= o29 (- o8 1))
                            (and
                              (= infix_mnqtresultqtunused2 o29)
                              (and
                                (= o30 (+ o5 1))
                                (and
                                  (= infix_plqtresultqtunused3 o30)
                                  (and
                                    (in_range o30)
                                    (and
                                      (= range_check_qtresultqtunused9 
                                      o30)
                                      (and
                                        (= o31 s)
                                        (and
                                          (= o9 (is_byte_10 o31 o30 o29 o28))
                                          (and
                                            (and
                                              (is_byte_10__function_guard
                                                o9
                                                o31
                                                o30
                                                o29
                                                o28)
                                              (and
                                                (=
                                                  (= o9 true)
                                                  (and
                                                    (and
                                                      (and
                                                        (and
                                                          (<= (- o29 2) 
                                                          o30)
                                                          (<= o30 o29))
                                                        (= (char_of_byte_10
                                                             (bvurem 
                                                             o28 #x0A)) 
                                                        (to_rep
                                                          (select (to_array
                                                                    o31) 
                                                          o29))))
                                                      (= (char_of_byte_10
                                                           (bvurem (bvudiv 
                                                           o28 #x0A) #x0A)) 
                                                      (ite (< o30 o29)
                                                        (to_rep
                                                          (select (to_array
                                                                    o31) (- 
                                                          o29 1)))
                                                        48)))
                                                    (= (char_of_byte_10
                                                         (bvudiv o28 #x64)) 
                                                    (ite (< o30 (- o29 1))
                                                      (to_rep
                                                        (select (to_array
                                                                  o31) (- 
                                                        o29 2)))
                                                      48))))
                                                (=>
                                                  (= o9 true)
                                                  (= (valid_byte_10
                                                       o31
                                                       o30
                                                       o29) true))))
                                            (= is_byte_10qtresultqtunused2 
                                            o9)))))))))))))))))))))
    (= o9 false)))

;; "H"
(assert (= o9 true))

;; "o"
(define-fun o32 () (_ BitVec 32)
  (bvand v #x000000FF))

;; "bw_and'result'unused"
(define-fun bw_andqtresultqtunused2 () (_ BitVec 32)
  o32)

;; "o"
(define-fun o33 () (_ BitVec 32)
  ((_ zero_extend 24) #xFF))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused6 () (_ BitVec 32)
  o33)

;; "o"
(define-fun o34 () (_ BitVec 32)
  ((_ zero_extend 24) #x00))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused7 () (_ BitVec 32)
  o34)

;; Goal "def'vc"
;; File "ipv4_parsing.ads", line 78, characters 0-0
(assert
  (not (bvule o32 o33)))

(check-sat)
