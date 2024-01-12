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

(declare-datatypes ()
  ((int__ref (int__refqtmk (int__content Int)))))

(declare-datatypes ()
  ((bool__ref (bool__refqtmk (bool__content Bool)))))

(declare-sort status 0)

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= 0 x) (<= x 1)))

;; "to_rep"
(declare-fun to_rep (status) Int)

;; "of_rep"
(declare-fun of_rep (Int) status)

;; "inversion_axiom"
(assert
  (forall ((x status)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x status)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int status))))))

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

(declare-datatypes ()
  ((set__ref (set__refqtmk (set__content us_rep)))))

;; "mem"
(declare-fun mem (us_rep
  Int) Bool)

;; "mem__function_guard"
(declare-fun mem__function_guard (Bool
  us_rep
  Int) Bool)

;; "is_add"
(declare-fun is_add (us_rep
  Int
  us_rep) Bool)

;; "is_add__function_guard"
(declare-fun is_add__function_guard (Bool
  us_rep
  Int
  us_rep) Bool)

;; "add"
(declare-fun add (us_rep
  Int) us_rep)

;; "add__function_guard"
(declare-fun add__function_guard (us_rep
  us_rep
  Int) Bool)

(declare-datatypes ()
  ((us_split_fields
   (us_split_fieldsqtmk
   (rec__allocator__m__t__available us_rep)(rec__allocator__m__t__allocated us_rep)))))

(declare-datatypes ()
  ((us_rep1 (us_repqtmk (us_split_fields1 us_split_fields)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; "value__size_axiom"
(assert (<= 0 value__size1))

;; "object__size_axiom"
(assert (<= 0 object__size1))

;; "alignment_axiom"
(assert (<= 0 alignment1))

(declare-const allocator__m__t__available__first__bit Int)

(declare-const allocator__m__t__available__last__bit Int)

(declare-const allocator__m__t__available__position Int)

;; "allocator__m__t__available__first__bit_axiom"
(assert (<= 0 allocator__m__t__available__first__bit))

;; "allocator__m__t__available__last__bit_axiom"
(assert
  (< allocator__m__t__available__first__bit allocator__m__t__available__last__bit))

;; "allocator__m__t__available__position_axiom"
(assert (<= 0 allocator__m__t__available__position))

(declare-const allocator__m__t__allocated__first__bit Int)

(declare-const allocator__m__t__allocated__last__bit Int)

(declare-const allocator__m__t__allocated__position Int)

;; "allocator__m__t__allocated__first__bit_axiom"
(assert (<= 0 allocator__m__t__allocated__first__bit))

;; "allocator__m__t__allocated__last__bit_axiom"
(assert
  (< allocator__m__t__allocated__first__bit allocator__m__t__allocated__last__bit))

;; "allocator__m__t__allocated__position_axiom"
(assert (<= 0 allocator__m__t__allocated__position))

(declare-const dummy1 us_rep1)

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 3)))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size Int)

(declare-const alignment2 Int)

;; "value__size_axiom"
(assert (<= 0 value__size2))

;; "object__size_axiom"
(assert (<= 0 object__size2))

;; "component__size_axiom"
(assert (<= 0 component__size))

;; "alignment_axiom"
(assert (<= 0 alignment2))

;; "is_empty"
(declare-fun is_empty (us_rep) Bool)

;; "is_empty__function_guard"
(declare-fun is_empty__function_guard (Bool
  us_rep) Bool)

;; "temp___result_230"
(declare-fun temp___result_230 (us_rep) Bool)

;; "temp___result_230'def"
(assert
  (forall ((temp___231 us_rep))
    (and
      (= (temp___result_230 temp___231) (is_empty temp___231))
      (is_empty__function_guard (temp___result_230 temp___231) temp___231))))

;; "default_initial_assumption"
(define-fun default_initial_assumption ((temp___expr_227 us_rep) (temp___skip_top_level_228 Bool)) Bool
  (=>
    (not (= temp___skip_top_level_228 true))
    (= (let ((temp___231 temp___expr_227)) (temp___result_230 temp___231)) true)))

