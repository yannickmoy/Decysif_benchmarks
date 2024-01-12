;; axiom Div_minus_1_left from module int.EuclideanDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const y Int)

(assert
  (not
    (=> (> y 1)
      (= (div (- 1) y) (- 1)))))

(check-sat)
