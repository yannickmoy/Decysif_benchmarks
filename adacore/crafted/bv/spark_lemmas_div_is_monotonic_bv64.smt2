;; Lemma_Div_Is_Monotonic from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 64))
(declare-const y (_ BitVec 64))
(declare-const z (_ BitVec 64))

(assert
  (not
    (=> (bvugt z #x0000000000000000)
      (=> (bvule x y)
        (bvule (bvudiv x z) (bvudiv y z))))))

(check-sat)
