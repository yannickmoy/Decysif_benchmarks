;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-sort slot 0)

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 0 x) (<= x 2)))

;; "to_rep"
(declare-fun to_rep (slot) Int)

;; "of_rep"
(declare-fun of_rep (Int) slot)

;; "inversion_axiom"
(assert
  (forall ((x slot)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert (forall ((x slot)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

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

;; "num_free_slots"
(declare-fun num_free_slots ((Array Int (Array Int slot))) Int)

;; "num_free_slots__function_guard"
(declare-fun num_free_slots__function_guard (Int
  (Array Int (Array Int slot))) Bool)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "count_free_slots"
(declare-fun count_free_slots (Int
  Int
  (Array Int (Array Int slot))) Int)

;; "count_free_slots__function_guard"
(declare-fun count_free_slots__function_guard (Int
  Int
  Int
  (Array Int (Array Int slot))) Bool)

(declare-sort pos 0)

;; "pos'int"
(declare-fun posqtint (pos) Int)

;; "pos'axiom"
(assert (forall ((i pos)) (and (<= 1 (posqtint i)) (<= (posqtint i) 3))))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 3)))

;; "to_rep"
(define-fun to_rep1 ((x pos)) Int
  (posqtint x))

;; "of_rep"
(declare-fun of_rep1 (Int) pos)

;; "inversion_axiom"
(assert
  (forall ((x pos)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x pos)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
  (((us_split_fieldsqtmk
    (rec__tictactoe__position__x pos)(rec__tictactoe__position__y pos)))))

(declare-datatypes ((us_rep 0))
  (((us_repqtmk (us_split_fields1 us_split_fields)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const tictactoe__position__x__first__bit Int)

(declare-const tictactoe__position__x__last__bit Int)

(declare-const tictactoe__position__x__position Int)

;; "tictactoe__position__x__first__bit_axiom"
(assert (<= 0 tictactoe__position__x__first__bit))

;; "tictactoe__position__x__last__bit_axiom"
(assert
  (< tictactoe__position__x__first__bit tictactoe__position__x__last__bit))

;; "tictactoe__position__x__position_axiom"
(assert (<= 0 tictactoe__position__x__position))

(declare-const tictactoe__position__y__first__bit Int)

(declare-const tictactoe__position__y__last__bit Int)

(declare-const tictactoe__position__y__position Int)

;; "tictactoe__position__y__first__bit_axiom"
(assert (<= 0 tictactoe__position__y__first__bit))

;; "tictactoe__position__y__last__bit_axiom"
(assert
  (< tictactoe__position__y__first__bit tictactoe__position__y__last__bit))

;; "tictactoe__position__y__position_axiom"
(assert (<= 0 tictactoe__position__y__position))

(declare-const dummy us_rep)

(declare-const p us_rep)

(declare-const v Int)

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

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_228 (Array Int (Array Int slot))) (temp___is_init_224 Bool) (temp___skip_constant_225 Bool) (temp___do_toplevel_226 Bool) (temp___do_typ_inv_227 Bool)) Bool
  true)

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "one_free_slot"
(define-fun one_free_slot ((param__x Int) (param__y Int) (Tictactoe__my_board___my_board___ (Array Int (Array Int slot)))) Int
  (ite (= (to_rep
            (let ((temp___177 (select Tictactoe__my_board___my_board___ param__x)))
              (select temp___177 param__y))) 0)
    1
    0))

;; "count_free_slots__post_axiom"
(assert
  (forall ((param__x Int) (param__y Int))
    (forall ((Tictactoe__my_board___my_board___ (Array Int (Array Int slot))))
      (! (=>
           (and
             (and (in_range2 param__x) (in_range2 param__y))
             (dynamic_invariant
               Tictactoe__my_board___my_board___
               true
               false
               true
               true))
           (let ((result (count_free_slots
                           param__x
                           param__y
                           Tictactoe__my_board___my_board___)))
             (=>
               (count_free_slots__function_guard
                 result
                 param__x
                 param__y
                 Tictactoe__my_board___my_board___)
               (in_range3 result)))) :pattern ((count_free_slots
                                                 param__x
                                                 param__y
                                                 Tictactoe__my_board___my_board___)) ))))

;; "count_free_slots__def_axiom"
(assert
  (forall ((param__x Int) (param__y Int))
    (forall ((Tictactoe__my_board___my_board___ (Array Int (Array Int slot))))
      (! (= (count_free_slots
              param__x
              param__y
              Tictactoe__my_board___my_board___) (+ (+ (+ (+ (one_free_slot
                                                               1
                                                               1
                                                               Tictactoe__my_board___my_board___) 
      (ite (<= 2 param__y)
        (one_free_slot 1 2 Tictactoe__my_board___my_board___)
        0)) (ite (<= 3 param__y)
              (one_free_slot 1 3 Tictactoe__my_board___my_board___)
              0)) (ite (<= 2 param__x)
                    (+ (+ (one_free_slot
                            2
                            1
                            Tictactoe__my_board___my_board___) (ite (<= 2 param__y)
                                                                 (one_free_slot
                                                                   2
                                                                   2
                                                                   Tictactoe__my_board___my_board___)
                                                                 0)) 
                    (ite (<= 3 param__y)
                      (one_free_slot 2 3 Tictactoe__my_board___my_board___)
                      0))
                    0)) (ite (<= 3 param__x)
                          (+ (+ (one_free_slot
                                  3
                                  1
                                  Tictactoe__my_board___my_board___) 
                          (ite (<= 2 param__y)
                            (one_free_slot
                              3
                              2
                              Tictactoe__my_board___my_board___)
                            0)) (ite (<= 3 param__y)
                                  (one_free_slot
                                    3
                                    3
                                    Tictactoe__my_board___my_board___)
                                  0))
                          0))) :pattern ((count_free_slots
                                           param__x
                                           param__y
                                           Tictactoe__my_board___my_board___)) ))))

;; "num_free_slots__post_axiom"
(assert
  (forall ((Tictactoe__my_board___my_board___ (Array Int (Array Int slot))))
    (! (=>
         (dynamic_invariant
           Tictactoe__my_board___my_board___
           true
           false
           true
           true)
         (let ((result (num_free_slots Tictactoe__my_board___my_board___)))
           (=>
             (num_free_slots__function_guard
               result
               Tictactoe__my_board___my_board___)
             (in_range1 result)))) :pattern ((num_free_slots
                                               Tictactoe__my_board___my_board___)) )))

;; "num_free_slots__def_axiom"
(assert
  (forall ((Tictactoe__my_board___my_board___ (Array Int (Array Int slot))))
    (! (and
         (count_free_slots__function_guard
           (count_free_slots 3 3 Tictactoe__my_board___my_board___)
           3
           3
           Tictactoe__my_board___my_board___)
         (= (num_free_slots Tictactoe__my_board___my_board___) (let ((temp___249qtunused 3))
                                                                 (count_free_slots
                                                                   3
                                                                   3
                                                                   Tictactoe__my_board___my_board___)))) :pattern (
    (num_free_slots
      Tictactoe__my_board___my_board___)) )))

;; Goal "def'vc"
;; File "tictactoe.adb", line 11, characters 0-0
(assert
  (not
  (forall ((my_board (Array Int (Array Int slot))))
    (=>
      (in_range v)
      (=>
        (dynamic_invariant my_board true false true true)
        (=>
          (and
            (= (to_rep
                 (select (select my_board (to_rep1
                                            (rec__tictactoe__position__x
                                              (us_split_fields1 p)))) 
                 (to_rep1
                   (rec__tictactoe__position__y (us_split_fields1 p))))) 0)
            (not (= v 0)))
          (let ((temp___old_675 (num_free_slots my_board)))
            (=>
              (count_free_slots__function_guard
                (count_free_slots 3 3 my_board)
                3
                3
                my_board)
              (=>
                (and
                  (num_free_slots__function_guard temp___old_675 my_board)
                  (and
                    (in_range1 temp___old_675)
                    (= temp___old_675 (count_free_slots 3 3 my_board))))
                (forall ((o Int))
                  (=>
                    (= (to_rep1
                         (rec__tictactoe__position__x (us_split_fields1 p))) o)
                    (forall ((o1 slot))
                      (=>
                        (= (to_rep o1) v)
                        (forall ((o2 Int))
                          (=>
                            (= (to_rep1
                                 (rec__tictactoe__position__y
                                   (us_split_fields1 p))) o2)
                            (forall ((o3 Int))
                              (=>
                                (= (to_rep1
                                     (rec__tictactoe__position__x
                                       (us_split_fields1 p))) o3)
                                (forall ((my_board1 (Array Int (Array Int slot))))
                                  (=>
                                    (= my_board1 (store my_board o3 (store (select my_board o) o2 o1)))
                                    (=>
                                      (num_free_slots__function_guard
                                        (num_free_slots my_board1)
                                        my_board1)
                                      (=>
                                        (num_free_slots__function_guard
                                          (num_free_slots my_board)
                                          my_board)
                                        (= (num_free_slots my_board1) (- 
                                        (num_free_slots
                                          my_board) 1)))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
