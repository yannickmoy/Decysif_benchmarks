;; Lemma_Mult_Scale from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 64))
(declare-const y (_ BitVec 64))
(declare-const z (_ BitVec 64))
(declare-const r (_ BitVec 64))

(assert
  (not
    (=> (bvugt z #x0000000000000000)
    (=> (bvule y z)
    (=> (or (= y #x0000000000000000) (bvule x (bvudiv #xFFFFFFFFFFFFFFFF y)))
    (=> (= r (bvudiv (bvmul x y) z))
    (bvule r x)))))))

(check-sat)
