;; axiom Div_bound from module int.EuclideanDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)
(declare-const y Int)

(assert
  (not
    (=> (>= x 0)
      (=> (> y 0)
        (and (<= 0 (div x y)) (<= (div x y) x))))))

(check-sat)
