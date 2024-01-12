;; Lemma_Mult_Then_Div_Is_Ident from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))

(assert
  (not
    (=> (bvugt y #x00000000)
    (=> (bvule x (bvudiv #xFFFFFFFF y))
    (= (bvudiv (bvmul x y) y) x)))))

(check-sat)
