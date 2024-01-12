;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

(declare-sort us_rep 0)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const dummy us_rep)

;; "has_key"
(declare-fun has_key (us_rep
  Int) Bool)

;; "get"
(declare-fun get (us_rep
  Int) Int)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

;; "keys_included"
(declare-fun keys_included (us_rep
  us_rep) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const dummy1 us_rep)

(declare-const left us_rep)

(declare-const right us_rep)

(declare-const result__ us_rep)

;; "has_key__post_axiom"
(assert true)

;; "lemma_has_key_equivalent__post_axiom"
(assert
  (forall ((param__container us_rep))
    (forall ((param__key Int))
      (=>
        (and
          (in_range param__key)
          (and
            (= (distinct 1 0) true)
            (not (= (has_key param__container param__key) true))))
        (forall ((k Int))
          (=>
            (and (in_range k) (= (has_key param__container k) true))
            (not (= param__key k))))))))

;; "get__post_axiom"
(assert
  (forall ((param__container us_rep))
    (forall ((param__key Int))
      (! (=>
           (and
             (in_range param__key)
             (= (has_key param__container param__key) true))
           (in_range1 (get param__container param__key))) :pattern ((get
                                                                    param__container
                                                                    param__key)) ))))

;; "lemma_get_equivalent__post_axiom"
(assert
  (forall ((param__container us_rep))
    (forall ((param__key_1 Int) (param__key_2 Int))
      (=>
        (and
          (and (in_range param__key_1) (in_range param__key_2))
          (and
            (and (= (distinct 1 0) true) (= param__key_1 param__key_2))
            (or
              (= (has_key param__container param__key_1) true)
              (= (has_key param__container param__key_2) true))))
        (= (get param__container param__key_1) (get
                                                 param__container
                                                 param__key_2))))))

;; Goal "def'vc"
;; File "recursive_mergesort.ads", line 34, characters 0-0
(assert
  (not
  (forall ((o Bool))
    (=>
      (let ((o1 result__))
        (let ((o2 left))
          (let ((o3 (keys_included o2 o1)))
            (and
              (=
                (= o3 true)
                (forall ((key Int))
                  (=>
                    (and (in_range key) (= (has_key o2 key) true))
                    (= (has_key o1 key) true))))
              (ite (= o3 true)
                (let ((o4 result__))
                  (let ((o5 right))
                    (and
                      (= o (keys_included o5 o4))
                      (=
                        (= o true)
                        (forall ((key Int))
                          (=>
                            (and (in_range key) (= (has_key o5 key) true))
                            (= (has_key o4 key) true)))))))
                (= o false))))))
      (=>
        (= o true)
        (forall ((usf Int))
          (=>
            (= (and (ite (in_range usf) true false) (has_key result__ usf)) true)
            (=>
              (= (and (has_key left usf) (has_key right usf)) true)
              (=> (in_range1 (get left usf)) (= (has_key right usf) true))))))))))

(check-sat)
(get-info :reason-unknown)