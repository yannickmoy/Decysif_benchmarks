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

(declare-sort natural 0)

;; "natural'int"
(declare-fun naturalqtint (natural) Int)

;; "natural'axiom"
(assert
  (forall ((i natural))
    (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "to_rep"
(define-fun to_rep ((x natural)) Int
  (naturalqtint x))

;; "of_rep"
(declare-fun of_rep (Int) natural)

;; "inversion_axiom"
(assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

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

(declare-datatypes ((us_split_fields 0))
  (((us_split_fieldsqtmk
    (rec__frame_condition__cell__value natural)(rec__frame_condition__cell__max_left natural)(rec__frame_condition__cell__max_right natural)))))

(declare-datatypes ((us_rep 0))
  (((us_repqtmk (us_split_fields1 us_split_fields)))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const frame_condition__cell__value__first__bit Int)

(declare-const frame_condition__cell__value__last__bit Int)

(declare-const frame_condition__cell__value__position Int)

;; "frame_condition__cell__value__first__bit_axiom"
(assert (<= 0 frame_condition__cell__value__first__bit))

;; "frame_condition__cell__value__last__bit_axiom"
(assert
  (< frame_condition__cell__value__first__bit frame_condition__cell__value__last__bit))

;; "frame_condition__cell__value__position_axiom"
(assert (<= 0 frame_condition__cell__value__position))

(declare-const frame_condition__cell__max_left__first__bit Int)

(declare-const frame_condition__cell__max_left__last__bit Int)

(declare-const frame_condition__cell__max_left__position Int)

;; "frame_condition__cell__max_left__first__bit_axiom"
(assert (<= 0 frame_condition__cell__max_left__first__bit))

;; "frame_condition__cell__max_left__last__bit_axiom"
(assert
  (< frame_condition__cell__max_left__first__bit frame_condition__cell__max_left__last__bit))

;; "frame_condition__cell__max_left__position_axiom"
(assert (<= 0 frame_condition__cell__max_left__position))

(declare-const frame_condition__cell__max_right__first__bit Int)

(declare-const frame_condition__cell__max_right__last__bit Int)

(declare-const frame_condition__cell__max_right__position Int)

;; "frame_condition__cell__max_right__first__bit_axiom"
(assert (<= 0 frame_condition__cell__max_right__first__bit))

;; "frame_condition__cell__max_right__last__bit_axiom"
(assert
  (< frame_condition__cell__max_right__first__bit frame_condition__cell__max_right__last__bit))

;; "frame_condition__cell__max_right__position_axiom"
(assert (<= 0 frame_condition__cell__max_right__position))

(declare-const dummy us_rep)

(declare-datatypes ((map__ref 0))
  (((map__refqtmk (map__content (Array Int us_rep))))))

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const first Int)

(declare-const last Int)

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
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int us_rep))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int us_rep)
  (elts a))

