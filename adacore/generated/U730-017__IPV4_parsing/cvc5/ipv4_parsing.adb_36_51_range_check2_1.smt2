;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "pow2"
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one (pow2 (- 8 1))))

;; "min"
(define-fun min ((x Int) (y Int)) Int
  (ite (<= x y) x y))

;; "max"
(define-fun max ((x Int) (y Int)) Int
  (ite (<= x y) y x))

;; "Min_r"
(assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; "Max_l"
(assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; "Min_comm"
(assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; "Max_comm"
(assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; "Min_assoc"
(assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; "Max_assoc"
(assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

;; "lsr"
(declare-fun lsr ((_ BitVec 32)
  Int) (_ BitVec 32))

(declare-const two_power_size_minus_one1 Int)

;; "two_power_size_minus_one_val"
(assert (= two_power_size_minus_one1 (pow2 (- 32 1))))

;; "lsr_bv_is_lsr"
(assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvlshr x n) (lsr x (bv2nat n)))))

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

(declare-datatypes ((character__init_wrapper 0))
  (((character__init_wrapperqtmk (rec__value character)(us_attr__init Bool)))))

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

;; "find_first_dot"
(declare-fun find_first_dot (us_t
  Int) Int)

;; "find_first_dot__function_guard"
(declare-fun find_first_dot__function_guard (Int
  us_t
  Int) Bool)

;; "valid_ipv4"
(declare-fun valid_ipv4 (us_t) Bool)

;; "valid_byte_10"
(declare-fun valid_byte_10 (us_t
  Int
  Int) Bool)

;; "is_ipv4"
(declare-fun is_ipv4 (us_t
  (_ BitVec 32)) Bool)

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

(declare-const v1 (_ BitVec 32))

(declare-const v2 (_ BitVec 32))

(declare-const d1 Int)

(declare-const d2 Int)

(declare-const d3 Int)

(declare-const v1_1 (_ BitVec 8))

(declare-const v1_2 (_ BitVec 8))

(declare-const v1_3 (_ BitVec 8))

(declare-const v1_4 (_ BitVec 8))

(declare-const v2_1 (_ BitVec 8))

(declare-const v2_2 (_ BitVec 8))

(declare-const v2_3 (_ BitVec 8))

(declare-const v2_4 (_ BitVec 8))

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
                 (let ((d11 (let ((temp___233 (first param__s)))
                              (find_first_dot param__s temp___233))))
                   (let ((d21 (ite (= d11 (+ (last param__s) 1))
                                (+ (last param__s) 1)
                                (let ((temp___231 (+ d11 1)))
                                  (find_first_dot param__s temp___231)))))
                     (let ((d31 (ite (= d21 (+ (last param__s) 1))
                                  (+ (last param__s) 1)
                                  (let ((temp___229 (+ d21 1)))
                                    (find_first_dot param__s temp___229)))))
                       (and
                         (and
                           (and
                             (and
                               (and
                                 (and
                                   (<= d11 (last param__s))
                                   (= (valid_byte_10
                                        param__s
                                        (first param__s)
                                        (- d11 1)) true))
                                 (<= d21 (last param__s)))
                               (= (valid_byte_10
                                    param__s
                                    (+ d11 1)
                                    (- d21 1)) true))
                             (<= d31 (last param__s)))
                           (= (valid_byte_10 param__s (+ d21 1) (- d31 1)) true))
                         (= (valid_byte_10
                              param__s
                              (+ d31 1)
                              (last param__s)) true)))))))))) :pattern (
    (valid_ipv4
      param__s)) )))

;; "is_ipv4__post_axiom"
(assert true)

