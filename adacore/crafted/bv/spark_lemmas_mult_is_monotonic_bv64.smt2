;; Lemma_Mult_Is_Monotonic from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 64))
(declare-const y (_ BitVec 64))
(declare-const z (_ BitVec 64))

(assert
  (not
    (=> (bvule x y)
      (=> (or (= z #x0000000000000000) (bvule y (bvudiv #xFFFFFFFFFFFFFFFF z)))
        (bvule (bvmul x z) (bvmul y z))))))

(check-sat)
