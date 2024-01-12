;; axiom Div_mult from module int.EuclideanDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert
  (not
    (=> (> x 0)
      (= (div (+ (* x y) z) x) (+ y (div z x))))))

(check-sat)
