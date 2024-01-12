;; axiom Div_unique from module int.EuclideanDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)
(declare-const y Int)
(declare-const q Int)

(assert
  (not
    (=> (> y 0)
      (=> (<= (* q y) x)
        (=> (< x (+ (* q y) y))
          (= (div x y) q))))))

(check-sat)
