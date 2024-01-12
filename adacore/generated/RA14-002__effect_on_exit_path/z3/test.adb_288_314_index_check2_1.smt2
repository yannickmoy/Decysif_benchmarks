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

(declare-sort os_mbx_index_t 0)

;; "in_range"
(define-fun in_range ((x (_ BitVec 8))) Bool
  (and (bvule #x00 x) (bvule x #x02)))

;; "to_rep"
(declare-fun to_rep (os_mbx_index_t) (_ BitVec 8))

;; "of_rep"
(declare-fun of_rep ((_ BitVec 8)) os_mbx_index_t)

;; "inversion_axiom"
(assert
  (forall ((x os_mbx_index_t))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x os_mbx_index_t))
    (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x (_ BitVec 8)))
    (! (let ((y (bvurem x #x03)))
         (=> (in_range y) (= (to_rep (of_rep x)) y))) :pattern ((to_rep
                                                                  (of_rep x))) )))

(declare-sort os_mbx_count_t 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

;; "in_range"
(define-fun in_range1 ((x (_ BitVec 8))) Bool
  (and (bvule #x00 x) (bvule x #x03)))

;; "to_rep"
(declare-fun to_rep1 (os_mbx_count_t) (_ BitVec 8))

;; "of_rep"
(declare-fun of_rep1 ((_ BitVec 8)) os_mbx_count_t)

;; "inversion_axiom"
(assert
  (forall ((x os_mbx_count_t))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert
  (forall ((x os_mbx_count_t))
    (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x (_ BitVec 8)))
    (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-sort os_task_id_t 0)

;; "os_task_id_t'int"
(declare-fun os_task_id_tqtint (os_task_id_t) Int)

;; "os_task_id_t'axiom"
(assert
  (forall ((i os_task_id_t))
    (and (<= (- 1) (os_task_id_tqtint i)) (<= (os_task_id_tqtint i) 4))))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= (- 1) x) (<= x 4)))

;; "to_rep"
(define-fun to_rep2 ((x os_task_id_t)) Int
  (os_task_id_tqtint x))

;; "of_rep"
(declare-fun of_rep2 (Int) os_task_id_t)

;; "inversion_axiom"
(assert
  (forall ((x os_task_id_t))
    (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; "range_axiom"
(assert
  (forall ((x os_task_id_t))
    (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                  (of_rep2 x))) )))

(declare-sort os_mbx_msg_t 0)

;; "os_mbx_msg_t'int"
(declare-fun os_mbx_msg_tqtint (os_mbx_msg_t) Int)

;; "os_mbx_msg_t'axiom"
(assert
  (forall ((i os_mbx_msg_t))
    (and (<= 0 (os_mbx_msg_tqtint i)) (<= (os_mbx_msg_tqtint i) 4294967295))))

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 4294967295)))

;; "to_rep"
(define-fun to_rep3 ((x os_mbx_msg_t)) Int
  (os_mbx_msg_tqtint x))

;; "of_rep"
(declare-fun of_rep3 (Int) os_mbx_msg_t)

;; "inversion_axiom"
(assert
  (forall ((x os_mbx_msg_t))
    (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; "range_axiom"
(assert
  (forall ((x os_mbx_msg_t))
    (! (in_range3 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                                  (of_rep3 x))) )))

(declare-datatypes ()
  ((us_split_fields
   (us_split_fieldsqtmk
   (rec__test__os_mbx_entry_t__sender_id os_task_id_t)(rec__test__os_mbx_entry_t__msg os_mbx_msg_t)))))

(declare-datatypes ()
  ((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))

;; "bool_eq"
(define-fun bool_eq ((a us_rep) (b us_rep)) Bool
  (ite (and
         (= (to_rep2
              (rec__test__os_mbx_entry_t__sender_id (us_split_fields1 a))) 
         (to_rep2
           (rec__test__os_mbx_entry_t__sender_id (us_split_fields1 b))))
         (= (to_rep3 (rec__test__os_mbx_entry_t__msg (us_split_fields1 a))) 
         (to_rep3
           (rec__test__os_mbx_entry_t__msg (us_split_fields1 b)))))
    true
    false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const test__os_mbx_entry_t__sender_id__first__bit Int)

(declare-const test__os_mbx_entry_t__sender_id__last__bit Int)

(declare-const test__os_mbx_entry_t__sender_id__position Int)

;; "test__os_mbx_entry_t__sender_id__first__bit_axiom"
(assert (<= 0 test__os_mbx_entry_t__sender_id__first__bit))

;; "test__os_mbx_entry_t__sender_id__last__bit_axiom"
(assert
  (< test__os_mbx_entry_t__sender_id__first__bit test__os_mbx_entry_t__sender_id__last__bit))

;; "test__os_mbx_entry_t__sender_id__position_axiom"
(assert (<= 0 test__os_mbx_entry_t__sender_id__position))

(declare-const test__os_mbx_entry_t__msg__first__bit Int)

(declare-const test__os_mbx_entry_t__msg__last__bit Int)

(declare-const test__os_mbx_entry_t__msg__position Int)

;; "test__os_mbx_entry_t__msg__first__bit_axiom"
(assert (<= 0 test__os_mbx_entry_t__msg__first__bit))

;; "test__os_mbx_entry_t__msg__last__bit_axiom"
(assert
  (< test__os_mbx_entry_t__msg__first__bit test__os_mbx_entry_t__msg__last__bit))

;; "test__os_mbx_entry_t__msg__position_axiom"
(assert (<= 0 test__os_mbx_entry_t__msg__position))

(declare-const dummy us_rep)

;; "bool_eq"
(define-fun bool_eq1 ((a (Array (_ BitVec 8) us_rep)) (a__first (_ BitVec 8)) (a__last (_ BitVec 8)) (b (Array (_ BitVec 8) us_rep)) (b__first (_ BitVec 8)) (b__last (_ BitVec 8))) Bool
  (ite (and
         (ite (bvule a__first a__last)
           (and
             (bvule b__first b__last)
             (= (bvsub a__last a__first) (bvsub b__last b__first)))
           (bvugt b__first b__last))
         (forall ((temp___idx_168 (_ BitVec 8)))
           (=>
             (and
               (bvule a__first temp___idx_168)
               (bvule temp___idx_168 a__last))
             (= (bool_eq
                  (select a temp___idx_168)
                  (select b (bvadd (bvsub b__first a__first) temp___idx_168))) true))))
    true
    false))

;; "bool_eq_rev"
(assert
  (forall ((a (Array (_ BitVec 8) us_rep)) (b (Array (_ BitVec 8) us_rep)))
    (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8)) (b__first (_ BitVec 8)) (b__last (_ BitVec 8)))
      (=>
        (= (bool_eq1 b b__first b__last a a__first a__last) true)
        (and
          (ite (bvule a__first a__last)
            (and
              (bvule b__first b__last)
              (= (bvsub a__last a__first) (bvsub b__last b__first)))
            (bvugt b__first b__last))
          (forall ((temp___idx_168 (_ BitVec 8)))
            (=>
              (and
                (bvule a__first temp___idx_168)
                (bvule temp___idx_168 a__last))
              (= (bool_eq
                   (select a temp___idx_168)
                   (select b (bvadd (bvsub b__first a__first) temp___idx_168))) true))))))))

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

(declare-datatypes ()
  ((us_split_fields2
   (us_split_fieldsqtmk1
   (rec__test__os_mbx_t__head os_mbx_index_t)(rec__test__os_mbx_t__count os_mbx_count_t)(rec__test__os_mbx_t__mbx_array (Array (_ BitVec 8) us_rep))))))

(declare-datatypes ()
  ((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))

;; "bool_eq"
(define-fun bool_eq2 ((a us_rep1) (b us_rep1)) Bool
  (ite (and
         (= (to_rep (rec__test__os_mbx_t__head (us_split_fields3 a))) 
         (to_rep
           (rec__test__os_mbx_t__head (us_split_fields3 b))))
         (and
           (= (to_rep1 (rec__test__os_mbx_t__count (us_split_fields3 a))) 
           (to_rep1
             (rec__test__os_mbx_t__count (us_split_fields3 b))))
           (= (bool_eq1
                (rec__test__os_mbx_t__mbx_array (us_split_fields3 a))
                #x00
                #x02
                (rec__test__os_mbx_t__mbx_array (us_split_fields3 b))
                #x00
                #x02) true)))
    true
    false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "alignment_axiom"
(assert (<= 0 alignment2))

(declare-const test__os_mbx_t__head__first__bit Int)

(declare-const test__os_mbx_t__head__last__bit Int)

(declare-const test__os_mbx_t__head__position Int)

;; "test__os_mbx_t__head__first__bit_axiom"
(assert (<= 0 test__os_mbx_t__head__first__bit))

;; "test__os_mbx_t__head__last__bit_axiom"
(assert (< test__os_mbx_t__head__first__bit test__os_mbx_t__head__last__bit))

;; "test__os_mbx_t__head__position_axiom"
(assert (<= 0 test__os_mbx_t__head__position))

(declare-const test__os_mbx_t__count__first__bit Int)

(declare-const test__os_mbx_t__count__last__bit Int)

(declare-const test__os_mbx_t__count__position Int)

;; "test__os_mbx_t__count__first__bit_axiom"
(assert (<= 0 test__os_mbx_t__count__first__bit))

;; "test__os_mbx_t__count__last__bit_axiom"
(assert
  (< test__os_mbx_t__count__first__bit test__os_mbx_t__count__last__bit))

;; "test__os_mbx_t__count__position_axiom"
(assert (<= 0 test__os_mbx_t__count__position))

(declare-const test__os_mbx_t__mbx_array__first__bit Int)

(declare-const test__os_mbx_t__mbx_array__last__bit Int)

(declare-const test__os_mbx_t__mbx_array__position Int)

;; "test__os_mbx_t__mbx_array__first__bit_axiom"
(assert (<= 0 test__os_mbx_t__mbx_array__first__bit))

;; "test__os_mbx_t__mbx_array__last__bit_axiom"
(assert
  (< test__os_mbx_t__mbx_array__first__bit test__os_mbx_t__mbx_array__last__bit))

;; "test__os_mbx_t__mbx_array__position_axiom"
(assert (<= 0 test__os_mbx_t__mbx_array__position))

(declare-const dummy1 us_rep1)

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int us_rep1))))))

;; "os_mbx_get_mbx_head"
(define-fun os_mbx_get_mbx_head ((param__task_id Int) (Test__os_task_mbx_rw___os_task_mbx_rw___ (Array Int us_rep1))) (_ BitVec 8)
  (to_rep
    (rec__test__os_mbx_t__head
      (us_split_fields3
        (select Test__os_task_mbx_rw___os_task_mbx_rw___ param__task_id)))))

;; "os_ghost_mbx_are_well_formed"
(declare-fun os_ghost_mbx_are_well_formed ((Array Int us_rep1)) Bool)

;; "os_mbx_get_mbx_count"
(define-fun os_mbx_get_mbx_count ((param__task_id Int) (Test__os_task_mbx_rw___os_task_mbx_rw___ (Array Int us_rep1))) (_ BitVec 8)
  (to_rep1
    (rec__test__os_mbx_t__count
      (us_split_fields3
        (select Test__os_task_mbx_rw___os_task_mbx_rw___ param__task_id)))))

;; "oadd"
(define-fun oadd ((param__left (_ BitVec 8)) (param__right (_ BitVec 8))) (_ BitVec 8)
  (let ((temp___172 (bvadd param__left (bvurem param__right #x03))))
    (ite (bvule (bvsub #x03 param__left) (bvurem param__right #x03))
      (bvsub temp___172 #x03)
      temp___172)))

;; "in_range"
(define-fun in_range4 ((x Int)) Bool
  (and (<= 0 x) (<= x 4)))

;; "os_ghost_task_mbx_are_well_formed"
(define-fun os_ghost_task_mbx_are_well_formed ((param__task_id Int) (Test__os_task_mbx_rw___os_task_mbx_rw___ (Array Int us_rep1))) Bool
  (ite (forall ((index (_ BitVec 8)))
         (=>
           (and (bvule #x00 index) (bvule index #x02))
           (ite (bvuge index (os_mbx_get_mbx_count
                               param__task_id
                               Test__os_task_mbx_rw___os_task_mbx_rw___))
             (= (to_rep2
                  (rec__test__os_mbx_entry_t__sender_id
                    (us_split_fields1
                      (let ((temp___175 (rec__test__os_mbx_t__mbx_array
                                          (us_split_fields3
                                            (select Test__os_task_mbx_rw___os_task_mbx_rw___ param__task_id)))))
                        (select temp___175 (oadd
                                             (os_mbx_get_mbx_head
                                               param__task_id
                                               Test__os_task_mbx_rw___os_task_mbx_rw___)
                                             index)))))) (- 1))
             (in_range4
               (to_rep2
                 (rec__test__os_mbx_entry_t__sender_id
                   (us_split_fields1
                     (let ((temp___176 (rec__test__os_mbx_t__mbx_array
                                         (us_split_fields3
                                           (select Test__os_task_mbx_rw___os_task_mbx_rw___ param__task_id)))))
                       (select temp___176 (oadd
                                            (os_mbx_get_mbx_head
                                              param__task_id
                                              Test__os_task_mbx_rw___os_task_mbx_rw___)
                                            index))))))))))
    true
    false))

;; "os_mbx_is_empty"
(define-fun os_mbx_is_empty ((param__task_id Int) (Test__os_task_mbx_rw___os_task_mbx_rw___ (Array Int us_rep1))) Bool
  (= (to_rep1
       (rec__test__os_mbx_t__count
         (us_split_fields3
           (select Test__os_task_mbx_rw___os_task_mbx_rw___ param__task_id)))) #x00))

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_324 us_rep1) (temp___is_init_320 Bool) (temp___skip_constant_321 Bool) (temp___do_toplevel_322 Bool) (temp___do_typ_inv_323 Bool)) Bool
  true)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size1 Int)

(declare-const alignment3 Int)

;; "value__size_axiom"
(assert (<= 0 value__size3))

;; "object__size_axiom"
(assert (<= 0 object__size3))

;; "component__size_axiom"
(assert (<= 0 component__size1))

;; "alignment_axiom"
(assert (<= 0 alignment3))

(declare-const task_id Int)

(declare-const mbx_index (_ BitVec 8))

(declare-const c20b Int)

(declare-const c21b (_ BitVec 8))

(declare-const c23b Int)

;; "os_ghost_mbx_are_well_formed__post_axiom"
(assert true)

;; "os_ghost_mbx_are_well_formed__def_axiom"
(assert
  (forall ((Test__os_task_mbx_rw___os_task_mbx_rw___ (Array Int us_rep1)))
    (! (=
         (= (os_ghost_mbx_are_well_formed
              Test__os_task_mbx_rw___os_task_mbx_rw___) true)
         (forall ((task_id1 Int))
           (=>
             (and (<= 0 task_id1) (<= task_id1 4))
             (= (os_ghost_task_mbx_are_well_formed
                  task_id1
                  Test__os_task_mbx_rw___os_task_mbx_rw___) true)))) :pattern (
    (os_ghost_mbx_are_well_formed
      Test__os_task_mbx_rw___os_task_mbx_rw___)) )))

(declare-const rliteral os_task_id_t)

;; "rliteral_axiom"
(assert (= (os_task_id_tqtint rliteral) (- 1)))

(declare-const rliteral1 os_mbx_msg_t)

;; "rliteral_axiom"
(assert (= (os_mbx_msg_tqtint rliteral1) 0))

(declare-const os_task_mbx_rw (Array Int us_rep1))

;; "os_task_mbx_rw'unused"
(define-fun os_task_mbx_rwqtunused () map__ref
  (map__refqtmk os_task_mbx_rw))

;; "os_task_mbx_rw'unused"
(define-fun os_task_mbx_rwqtunused1 () map__ref
  (map__refqtmk os_task_mbx_rw))

;; "Assume"
(assert
  (forall ((temp___584 Int))
    (=>
      (and (<= 0 temp___584) (<= temp___584 4))
      (dynamic_invariant
        (select os_task_mbx_rw temp___584)
        true
        false
        true
        true))))

;; "Assume"
(assert (in_range4 task_id))

;; "Assume"
(assert
  (and
    (not (= (os_mbx_is_empty task_id os_task_mbx_rw) true))
    (= (os_ghost_mbx_are_well_formed os_task_mbx_rw) true)))

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused () (Array Int us_rep1)
  os_task_mbx_rw)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused1 () (Array Int us_rep1)
  os_task_mbx_rw)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused2 () (Array Int us_rep1)
  os_task_mbx_rw)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused3 () (Array Int us_rep1)
  os_task_mbx_rw)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused4 () (Array Int us_rep1)
  os_task_mbx_rw)

;; "o"
(define-fun o () Int
  task_id)

;; "test__os_mbx_remove_first_mbx__mbx_index__assume"
(define-fun test__os_mbx_remove_first_mbx__mbx_index__assume () (_ BitVec 8)
  (os_mbx_get_mbx_head o os_task_mbx_rw))

;; "H"
(assert (in_range test__os_mbx_remove_first_mbx__mbx_index__assume))

;; "H"
(assert
  (= test__os_mbx_remove_first_mbx__mbx_index__assume (to_rep
                                                        (rec__test__os_mbx_t__head
                                                          (us_split_fields3
                                                            (select os_task_mbx_rw 
                                                            o))))))

;; "os_mbx_get_mbx_head'result'unused"
(define-fun os_mbx_get_mbx_headqtresultqtunused () (_ BitVec 8)
  test__os_mbx_remove_first_mbx__mbx_index__assume)

;; "Assume"
(assert (= test__os_mbx_remove_first_mbx__mbx_index__assume mbx_index))

;; "Assume"
(assert (in_range mbx_index))

;; "test__os_mbx_remove_first_mbx__C20b__assume'unused"
(define-fun test__os_mbx_remove_first_mbx__C20b__assumeqtunused () Int
  task_id)

;; "Assume"
(assert (= task_id c20b))

;; "Assume"
(assert (in_range4 c20b))

;; "test__os_mbx_remove_first_mbx__C21b__assume'unused"
(define-fun test__os_mbx_remove_first_mbx__C21b__assumeqtunused () (_ BitVec 8)
  mbx_index)

;; "Assume"
(assert (= mbx_index c21b))

;; "Assume"
(assert (in_range c21b))

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused5 () (Array Int us_rep1)
  os_task_mbx_rw)

;; "temp___546"
(define-fun temp___546 () us_rep1
  (select os_task_mbx_rw c20b))

;; "get'result'unused"
(define-fun getqtresultqtunused () us_rep1
  temp___546)

;; "_q "
(define-fun usq_ () us_split_fields2
  (us_split_fields3 temp___546))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused () us_split_fields2
  usq_)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused6 () (Array Int us_rep1)
  os_task_mbx_rw)

;; "o"
(define-fun o1 () us_rep1
  (select os_task_mbx_rw c20b))

;; "get'result'unused"
(define-fun getqtresultqtunused1 () us_rep1
  o1)

;; "o"
(define-fun o2 () us_split_fields2
  (us_split_fields3 o1))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused1 () us_split_fields2
  o2)

;; "temp___544"
(define-fun temp___544 () (Array (_ BitVec 8) us_rep)
  (rec__test__os_mbx_t__mbx_array o2))

;; "rec__test__os_mbx_t__mbx_array'result'unused"
(define-fun rec__test__os_mbx_t__mbx_arrayqtresultqtunused () (Array (_ BitVec 8) us_rep)
  temp___544)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused7 () (Array Int us_rep1)
  os_task_mbx_rw)

;; "o"
(define-fun o3 () us_rep1
  (select os_task_mbx_rw c20b))

;; "get'result'unused"
(define-fun getqtresultqtunused2 () us_rep1
  o3)

;; "o"
(define-fun o4 () us_split_fields2
  (us_split_fields3 o3))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused2 () us_split_fields2
  o4)

;; "temp___541"
(define-fun temp___541 () (Array (_ BitVec 8) us_rep)
  (rec__test__os_mbx_t__mbx_array o4))

;; "rec__test__os_mbx_t__mbx_array'result'unused"
(define-fun rec__test__os_mbx_t__mbx_arrayqtresultqtunused1 () (Array (_ BitVec 8) us_rep)
  temp___541)

;; "temp___542"
(define-fun temp___542 () us_rep
  (select temp___541 c21b))

;; "get'result'unused"
(define-fun getqtresultqtunused3 () us_rep
  temp___542)

;; "_q "
(define-fun usq_1 () us_split_fields
  (us_split_fields1 temp___542))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused3 () us_split_fields
  usq_1)

;; "o"
(define-fun o5 () os_mbx_msg_t
  (rec__test__os_mbx_entry_t__msg usq_1))

;; "rec__test__os_mbx_entry_t__msg'result'unused"
(define-fun rec__test__os_mbx_entry_t__msgqtresultqtunused () os_mbx_msg_t
  o5)

;; "o"
(define-fun o6 () us_split_fields
  (us_split_fieldsqtmk rliteral o5))

;; "__split_fields'mk'result'unused"
(define-fun us_split_fieldsqtmkqtresultqtunused () us_split_fields
  o6)

;; "o"
(define-fun o7 () us_rep
  (us_repqtmk o6))

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused () us_rep
  o7)

