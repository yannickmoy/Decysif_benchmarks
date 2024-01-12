;; Lemma_Double_Shift from GNAT runtime

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y Int)
(declare-const z Int)

(assert
  (not
    (=> (>= y 0)
    (=> (>= z 0)
    (=> (<= (+ y z) 32)
    (= (bvshl (bvshl x ((_ int2bv 32) y)) ((_ int2bv 32) z)) (bvshl x ((_ int2bv 32) (+ y z)))))))))

(check-sat)
