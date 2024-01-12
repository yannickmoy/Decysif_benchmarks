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

;; "Assume"
(assert (dynamic_invariant s true false true true))

;; "Assume"
(assert (in_range1 d1))

;; "Assume"
(assert (in_range1 d2))

;; "Assume"
(assert (in_range1 d3))

;; "Assume"
(assert true)

(declare-const o Bool)

(declare-const o1 Int)

;; "H"
(assert (= o1 (last s)))

(declare-const lastqtresultqtunused Int)

;; "H"
(assert (= lastqtresultqtunused o1))

(declare-const infix_lsqtresultqtunused Bool)

;; "H"
(assert (= infix_lsqtresultqtunused (ite (< o1 2147483647) true false)))

(declare-const o2 Bool)

(declare-const o3 Int)

(declare-const lengthqtresultqtunused Int)

(declare-const infix_gtqtresultqtunused Bool)

;; "H"
(assert
  (ite (< o1 2147483647)
    (and
      (= o3 (length s))
      (and
        (= lengthqtresultqtunused o3)
        (and
          (= o2 (ite (< 0 o3) true false))
          (= infix_gtqtresultqtunused o2))))
    (= o2 false)))

(declare-const o4 Bool)

(declare-const o5 Int)

(declare-const lastqtresultqtunused1 Int)

(declare-const o6 Bool)

(declare-const infix_lseqqtresultqtunused Bool)

(declare-const o7 Int)

(declare-const firstqtresultqtunused Int)

(declare-const o8 Bool)

(declare-const infix_lseqqtresultqtunused1 Bool)

(declare-const andbqtresultqtunused Bool)

;; "H"
(assert
  (ite (= o2 true)
    (and
      (= o5 (last s))
      (and
        (= lastqtresultqtunused1 o5)
        (and
          (= o6 (ite (<= d1 o5) true false))
          (and
            (= infix_lseqqtresultqtunused o6)
            (and
              (= o7 (first s))
              (and
                (= firstqtresultqtunused o7)
                (and
                  (= o8 (ite (<= o7 d1) true false))
                  (and
                    (= infix_lseqqtresultqtunused1 o8)
                    (and (= o4 (and o8 o6)) (= andbqtresultqtunused o4))))))))))
    (= o4 false)))

(declare-const o9 Bool)

(declare-const o10 Int)

(declare-const lastqtresultqtunused2 Int)

(declare-const o11 Bool)

(declare-const infix_lseqqtresultqtunused2 Bool)

(declare-const o12 Int)

(declare-const infix_plqtresultqtunused Int)

(declare-const range_check_qtresultqtunused Int)

(declare-const o13 Bool)

(declare-const infix_lseqqtresultqtunused3 Bool)

(declare-const andbqtresultqtunused1 Bool)

;; "H"
(assert
  (ite (= o4 true)
    (and
      (= o10 (last s))
      (and
        (= lastqtresultqtunused2 o10)
        (and
          (= o11 (ite (<= d2 o10) true false))
          (and
            (= infix_lseqqtresultqtunused2 o11)
            (and
              (= o12 (+ d1 1))
              (and
                (= infix_plqtresultqtunused o12)
                (and
                  (in_range o12)
                  (and
                    (= range_check_qtresultqtunused o12)
                    (and
                      (= o13 (ite (<= o12 d2) true false))
                      (and
                        (= infix_lseqqtresultqtunused3 o13)
                        (and
                          (= o9 (and o13 o11))
                          (= andbqtresultqtunused1 o9))))))))))))
    (= o9 false)))

(declare-const o14 Bool)

(declare-const o15 Int)

(declare-const lastqtresultqtunused3 Int)

(declare-const o16 Bool)

(declare-const infix_lseqqtresultqtunused4 Bool)

(declare-const o17 Int)

(declare-const infix_plqtresultqtunused1 Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const o18 Bool)

(declare-const infix_lseqqtresultqtunused5 Bool)

(declare-const andbqtresultqtunused2 Bool)

;; "H"
(assert
  (ite (= o9 true)
    (and
      (= o15 (last s))
      (and
        (= lastqtresultqtunused3 o15)
        (and
          (= o16 (ite (<= d3 o15) true false))
          (and
            (= infix_lseqqtresultqtunused4 o16)
            (and
              (= o17 (+ d2 1))
              (and
                (= infix_plqtresultqtunused1 o17)
                (and
                  (in_range o17)
                  (and
                    (= range_check_qtresultqtunused1 o17)
                    (and
                      (= o18 (ite (<= o17 d3) true false))
                      (and
                        (= infix_lseqqtresultqtunused5 o18)
                        (and
                          (= o14 (and o18 o16))
                          (= andbqtresultqtunused2 o14))))))))))))
    (= o14 false)))