;; "o"
(define-fun o8 () (Array (_ BitVec 8) us_rep)
  (store temp___544 c21b o7))

;; "set'result'unused"
(define-fun setqtresultqtunused () (Array (_ BitVec 8) us_rep)
  o8)

;; "o"
(define-fun o9 () os_mbx_count_t
  (rec__test__os_mbx_t__count usq_))

;; "rec__test__os_mbx_t__count'result'unused"
(define-fun rec__test__os_mbx_t__countqtresultqtunused () os_mbx_count_t
  o9)

;; "o"
(define-fun o10 () os_mbx_index_t
  (rec__test__os_mbx_t__head usq_))

;; "rec__test__os_mbx_t__head'result'unused"
(define-fun rec__test__os_mbx_t__headqtresultqtunused () os_mbx_index_t
  o10)

;; "o"
(define-fun o11 () us_split_fields2
  (us_split_fieldsqtmk1 o10 o9 o8))

;; "__split_fields'mk'result'unused"
(define-fun us_split_fieldsqtmkqtresultqtunused1 () us_split_fields2
  o11)

;; "o"
(define-fun o12 () us_rep1
  (us_repqtmk1 o11))

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused1 () us_rep1
  o12)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused8 () (Array Int us_rep1)
  os_task_mbx_rw)

