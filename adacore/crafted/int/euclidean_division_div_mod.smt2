;; axiom Div_mod from module int.EuclideanDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)
(declare-const y Int)

(assert
  (not
    (=> (not (= y 0)) (= x (+ (* y (div x y)) (mod x y))))))

(check-sat)
