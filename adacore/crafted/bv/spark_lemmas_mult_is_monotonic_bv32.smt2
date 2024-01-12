;; Lemma_Mult_Is_Monotonic from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))
(declare-const z (_ BitVec 32))

(assert
  (not
    (=> (bvule x y)
      (=> (or (= z #x00000000) (bvule y (bvudiv #xFFFFFFFF z)))
        (bvule (bvmul x z) (bvmul y z))))))

(check-sat)
