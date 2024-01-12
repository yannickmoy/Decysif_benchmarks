;; lemma on Euclidean division

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x Int)
(declare-const y Int)

(assert
  (not
    (=> (not (= y 0))
      (= (div x (- y)) (- (div x y))))))

(check-sat)
