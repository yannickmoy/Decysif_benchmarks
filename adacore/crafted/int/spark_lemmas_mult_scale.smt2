;; Lemma_Mult_Scale from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(define-fun cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-const r Int)

(assert
  (not
    (=> (>= y 0)
    (=> (> z 0)
    (=> (<= y z)
    (=> (= r (cdiv (* x y) z))
    (and (<= (abs r) (abs x))
    (and (=> (>= x 0) (>= r 0)) (=> (<= x 0) (<= r 0))))))))))

(check-sat)
