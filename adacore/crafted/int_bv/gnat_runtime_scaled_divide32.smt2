;; assertion in Scaled_Divide32 from GNAT runtime

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)


(declare-const d (_ BitVec 64))
(declare-const zu (_ BitVec 32))
(declare-const qu (_ BitVec 32))

(assert
  (not
    (=> (not (bvuge ((_ extract 63 32) d) zu))
    (=> (= qu ((_ extract 31 0) (bvudiv d (concat #x00000000 zu))))
    (= (bv2nat qu) (bv2nat (bvudiv d (concat #x00000000 zu))))))))

(check-sat)
