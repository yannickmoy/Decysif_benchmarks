;; lemma from SPARK test

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))

(assert
  (not
    (=> (bvule x (bvsub #xFFFFFFFF y))
    (= (bv2nat (bvadd x y)) (+ (bv2nat x) (bv2nat y))))))

(check-sat)