;; "is_ipv4__def_axiom"
(assert
  (forall ((param__s us_t))
    (forall ((param__v (_ BitVec 32)))
      (! (and
           (forall ((temp___285 Int))
             (find_first_dot__function_guard
               (find_first_dot param__s temp___285)
               param__s
               temp___285))
           (and
             (forall ((temp___283 Int))
               (find_first_dot__function_guard
                 (find_first_dot param__s temp___283)
                 param__s
                 temp___283))
             (and
               (forall ((temp___281 Int))
                 (find_first_dot__function_guard
                   (find_first_dot param__s temp___281)
                   param__s
                   temp___281))
               (and
                 (forall ((temp___267 (_ BitVec 8)) (temp___266 Int) (temp___265 Int))
                   (is_byte_10__function_guard
                     (is_byte_10 param__s temp___265 temp___266 temp___267)
                     param__s
                     temp___265
                     temp___266
                     temp___267))
                 (and
                   (forall ((temp___271 (_ BitVec 8)) (temp___270 Int) (temp___269 Int))
                     (is_byte_10__function_guard
                       (is_byte_10 param__s temp___269 temp___270 temp___271)
                       param__s
                       temp___269
                       temp___270
                       temp___271))
                   (and
                     (forall ((temp___275 (_ BitVec 8)) (temp___274 Int) (temp___273 Int))
                       (is_byte_10__function_guard
                         (is_byte_10
                           param__s
                           temp___273
                           temp___274
                           temp___275)
                         param__s
                         temp___273
                         temp___274
                         temp___275))
                     (and
                       (forall ((temp___279 (_ BitVec 8)) (temp___278 Int) (temp___277 Int))
                         (is_byte_10__function_guard
                           (is_byte_10
                             param__s
                             temp___277
                             temp___278
                             temp___279)
                           param__s
                           temp___277
                           temp___278
                           temp___279))
                       (=
                         (= (is_ipv4 param__s param__v) true)
                         (let ((d11 (let ((temp___285 (first param__s)))
                                      (find_first_dot param__s temp___285))))
                           (let ((d21 (let ((temp___283 (+ d11 1)))
                                        (find_first_dot param__s temp___283))))
                             (let ((d31 (let ((temp___281 (+ d21 1)))
                                          (find_first_dot
                                            param__s
                                            temp___281))))
                               (and
                                 (and
                                   (and
                                     (= (let ((temp___267 ((_ extract 7 0) (bvlshr param__v ((_ int2bv 32) 24)))))
                                          (let ((temp___266 (- d11 1)))
                                            (let ((temp___265 (first
                                                                param__s)))
                                              (is_byte_10
                                                param__s
                                                temp___265
                                                temp___266
                                                temp___267)))) true)
                                     (= (let ((temp___271 ((_ extract 7 0) (bvand (bvlshr param__v ((_ int2bv 32) 16)) #x000000FF))))
                                          (let ((temp___270 (- d21 1)))
                                            (let ((temp___269 (+ d11 1)))
                                              (is_byte_10
                                                param__s
                                                temp___269
                                                temp___270
                                                temp___271)))) true))
                                   (= (let ((temp___275 ((_ extract 7 0) (bvand (bvlshr param__v ((_ int2bv 32) 8)) #x000000FF))))
                                        (let ((temp___274 (- d31 1)))
                                          (let ((temp___273 (+ d21 1)))
                                            (is_byte_10
                                              param__s
                                              temp___273
                                              temp___274
                                              temp___275)))) true))
                                 (= (let ((temp___279 ((_ extract 7 0) (bvand param__v #x000000FF))))
                                      (let ((temp___278 (last param__s)))
                                        (let ((temp___277 (+ d31 1)))
                                          (is_byte_10
                                            param__s
                                            temp___277
                                            temp___278
                                            temp___279)))) true))))))))))))) :pattern (
      (is_ipv4
        param__s
        param__v)) ))))

;; Goal "def'vc"
;; File "ipv4_parsing.ads", line 94, characters 0-0
(assert
  (not
  (=>
    (dynamic_invariant s true false true true)
    (=>
      (and
        (and
          (and (< (last s) 2147483647) (= (valid_ipv4 s) true))
          (= (is_ipv4 s v1) true))
        (= (is_ipv4 s v2) true))
      (let ((o (first s)))
        (let ((o1 s))
          (let ((o2 (find_first_dot o1 o)))
            (=>
              (and
                (find_first_dot__function_guard o2 o1 o)
                (and
                  (in_range o2)
                  (and
                    (and
                      (and (<= o o2) (<= o2 (+ (last o1) 1)))
                      (=>
                        (and (<= (first o1) o2) (<= o2 (last o1)))
                        (= (to_rep (select (to_array o1) o2)) 46)))
                    (forall ((k Int))
                      (=>
                        (and (<= o k) (<= k (- o2 1)))
                        (not (= (to_rep (select (to_array o1) k)) 46)))))))
              (=>
                (in_range1 o2)
                (=>
                  (= o2 d1)
                  (=>
                    (in_range1 d1)
                    (let ((o3 (+ d1 1)))
                      (=>
                        (in_range o3)
                        (let ((o4 s))
                          (let ((o5 (find_first_dot o4 o3)))
                            (=>
                              (and
                                (find_first_dot__function_guard o5 o4 o3)
                                (and
                                  (in_range o5)
                                  (and
                                    (and
                                      (and
                                        (<= o3 o5)
                                        (<= o5 (+ (last o4) 1)))
                                      (=>
                                        (and
                                          (<= (first o4) o5)
                                          (<= o5 (last o4)))
                                        (= (to_rep (select (to_array o4) o5)) 46)))
                                    (forall ((k Int))
                                      (=>
                                        (and (<= o3 k) (<= k (- o5 1)))
                                        (not
                                          (= (to_rep
                                               (select (to_array o4) k)) 46)))))))
                              (=>
                                (in_range1 o5)
                                (=>
                                  (= o5 d2)
                                  (=>
                                    (in_range1 d2)
                                    (let ((o6 (+ d2 1)))
                                      (=>
                                        (in_range o6)
                                        (let ((o7 s))
                                          (let ((o8 (find_first_dot o7 o6)))
                                            (=>
                                              (and
                                                (find_first_dot__function_guard
                                                  o8
                                                  o7
                                                  o6)
                                                (and
                                                  (in_range o8)
                                                  (and
                                                    (and
                                                      (and
                                                        (<= o6 o8)
                                                        (<= o8 (+ (last o7) 1)))
                                                      (=>
                                                        (and
                                                          (<= (first o7) o8)
                                                          (<= o8 (last o7)))
                                                        (= (to_rep
                                                             (select 
                                                             (to_array
                                                               o7) o8)) 46)))
                                                    (forall ((k Int))
                                                      (=>
                                                        (and
                                                          (<= o6 k)
                                                          (<= k (- o8 1)))
                                                        (not
                                                          (= (to_rep
                                                               (select 
                                                               (to_array
                                                                 o7) k)) 46)))))))
                                              (=>
                                                (in_range1 o8)
                                                (=>
                                                  (= o8 d3)
                                                  (=>
                                                    (in_range1 d3)
                                                    (=>
                                                      (= ((_ extract 7 0) (bvlshr 
                                                      v1 ((_ int2bv 32) 24))) 
                                                      v1_1)
                                                      (=>
                                                        (= ((_ extract 7 0) (bvand (bvlshr 
                                                        v1 ((_ int2bv 32) 16)) #x000000FF)) 
                                                        v1_2)
                                                        (=>
                                                          (= ((_ extract 7 0) (bvand (bvlshr 
                                                          v1 ((_ int2bv 32) 8)) #x000000FF)) 
                                                          v1_3)
                                                          (=>
                                                            (= ((_ extract 7 0) (bvand 
                                                            v1 #x000000FF)) 
                                                            v1_4)
                                                            (=>
                                                              (= ((_ extract 7 0) (bvlshr 
                                                              v2 ((_ int2bv 32) 24))) 
                                                              v2_1)
                                                              (=>
                                                                (= ((_ extract 7 0) (bvand (bvlshr 
                                                                v2 ((_ int2bv 32) 16)) #x000000FF)) 
                                                                v2_2)
                                                                (=>
                                                                  (= ((_ extract 7 0) (bvand (bvlshr 
                                                                  v2 ((_ int2bv 32) 8)) #x000000FF)) 
                                                                  v2_3)
                                                                  (bvule (bvand 
                                                                  v2 #x000000FF) ((_ zero_extend 24) #xFF))))))))))))))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
