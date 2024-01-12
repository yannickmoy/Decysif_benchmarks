;; Lemma_Div_Then_Mult_Bounds from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 64))
(declare-const y (_ BitVec 64))
(declare-const r (_ BitVec 64))

(assert
  (not
    (=> (bvugt y #x0000000000000000)
      (=> (= r (bvmul (bvudiv x y) y))
        (and (bvule r x) (bvult (bvsub x r) y))))))

(check-sat)
