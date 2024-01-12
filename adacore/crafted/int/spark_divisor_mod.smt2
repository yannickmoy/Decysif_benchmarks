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
    (=> (divides x a)
    (=> (divides x b)
    (=> (not (divides b a))
    (divides x (mod a b))))))))))

(check-sat)