;; "o"
(define-fun o13 () (Array Int us_rep1)
  (store os_task_mbx_rw c20b o12))

;; "set'result'unused"
(define-fun setqtresultqtunused1 () (Array Int us_rep1)
  o13)

(declare-const os_task_mbx_rw1 (Array Int us_rep1))

;; "os_task_mbx_rw'unused"
(define-fun os_task_mbx_rwqtunused2 () map__ref
  (map__refqtmk os_task_mbx_rw1))

;; "H"
(assert (= os_task_mbx_rw1 o13))

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused9 () (Array Int us_rep1)
  os_task_mbx_rw1)

;; "temp___554"
(define-fun temp___554 () us_rep1
  (select os_task_mbx_rw1 c20b))

;; "get'result'unused"
(define-fun getqtresultqtunused4 () us_rep1
  temp___554)

;; "_q "
(define-fun usq_2 () us_split_fields2
  (us_split_fields3 temp___554))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused4 () us_split_fields2
  usq_2)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused10 () (Array Int us_rep1)
  os_task_mbx_rw1)

;; "o"
(define-fun o14 () us_rep1
  (select os_task_mbx_rw1 c20b))

;; "get'result'unused"
(define-fun getqtresultqtunused5 () us_rep1
  o14)

;; "o"
(define-fun o15 () us_split_fields2
  (us_split_fields3 o14))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused5 () us_split_fields2
  o15)

