;; lemma from SPARK test

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(define-fun cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))
(define-fun cmod ((x Int) (y Int)) Int (ite (>= x 0) (mod x y) (- (mod (- x) y))))

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert
  (not
    (=> (not (= y 0))
      (= (cmod (+ (* x y) z) y) (cmod z y)))))

(check-sat)
