;; axiom Mod_0 from module int.EuclideanDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const y Int)

(assert
  (not
    (=> (not (= y 0))
      (= (mod 0 y) 0))))

(check-sat)