;; "mem__post_axiom"
(assert
  (forall ((param__s us_rep))
    (forall ((param__e Int))
      (! (=>
           (in_range1 param__e)
           (let ((result (mem param__s param__e)))
             (=>
               (mem__function_guard result param__s param__e)
               (=> (= param__e 0) (not (= result true)))))) :pattern (
      (mem
        param__s
        param__e)) ))))

;; "is_empty__post_axiom"
(assert
  (forall ((param__s us_rep))
    (! (let ((result (is_empty param__s)))
         (and
           (forall ((e Int) (temp___268 us_rep))
             (mem__function_guard (mem temp___268 e) temp___268 e))
           (=>
             (is_empty__function_guard result param__s)
             (=
               (= result true)
               (forall ((e Int))
                 (not (and (in_range1 e) (= (mem param__s e) true)))))))) :pattern (
    (is_empty
      param__s)) )))

;; "is_add__post_axiom"
(assert
  (forall ((param__s us_rep) (param__result__ us_rep))
    (forall ((param__e Int))
      (! (=>
           (in_range1 param__e)
           (let ((result (is_add param__s param__e param__result__)))
             (and
               (forall ((temp___284 us_rep))
                 (mem__function_guard
                   (mem temp___284 param__e)
                   temp___284
                   param__e))
               (and
                 (forall ((temp___286 us_rep))
                   (mem__function_guard
                     (mem temp___286 param__e)
                     temp___286
                     param__e))
                 (and
                   (forall ((f Int) (temp___289 us_rep))
                     (mem__function_guard (mem temp___289 f) temp___289 f))
                   (and
                     (forall ((f Int) (temp___291 us_rep))
                       (mem__function_guard (mem temp___291 f) temp___291 f))
                     (and
                       (forall ((e Int) (temp___294 us_rep))
                         (mem__function_guard
                           (mem temp___294 e)
                           temp___294
                           e))
                       (and
                         (forall ((e Int) (temp___296 us_rep))
                           (mem__function_guard
                             (mem temp___296 e)
                             temp___296
                             e))
                         (=>
                           (is_add__function_guard
                             result
                             param__s
                             param__e
                             param__result__)
                           (=
                             (= result true)
                             (and
                               (and
                                 (and
                                   (and
                                     (not (= param__e 0))
                                     (= (let ((temp___284 param__result__))
                                          (mem temp___284 param__e)) true))
                                   (not
                                     (= (let ((temp___286 param__s))
                                          (mem temp___286 param__e)) true)))
                                 (forall ((f Int))
                                   (=>
                                     (and
                                       (in_range1 f)
                                       (= (mem param__result__ f) true))
                                     (or
                                       (= (let ((temp___291 param__s))
                                            (mem temp___291 f)) true)
                                       (= f param__e)))))
                               (forall ((e Int))
                                 (=>
                                   (and
                                     (in_range1 e)
                                     (= (mem param__s e) true))
                                   (= (let ((temp___296 param__result__))
                                        (mem temp___296 e)) true)))))))))))))) :pattern (
      (is_add
        param__s
        param__e
        param__result__)) ))))

(declare-const data (Array Int status))

(declare-const avail us_rep)

(declare-const alloc us_rep)

;; "alloc'unused"
(define-fun allocqtunused () set__ref
  (set__refqtmk alloc))

;; "avail'unused"
(define-fun availqtunused () set__ref
  (set__refqtmk avail))

;; "data'unused"
(define-fun dataqtunused () map__ref
  (map__refqtmk data))

;; "Assume"
(assert true)

;; "Assume"
(assert (default_initial_assumption avail false))

;; "Assume"
(assert true)

;; "Assume"
(assert (default_initial_assumption alloc false))

;; "Assume"
(assert true)

(declare-const r Int)

;; "r'unused"
(define-fun rqtunused () int__ref
  (int__refqtmk r))

;; "H"
(assert (= r 1))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  r)

;; "o"
(define-fun o () Bool
  (ite (<= r 3) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused () Bool
  o)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  r)

;; "o"
(define-fun o1 () Bool
  (ite (<= 1 r) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused1 () Bool
  o1)

;; "o"
(define-fun o2 () Bool
  (and o1 o))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o2)

;; "H"
(assert (= o2 true))

