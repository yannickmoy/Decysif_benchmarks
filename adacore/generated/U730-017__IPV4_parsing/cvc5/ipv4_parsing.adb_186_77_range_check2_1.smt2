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
          (forall ((o Bool))
            (=>
              (exists ((o1 Bool))
                (and
                  (exists ((o2 Bool))
                    (and
                      (exists ((o3 Bool))
                        (and
                          (exists ((o4 Bool))
                            (and
                              (exists ((o5 Bool))
                                (and
                                  (exists ((o6 Bool))
                                    (and
                                      (exists ((o7 Bool))
                                        (and
                                          (exists ((o8 Bool))
                                            (and
                                              (exists ((o9 Bool))
                                                (and
                                                  (ite (< (last s) 2147483647)
                                                    (= o9 (ite (< 0 (length
                                                                    s))
                                                            true
                                                            false))
                                                    (= o9 false))
                                                  (ite (= o9 true)
                                                    (= o8 (and (ite (<= 
                                                                 (first
                                                                   s) 
                                                                 d1)
                                                                 true
                                                                 false) 
                                                    (ite (<= d1 (last s))
                                                      true
                                                      false)))
                                                    (= o8 false))))
                                              (ite (= o8 true)
                                                (let ((o9 (+ d1 1)))
                                                  (and
                                                    (in_range o9)
                                                    (= o7 (and (ite (<= o9 
                                                                 d2)
                                                                 true
                                                                 false) 
                                                    (ite (<= d2 (last s))
                                                      true
                                                      false)))))
                                                (= o7 false))))
                                          (ite (= o7 true)
                                            (let ((o8 (+ d2 1)))
                                              (and
                                                (in_range o8)
                                                (= o6 (and (ite (<= o8 
                                                             d3)
                                                             true
                                                             false) (ite (<= 
                                                                    d3 
                                                                    (last
                                                                    s))
                                                                    true
                                                                    false)))))
                                            (= o6 false))))
                                      (ite (= o6 true)
                                        (and
                                          (and
                                            (<= (first s) d1)
                                            (<= d1 (last s)))
                                          (exists ((o7 Int))
                                            (and
                                              (= (to_rep
                                                   (select (to_array s) 
                                                   d1)) o7)
                                              (= o5 (ite (= o7 46)
                                                      true
                                                      false)))))
                                        (= o5 false))))
                                  (ite (= o5 true)
                                    (and
                                      (and
                                        (<= (first s) d2)
                                        (<= d2 (last s)))
                                      (exists ((o6 Int))
                                        (and
                                          (= (to_rep
                                               (select (to_array s) d2)) o6)
                                          (= o4 (ite (= o6 46) true false)))))
                                    (= o4 false))))
                              (ite (= o4 true)
                                (and
                                  (and (<= (first s) d3) (<= d3 (last s)))
                                  (exists ((o5 Int))
                                    (and
                                      (= (to_rep (select (to_array s) d3)) o5)
                                      (= o3 (ite (= o5 46) true false)))))
                                (= o3 false))))
                          (ite (= o3 true)
                            (let ((o4 ((_ extract 7 0) (bvlshr v ((_ int2bv 32) 24)))))
                              (let ((temp___764 (- d1 1)))
                                (let ((temp___763 (first s)))
                                  (and
                                    (=>
                                      (<= temp___763 temp___764)
                                      (and
                                        (and
                                          (<= (first s) temp___763)
                                          (<= temp___763 (last s)))
                                        (and
                                          (<= (first s) temp___764)
                                          (<= temp___764 (last s)))))
                                    (let ((o5 (to_array s)))
                                      (let ((o6 (of_array
                                                  o5
                                                  temp___763
                                                  temp___764)))
                                        (and
                                          (= o2 (is_smallest_byte_10 o6 o4))
                                          (=
                                            (= o2 true)
                                            (and
                                              (and
                                                (and
                                                  (= (length o6) (ite (bvuge o4 #x64)
                                                                   3
                                                                   (ite (bvuge o4 #x0A)
                                                                    2
                                                                    1)))
                                                  (= (to_rep
                                                       (select o5 temp___764)) 
                                                  (char_of_byte_10
                                                    (bvurem o4 #x0A))))
                                                (=>
                                                  (bvuge o4 #x0A)
                                                  (= (to_rep
                                                       (select o5 (- temp___764 1))) 
                                                  (char_of_byte_10
                                                    (bvurem (bvudiv o4 #x0A) #x0A)))))
                                              (=>
                                                (bvuge o4 #x64)
                                                (= (to_rep
                                                     (select o5 temp___763)) 
                                                (char_of_byte_10
                                                  (bvudiv o4 #x64)))))))))))))
                            (= o2 false))))
                      (ite (= o2 true)
                        (let ((o3 ((_ extract 7 0) (bvand (bvlshr v ((_ int2bv 32) 16)) #x000000FF))))
                          (let ((temp___768 (- d2 1)))
                            (let ((o4 (+ d1 1)))
                              (and
                                (in_range o4)
                                (and
                                  (=>
                                    (<= o4 temp___768)
                                    (and
                                      (and
                                        (<= (first s) o4)
                                        (<= o4 (last s)))
                                      (and
                                        (<= (first s) temp___768)
                                        (<= temp___768 (last s)))))
                                  (let ((o5 (to_array s)))
                                    (let ((o6 (of_array o5 o4 temp___768)))
                                      (and
                                        (= o1 (is_smallest_byte_10 o6 o3))
                                        (=
                                          (= o1 true)
                                          (and
                                            (and
                                              (and
                                                (= (length o6) (ite (bvuge o3 #x64)
                                                                 3
                                                                 (ite (bvuge o3 #x0A)
                                                                   2
                                                                   1)))
                                                (= (to_rep
                                                     (select o5 temp___768)) 
                                                (char_of_byte_10
                                                  (bvurem o3 #x0A))))
                                              (=>
                                                (bvuge o3 #x0A)
                                                (= (to_rep
                                                     (select o5 (- temp___768 1))) 
                                                (char_of_byte_10
                                                  (bvurem (bvudiv o3 #x0A) #x0A)))))
                                            (=>
                                              (bvuge o3 #x64)
                                              (= (to_rep (select o5 o4)) 
                                              (char_of_byte_10
                                                (bvudiv o3 #x64))))))))))))))
                        (= o1 false))))
                  (ite (= o1 true)
                    (let ((o2 ((_ extract 7 0) (bvand (bvlshr v ((_ int2bv 32) 8)) #x000000FF))))
                      (let ((temp___772 (- d3 1)))
                        (let ((o3 (+ d2 1)))
                          (and
                            (in_range o3)
                            (and
                              (=>
                                (<= o3 temp___772)
                                (and
                                  (and (<= (first s) o3) (<= o3 (last s)))
                                  (and
                                    (<= (first s) temp___772)
                                    (<= temp___772 (last s)))))
                              (let ((o4 (to_array s)))
                                (let ((o5 (of_array o4 o3 temp___772)))
                                  (and
                                    (= o (is_smallest_byte_10 o5 o2))
                                    (=
                                      (= o true)
                                      (and
                                        (and
                                          (and
                                            (= (length o5) (ite (bvuge o2 #x64)
                                                             3
                                                             (ite (bvuge o2 #x0A)
                                                               2
                                                               1)))
                                            (= (to_rep
                                                 (select o4 temp___772)) 
                                            (char_of_byte_10
                                              (bvurem o2 #x0A))))
                                          (=>
                                            (bvuge o2 #x0A)
                                            (= (to_rep
                                                 (select o4 (- temp___772 1))) 
                                            (char_of_byte_10
                                              (bvurem (bvudiv o2 #x0A) #x0A)))))
                                        (=>
                                          (bvuge o2 #x64)
                                          (= (to_rep (select o4 o3)) 
                                          (char_of_byte_10
                                            (bvudiv o2 #x64))))))))))))))
                    (= o false))))
              (=>
                (= o true)
                (bvule (bvand v #x000000FF) ((_ zero_extend 24) #xFF)))))))))))

(check-sat)
(get-info :reason-unknown)
