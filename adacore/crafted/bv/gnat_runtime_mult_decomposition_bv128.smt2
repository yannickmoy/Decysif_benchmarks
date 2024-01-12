;; Lemma_Mult_Decomposition from GNAT runtime

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const mult (_ BitVec 128))
(declare-const xu (_ BitVec 64))
(declare-const yu (_ BitVec 64))
(declare-const xhi (_ BitVec 32))
(declare-const xlo (_ BitVec 32))
(declare-const yhi (_ BitVec 32))
(declare-const ylo (_ BitVec 32))

(define-fun bv2large ((x (_ BitVec 64))) (_ BitVec 128)
  (concat #x0000000000000000 x))

(define-fun mult_bv2large ((x (_ BitVec 32)) (y (_ BitVec 32))) (_ BitVec 128)
  (bv2large (bvmul (concat #x00000000 x) (concat #x00000000 y))))

(define-fun bv4294967296 () (_ BitVec 128) #x00000000000000000000000100000000)

(assert
  (not
    (=> (= mult (bvmul (bv2large xu) (bv2large yu)))
    (=> (= xhi ((_ extract 63 32) xu))
    (=> (= xlo ((_ extract 31 0) xu))
    (=> (= yhi ((_ extract 63 32) yu))
    (=> (= ylo ((_ extract 31 0) yu))
    (= mult
    (bvadd (bvadd (bvadd (bvmul bv4294967296 (bvmul bv4294967296 (mult_bv2large xhi yhi)))
                         (bvmul bv4294967296 (mult_bv2large xhi ylo)))
                  (bvmul bv4294967296 (mult_bv2large xlo yhi)))
           (mult_bv2large xlo ylo))))))))))

(check-sat)
