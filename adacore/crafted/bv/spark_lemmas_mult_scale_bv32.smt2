;; Lemma_Mult_Scale from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))
(declare-const z (_ BitVec 32))
(declare-const r (_ BitVec 32))

(assert
  (not
    (=> (bvugt z #x00000000)
    (=> (bvule y z)
    (=> (or (= y #x00000000) (bvule x (bvudiv #xFFFFFFFF y)))
    (=> (= r (bvudiv (bvmul x y) z))
    (bvule r x)))))))

(check-sat)