;; "temp___loop_entry_547'unused"
(define-fun temp___loop_entry_547qtunused () us_rep
  avail)

;; "set__content'result'unused"
(define-fun set__contentqtresultqtunused () us_rep
  avail)

;; "temp___loop_entry_546'unused"
(define-fun temp___loop_entry_546qtunused () us_rep
  alloc)

;; "set__content'result'unused"
(define-fun set__contentqtresultqtunused1 () us_rep
  alloc)

(declare-const spark__branch Bool)

(declare-const avail1 us_rep)

(declare-const alloc1 us_rep)

;; "alloc'unused"
(define-fun allocqtunused1 () set__ref
  (set__refqtmk alloc1))

;; "avail'unused"
(define-fun availqtunused1 () set__ref
  (set__refqtmk avail1))

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert
  (forall ((o3 us_rep))
    (is_add__function_guard (is_add avail r o3) avail r o3)))

;; "H"
(assert
  (forall ((o3 us_rep))
    (is_add__function_guard (is_add alloc r o3) alloc r o3)))

(declare-const int__contentqtresultqtunused2 Int)

;; "H"
(assert (= int__contentqtresultqtunused2 r))

(declare-const map__contentqtresultqtunused (Array Int status))

;; "H"
(assert (= map__contentqtresultqtunused data))

(declare-const o3 status)

;; "H"
(assert (= o3 (select data r)))

(declare-const getqtresultqtunused status)

;; "H"
(assert (= getqtresultqtunused o3))

(declare-const temp___543 Int)

;; "Ensures"
(assert (= (to_rep o3) temp___543))

(declare-const to_repqtresultqtunused Int)

;; "H"
(assert (= to_repqtresultqtunused temp___543))

(declare-const o4 Bool)

;; "H"
(assert (= o4 (ite (= temp___543 0) true false)))

(declare-const infix_eqqtresultqtunused Bool)

;; "H"
(assert (= infix_eqqtresultqtunused o4))

;; "H"
(assert (= spark__branch o4))

(declare-const bool__contentqtresultqtunused Bool)

;; "H"
(assert (= bool__contentqtresultqtunused spark__branch))

(declare-const int__contentqtresultqtunused3 Int)

(declare-const set__contentqtresultqtunused2 us_rep)

(declare-const o5 us_rep)

(declare-const addqtresultqtunused us_rep)

(declare-const int__contentqtresultqtunused4 Int)

(declare-const set__contentqtresultqtunused3 us_rep)

(declare-const o6 us_rep)

(declare-const addqtresultqtunused1 us_rep)

;; "H"
(assert
  (ite (= spark__branch true)
    (and
      (and
        (= int__contentqtresultqtunused4 r)
        (and
          (= set__contentqtresultqtunused3 avail)
          (and
            (= o6 (add avail r))
            (and
              (and
                (add__function_guard o6 avail r)
                (= (is_add avail r o6) true))
              (and (= addqtresultqtunused1 o6) (= avail1 o6))))))
      (= alloc1 alloc))
    (and
      (and
        (= int__contentqtresultqtunused3 r)
        (and
          (= set__contentqtresultqtunused2 alloc)
          (and
            (= o5 (add alloc r))
            (and
              (and
                (add__function_guard o5 alloc r)
                (= (is_add alloc r o5) true))
              (and (= addqtresultqtunused o5) (= alloc1 o5))))))
      (= avail1 avail))))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem avail1 e) avail1 e)))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem avail1 e) avail1 e)))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem avail1 e) avail1 e)))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem alloc1 e) alloc1 e)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail1 rr) avail1 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc1 rr) alloc1 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail1 rr) avail1 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc1 rr) alloc1 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail1 rr) avail1 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc1 rr) alloc1 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail1 rr) avail1 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc1 rr) alloc1 rr)))

(declare-const set__contentqtresultqtunused4 us_rep)

;; "H"
(assert (= set__contentqtresultqtunused4 avail1))

(declare-const usf Int)

(declare-const anyqtresultqtunused Int)

;; "H"
(assert (= anyqtresultqtunused usf))

(declare-const eqtunused Int)

;; "H"
(assert (= eqtunused usf))

(declare-const temp___result_550 Bool)

