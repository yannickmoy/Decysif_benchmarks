;; Lemma_Concat_Definition from GNAT runtime

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))

(assert
  (not
    (= (bv2nat (concat x y)) (+ (* 4294967296 (bv2nat x)) (bv2nat y)))))

(check-sat)
