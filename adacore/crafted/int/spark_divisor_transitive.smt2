;; lemma from SPARK test

(set-info :smt-lib-version 2.5)
(set-info :status unsat)
(set-logic ALL)

(declare-const a Int)
(declare-const b Int)
(declare-const x Int)

(define-fun divides ((a Int) (b Int)) Bool (= (mod b a) 0))

(assert
  (not
    (=> (> a 0)
    (=> (> b 0)
    (=> (> x 0)
    (=> (divides b a)
    (=> (divides x b)
    (divides x a))))))))

(check-sat)