;; "H"
(assert (= temp___result_550 (mem avail1 usf)))

(declare-const memqtresultqtunused Bool)

;; "H"
(assert (= memqtresultqtunused temp___result_550))

;; "Assume"
(assert (mem__function_guard temp___result_550 avail1 usf))

(declare-const usf1 Bool)

;; "H"
(assert (= usf1 (ite (in_range1 usf) true false)))

(declare-const anyqtresultqtunused1 Bool)

;; "H"
(assert (= anyqtresultqtunused1 usf1))

(declare-const andbqtresultqtunused1 Bool)

;; "H"
(assert (= andbqtresultqtunused1 (and usf1 temp___result_550)))

(declare-const usfqtunused Bool)

;; "H"
(assert
  (= usfqtunused (ite (forall ((e Int))
                        (=>
                          (and (in_range1 e) (= (mem avail1 e) true))
                          (and (<= 1 e) (<= e r))))
                   true
                   false)))

(declare-const anyqtresultqtunused2 Bool)

;; "H"
(assert
  (= anyqtresultqtunused2 (ite (forall ((e Int))
                                 (=>
                                   (and
                                     (in_range1 e)
                                     (= (mem avail1 e) true))
                                   (and (<= 1 e) (<= e r))))
                            true
                            false)))

(declare-const o7 Bool)

(declare-const usf2 Bool)

(declare-const anyqtresultqtunused3 Bool)

(declare-const set__contentqtresultqtunused5 us_rep)

(declare-const usf3 Int)

(declare-const anyqtresultqtunused4 Int)

(declare-const eqtunused1 Int)

(declare-const temp___result_556 Bool)

(declare-const memqtresultqtunused1 Bool)

(declare-const usf4 Bool)

(declare-const anyqtresultqtunused5 Bool)

(declare-const andbqtresultqtunused2 Bool)

;; "H"
(assert
  (ite (forall ((e Int))
         (=>
           (and (in_range1 e) (= (mem avail1 e) true))
           (and (<= 1 e) (<= e r))))
    (and
      (and
        (= set__contentqtresultqtunused5 alloc1)
        (and
          (= anyqtresultqtunused4 usf3)
          (and
            (= eqtunused1 usf3)
            (and
              (= temp___result_556 (mem alloc1 usf3))
              (and
                (= memqtresultqtunused1 temp___result_556)
                (and
                  (mem__function_guard temp___result_556 alloc1 usf3)
                  (and
                    (= usf4 (ite (in_range1 usf3) true false))
                    (and
                      (= anyqtresultqtunused5 usf4)
                      (= andbqtresultqtunused2 (and usf4 temp___result_556))))))))))
      (and
        (= usf2 (ite (forall ((e Int))
                       (=>
                         (and (in_range1 e) (= (mem alloc1 e) true))
                         (and (<= 1 e) (<= e r))))
                  true
                  false))
        (and (= anyqtresultqtunused3 usf2) (= o7 usf2))))
    (= o7 false)))

(declare-const usfqtunused1 Bool)

(declare-const anyqtresultqtunused6 Bool)

(declare-const usf5 Int)

(declare-const anyqtresultqtunused7 Int)

(declare-const rrqtunused Int)

(declare-const int__contentqtresultqtunused5 Int)

(declare-const o8 Bool)

(declare-const infix_lseqqtresultqtunused2 Bool)

(declare-const o9 Bool)

(declare-const infix_lseqqtresultqtunused3 Bool)

(declare-const andbqtresultqtunused3 Bool)

