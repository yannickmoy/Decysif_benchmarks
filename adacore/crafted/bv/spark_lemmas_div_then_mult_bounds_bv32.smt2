;; Lemma_Div_Then_Mult_Bounds from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))
(declare-const r (_ BitVec 32))

(assert
  (not
    (=> (bvugt y #x00000000)
      (=> (= r (bvmul (bvudiv x y) y))
        (and (bvule r x) (bvult (bvsub x r) y))))))

(check-sat)
