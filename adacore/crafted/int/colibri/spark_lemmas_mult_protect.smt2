;; Lemma_Mult_Protect from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(define-fun cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert
  (not
    (=> (>= y 0)
    (=> (>= z 0)
    (=> (or (= y 0) (<= x (colibri_cdiv z y)))
    (<= (* x y) z))))))

(check-sat)