;; "H"
(assert
  (=>
    (= o7 true)
    (and
      (and
        (= anyqtresultqtunused7 usf5)
        (and
          (= rrqtunused usf5)
          (and
            (= int__contentqtresultqtunused5 r)
            (and
              (= o8 (ite (<= usf5 r) true false))
              (and
                (= infix_lseqqtresultqtunused2 o8)
                (and
                  (= o9 (ite (<= 1 usf5) true false))
                  (and
                    (= infix_lseqqtresultqtunused3 o9)
                    (= andbqtresultqtunused3 (and o9 o8)))))))))
      (and
        (= usfqtunused1 (ite (forall ((rr Int))
                               (=>
                                 (and (<= 1 rr) (<= rr r))
                                 (ite (= (to_rep (select data rr)) 0)
                                   (and
                                     (= (mem avail1 rr) true)
                                     (not (= (mem alloc1 rr) true)))
                                   (and
                                     (not (= (mem avail1 rr) true))
                                     (= (mem alloc1 rr) true)))))
                          true
                          false))
        (= anyqtresultqtunused6 (ite (forall ((rr Int))
                                       (=>
                                         (and (<= 1 rr) (<= rr r))
                                         (ite (= (to_rep (select data rr)) 0)
                                           (and
                                             (= (mem avail1 rr) true)
                                             (not (= (mem alloc1 rr) true)))
                                           (and
                                             (not (= (mem avail1 rr) true))
                                             (= (mem alloc1 rr) true)))))
                                  true
                                  false))))))

(declare-const avail2 us_rep)

(declare-const alloc2 us_rep)

(declare-const r1 Int)

;; "r'unused"
(define-fun rqtunused1 () int__ref
  (int__refqtmk r1))

;; "alloc'unused"
(define-fun allocqtunused2 () set__ref
  (set__refqtmk alloc2))

;; "avail'unused"
(define-fun availqtunused2 () set__ref
  (set__refqtmk avail2))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem avail2 e) avail2 e)))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem alloc2 e) alloc2 e)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail2 rr) avail2 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc2 rr) alloc2 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail2 rr) avail2 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc2 rr) alloc2 rr)))

;; "LoopInvariant"
(assert
  (and
    (and
      (forall ((e Int))
        (=>
          (and (in_range1 e) (= (mem avail2 e) true))
          (and (<= 1 e) (<= e r1))))
      (forall ((e Int))
        (=>
          (and (in_range1 e) (= (mem alloc2 e) true))
          (and (<= 1 e) (<= e r1)))))
    (forall ((rr Int))
      (=>
        (and (<= 1 rr) (<= rr r1))
        (ite (= (to_rep (select data rr)) 0)
          (and (= (mem avail2 rr) true) (not (= (mem alloc2 rr) true)))
          (and (not (= (mem avail2 rr) true)) (= (mem alloc2 rr) true)))))))

;; "Assume"
(assert
  (= (and (ite true true false) (ite (and (<= 1 r1) (<= r1 3)) true false)) true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  r1)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused1 () Bool
  (ite (= r1 3) true false))

