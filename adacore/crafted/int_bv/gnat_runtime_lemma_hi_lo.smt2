;; Lemma_Hi_Lo from GNAT runtime

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const x (_ BitVec 64))
(declare-const hi (_ BitVec 32))
(declare-const lo (_ BitVec 32))

(assert
  (not
    (=> (= hi ((_ extract 63 32) x))
    (=> (= lo ((_ extract 31 0) x))
    (= (bv2nat x) (+ (* 4294967296 (bv2nat hi)) (bv2nat lo)))))))

(check-sat)
