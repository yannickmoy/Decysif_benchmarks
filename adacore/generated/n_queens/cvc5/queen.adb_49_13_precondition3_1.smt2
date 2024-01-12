;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-sort index 0)

;; "index'int"
(declare-fun indexqtint (index) Int)

;; "index'axiom"
(assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 8))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 1 x) (<= x 8)))

;; "to_rep"
(define-fun to_rep ((x index)) Int
  (indexqtint x))

;; "of_rep"
(declare-fun of_rep (Int) index)

;; "inversion_axiom"
(assert
  (forall ((x index)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x index)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

(declare-datatypes ((map__ref 0))
  (((map__refqtmk (map__content (Array Int index))))))

;; "consistent"
(define-fun consistent ((param__b (Array Int index)) (param__k Int)) Bool
  (ite (forall ((i Int))
         (=>
           (and (<= 1 i) (<= i param__k))
           (forall ((j Int))
             (=>
               (and (<= 1 j) (<= j (- i 1)))
               (and
                 (and
                   (not
                     (= (to_rep (select param__b i)) (to_rep
                                                       (select param__b j))))
                   (not
                     (= (- i j) (- (to_rep (select param__b i)) (to_rep
                                                                  (select param__b j))))))
                 (not
                   (= (- i j) (- (to_rep (select param__b j)) (to_rep
                                                                (select param__b i))))))))))
    true
    false))

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

(declare-const i Int)

(declare-const c (Array Int index))

;; Goal "def'vc"
;; File "queen.ads", line 47, characters 0-0
(assert
  (not
  (forall ((b (Array Int index)) (done__ Bool))
    (=>
      (in_range i)
      (=>
        (and
          (and
            (not (= done__ true))
            (forall ((j Int))
              (=>
                (and (<= 1 j) (<= j (- i 1)))
                (= (to_rep (select c j)) (to_rep (select b j))))))
          (=> (< 1 i) (= (consistent b (- i 1)) true)))
        (forall ((r Int))
          (=>
            (= r 1)
            (=>
              (= (and (ite (<= 1 r) true false) (ite (<= r 8) true false)) true)
              (forall ((o Bool))
                (=>
                  (exists ((o1 Int))
                    (and
                      (= (to_rep (select c i)) o1)
                      (ite (< o1 r)
                        (let ((o2 c))
                          (let ((o3 (consistent o2 8)))
                            (and
                              (=
                                (= o3 true)
                                (forall ((i1 Int))
                                  (=>
                                    (and (<= 1 i1) (<= i1 8))
                                    (forall ((j Int))
                                      (=>
                                        (and (<= 1 j) (<= j (- i1 1)))
                                        (and
                                          (and
                                            (not
                                              (= (to_rep (select o2 i1)) 
                                              (to_rep
                                                (select o2 j))))
                                            (not
                                              (= (- i1 j) (- (to_rep
                                                               (select o2 i1)) 
                                              (to_rep
                                                (select o2 j))))))
                                          (not
                                            (= (- i1 j) (- (to_rep
                                                             (select o2 j)) 
                                            (to_rep
                                              (select o2 i1)))))))))))
                              (= o (ite (= o3 true) false true)))))
                        (= o (distinct 1 0)))))
                  (forall ((b1 (Array Int index)) (done__1 Bool) (r1 Int))
                    (=>
                      (and
                        (and
                          (not (= done__1 true))
                          (forall ((j Int))
                            (=>
                              (and (<= 1 j) (<= j (- i 1)))
                              (= (to_rep (select b1 j)) (to_rep (select b j))))))
                        (=>
                          (< (to_rep (select c i)) r1)
                          (not (= (consistent c 8) true))))
                      (=>
                        (= (and (ite true true false) (ite (and
                                                             (<= 1 r1)
                                                             (<= r1 8))
                                                        true
                                                        false)) true)
                        (forall ((o1 index))
                          (=>
                            (= (to_rep o1) r1)
                            (forall ((b2 (Array Int index)))
                              (=>
                                (= b2 (store b1 i o1))
                                (forall ((o2 Int))
                                  (=>
                                    (= (to_rep (select c i)) o2)
                                    (forall ((spark__branch Bool))
                                      (=>
                                        (= spark__branch (ite (= o2 r1)
                                                           true
                                                           false))
                                        (=>
                                          (= spark__branch true)
                                          (let ((o3 i))
                                            (=>
                                              (< 1 o3)
                                              (= (consistent b2 (- o3 1)) true)))))))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)
