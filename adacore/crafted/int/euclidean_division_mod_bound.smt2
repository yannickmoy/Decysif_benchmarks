;; axiom Mod_bound from module int.ComputerDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)
(declare-const y Int)

(assert
  (not
    (=> (not (= y 0))
      (and (<= 0 (mod x y)) (< (mod x y) (abs y))))))

(check-sat)