;; "temp___552"
(define-fun temp___552 () (Array (_ BitVec 8) us_rep)
  (rec__test__os_mbx_t__mbx_array o15))

;; "rec__test__os_mbx_t__mbx_array'result'unused"
(define-fun rec__test__os_mbx_t__mbx_arrayqtresultqtunused2 () (Array (_ BitVec 8) us_rep)
  temp___552)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused11 () (Array Int us_rep1)
  os_task_mbx_rw1)

;; "o"
(define-fun o16 () us_rep1
  (select os_task_mbx_rw1 c20b))

;; "get'result'unused"
(define-fun getqtresultqtunused6 () us_rep1
  o16)

;; "o"
(define-fun o17 () us_split_fields2
  (us_split_fields3 o16))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused6 () us_split_fields2
  o17)

;; "temp___549"
(define-fun temp___549 () (Array (_ BitVec 8) us_rep)
  (rec__test__os_mbx_t__mbx_array o17))

;; "rec__test__os_mbx_t__mbx_array'result'unused"
(define-fun rec__test__os_mbx_t__mbx_arrayqtresultqtunused3 () (Array (_ BitVec 8) us_rep)
  temp___549)

;; "temp___550"
(define-fun temp___550 () us_rep
  (select temp___549 c21b))

;; "get'result'unused"
(define-fun getqtresultqtunused7 () us_rep
  temp___550)