;; "H"
(assert (not (= r1 3)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  r1)

;; "o"
(define-fun o10 () Int
  (+ r1 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o10)

(declare-const r2 Int)

;; "r'unused"
(define-fun rqtunused2 () int__ref
  (int__refqtmk r2))

;; "H"
(assert (= r2 o10))

(declare-const avail3 us_rep)

(declare-const alloc3 us_rep)

;; "alloc'unused"
(define-fun allocqtunused3 () set__ref
  (set__refqtmk alloc3))

;; "avail'unused"
(define-fun availqtunused3 () set__ref
  (set__refqtmk avail3))

;; "H"
(assert
  (forall ((o11 us_rep))
    (is_add__function_guard (is_add avail2 r2 o11) avail2 r2 o11)))

;; "H"
(assert
  (forall ((o11 us_rep))
    (is_add__function_guard (is_add alloc2 r2 o11) alloc2 r2 o11)))

(declare-const int__contentqtresultqtunused8 Int)

;; "H"
(assert (= int__contentqtresultqtunused8 r2))

(declare-const map__contentqtresultqtunused1 (Array Int status))

;; "H"
(assert (= map__contentqtresultqtunused1 data))

(declare-const o11 status)

;; "H"
(assert (= o11 (select data r2)))

(declare-const getqtresultqtunused1 status)

;; "H"
(assert (= getqtresultqtunused1 o11))

(declare-const temp___5431 Int)

;; "Ensures"
(assert (= (to_rep o11) temp___5431))

(declare-const to_repqtresultqtunused1 Int)

;; "H"
(assert (= to_repqtresultqtunused1 temp___5431))

(declare-const o12 Bool)

;; "H"
(assert (= o12 (ite (= temp___5431 0) true false)))

(declare-const infix_eqqtresultqtunused2 Bool)

;; "H"
(assert (= infix_eqqtresultqtunused2 o12))

(declare-const spark__branch1 Bool)

(declare-const spark__branchqtunused1 bool__ref)

;; "H"
(assert (= spark__branchqtunused1 (bool__refqtmk spark__branch1)))

;; "H"
(assert (= spark__branch1 o12))

(declare-const bool__contentqtresultqtunused1 Bool)

;; "H"
(assert (= bool__contentqtresultqtunused1 spark__branch1))

(declare-const int__contentqtresultqtunused9 Int)

(declare-const set__contentqtresultqtunused6 us_rep)

(declare-const o13 us_rep)

(declare-const addqtresultqtunused2 us_rep)

(declare-const int__contentqtresultqtunused10 Int)

(declare-const set__contentqtresultqtunused7 us_rep)

(declare-const o14 us_rep)

(declare-const addqtresultqtunused3 us_rep)

;; "H"
(assert
  (ite (= spark__branch1 true)
    (and
      (and
        (= int__contentqtresultqtunused10 r2)
        (and
          (= set__contentqtresultqtunused7 avail2)
          (and
            (= o14 (add avail2 r2))
            (and
              (and
                (add__function_guard o14 avail2 r2)
                (= (is_add avail2 r2 o14) true))
              (and (= addqtresultqtunused3 o14) (= avail3 o14))))))
      (= alloc3 alloc2))
    (and
      (and
        (= int__contentqtresultqtunused9 r2)
        (and
          (= set__contentqtresultqtunused6 alloc2)
          (and
            (= o13 (add alloc2 r2))
            (and
              (and
                (add__function_guard o13 alloc2 r2)
                (= (is_add alloc2 r2 o13) true))
              (and (= addqtresultqtunused2 o13) (= alloc3 o13))))))
      (= avail3 avail2))))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem avail3 e) avail3 e)))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem avail3 e) avail3 e)))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem avail3 e) avail3 e)))

;; "H"
(assert (forall ((e Int)) (mem__function_guard (mem alloc3 e) alloc3 e)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail3 rr) avail3 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc3 rr) alloc3 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail3 rr) avail3 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc3 rr) alloc3 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail3 rr) avail3 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc3 rr) alloc3 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem avail3 rr) avail3 rr)))

;; "H"
(assert (forall ((rr Int)) (mem__function_guard (mem alloc3 rr) alloc3 rr)))

(declare-const set__contentqtresultqtunused8 us_rep)

;; "H"
(assert (= set__contentqtresultqtunused8 avail3))

(declare-const usf6 Int)

(declare-const anyqtresultqtunused8 Int)

;; "H"
(assert (= anyqtresultqtunused8 usf6))

(declare-const eqtunused2 Int)

;; "H"
(assert (= eqtunused2 usf6))

(declare-const temp___result_5501 Bool)

;; "H"
(assert (= temp___result_5501 (mem avail3 usf6)))

(declare-const memqtresultqtunused2 Bool)

;; "H"
(assert (= memqtresultqtunused2 temp___result_5501))

;; "Assume"
(assert (mem__function_guard temp___result_5501 avail3 usf6))

(declare-const usf7 Bool)

;; "H"
(assert (= usf7 (ite (in_range1 usf6) true false)))

(declare-const anyqtresultqtunused9 Bool)

;; "H"
(assert (= anyqtresultqtunused9 usf7))

(declare-const andbqtresultqtunused4 Bool)

;; "H"
(assert (= andbqtresultqtunused4 (and usf7 temp___result_5501)))

(declare-const usfqtunused2 Bool)

;; "H"
(assert
  (= usfqtunused2 (ite (forall ((e Int))
                         (=>
                           (and (in_range1 e) (= (mem avail3 e) true))
                           (and (<= 1 e) (<= e r2))))
                    true
                    false)))

(declare-const anyqtresultqtunused10 Bool)

;; "H"
(assert
  (= anyqtresultqtunused10 (ite (forall ((e Int))
                                  (=>
                                    (and
                                      (in_range1 e)
                                      (= (mem avail3 e) true))
                                    (and (<= 1 e) (<= e r2))))
                             true
                             false)))

