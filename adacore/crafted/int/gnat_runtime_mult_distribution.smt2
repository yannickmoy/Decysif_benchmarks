;; Lemma_Mult_Distribution from GNAT runtime

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert
  (not
    (= (* x (+ y z)) (+ (* x y) (* x z)))))

(check-sat)
