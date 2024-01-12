;; Lemma_Mult_Is_Strictly_Monotonic from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 64))
(declare-const y (_ BitVec 64))
(declare-const z (_ BitVec 64))

(assert
  (not
    (=> (bvugt z #x0000000000000000)
    (=> (bvult x y)
    (=> (bvule y (bvudiv #xFFFFFFFFFFFFFFFF z))
    (bvult (bvmul x z) (bvmul y z)))))))

(check-sat)