;; "_q "
(define-fun usq_3 () us_split_fields
  (us_split_fields1 temp___550))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused7 () us_split_fields
  usq_3)

;; "o"
(define-fun o18 () os_task_id_t
  (rec__test__os_mbx_entry_t__sender_id usq_3))

;; "rec__test__os_mbx_entry_t__sender_id'result'unused"
(define-fun rec__test__os_mbx_entry_t__sender_idqtresultqtunused () os_task_id_t
  o18)

;; "o"
(define-fun o19 () us_split_fields
  (us_split_fieldsqtmk o18 rliteral1))

;; "__split_fields'mk'result'unused"
(define-fun us_split_fieldsqtmkqtresultqtunused2 () us_split_fields
  o19)

;; "o"
(define-fun o20 () us_rep
  (us_repqtmk o19))

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused2 () us_rep
  o20)

;; "o"
(define-fun o21 () (Array (_ BitVec 8) us_rep)
  (store temp___552 c21b o20))

;; "set'result'unused"
(define-fun setqtresultqtunused2 () (Array (_ BitVec 8) us_rep)
  o21)

;; "o"
(define-fun o22 () os_mbx_count_t
  (rec__test__os_mbx_t__count usq_2))

;; "rec__test__os_mbx_t__count'result'unused"
(define-fun rec__test__os_mbx_t__countqtresultqtunused1 () os_mbx_count_t
  o22)

