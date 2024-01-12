;; axiom Div_sign_pos from module int.ComputerDivision

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(define-fun cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))
(define-fun cmod ((x Int) (y Int)) Int (ite (>= x 0) (mod x y) (- (mod (- x) y))))

(declare-const x Int)
(declare-const y Int)

(assert
  (not
    (=> (>= x 0)
      (=> (> y 0)
        (>= (colibri_cdiv x y) 0)))))

(check-sat)
