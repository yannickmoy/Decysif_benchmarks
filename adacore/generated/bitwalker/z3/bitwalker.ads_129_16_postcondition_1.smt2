;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-const two_power_size_minus_one Int)

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; "nth"
(define-fun nth ((param__x (_ BitVec 64)) (param__pos Int)) Bool
  (= (bvand (bvlshr param__x ((_ int2bv 64) param__pos)) #x0000000000000001) #x0000000000000001))

;; "maxvalue"
(declare-fun maxvalue (Int) (_ BitVec 64))

;; "maxvalue__function_guard"
(declare-fun maxvalue__function_guard ((_ BitVec 64)
  Int) Bool)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-const x (_ BitVec 64))

(declare-const len Int)

;; "cases64"
(define-fun cases64 ((param__i Int)) Bool
  (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (= param__i 0) (= param__i 1)) (= param__i 2)) (= param__i 3)) (= param__i 4)) (= param__i 5)) (= param__i 6)) (= param__i 7)) (= param__i 8)) (= param__i 9)) (= param__i 10)) (= param__i 11)) (= param__i 12)) (= param__i 13)) (= param__i 14)) (= param__i 15)) (= param__i 16)) (= param__i 17)) (= param__i 18)) (= param__i 19)) (= param__i 20)) (= param__i 21)) (= param__i 22)) (= param__i 23)) (= param__i 24)) (= param__i 25)) (= param__i 26)) (= param__i 27)) (= param__i 28)) (= param__i 29)) (= param__i 30)) (= param__i 31)) (= param__i 32)) (= param__i 33)) (= param__i 34)) (= param__i 35)) (= param__i 36)) (= param__i 37)) (= param__i 38)) (= param__i 39)) (= param__i 40)) (= param__i 41)) (= param__i 42)) (= param__i 43)) (= param__i 44)) (= param__i 45)) (= param__i 46)) (= param__i 47)) (= param__i 48)) (= param__i 49)) (= param__i 50)) (= param__i 51)) (= param__i 52)) (= param__i 53)) (= param__i 54)) (= param__i 55)) (= param__i 56)) (= param__i 57)) (= param__i 58)) (= param__i 59)) (= param__i 60)) (= param__i 61)) (= param__i 62)) (= param__i 63)))

;; "cond_unit"
(define-fun cond_unit ((param__x (_ BitVec 64)) (param__len Int) (param__i Int)) Bool
  (ite (and (and (<= param__len param__i) (<= param__i 63)) (<= 0 param__i))
    (not (nth param__x param__i))
    (distinct 1 0)))

