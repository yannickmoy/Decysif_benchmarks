;; Lemma_Mod_Symmetry from SPARKlib

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(define-fun cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))
(define-fun cmod ((x Int) (y Int)) Int (ite (>= x 0) (mod x y) (- (mod (- x) y))))
(define-fun adamod ((x Int) (y Int)) Int (ite (>= y 0) (mod x y) (- (mod (- x) y))))

(declare-const x Int)
(declare-const y Int)

(assert
  (not
    (=> (not (= y 0))
      (= (adamod (- x) (- y)) (- (adamod x y))))))

(check-sat)
