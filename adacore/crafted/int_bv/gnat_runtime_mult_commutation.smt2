;; Lemma_Mult_Commutation from GNAT runtime

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))

(assert
  (not
    (= (* (bv2nat (concat #x00000000 x)) (bv2nat (concat #x00000000 y)))
       (bv2nat (bvmul (concat #x00000000 x) (concat #x00000000 y))))))

(check-sat)
