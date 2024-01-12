;; Lemma_Mult_Protect from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))
(declare-const z (_ BitVec 32))

(assert
  (not
    (=> (or (= y #x00000000) (bvule x (bvudiv z y)))
    (bvule (bvmul x y) z))))

(check-sat)
