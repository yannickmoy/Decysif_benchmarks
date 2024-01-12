;; axiom Div_inf from module int.EuclideanDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)
(declare-const y Int)

(assert
  (not
    (=> (<= 0 x)
      (=> (< x y)
        (= (div x y) 0)))))

(check-sat)
