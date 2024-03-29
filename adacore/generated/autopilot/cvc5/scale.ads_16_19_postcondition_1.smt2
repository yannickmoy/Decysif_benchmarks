;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(define-fun __cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))
(define-fun __cmod ((x Int) (y Int)) Int (ite (>= x 0) (mod x y) (- (mod (- x) y))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

(declare-const mach Int)

(declare-const present Int)

(declare-const target Int)

(declare-const max Int)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 100)))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= (- 100) x) (<= x 100)))

;; "in_range"
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 100)))

;; "in_range"
(define-fun in_range4 ((x Int)) Bool
  (and (<= (- 45) x) (<= x 45)))

;; Goal "def'vc"
;; File "scale.ads", line 9, characters 0-0
(assert
  (not
  (forall ((target_angle Int) (k1 Int) (k2 Int) (gap Int))
    (=>
      (in_range3 mach)
      (=>
        (in_range2 present)
        (=>
          (in_range2 target)
          (=>
            (in_range4 max)
            (=>
              (< 0 max)
              (=>
                (in_range4 target_angle)
                (=>
                  (in_range k1)
                  (=>
                    (in_range k2)
                    (=>
                      (in_range gap)
                      (forall ((target_angle1 Int))
                        (=>
                          (exists ((spark__branch Bool))
                            (and
                              (= spark__branch (ite (= present target)
                                                 true
                                                 false))
                              (ite (= spark__branch true)
                                (= target_angle1 0)
                                (exists ((k11 Int) (k21 Int))
                                  (and
                                    (and
                                      (and (in_range1 k11) (< 0 k21))
                                      (<= k11 k21))
                                    (and
                                      (in_range k11)
                                      (and
                                        (in_range k21)
                                        (let ((o (* max k11)))
                                          (and
                                            (in_range o)
                                            (let ((o1 (__cdiv o k21)))
                                              (and
                                                (in_range o1)
                                                (and
                                                  (in_range4 o1)
                                                  (exists ((target_angle2 Int))
                                                    (and
                                                      (= target_angle2 o1)
                                                      (exists ((spark__branch1 Bool))
                                                        (and
                                                          (= spark__branch1 
                                                          (ite (< target 
                                                            present)
                                                            true
                                                            false))
                                                          (ite (= spark__branch1 true)
                                                            (= target_angle1 (- target_angle2))
                                                            (= target_angle1 target_angle2))))))))))))))))))
                          (forall ((scale__scale_movement__result Int))
                            (=>
                              (= scale__scale_movement__result target_angle1)
                              (<= (- max) scale__scale_movement__result)))))))))))))))))

(check-sat)
(get-info :reason-unknown)
