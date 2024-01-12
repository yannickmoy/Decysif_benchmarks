;; Lemma_Div_Is_Monotonic from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))
(declare-const z (_ BitVec 32))

(assert
  (not
    (=> (bvugt z #x00000000)
      (=> (bvule x y)
        (bvule (bvudiv x z) (bvudiv y z))))))

(check-sat)
