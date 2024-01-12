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
             (= (to_rep1 (rec__first (mk f l))) f)
             (= (to_rep1 (rec__last (mk f l))) l)))) :pattern ((mk f l)) )))

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

;; "of_array"
(define-fun of_array ((a (Array Int character)) (f Int) (l Int)) us_t
  (us_tqtmk a (mk f l)))

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

;; "find_first_dot"
(declare-fun find_first_dot (us_t
  Int) Int)

;; "find_first_dot__function_guard"
(declare-fun find_first_dot__function_guard (Int
  us_t
  Int) Bool)

;; "is_smallest_byte_10"
(declare-fun is_smallest_byte_10 (us_t
  (_ BitVec 8)) Bool)

(declare-const s us_t)

(declare-const d1 Int)

(declare-const d2 Int)

(declare-const d3 Int)

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
                 (= (to_rep (select (to_array param__s) (last param__s))) 
                 (char_of_byte_10
                   (bvurem param__v #x0A))))
               (=>
                 (bvuge param__v #x0A)
                 (= (to_rep
                      (select (to_array param__s) (- (last param__s) 1))) 
                 (char_of_byte_10
                   (bvurem (bvudiv param__v #x0A) #x0A)))))
             (=>
               (bvuge param__v #x64)
               (= (to_rep (select (to_array param__s) (first param__s))) 
               (char_of_byte_10
                 (bvudiv param__v #x64)))))) :pattern ((is_smallest_byte_10
                                                         param__s
                                                         param__v)) ))))

;; Goal "def'vc"
;; File "ipv4_parsing.adb", line 178, characters 0-0
(assert
  (not
  (=>
    (dynamic_invariant s true false true true)
    (=>
      (in_range1 d1)
      (=>
        (in_range1 d2)
        (=>
          (in_range1 d3)
          (=>
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (and
                          (and
                            (and
                              (and
                                (and
                                  (< (last s) 2147483647)
                                  (< 0 (length s)))
                                (and (<= (first s) d1) (<= d1 (last s))))
                              (and (<= (+ d1 1) d2) (<= d2 (last s))))
                            (and (<= (+ d2 1) d3) (<= d3 (last s))))
                          (= (to_rep (select (to_array s) d1)) 46))
                        (= (to_rep (select (to_array s) d2)) 46))
                      (= (to_rep (select (to_array s) d3)) 46))
                    (= (is_smallest_byte_10
                         (let ((temp___781qtunused (let ((temp___780 (- 
                                                     d1 1)))
                                                     (let ((temp___779 
                                                       (first
                                                         s)))
                                                       (of_array
                                                         (to_array s)
                                                         temp___779
                                                         temp___780)))))
                           (let ((temp___780 (- d1 1)))
                             (let ((temp___779 (first s)))
                               (of_array (to_array s) temp___779 temp___780))))
                         ((_ extract 7 0) (bvlshr v ((_ int2bv 32) 24)))) true))
                  (= (is_smallest_byte_10
                       (let ((temp___785qtunused (let ((temp___784 (- 
                                                   d2 1)))
                                                   (let ((temp___783 (+ 
                                                     d1 1)))
                                                     (of_array
                                                       (to_array s)
                                                       temp___783
                                                       temp___784)))))
                         (let ((temp___784 (- d2 1)))
                           (let ((temp___783 (+ d1 1)))
                             (of_array (to_array s) temp___783 temp___784))))
                       ((_ extract 7 0) (bvand (bvlshr v ((_ int2bv 32) 16)) #x000000FF))) true))
                (= (is_smallest_byte_10
                     (let ((temp___789qtunused (let ((temp___788 (- d3 1)))
                                                 (let ((temp___787 (+ 
                                                   d2 1)))
                                                   (of_array
                                                     (to_array s)
                                                     temp___787
                                                     temp___788)))))
                       (let ((temp___788 (- d3 1)))
                         (let ((temp___787 (+ d2 1)))
                           (of_array (to_array s) temp___787 temp___788))))
                     ((_ extract 7 0) (bvand (bvlshr v ((_ int2bv 32) 8)) #x000000FF))) true))
              (= (is_smallest_byte_10
                   (let ((temp___793qtunused (let ((temp___792 (last s)))
                                               (let ((temp___791 (+ d3 1)))
                                                 (of_array
                                                   (to_array s)
                                                   temp___791
                                                   temp___792)))))
                     (let ((temp___792 (last s)))
                       (let ((temp___791 (+ d3 1)))
                         (of_array (to_array s) temp___791 temp___792))))
                   ((_ extract 7 0) (bvand v #x000000FF))) true))
            (=>
              (forall ((temp___742 Int))
                (find_first_dot__function_guard
                  (find_first_dot s temp___742)
                  s
                  temp___742))
              (=>
                (= d1 (let ((temp___742 (first s)))
                        (find_first_dot s temp___742)))
                (=>
                  (forall ((temp___744 Int))
                    (find_first_dot__function_guard
                      (find_first_dot s temp___744)
                      s
                      temp___744))
                  (=>
                    (= d2 (let ((temp___744 (+ d1 1)))
                            (find_first_dot s temp___744)))
                    (=>
                      (forall ((temp___746 Int))
                        (find_first_dot__function_guard
                          (find_first_dot s temp___746)
                          s
                          temp___746))
                      (=>
                        (= d3 (let ((temp___746 (+ d2 1)))
                                (find_first_dot s temp___746)))
                        (=>
                          (forall ((temp___750 (_ BitVec 8)) (temp___749 Int) (temp___748 Int))
                            (is_byte_10__function_guard
                              (is_byte_10 s temp___748 temp___749 temp___750)
                              s
                              temp___748
                              temp___749
                              temp___750))
                          (=>
                            (= (let ((temp___750 ((_ extract 7 0) (bvlshr 
                                 v ((_ int2bv 32) 24)))))
                                 (let ((temp___749 (- d1 1)))
                                   (let ((temp___748 (first s)))
                                     (is_byte_10
                                       s
                                       temp___748
                                       temp___749
                                       temp___750)))) true)
                            (=>
                              (forall ((temp___754 (_ BitVec 8)) (temp___753 Int) (temp___752 Int))
                                (is_byte_10__function_guard
                                  (is_byte_10
                                    s
                                    temp___752
                                    temp___753
                                    temp___754)
                                  s
                                  temp___752
                                  temp___753
                                  temp___754))
                              (=>
                                (= (let ((temp___754 ((_ extract 7 0) (bvand (bvlshr 
                                     v ((_ int2bv 32) 16)) #x000000FF))))
                                     (let ((temp___753 (- d2 1)))
                                       (let ((temp___752 (+ d1 1)))
                                         (is_byte_10
                                           s
                                           temp___752
                                           temp___753
                                           temp___754)))) true)
                                (=>
                                  (forall ((temp___758 (_ BitVec 8)) (temp___757 Int) (temp___756 Int))
                                    (is_byte_10__function_guard
                                      (is_byte_10
                                        s
                                        temp___756
                                        temp___757
                                        temp___758)
                                      s
                                      temp___756
                                      temp___757
                                      temp___758))
                                  (= (let ((temp___758 ((_ extract 7 0) (bvand (bvlshr 
                                       v ((_ int2bv 32) 8)) #x000000FF))))
                                       (let ((temp___757 (- d3 1)))
                                         (let ((temp___756 (+ d2 1)))
                                           (is_byte_10
                                             s
                                             temp___756
                                             temp___757
                                             temp___758)))) true)))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