(declare-const o19 Bool)

(declare-const o20 (Array Int character))

(declare-const to_arrayqtresultqtunused (Array Int character))

(declare-const o21 character)

(declare-const getqtresultqtunused character)

(declare-const o22 Int)

(declare-const to_repqtresultqtunused Int)

(declare-const infix_eqqtresultqtunused Bool)

;; "H"
(assert
  (ite (= o14 true)
    (and
      (and (<= (first s) d1) (<= d1 (last s)))
      (and
        (= o20 (to_array s))
        (and
          (= to_arrayqtresultqtunused o20)
          (and
            (= o21 (select o20 d1))
            (and
              (= getqtresultqtunused o21)
              (and
                (= (to_rep o21) o22)
                (and
                  (= to_repqtresultqtunused o22)
                  (and
                    (= o19 (ite (= o22 46) true false))
                    (= infix_eqqtresultqtunused o19)))))))))
    (= o19 false)))

(declare-const o23 Bool)

(declare-const o24 (Array Int character))

(declare-const to_arrayqtresultqtunused1 (Array Int character))

(declare-const o25 character)

(declare-const getqtresultqtunused1 character)

(declare-const o26 Int)

(declare-const to_repqtresultqtunused1 Int)

(declare-const infix_eqqtresultqtunused1 Bool)

;; "H"
(assert
  (ite (= o19 true)
    (and
      (and (<= (first s) d2) (<= d2 (last s)))
      (and
        (= o24 (to_array s))
        (and
          (= to_arrayqtresultqtunused1 o24)
          (and
            (= o25 (select o24 d2))
            (and
              (= getqtresultqtunused1 o25)
              (and
                (= (to_rep o25) o26)
                (and
                  (= to_repqtresultqtunused1 o26)
                  (and
                    (= o23 (ite (= o26 46) true false))
                    (= infix_eqqtresultqtunused1 o23)))))))))
    (= o23 false)))

(declare-const o27 Bool)

(declare-const o28 (Array Int character))

(declare-const to_arrayqtresultqtunused2 (Array Int character))

(declare-const o29 character)

(declare-const getqtresultqtunused2 character)

(declare-const o30 Int)

(declare-const to_repqtresultqtunused2 Int)

(declare-const infix_eqqtresultqtunused2 Bool)

;; "H"
(assert
  (ite (= o23 true)
    (and
      (and (<= (first s) d3) (<= d3 (last s)))
      (and
        (= o28 (to_array s))
        (and
          (= to_arrayqtresultqtunused2 o28)
          (and
            (= o29 (select o28 d3))
            (and
              (= getqtresultqtunused2 o29)
              (and
                (= (to_rep o29) o30)
                (and
                  (= to_repqtresultqtunused2 o30)
                  (and
                    (= o27 (ite (= o30 46) true false))
                    (= infix_eqqtresultqtunused2 o27)))))))))
    (= o27 false)))

(declare-const o31 (_ BitVec 32))

(declare-const of_intqtresultqtunused (_ BitVec 32))

(declare-const o32 (_ BitVec 32))

(declare-const lsr_bvqtresultqtunused (_ BitVec 32))

(declare-const toBigqtresultqtunused (_ BitVec 32))

(declare-const toBigqtresultqtunused1 (_ BitVec 32))

(declare-const range_check_qtresultqtunused2 (_ BitVec 32))

(declare-const o33 (_ BitVec 8))

(declare-const toSmallqtresultqtunused (_ BitVec 8))

(declare-const temp___764 Int)

(declare-const infix_mnqtresultqtunused Int)

(declare-const temp___763 Int)

(declare-const firstqtresultqtunused1 Int)

(declare-const o34 (Array Int character))

(declare-const to_arrayqtresultqtunused3 (Array Int character))

(declare-const o35 (Array Int character))

(declare-const sliceqtresultqtunused (Array Int character))

(declare-const temp___765 us_t)

(declare-const of_arrayqtresultqtunused us_t)

(declare-const temp___766 (Array Int character))

(declare-const to_arrayqtresultqtunused4 (Array Int character))

(declare-const o36 Int)

(declare-const lastqtresultqtunused4 Int)

(declare-const o37 Int)

(declare-const firstqtresultqtunused2 Int)

(declare-const o38 us_t)

(declare-const of_arrayqtresultqtunused1 us_t)

(declare-const is_smallest_byte_10qtresultqtunused Bool)

