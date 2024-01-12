;; produced by cvc5.drv ;;
(set-logic ALL)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 255)))

(declare-sort us_rep 0)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const dummy us_rep)

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 864000)))

;; Goal "def'vc"
;; File "configdata.adb", line 342, characters 0-0
(assert
  (not
  (forall ((theduration Int) (rawhours Int) (rawminutes Int) (char1 Int))
    (=>
      (in_range2 theduration)
      (=>
        (in_range rawhours)
        (=>
          (in_range rawminutes)
          (=>
            (in_range1 char1)
            (forall ((success Bool) (rawhours1 Int))
              (=>
                (in_range rawhours1)
                (forall ((spark__branch Bool))
                  (=>
                    (= spark__branch (and (and success (ite (<= 0 rawhours1)
                                                         true
                                                         false)) (ite (<= rawhours1 23)
                                                                   true
                                                                   false)))
                    (=>
                      (= spark__branch true)
                      (forall ((char2 Int))
                        (=>
                          (in_range1 char2)
                          (forall ((success1 Bool) (rawminutes1 Int))
                            (=>
                              (in_range rawminutes1)
                              (forall ((spark__branch1 Bool))
                                (=>
                                  (= spark__branch1 (and (and (and success1 
                                  (ite (= char2 58)
                                    true
                                    false)) (ite (<= 0 rawminutes1)
                                              true
                                              false)) (ite (<= rawminutes1 59)
                                                        true
                                                        false)))
                                  (=>
                                    (= spark__branch1 true)
                                    (=>
                                      (in_range2 rawminutes1)
                                      (<= 0 rawhours1)))))))))))))))))))))

(check-sat)
(get-info :reason-unknown)