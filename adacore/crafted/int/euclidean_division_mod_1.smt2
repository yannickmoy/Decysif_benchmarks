;; axiom Mod_1 from module int.EuclideanDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)

(assert
  (not
    (= (mod x 1) 0)))

(check-sat)