;; "of_array"
(define-fun of_array ((a (Array Int us_rep)) (f Int) (l Int)) us_t
  (us_tqtmk a (mk f l)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "component__size_axiom"
(assert (<= 0 component__size))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const first1 Int)

(declare-const last1 Int)

;; "get_max_left"
(define-fun get_max_left ((param__index Int) (Frame_condition__update_max_2__a___a___ (Array Int us_rep))) Int
  (to_rep
    (rec__frame_condition__cell__max_left
      (us_split_fields1
        (let ((temp___172 (of_array
                            Frame_condition__update_max_2__a___a___
                            (to_rep1 a__first)
                            (to_rep1 a__last))))
          (select (to_array temp___172) param__index))))))

;; "frame_left"
(define-fun frame_left ((param__old_a us_t) (Frame_condition__update_max_2__a___a___ (Array Int us_rep))) Bool
  (ite (forall ((i Int))
         (=>
           (and (<= (to_rep1 a__first) i) (<= i (to_rep1 a__last)))
           (= (to_rep
                (rec__frame_condition__cell__value
                  (us_split_fields1
                    (let ((temp___176 (of_array
                                        Frame_condition__update_max_2__a___a___
                                        (to_rep1 a__first)
                                        (to_rep1 a__last))))
                      (select (to_array temp___176) i))))) (to_rep
                                                             (rec__frame_condition__cell__value
                                                               (us_split_fields1
                                                                 (select 
                                                                 (to_array
                                                                   param__old_a) i)))))))
    true
    false))

(declare-const first2 Int)

(declare-const last2 Int)

;; "get_max_right"
(define-fun get_max_right ((param__index Int) (Frame_condition__update_max_2__a___a___ (Array Int us_rep))) Int
  (to_rep
    (rec__frame_condition__cell__max_right
      (us_split_fields1
        (let ((temp___178 (of_array
                            Frame_condition__update_max_2__a___a___
                            (to_rep1 a__first)
                            (to_rep1 a__last))))
          (select (to_array temp___178) param__index))))))

;; "frame_right"
(define-fun frame_right ((param__old_a us_t) (Frame_condition__update_max_2__a___a___ (Array Int us_rep))) Bool
  (ite (forall ((i Int))
         (=>
           (and (<= (to_rep1 a__first) i) (<= i (to_rep1 a__last)))
           (and
             (= (to_rep
                  (rec__frame_condition__cell__value
                    (us_split_fields1
                      (let ((temp___182 (of_array
                                          Frame_condition__update_max_2__a___a___
                                          (to_rep1 a__first)
                                          (to_rep1 a__last))))
                        (select (to_array temp___182) i))))) (to_rep
                                                               (rec__frame_condition__cell__value
                                                                 (us_split_fields1
                                                                   (select 
                                                                   (to_array
                                                                    param__old_a) i)))))
             (= (to_rep
                  (rec__frame_condition__cell__max_left
                    (us_split_fields1
                      (let ((temp___183 (of_array
                                          Frame_condition__update_max_2__a___a___
                                          (to_rep1 a__first)
                                          (to_rep1 a__last))))
                        (select (to_array temp___183) i))))) (to_rep
                                                               (rec__frame_condition__cell__max_left
                                                                 (us_split_fields1
                                                                   (select 
                                                                   (to_array
                                                                    param__old_a) i))))))))
    true
    false))

;; Goal "def'vc"
;; File "frame_condition.ads", line 17, characters 0-0
(assert
  (not
  (forall ((a (Array Int us_rep)))
    (=>
      (dynamic_property 1 2147483647 (to_rep1 a__first) (to_rep1 a__last))
      (forall ((o Int))
        (=>
          (= (to_rep1 a__last) o)
          (forall ((o1 Int))
            (=>
              (= (to_rep1 a__first) o1)
              (forall ((a1 (Array Int us_rep)))
                (=>
                  (exists ((o2 Int))
                    (and
                      (= (to_rep1 a__last) o2)
                      (exists ((o3 Int))
                        (and
                          (= (to_rep1 a__first) o3)
                          (exists ((o4 Int))
                            (and
                              (= (to_rep1 a__last) o4)
                              (exists ((o5 Int))
                                (and
                                  (= (to_rep1 a__first) o5)
                                  (exists ((spark__branch Bool))
                                    (and
                                      (= spark__branch (ite (= (length o5 o4) 0)
                                                         true
                                                         false))
                                      (ite (= spark__branch true)
                                        (= a1 a)
                                        (exists ((o6 Int))
                                          (and
                                            (= (to_rep1 a__last) o6)
                                            (exists ((o7 Int))
                                              (and
                                                (= (to_rep1 a__first) o7)
                                                (exists ((o8 Int))
                                                  (and
                                                    (= (to_rep1 a__first) o8)
                                                    (and
                                                      (in_range2 o8)
                                                      (and
                                                        (= o8 first)
                                                        (and
                                                          (in_range2 first)
                                                          (exists ((o9 Int))
                                                            (and
                                                              (= (to_rep1
                                                                   a__last) o9)
                                                              (exists 
                                                                ((o10 Int))
                                                                (and
                                                                  (= 
                                                                  (to_rep1
                                                                    a__first) o10)
                                                                  (exists 
                                                                    ((o11 Int))
                                                                    (and
                                                                    (= 
                                                                    (to_rep1
                                                                    a__last) o11)
                                                                    (and
                                                                    (in_range2
                                                                    o11)
                                                                    (and
                                                                    (= o11 
                                                                    last)
                                                                    (and
                                                                    (in_range2
                                                                    last)
                                                                    (and
                                                                    (in_range2
                                                                    first1)
                                                                    (and
                                                                    (= 
                                                                    first 
                                                                    first1)
                                                                    (and
                                                                    (in_range2
                                                                    last1)
                                                                    (and
                                                                    (= 
                                                                    last 
                                                                    last1)
                                                                    (and
                                                                    (in_range2
                                                                    first2)
                                                                    (and
                                                                    (= 
                                                                    last 
                                                                    first2)
                                                                    (and
                                                                    (in_range2
                                                                    last2)
                                                                    (and
                                                                    (= 
                                                                    first 
                                                                    last2)
                                                                    (exists 
                                                                    ((a2 (Array Int us_rep)))
                                                                    (and
                                                                    (and
                                                                    (and
                                                                    (forall 
                                                                    ((i Int))
                                                                    (=>
                                                                    (and
                                                                    (<= 
                                                                    first1 i)
                                                                    (<= i 
                                                                    last1))
                                                                    (forall 
                                                                    ((j Int))
                                                                    (=>
                                                                    (and
                                                                    (<= i j)
                                                                    (<= j 
                                                                    last1))
                                                                    (<= 
                                                                    (to_rep
                                                                    (rec__frame_condition__cell__value
                                                                    (us_split_fields1
                                                                    (select a2 i)))) 
                                                                    (get_max_left
                                                                    j
                                                                    a2))))))
                                                                    (forall 
                                                                    ((i Int))
                                                                    (=>
                                                                    (and
                                                                    (<= 
                                                                    last1 i)
                                                                    (<= i 
                                                                    first1))
                                                                    (forall 
                                                                    ((j Int))
                                                                    (=>
                                                                    (and
                                                                    (<= i j)
                                                                    (<= j 
                                                                    first1))
                                                                    (<= 
                                                                    (to_rep
                                                                    (rec__frame_condition__cell__value
                                                                    (us_split_fields1
                                                                    (select a2 j)))) 
                                                                    (get_max_left
                                                                    i
                                                                    a2)))))))
                                                                    (= 
                                                                    (frame_left
                                                                    (let ((temp___303qtunused 
                                                                    (of_array
                                                                    a
                                                                    (to_rep1
                                                                    a__first)
                                                                    (to_rep1
                                                                    a__last))))
                                                                    (of_array
                                                                    a
                                                                    (to_rep1
                                                                    a__first)
                                                                    (to_rep1
                                                                    a__last)))
                                                                    a2) true))
                                                                    (and
                                                                    (and
                                                                    (forall 
                                                                    ((i Int))
                                                                    (=>
                                                                    (and
                                                                    (<= 
                                                                    first2 i)
                                                                    (<= i 
                                                                    last2))
                                                                    (forall 
                                                                    ((j Int))
                                                                    (=>
                                                                    (and
                                                                    (<= i j)
                                                                    (<= j 
                                                                    last2))
                                                                    (<= 
                                                                    (to_rep
                                                                    (rec__frame_condition__cell__value
                                                                    (us_split_fields1
                                                                    (select a1 i)))) 
                                                                    (get_max_right
                                                                    j
                                                                    a1))))))
                                                                    (forall 
                                                                    ((i Int))
                                                                    (=>
                                                                    (and
                                                                    (<= 
                                                                    last2 i)
                                                                    (<= i 
                                                                    first2))
                                                                    (forall 
                                                                    ((j Int))
                                                                    (=>
                                                                    (and
                                                                    (<= i j)
                                                                    (<= j 
                                                                    first2))
                                                                    (<= 
                                                                    (to_rep
                                                                    (rec__frame_condition__cell__value
                                                                    (us_split_fields1
                                                                    (select a1 j)))) 
                                                                    (get_max_right
                                                                    i
                                                                    a1)))))))
                                                                    (= 
                                                                    (frame_right
                                                                    (let ((temp___327qtunused 
                                                                    (of_array
                                                                    a2
                                                                    (to_rep1
                                                                    a__first)
                                                                    (to_rep1
                                                                    a__last))))
                                                                    (of_array
                                                                    a2
                                                                    (to_rep1
                                                                    a__first)
                                                                    (to_rep1
                                                                    a__last)))
                                                                    a1) true)))))))))))))))))))))))))))))))))))))))))
                  (forall ((i Int))
                    (=>
                      (and
                        (<= (to_rep1 a__first) i)
                        (<= i (to_rep1 a__last)))
                      (forall ((j Int))
                        (=>
                          (and (<= i j) (<= j (to_rep1 a__last)))
                          (<= (to_rep
                                (rec__frame_condition__cell__value
                                  (us_split_fields1 (select a1 i)))) 
                          (to_rep
                            (rec__frame_condition__cell__max_left
                              (us_split_fields1 (select a1 j)))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
