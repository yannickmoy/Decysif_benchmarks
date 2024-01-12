;; Lemma_Mult_Is_Strictly_Monotonic from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))
(declare-const z (_ BitVec 32))

(assert
  (not
    (=> (bvugt z #x00000000)
    (=> (bvult x y)
    (=> (bvule y (bvudiv #xFFFFFFFF z))
    (bvult (bvmul x z) (bvmul y z)))))))

(check-sat)