;; "H"
(assert
  (ite (= o27 true)
    (and
      (= o31 ((_ int2bv 32) 24))
      (and
        (= of_intqtresultqtunused o31)
        (and
          (= o32 (bvlshr v o31))
          (and
            (= lsr_bvqtresultqtunused o32)
            (and
              (= toBigqtresultqtunused ((_ zero_extend 24) #xFF))
              (and
                (= toBigqtresultqtunused1 ((_ zero_extend 24) #x00))
                (and
                  (= range_check_qtresultqtunused2 o32)
                  (and
                    (= o33 ((_ extract 7 0) o32))
                    (and
                      (= toSmallqtresultqtunused o33)
                      (and
                        (= temp___764 (- d1 1))
                        (and
                          (= infix_mnqtresultqtunused temp___764)
                          (and
                            (= temp___763 (first s))
                            (and
                              (= firstqtresultqtunused1 temp___763)
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
                                (and
                                  (= o34 (to_array s))
                                  (and
                                    (= to_arrayqtresultqtunused3 o34)
                                    (and
                                      (= o35 o34)
                                      (and
                                        (= sliceqtresultqtunused o35)
                                        (and
                                          (= temp___765 (of_array
                                                          o35
                                                          temp___763
                                                          temp___764))
                                          (and
                                            (= of_arrayqtresultqtunused 
                                            temp___765)
                                            (and
                                              (= temp___766 o35)
                                              (and
                                                (= to_arrayqtresultqtunused4 
                                                temp___766)
                                                (and
                                                  (= o36 temp___764)
                                                  (and
                                                    (= lastqtresultqtunused4 
                                                    o36)
                                                    (and
                                                      (= o37 temp___763)
                                                      (and
                                                        (= firstqtresultqtunused2 
                                                        o37)
                                                        (and
                                                          (= o38 (of_array
                                                                   temp___766
                                                                   o37
                                                                   o36))
                                                          (and
                                                            (= of_arrayqtresultqtunused1 
                                                            o38)
                                                            (and
                                                              (= o (is_smallest_byte_10
                                                                    o38
                                                                    o33))
                                                              (and
                                                                (=
                                                                  (= 
                                                                  o true)
                                                                  (and
                                                                    (and
                                                                    (and
                                                                    (= 
                                                                    (length
                                                                    o38) 
                                                                    (ite (bvuge 
                                                                    o33 #x64)
                                                                    3
                                                                    (ite (bvuge 
                                                                    o33 #x0A)
                                                                    2
                                                                    1)))
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    temp___766 
                                                                    o36)) 
                                                                    (char_of_byte_10
                                                                    (bvurem 
                                                                    o33 #x0A))))
                                                                    (=>
                                                                    (bvuge 
                                                                    o33 #x0A)
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    temp___766 (- 
                                                                    o36 1))) 
                                                                    (char_of_byte_10
                                                                    (bvurem (bvudiv 
                                                                    o33 #x0A) #x0A)))))
                                                                    (=>
                                                                    (bvuge 
                                                                    o33 #x64)
                                                                    (= 
                                                                    (to_rep
                                                                    (select 
                                                                    temp___766 
                                                                    o37)) 
                                                                    (char_of_byte_10
                                                                    (bvudiv 
                                                                    o33 #x64))))))
                                                                (= is_smallest_byte_10qtresultqtunused 
                                                                o)))))))))))))))))))))))))))))))
    (= o false)))

;; "H"
(assert (= o true))

;; "o"
(define-fun o39 () (_ BitVec 32)
  ((_ int2bv 32) 16))

;; "of_int'result'unused"
(define-fun of_intqtresultqtunused1 () (_ BitVec 32)
  o39)

;; "o"
(define-fun o40 () (_ BitVec 32)
  (bvlshr v o39))

;; "lsr_bv'result'unused"
(define-fun lsr_bvqtresultqtunused1 () (_ BitVec 32)
  o40)

;; "o"
(define-fun o41 () (_ BitVec 32)
  (bvand o40 #x000000FF))

;; "bw_and'result'unused"
(define-fun bw_andqtresultqtunused () (_ BitVec 32)
  o41)

;; "o"
(define-fun o42 () (_ BitVec 32)
  ((_ zero_extend 24) #xFF))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused2 () (_ BitVec 32)
  o42)

;; "o"
(define-fun o43 () (_ BitVec 32)
  ((_ zero_extend 24) #x00))

;; "toBig'result'unused"
(define-fun toBigqtresultqtunused3 () (_ BitVec 32)
  o43)

;; Goal "def'vc"
;; File "ipv4_parsing.adb", line 178, characters 0-0
(assert
  (not (bvule o41 o42)))

(check-sat)