(declare-const o15 Bool)

(declare-const usf8 Bool)

(declare-const anyqtresultqtunused11 Bool)

(declare-const set__contentqtresultqtunused9 us_rep)

(declare-const usf9 Int)

(declare-const anyqtresultqtunused12 Int)

(declare-const eqtunused3 Int)

(declare-const temp___result_5561 Bool)

(declare-const memqtresultqtunused3 Bool)

(declare-const usf10 Bool)

(declare-const anyqtresultqtunused13 Bool)

(declare-const andbqtresultqtunused5 Bool)

;; "H"
(assert
  (ite (forall ((e Int))
         (=>
           (and (in_range1 e) (= (mem avail3 e) true))
           (and (<= 1 e) (<= e r2))))
    (and
      (and
        (= set__contentqtresultqtunused9 alloc3)
        (and
          (= anyqtresultqtunused12 usf9)
          (and
            (= eqtunused3 usf9)
            (and
              (= temp___result_5561 (mem alloc3 usf9))
              (and
                (= memqtresultqtunused3 temp___result_5561)
                (and
                  (mem__function_guard temp___result_5561 alloc3 usf9)
                  (and
                    (= usf10 (ite (in_range1 usf9) true false))
                    (and
                      (= anyqtresultqtunused13 usf10)
                      (= andbqtresultqtunused5 (and usf10 temp___result_5561))))))))))
      (and
        (= usf8 (ite (forall ((e Int))
                       (=>
                         (and (in_range1 e) (= (mem alloc3 e) true))
                         (and (<= 1 e) (<= e r2))))
                  true
                  false))
        (and (= anyqtresultqtunused11 usf8) (= o15 usf8))))
    (= o15 false)))

(declare-const usfqtunused3 Bool)

(declare-const anyqtresultqtunused14 Bool)

(declare-const usf11 Int)

(declare-const anyqtresultqtunused15 Int)

(declare-const rrqtunused1 Int)

(declare-const int__contentqtresultqtunused11 Int)

(declare-const o16 Bool)

(declare-const infix_lseqqtresultqtunused4 Bool)

(declare-const o17 Bool)

(declare-const infix_lseqqtresultqtunused5 Bool)

(declare-const andbqtresultqtunused6 Bool)

;; "H"
(assert
  (=>
    (= o15 true)
    (and
      (and
        (= anyqtresultqtunused15 usf11)
        (and
          (= rrqtunused1 usf11)
          (and
            (= int__contentqtresultqtunused11 r2)
            (and
              (= o16 (ite (<= usf11 r2) true false))
              (and
                (= infix_lseqqtresultqtunused4 o16)
                (and
                  (= o17 (ite (<= 1 usf11) true false))
                  (and
                    (= infix_lseqqtresultqtunused5 o17)
                    (= andbqtresultqtunused6 (and o17 o16)))))))))
      (and
        (= usfqtunused3 (ite (forall ((rr Int))
                               (=>
                                 (and (<= 1 rr) (<= rr r2))
                                 (ite (= (to_rep (select data rr)) 0)
                                   (and
                                     (= (mem avail3 rr) true)
                                     (not (= (mem alloc3 rr) true)))
                                   (and
                                     (not (= (mem avail3 rr) true))
                                     (= (mem alloc3 rr) true)))))
                          true
                          false))
        (= anyqtresultqtunused14 (ite (forall ((rr Int))
                                        (=>
                                          (and (<= 1 rr) (<= rr r2))
                                          (ite (= (to_rep (select data rr)) 0)
                                            (and
                                              (= (mem avail3 rr) true)
                                              (not (= (mem alloc3 rr) true)))
                                            (and
                                              (not (= (mem avail3 rr) true))
                                              (= (mem alloc3 rr) true)))))
                                   true
                                   false))))))

(declare-const e Int)

;; "H"
(assert (mem__function_guard (mem alloc3 e) alloc3 e))

;; "H"
(assert (in_range1 e))

;; "H"
(assert (= (mem alloc3 e) true))

;; Goal "def'vc"
;; File "allocator.ads", line 41, characters 0-0
(assert
  (not (<= e r2)))

(check-sat)