;; "less_than_max_cond"
(define-fun less_than_max_cond ((param__x (_ BitVec 64)) (param__len Int)) Bool
  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and 
  (cond_unit
    param__x
    param__len
    0) (cond_unit param__x param__len 1)) (cond_unit param__x param__len 2)) 
  (cond_unit
    param__x
    param__len
    3)) (cond_unit param__x param__len 4)) (cond_unit param__x param__len 5)) 
  (cond_unit
    param__x
    param__len
    6)) (cond_unit param__x param__len 7)) (cond_unit param__x param__len 8)) 
  (cond_unit
    param__x
    param__len
    9)) (cond_unit param__x param__len 10)) (cond_unit
                                              param__x
                                              param__len
                                              11)) (cond_unit
                                                     param__x
                                                     param__len
                                                     12)) (cond_unit
                                                            param__x
                                                            param__len
                                                            13)) (cond_unit
                                                                   param__x
                                                                   param__len
                                                                   14)) 
  (cond_unit
    param__x
    param__len
    15)) (cond_unit param__x param__len 16)) (cond_unit
                                               param__x
                                               param__len
                                               17)) (cond_unit
                                                      param__x
                                                      param__len
                                                      18)) (cond_unit
                                                             param__x
                                                             param__len
                                                             19)) (cond_unit
                                                                    param__x
                                                                    param__len
                                                                    20)) 
  (cond_unit
    param__x
    param__len
    21)) (cond_unit param__x param__len 22)) (cond_unit
                                               param__x
                                               param__len
                                               23)) (cond_unit
                                                      param__x
                                                      param__len
                                                      24)) (cond_unit
                                                             param__x
                                                             param__len
                                                             25)) (cond_unit
                                                                    param__x
                                                                    param__len
                                                                    26)) 
  (cond_unit
    param__x
    param__len
    27)) (cond_unit param__x param__len 28)) (cond_unit
                                               param__x
                                               param__len
                                               29)) (cond_unit
                                                      param__x
                                                      param__len
                                                      30)) (cond_unit
                                                             param__x
                                                             param__len
                                                             31)) (cond_unit
                                                                    param__x
                                                                    param__len
                                                                    32)) 
  (cond_unit
    param__x
    param__len
    33)) (cond_unit param__x param__len 34)) (cond_unit
                                               param__x
                                               param__len
                                               35)) (cond_unit
                                                      param__x
                                                      param__len
                                                      36)) (cond_unit
                                                             param__x
                                                             param__len
                                                             37)) (cond_unit
                                                                    param__x
                                                                    param__len
                                                                    38)) 
  (cond_unit
    param__x
    param__len
    39)) (cond_unit param__x param__len 40)) (cond_unit
                                               param__x
                                               param__len
                                               41)) (cond_unit
                                                      param__x
                                                      param__len
                                                      42)) (cond_unit
                                                             param__x
                                                             param__len
                                                             43)) (cond_unit
                                                                    param__x
                                                                    param__len
                                                                    44)) 
  (cond_unit
    param__x
    param__len
    45)) (cond_unit param__x param__len 46)) (cond_unit
                                               param__x
                                               param__len
                                               47)) (cond_unit
                                                      param__x
                                                      param__len
                                                      48)) (cond_unit
                                                             param__x
                                                             param__len
                                                             49)) (cond_unit
                                                                    param__x
                                                                    param__len
                                                                    50)) 
  (cond_unit
    param__x
    param__len
    51)) (cond_unit param__x param__len 52)) (cond_unit
                                               param__x
                                               param__len
                                               53)) (cond_unit
                                                      param__x
                                                      param__len
                                                      54)) (cond_unit
                                                             param__x
                                                             param__len
                                                             55)) (cond_unit
                                                                    param__x
                                                                    param__len
                                                                    56)) 
  (cond_unit
    param__x
    param__len
    57)) (cond_unit param__x param__len 58)) (cond_unit
                                               param__x
                                               param__len
                                               59)) (cond_unit
                                                      param__x
                                                      param__len
                                                      60)) (cond_unit
                                                             param__x
                                                             param__len
                                                             61)) (cond_unit
                                                                    param__x
                                                                    param__len
                                                                    62)) 
  (cond_unit
    param__x
    param__len
    63)))

;; "maxvalue__post_axiom"
(assert true)

;; "maxvalue__def_axiom"
(assert
  (forall ((param__len Int))
    (! (= (maxvalue param__len) (bvshl #x0000000000000001 ((_ int2bv 64) param__len))) :pattern (
    (maxvalue
      param__len)) )))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range len))

;; "H"
(assert
  (forall ((temp___475 Int))
    (maxvalue__function_guard (maxvalue temp___475) temp___475)))

;; "Assume"
(assert
  (and
    (and (<= 0 len) (<= len 63))
    (bvult x (let ((temp___475 len)) (maxvalue temp___475)))))

;; "Assert"
(assert (= (cases64 len) true))

;; "Assert"
(assert (= (less_than_max_cond x len) true))

(declare-const i Int)

;; "H"
(assert (<= len i))

;; "H"
(assert (<= i 63))

;; Goal "def'vc"
;; File "bitwalker.ads", line 125, characters 0-0
(assert
  (not (not (= (nth x i) true))))

(check-sat)