;; "o"
(define-fun o23 () os_mbx_index_t
  (rec__test__os_mbx_t__head usq_2))

;; "rec__test__os_mbx_t__head'result'unused"
(define-fun rec__test__os_mbx_t__headqtresultqtunused1 () os_mbx_index_t
  o23)

;; "o"
(define-fun o24 () us_split_fields2
  (us_split_fieldsqtmk1 o23 o22 o21))

;; "__split_fields'mk'result'unused"
(define-fun us_split_fieldsqtmkqtresultqtunused3 () us_split_fields2
  o24)

;; "o"
(define-fun o25 () us_rep1
  (us_repqtmk1 o24))

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused3 () us_rep1
  o25)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused12 () (Array Int us_rep1)
  os_task_mbx_rw1)

;; "o"
(define-fun o26 () (Array Int us_rep1)
  (store os_task_mbx_rw1 c20b o25))

;; "set'result'unused"
(define-fun setqtresultqtunused3 () (Array Int us_rep1)
  o26)

(declare-const os_task_mbx_rw2 (Array Int us_rep1))

;; "os_task_mbx_rw'unused"
(define-fun os_task_mbx_rwqtunused3 () map__ref
  (map__refqtmk os_task_mbx_rw2))

;; "H"
(assert (= os_task_mbx_rw2 o26))

