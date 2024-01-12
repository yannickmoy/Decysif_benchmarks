;; Lemma_Mult_Decomposition from GNAT runtime

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const mult Int)
(declare-const xu (_ BitVec 64))
(declare-const yu (_ BitVec 64))
(declare-const xhi (_ BitVec 32))
(declare-const xlo (_ BitVec 32))
(declare-const yhi (_ BitVec 32))
(declare-const ylo (_ BitVec 32))

(define-fun mult_bv2int ((x (_ BitVec 32)) (y (_ BitVec 32))) Int
  (bv2nat (bvmul (concat #x00000000 x) (concat #x00000000 y))))

(assert
  (not
    (=> (= mult (* (bv2nat xu) (bv2nat yu)))
    (=> (= xhi ((_ extract 63 32) xu))
    (=> (= xlo ((_ extract 31 0) xu))
    (=> (= yhi ((_ extract 63 32) yu))
    (=> (= ylo ((_ extract 31 0) yu))
    (= mult
    (+ (+ (+ (* 4294967296 (* 4294967296 (mult_bv2int xhi yhi)))
             (* 4294967296 (mult_bv2int xhi ylo)))
          (* 4294967296 (mult_bv2int xlo yhi)))
       (mult_bv2int xlo ylo))))))))))

(check-sat)
