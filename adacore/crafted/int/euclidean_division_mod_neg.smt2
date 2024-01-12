;; lemma on Euclidean modulo

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)
(declare-const y Int)

(assert
  (not
    (=> (not (= y 0))
      (= (mod x (- y)) (mod x y)))))

(check-sat)