;; "test__os_mbx_remove_first_mbx__C23b__assume'unused"
(define-fun test__os_mbx_remove_first_mbx__C23b__assumeqtunused () Int
  task_id)

;; "Assume"
(assert (= task_id c23b))

;; "Assume"
(assert (in_range4 c23b))

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused13 () (Array Int us_rep1)
  os_task_mbx_rw2)

;; "temp___558"
(define-fun temp___558 () us_rep1
  (select os_task_mbx_rw2 c23b))

;; "get'result'unused"
(define-fun getqtresultqtunused8 () us_rep1
  temp___558)

;; "_q "
(define-fun usq_4 () us_split_fields2
  (us_split_fields3 temp___558))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused8 () us_split_fields2
  usq_4)

;; "o"
(define-fun o27 () (Array (_ BitVec 8) us_rep)
  (rec__test__os_mbx_t__mbx_array usq_4))

;; "rec__test__os_mbx_t__mbx_array'result'unused"
(define-fun rec__test__os_mbx_t__mbx_arrayqtresultqtunused4 () (Array (_ BitVec 8) us_rep)
  o27)

;; "o"
(define-fun o28 () os_mbx_count_t
  (rec__test__os_mbx_t__count usq_4))

;; "rec__test__os_mbx_t__count'result'unused"
(define-fun rec__test__os_mbx_t__countqtresultqtunused2 () os_mbx_count_t
  o28)

(declare-const o29 (_ BitVec 8))

(declare-const o30 Int)

;; "H"
(assert (= o30 c23b))

(declare-const o31 (_ BitVec 8))

;; "H"
(assert (= o31 (os_mbx_get_mbx_head o30 os_task_mbx_rw2)))

;; "H"
(assert (in_range o31))

;; "H"
(assert
  (= o31 (to_rep
           (rec__test__os_mbx_t__head
             (us_split_fields3 (select os_task_mbx_rw2 o30))))))

(declare-const os_mbx_get_mbx_headqtresultqtunused1 (_ BitVec 8))

;; "H"
(assert (= os_mbx_get_mbx_headqtresultqtunused1 o31))

(declare-const temp___557 (_ BitVec 8))

;; "H"
(assert (= temp___557 (bvadd o31 #x01)))

(declare-const addqtresultqtunused (_ BitVec 8))

;; "H"
(assert (= addqtresultqtunused temp___557))

(declare-const o32 Int)

;; "H"
(assert (= o32 c23b))

(declare-const o33 (_ BitVec 8))

;; "H"
(assert (= o33 (os_mbx_get_mbx_head o32 os_task_mbx_rw2)))

;; "H"
(assert (in_range o33))

;; "H"
(assert
  (= o33 (to_rep
           (rec__test__os_mbx_t__head
             (us_split_fields3 (select os_task_mbx_rw2 o32))))))

(declare-const os_mbx_get_mbx_headqtresultqtunused2 (_ BitVec 8))

;; "H"
(assert (= os_mbx_get_mbx_headqtresultqtunused2 o33))

(declare-const o34 (_ BitVec 8))

;; "H"
(assert (= o34 (bvsub #x03 o33)))

(declare-const subqtresultqtunused (_ BitVec 8))

;; "H"
(assert (= subqtresultqtunused o34))

(declare-const uleqtresultqtunused Bool)

;; "H"
(assert (= uleqtresultqtunused (ite (bvule o34 #x01) true false)))

(declare-const subqtresultqtunused1 (_ BitVec 8))

;; "H"
(assert
  (ite (bvule o34 #x01)
    (and (= o29 (bvsub temp___557 #x03)) (= subqtresultqtunused1 o29))
    (= o29 temp___557)))

(declare-const o35 os_mbx_index_t)

;; "Ensures"
(assert (= (to_rep o35) o29))

;; "of_rep'result'unused"
(define-fun of_repqtresultqtunused () os_mbx_index_t
  o35)

;; "o"
(define-fun o36 () us_split_fields2
  (us_split_fieldsqtmk1 o35 o28 o27))

;; "__split_fields'mk'result'unused"
(define-fun us_split_fieldsqtmkqtresultqtunused4 () us_split_fields2
  o36)

;; "o"
(define-fun o37 () us_rep1
  (us_repqtmk1 o36))

;; "__rep'mk'result'unused"
(define-fun us_repqtmkqtresultqtunused4 () us_rep1
  o37)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused14 () (Array Int us_rep1)
  os_task_mbx_rw2)

;; "o"
(define-fun o38 () (Array Int us_rep1)
  (store os_task_mbx_rw2 c23b o37))

;; "set'result'unused"
(define-fun setqtresultqtunused4 () (Array Int us_rep1)
  o38)

(declare-const os_task_mbx_rw3 (Array Int us_rep1))

;; "os_task_mbx_rw'unused"
(define-fun os_task_mbx_rwqtunused4 () map__ref
  (map__refqtmk os_task_mbx_rw3))

;; "H"
(assert (= os_task_mbx_rw3 o38))

;; "o"
(define-fun o39 () Int
  task_id)

;; "os_task_mbx_rw'unused"
(define-fun os_task_mbx_rwqtunused5 () map__ref
  (map__refqtmk os_task_mbx_rw3))

(declare-const os_task_mbx_rw4 (Array Int us_rep1))

;; "os_task_mbx_rw'unused"
(define-fun os_task_mbx_rwqtunused6 () map__ref
  (map__refqtmk os_task_mbx_rw4))

;; "H"
(assert
  (forall ((temp___index_372 Int))
    (=>
      (and (<= 0 temp___index_372) (<= temp___index_372 4))
      (= (bool_eq2
           (select os_task_mbx_rw4 temp___index_372)
           (ite (= temp___index_372 o39)
             (us_repqtmk1
               (let ((usq_5 (us_split_fields3 (select os_task_mbx_rw3 o39))))
                 (us_split_fieldsqtmk1
                   (rec__test__os_mbx_t__head usq_5)
                   (of_rep1
                     (bvsub (to_rep1
                              (rec__test__os_mbx_t__count
                                (us_split_fields3
                                  (select os_task_mbx_rw3 o39)))) #x01))
                   (rec__test__os_mbx_t__mbx_array usq_5))))
             (select os_task_mbx_rw3 temp___index_372))) true))))

;; "H"
(assert true)

;; "H"
(assert
  (forall ((temp___376 Int))
    (=>
      (and (<= 0 temp___376) (<= temp___376 4))
      (dynamic_invariant
        (select os_task_mbx_rw4 temp___376)
        true
        false
        true
        true))))

;; "H"
(assert true)

;; "H"
(assert true)

(declare-const usf Int)

;; "any'result'unused"
(define-fun anyqtresultqtunused () Int
  usf)

;; "temp___575"
(define-fun temp___575 () us_rep1
  (select os_task_mbx_rw task_id))

;; "get'result'unused"
(define-fun getqtresultqtunused9 () us_rep1
  temp___575)

;; "_q 'unused"
(define-fun usq_qtunused () us_split_fields2
  (us_split_fields3 temp___575))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused9 () us_split_fields2
  (us_split_fields3 temp___575))

;; "o"
(define-fun o40 () us_rep1
  (select os_task_mbx_rw task_id))

;; "get'result'unused"
(define-fun getqtresultqtunused10 () us_rep1
  o40)

;; "o"
(define-fun o41 () us_split_fields2
  (us_split_fields3 o40))

;; "__split_fields'result'unused"
(define-fun us_split_fieldsqtresultqtunused10 () us_split_fields2
  o41)

;; "temp___572"
(define-fun temp___572 () (Array (_ BitVec 8) us_rep)
  (rec__test__os_mbx_t__mbx_array o41))

;; "rec__test__os_mbx_t__mbx_array'result'unused"
(define-fun rec__test__os_mbx_t__mbx_arrayqtresultqtunused5 () (Array (_ BitVec 8) us_rep)
  temp___572)

;; "_f"
(define-fun usf1 () (_ BitVec 8)
  (let ((temp___574 (bvsub (os_mbx_get_mbx_head task_id os_task_mbx_rw4) #x01)))
    (ite (bvult (os_mbx_get_mbx_head task_id os_task_mbx_rw4) #x01)
      (bvadd temp___574 #x03)
      temp___574)))

;; "any'result'unused"
(define-fun anyqtresultqtunused1 () (_ BitVec 8)
  usf1)

;; Goal "def'vc"
;; File "test.adb", line 283, characters 0-0
(assert
  (not (bvule usf1 #x02)))

(check-sat)
