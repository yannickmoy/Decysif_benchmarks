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

(declare-sort integer 0)

;; "integer'int"
(declare-fun integerqtint (integer) Int)

;; "integer'axiom"
(assert
  (forall ((i integer))
    (and
      (<= (- 2147483648) (integerqtint i))
      (<= (integerqtint i) 2147483647))))

;; "in_range"
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; "to_rep"
(define-fun to_rep ((x integer)) Int
  (integerqtint x))

;; "of_rep"
(declare-fun of_rep (Int) integer)

;; "inversion_axiom"
(assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; "range_axiom"
(assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; "coerce_axiom"
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int integer))))))

(declare-datatypes ()
  ((t (tqtmk (rec__first integer)(rec__last integer)))))

;; "mk"
(declare-fun mk (Int
  Int) t)

;; "mk_def"
(assert
  (forall ((f Int) (l Int))
    (! (=>
         (in_range f)
         (=>
           (in_range l)
           (and
             (= (to_rep (rec__first (mk f l))) f)
             (= (to_rep (rec__last (mk f l))) l)))) :pattern ((mk f l)) )))

;; "dynamic_property"
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int integer)
  (elts a))

;; "of_array"
(define-fun of_array ((a (Array Int integer)) (f Int) (l Int)) us_t
  (us_tqtmk a (mk f l)))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep (rec__last (rt a))))

;; "length"
(define-fun length ((a us_t)) Int
  (ite (<= (first a) (last a)) (+ (- (last a) (first a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; "value__size_axiom"
(assert (<= 0 value__size))

;; "object__size_axiom"
(assert (<= 0 object__size))

;; "component__size_axiom"
(assert (<= 0 component__size))

;; "alignment_axiom"
(assert (<= 0 alignment))

(declare-const s1 us_t)

(declare-const s2 us_t)

(declare-const r__first integer)

(declare-const r__last integer)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_189 us_t) (temp___is_init_185 Bool) (temp___skip_constant_186 Bool) (temp___do_toplevel_187 Bool) (temp___do_typ_inv_188 Bool)) Bool
  (and
    (=>
      (not (= temp___skip_constant_186 true))
      (dynamic_property
        1
        2147483647
        (first temp___expr_189)
        (last temp___expr_189)))
    (=>
      (= temp___is_init_185 true)
      (=> (= temp___do_toplevel_187 true) (= (first temp___expr_189) 1)))))

;; "dynamic_invariant"
(define-fun dynamic_invariant1 ((temp___expr_268 us_t) (temp___is_init_264 Bool) (temp___skip_constant_265 Bool) (temp___do_toplevel_266 Bool) (temp___do_typ_inv_267 Bool)) Bool
  (and
    (=>
      (not (= temp___skip_constant_265 true))
      (and
        (and
          (dynamic_property
            1
            (+ (length s1) (length s2))
            (first temp___expr_268)
            (last temp___expr_268))
          (= (first temp___expr_268) 1))
        (= (last temp___expr_268) (+ (length s1) (length s2)))))
    (=> (= temp___is_init_264 true) (= (first temp___expr_268) 1))))

;; "default_initial_assumption"
(define-fun default_initial_assumption ((temp___expr_271 us_t) (temp___skip_top_level_272 Bool)) Bool
  (and
    (= (first temp___expr_271) 1)
    (= (last temp___expr_271) (+ (length s1) (length s2)))))

;; "temp_____aggregate_def_617"
(declare-fun temp_____aggregate_def_617 (Int
  Int
  Int) us_t)

(declare-const rliteral integer)

;; "rliteral_axiom"
(assert (= (integerqtint rliteral) 0))

(declare-const r (Array Int integer))

;; "r'unused"
(define-fun rqtunused () map__ref
  (map__refqtmk r))

;; "Assume"
(assert (dynamic_invariant s1 true false true true))

;; "Assume"
(assert (dynamic_invariant s2 true false true true))

;; "Assume"
(assert
  (and
    (and
      (< (length s1) (- 2147483647 (length s2)))
      (forall ((l Int))
        (=>
          (and (<= 2 l) (<= l (last s1)))
          (<= (to_rep (select (to_array s1) (- l 1))) (to_rep
                                                        (select (to_array s1) l))))))
    (forall ((l Int))
      (=>
        (and (<= 2 l) (<= l (last s2)))
        (<= (to_rep (select (to_array s2) (- l 1))) (to_rep
                                                      (select (to_array s2) l)))))))

(declare-const j1 Int)

;; "j1'unused"
(define-fun j1qtunused () int__ref
  (int__refqtmk j1))

;; "H"
(assert (= j1 1))

;; "Assume"
(assert (in_range1 j1))

(declare-const j2 Int)

;; "j2'unused"
(define-fun j2qtunused () int__ref
  (int__refqtmk j2))

;; "H"
(assert (= j2 1))

;; "Assume"
(assert (in_range1 j2))

(declare-const j Int)

;; "j'unused"
(define-fun jqtunused () int__ref
  (int__refqtmk j))

;; "H"
(assert (= j 1))

;; "Assume"
(assert (in_range1 j))

;; "Assume"
(assert
  (default_initial_assumption
    (of_array r (to_rep r__first) (to_rep r__last))
    false))

;; "Assume"
(assert
  (dynamic_invariant1
    (of_array r (to_rep r__first) (to_rep r__last))
    false
    false
    true
    true))

;; "o"
(define-fun o () Int
  (length s2))

;; "length'result'unused"
(define-fun lengthqtresultqtunused () Int
  o)

;; "o"
(define-fun o1 () Int
  (length s1))

;; "length'result'unused"
(define-fun lengthqtresultqtunused1 () Int
  o1)

;; "o"
(define-fun o2 () Int
  (+ o1 o))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o2)

(declare-const temp___621 us_t)

;; "H"
(assert (= (first temp___621) 1))

;; "H"
(assert (= (last temp___621) o2))

;; "H"
(assert true)

;; "H"
(assert true)

;; "H"
(assert
  (forall ((temp___620 Int))
    (! (=>
         (and
           (<= (first temp___621) temp___620)
           (<= temp___620 (last temp___621)))
         (= (select (to_array temp___621) temp___620) rliteral)) :pattern ((select 
    (to_array
      temp___621) temp___620)) )))

;; "H"
(assert (= temp___621 (temp_____aggregate_def_617 0 1 o2)))

;; "temp_____aggregate_def_617'result'unused"
(define-fun temp_____aggregate_def_617qtresultqtunused () us_t
  temp___621)

;; "Assume"
(assert (= (first temp___621) 1))

;; "Assume"
(assert (= (last temp___621) (+ (length s1) (length s2))))

;; "Assert"
(assert (= (first temp___621) 1))

;; "temp___625"
(define-fun temp___625 () (Array Int integer)
  (to_array temp___621))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused () (Array Int integer)
  temp___625)

;; "Assert"
(assert (= (first temp___621) 1))

;; "Assert"
(assert
  (ite (<= (first temp___621) (last temp___621))
    (and
      (<= 1 (+ (length s1) (length s2)))
      (= (- (last temp___621) (first temp___621)) (- (+ (length s1) (length
                                                                    s2)) 1)))
    (< (+ (length s1) (length s2)) 1)))

;; "o"
(define-fun o3 () Int
  (last temp___621))

;; "last'result'unused"
(define-fun lastqtresultqtunused () Int
  o3)

;; "o"
(define-fun o4 () Int
  (first temp___621))

;; "first'result'unused"
(define-fun firstqtresultqtunused () Int
  o4)

;; "temp___627"
(define-fun temp___627 () us_t
  temp___621)

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused () us_t
  temp___627)

(declare-const o5 Int)

;; "Ensures"
(assert (= (to_rep r__last) o5))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused () Int
  o5)

(declare-const o6 Int)

;; "Ensures"
(assert (= (to_rep r__first) o6))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused1 () Int
  o6)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused () (Array Int integer)
  r)

;; "temp___628"
(define-fun temp___628 () us_t
  (of_array r o6 o5))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused1 () us_t
  temp___628)

;; "Assert"
(assert
  (ite (<= (first temp___627) (last temp___627))
    (and (<= o6 o5) (= (- (last temp___627) (first temp___627)) (- o5 o6)))
    (< o5 o6)))

;; "o"
(define-fun o7 () (Array Int integer)
  (to_array temp___627))

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused1 () (Array Int integer)
  o7)

(declare-const r1 (Array Int integer))

;; "r'unused"
(define-fun rqtunused1 () map__ref
  (map__refqtmk r1))

;; "H"
(assert (= r1 o7))

(declare-const o8 Bool)

(declare-const o9 Int)

;; "H"
(assert (= o9 (last s1)))

(declare-const lastqtresultqtunused1 Int)

;; "H"
(assert (= lastqtresultqtunused1 o9))

(declare-const int__contentqtresultqtunused Int)

;; "H"
(assert (= int__contentqtresultqtunused j1))

(declare-const o10 Bool)

;; "H"
(assert (= o10 (ite (<= j1 o9) true false)))

(declare-const infix_lseqqtresultqtunused Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused o10))

(declare-const int__contentqtresultqtunused1 Int)

;; "H"
(assert (= int__contentqtresultqtunused1 j1))

(declare-const o11 Int)

;; "H"
(assert (= o11 (first s1)))

(declare-const firstqtresultqtunused1 Int)

;; "H"
(assert (= firstqtresultqtunused1 o11))

(declare-const o12 Bool)

;; "H"
(assert (= o12 (ite (<= o11 j1) true false)))

(declare-const infix_lseqqtresultqtunused1 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused1 o12))

(declare-const o13 Bool)

;; "H"
(assert (= o13 (and o12 o10)))

(declare-const andbqtresultqtunused Bool)

;; "H"
(assert (= andbqtresultqtunused o13))

(declare-const o14 Int)

(declare-const lastqtresultqtunused2 Int)

(declare-const int__contentqtresultqtunused2 Int)

(declare-const o15 Bool)

(declare-const infix_lseqqtresultqtunused2 Bool)

(declare-const int__contentqtresultqtunused3 Int)

(declare-const o16 Int)

(declare-const firstqtresultqtunused2 Int)

(declare-const o17 Bool)

(declare-const infix_lseqqtresultqtunused3 Bool)

(declare-const andbqtresultqtunused1 Bool)

;; "H"
(assert
  (ite (= o13 true)
    (and
      (= o14 (last s2))
      (and
        (= lastqtresultqtunused2 o14)
        (and
          (= int__contentqtresultqtunused2 j2)
          (and
            (= o15 (ite (<= j2 o14) true false))
            (and
              (= infix_lseqqtresultqtunused2 o15)
              (and
                (= int__contentqtresultqtunused3 j2)
                (and
                  (= o16 (first s2))
                  (and
                    (= firstqtresultqtunused2 o16)
                    (and
                      (= o17 (ite (<= o16 j2) true false))
                      (and
                        (= infix_lseqqtresultqtunused3 o17)
                        (and
                          (= o8 (and o17 o15))
                          (= andbqtresultqtunused1 o8))))))))))))
    (= o8 false)))

;; "H"
(assert (= o8 true))

(declare-const o18 Int)

;; "Ensures"
(assert (= (to_rep r__last) o18))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused2 () Int
  o18)

(declare-const o19 Int)

;; "Ensures"
(assert (= (to_rep r__first) o19))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused3 () Int
  o19)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused1 () (Array Int integer)
  r1)

;; "temp___loop_entry_645"
(define-fun temp___loop_entry_645 () us_t
  (of_array r1 o19 o18))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused2 () us_t
  temp___loop_entry_645)

;; "temp___loop_entry_644'unused"
(define-fun temp___loop_entry_644qtunused () Int
  j)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused4 () Int
  j)

;; "temp___loop_entry_643'unused"
(define-fun temp___loop_entry_643qtunused () Int
  j2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  j2)

;; "temp___loop_entry_642'unused"
(define-fun temp___loop_entry_642qtunused () Int
  j1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  j1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  j2)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused8 () Int
  j1)

;; "o"
(define-fun o20 () Int
  (+ j1 j2))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o20)

;; "Ensures"
(assert (in_range o20))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o20)

;; "o"
(define-fun o21 () Int
  (- o20 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused () Int
  o21)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  j)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  (ite (= j o21) true false))

(declare-const j11 Int)

(declare-const j21 Int)

(declare-const j3 Int)

(declare-const r2 (Array Int integer))

;; "r'unused"
(define-fun rqtunused2 () map__ref
  (map__refqtmk r2))

;; "j'unused"
(define-fun jqtunused1 () int__ref
  (int__refqtmk j3))

;; "j2'unused"
(define-fun j2qtunused1 () int__ref
  (int__refqtmk j21))

;; "j1'unused"
(define-fun j1qtunused1 () int__ref
  (int__refqtmk j11))

;; "LoopInvariant"
(assert (= j3 (- (+ j11 j21) 1)))

;; "LoopInvariant"
(assert
  (=>
    (< 1 j3)
    (<= (to_rep (select r2 (- j3 1))) (to_rep (select (to_array s1) j11)))))

;; "LoopInvariant"
(assert
  (=>
    (< 1 j3)
    (<= (to_rep (select r2 (- j3 1))) (to_rep (select (to_array s2) j21)))))

;; "LoopInvariant"
(assert
  (forall ((l Int))
    (=>
      (and (<= 2 l) (<= l (- j3 1)))
      (<= (to_rep (select r2 (- l 1))) (to_rep (select r2 l))))))

;; "loop_var___43231'unused"
(define-fun loop_var___43231qtunused () Int
  j11)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused10 () Int
  j11)

;; "loop_var___43245'unused"
(define-fun loop_var___43245qtunused () Int
  j21)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused11 () Int
  j21)

;; "Assume"
(assert
  (= (and (ite (and
                 (and (and (in_range1 j11) (in_range1 j21)) (in_range1 j3))
                 (dynamic_invariant1
                   (of_array r2 (to_rep r__first) (to_rep r__last))
                   false
                   true
                   true
                   true))
            true
            false) (ite (and
                          (and (<= (first s1) j11) (<= j11 (last s1)))
                          (and (<= (first s2) j21) (<= j21 (last s2))))
                     true
                     false)) true))

(declare-const j12 Int)

(declare-const j22 Int)

(declare-const r3 (Array Int integer))

;; "r'unused"
(define-fun rqtunused3 () map__ref
  (map__refqtmk r3))

;; "j2'unused"
(define-fun j2qtunused2 () int__ref
  (int__refqtmk j22))

;; "j1'unused"
(define-fun j1qtunused2 () int__ref
  (int__refqtmk j12))

;; "Assert"
(assert (and (<= (first s2) j21) (<= j21 (last s2))))

(declare-const int__contentqtresultqtunused12 Int)

;; "H"
(assert (= int__contentqtresultqtunused12 j21))

(declare-const o22 (Array Int integer))

;; "H"
(assert (= o22 (to_array s2)))

(declare-const to_arrayqtresultqtunused2 (Array Int integer))

;; "H"
(assert (= to_arrayqtresultqtunused2 o22))

(declare-const o23 integer)

;; "H"
(assert (= o23 (select o22 j21)))

(declare-const getqtresultqtunused integer)

;; "H"
(assert (= getqtresultqtunused o23))

(declare-const o24 Int)

;; "Ensures"
(assert (= (to_rep o23) o24))

(declare-const to_repqtresultqtunused4 Int)

;; "H"
(assert (= to_repqtresultqtunused4 o24))

;; "Assert"
(assert (and (<= (first s1) j11) (<= j11 (last s1))))

(declare-const int__contentqtresultqtunused13 Int)

;; "H"
(assert (= int__contentqtresultqtunused13 j11))

(declare-const o25 (Array Int integer))

;; "H"
(assert (= o25 (to_array s1)))

(declare-const to_arrayqtresultqtunused3 (Array Int integer))

;; "H"
(assert (= to_arrayqtresultqtunused3 o25))

(declare-const o26 integer)

;; "H"
(assert (= o26 (select o25 j11)))

(declare-const getqtresultqtunused1 integer)

;; "H"
(assert (= getqtresultqtunused1 o26))

(declare-const o27 Int)

;; "Ensures"
(assert (= (to_rep o26) o27))

(declare-const to_repqtresultqtunused5 Int)

;; "H"
(assert (= to_repqtresultqtunused5 o27))

(declare-const o28 Bool)

;; "H"
(assert (= o28 (ite (< o27 o24) true false)))

(declare-const infix_lsqtresultqtunused Bool)

;; "H"
(assert (= infix_lsqtresultqtunused o28))

(declare-const spark__branch Bool)

(declare-const spark__branchqtunused bool__ref)

;; "H"
(assert (= spark__branchqtunused (bool__refqtmk spark__branch)))

;; "H"
(assert (= spark__branch o28))

(declare-const bool__contentqtresultqtunused Bool)

;; "H"
(assert (= bool__contentqtresultqtunused spark__branch))

(declare-const o29 Int)

(declare-const to_repqtresultqtunused6 Int)

(declare-const o30 Int)

(declare-const to_repqtresultqtunused7 Int)

(declare-const map__contentqtresultqtunused2 (Array Int integer))

(declare-const temp___636 us_t)

(declare-const of_arrayqtresultqtunused3 us_t)

(declare-const o31 t)

(declare-const rtqtresultqtunused t)

(declare-const int__contentqtresultqtunused14 Int)

(declare-const o32 (Array Int integer))

(declare-const to_arrayqtresultqtunused4 (Array Int integer))

(declare-const o33 integer)

(declare-const getqtresultqtunused2 integer)

(declare-const o34 Int)

(declare-const to_repqtresultqtunused8 Int)

(declare-const o35 integer)

(declare-const of_repqtresultqtunused integer)

(declare-const int__contentqtresultqtunused15 Int)

(declare-const o36 (Array Int integer))

(declare-const to_arrayqtresultqtunused5 (Array Int integer))

(declare-const o37 (Array Int integer))

(declare-const setqtresultqtunused (Array Int integer))

(declare-const temp___638 us_t)

(declare-const us_tqtmkqtresultqtunused us_t)

(declare-const o38 (Array Int integer))

(declare-const to_arrayqtresultqtunused6 (Array Int integer))

(declare-const int__contentqtresultqtunused16 Int)

(declare-const o39 Int)

(declare-const infix_plqtresultqtunused2 Int)

(declare-const range_check_qtresultqtunused1 Int)

(declare-const o40 Int)

(declare-const to_repqtresultqtunused9 Int)

(declare-const o41 Int)

(declare-const to_repqtresultqtunused10 Int)

(declare-const map__contentqtresultqtunused3 (Array Int integer))

(declare-const temp___630 us_t)

(declare-const of_arrayqtresultqtunused4 us_t)

(declare-const o42 t)

(declare-const rtqtresultqtunused1 t)

(declare-const int__contentqtresultqtunused17 Int)

(declare-const o43 (Array Int integer))

(declare-const to_arrayqtresultqtunused7 (Array Int integer))

(declare-const o44 integer)

(declare-const getqtresultqtunused3 integer)

(declare-const o45 Int)

(declare-const to_repqtresultqtunused11 Int)

(declare-const o46 integer)

(declare-const of_repqtresultqtunused1 integer)

(declare-const int__contentqtresultqtunused18 Int)

(declare-const o47 (Array Int integer))

(declare-const to_arrayqtresultqtunused8 (Array Int integer))

(declare-const o48 (Array Int integer))

(declare-const setqtresultqtunused1 (Array Int integer))

(declare-const temp___632 us_t)

(declare-const us_tqtmkqtresultqtunused1 us_t)

(declare-const o49 (Array Int integer))

(declare-const to_arrayqtresultqtunused9 (Array Int integer))

(declare-const int__contentqtresultqtunused19 Int)

(declare-const o50 Int)

(declare-const infix_plqtresultqtunused3 Int)

(declare-const range_check_qtresultqtunused2 Int)

;; "H"
(assert
  (ite (= spark__branch true)
    (and
      (and
        (= (to_rep r__last) o40)
        (and
          (= to_repqtresultqtunused9 o40)
          (and
            (= (to_rep r__first) o41)
            (and
              (= to_repqtresultqtunused10 o41)
              (and
                (= map__contentqtresultqtunused3 r2)
                (and
                  (= temp___630 (of_array r2 o41 o40))
                  (and
                    (= of_arrayqtresultqtunused4 temp___630)
                    (and
                      (= o42 (rt temp___630))
                      (and
                        (= rtqtresultqtunused1 o42)
                        (and
                          (and (<= (first s1) j11) (<= j11 (last s1)))
                          (and
                            (= int__contentqtresultqtunused17 j11)
                            (and
                              (= o43 (to_array s1))
                              (and
                                (= to_arrayqtresultqtunused7 o43)
                                (and
                                  (= o44 (select o43 j11))
                                  (and
                                    (= getqtresultqtunused3 o44)
                                    (and
                                      (= (to_rep o44) o45)
                                      (and
                                        (= to_repqtresultqtunused11 o45)
                                        (and
                                          (= (to_rep o46) o45)
                                          (and
                                            (= of_repqtresultqtunused1 
                                            o46)
                                            (and
                                              (and (<= o41 j3) (<= j3 o40))
                                              (and
                                                (= int__contentqtresultqtunused18 
                                                j3)
                                                (and
                                                  (= o47 r2)
                                                  (and
                                                    (= to_arrayqtresultqtunused8 
                                                    o47)
                                                    (and
                                                      (= o48 (store o47 
                                                      j3 o46))
                                                      (and
                                                        (= setqtresultqtunused1 
                                                        o48)
                                                        (and
                                                          (= temp___632 
                                                          (us_tqtmk
                                                            o48
                                                            o42))
                                                          (and
                                                            (= us_tqtmkqtresultqtunused1 
                                                            temp___632)
                                                            (and
                                                              (= (first
                                                                   temp___632) 1)
                                                              (and
                                                                (= o49 
                                                                (to_array
                                                                  temp___632))
                                                                (and
                                                                  (= 
                                                                  to_arrayqtresultqtunused9 
                                                                  o49)
                                                                  (and
                                                                    (= 
                                                                    r3 
                                                                    o49)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused19 
                                                                    j11)
                                                                    (and
                                                                    (= 
                                                                    o50 (+ 
                                                                    j11 1))
                                                                    (and
                                                                    (= 
                                                                    infix_plqtresultqtunused3 
                                                                    o50)
                                                                    (and
                                                                    (in_range
                                                                    o50)
                                                                    (and
                                                                    (= 
                                                                    range_check_qtresultqtunused2 
                                                                    o50)
                                                                    (= 
                                                                    j12 
                                                                    o50)))))))))))))))))))))))))))))))))))))
      (= j22 j21))
    (and
      (and
        (= (to_rep r__last) o29)
        (and
          (= to_repqtresultqtunused6 o29)
          (and
            (= (to_rep r__first) o30)
            (and
              (= to_repqtresultqtunused7 o30)
              (and
                (= map__contentqtresultqtunused2 r2)
                (and
                  (= temp___636 (of_array r2 o30 o29))
                  (and
                    (= of_arrayqtresultqtunused3 temp___636)
                    (and
                      (= o31 (rt temp___636))
                      (and
                        (= rtqtresultqtunused o31)
                        (and
                          (and (<= (first s2) j21) (<= j21 (last s2)))
                          (and
                            (= int__contentqtresultqtunused14 j21)
                            (and
                              (= o32 (to_array s2))
                              (and
                                (= to_arrayqtresultqtunused4 o32)
                                (and
                                  (= o33 (select o32 j21))
                                  (and
                                    (= getqtresultqtunused2 o33)
                                    (and
                                      (= (to_rep o33) o34)
                                      (and
                                        (= to_repqtresultqtunused8 o34)
                                        (and
                                          (= (to_rep o35) o34)
                                          (and
                                            (= of_repqtresultqtunused 
                                            o35)
                                            (and
                                              (and (<= o30 j3) (<= j3 o29))
                                              (and
                                                (= int__contentqtresultqtunused15 
                                                j3)
                                                (and
                                                  (= o36 r2)
                                                  (and
                                                    (= to_arrayqtresultqtunused5 
                                                    o36)
                                                    (and
                                                      (= o37 (store o36 
                                                      j3 o35))
                                                      (and
                                                        (= setqtresultqtunused 
                                                        o37)
                                                        (and
                                                          (= temp___638 
                                                          (us_tqtmk
                                                            o37
                                                            o31))
                                                          (and
                                                            (= us_tqtmkqtresultqtunused 
                                                            temp___638)
                                                            (and
                                                              (= (first
                                                                   temp___638) 1)
                                                              (and
                                                                (= o38 
                                                                (to_array
                                                                  temp___638))
                                                                (and
                                                                  (= 
                                                                  to_arrayqtresultqtunused6 
                                                                  o38)
                                                                  (and
                                                                    (= 
                                                                    r3 
                                                                    o38)
                                                                    (and
                                                                    (= 
                                                                    int__contentqtresultqtunused16 
                                                                    j21)
                                                                    (and
                                                                    (= 
                                                                    o39 (+ 
                                                                    j21 1))
                                                                    (and
                                                                    (= 
                                                                    infix_plqtresultqtunused2 
                                                                    o39)
                                                                    (and
                                                                    (in_range
                                                                    o39)
                                                                    (and
                                                                    (= 
                                                                    range_check_qtresultqtunused1 
                                                                    o39)
                                                                    (= 
                                                                    j22 
                                                                    o39)))))))))))))))))))))))))))))))))))))
      (= j12 j11))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused20 () Int
  j3)

;; "o"
(define-fun o51 () Int
  (+ j3 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused4 () Int
  o51)

;; "Ensures"
(assert (in_range o51))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o51)

(declare-const j4 Int)

;; "j'unused"
(define-fun jqtunused2 () int__ref
  (int__refqtmk j4))

;; "H"
(assert (= j4 o51))

(declare-const o52 Bool)

(declare-const o53 Int)

;; "H"
(assert (= o53 (last s1)))

(declare-const lastqtresultqtunused3 Int)

;; "H"
(assert (= lastqtresultqtunused3 o53))

(declare-const int__contentqtresultqtunused21 Int)

;; "H"
(assert (= int__contentqtresultqtunused21 j12))

(declare-const o54 Bool)

;; "H"
(assert (= o54 (ite (<= j12 o53) true false)))

(declare-const infix_lseqqtresultqtunused4 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused4 o54))

(declare-const int__contentqtresultqtunused22 Int)

;; "H"
(assert (= int__contentqtresultqtunused22 j12))

(declare-const o55 Int)

;; "H"
(assert (= o55 (first s1)))

(declare-const firstqtresultqtunused3 Int)

;; "H"
(assert (= firstqtresultqtunused3 o55))

(declare-const o56 Bool)

;; "H"
(assert (= o56 (ite (<= o55 j12) true false)))

(declare-const infix_lseqqtresultqtunused5 Bool)

;; "H"
(assert (= infix_lseqqtresultqtunused5 o56))

(declare-const o57 Bool)

;; "H"
(assert (= o57 (and o56 o54)))

(declare-const andbqtresultqtunused2 Bool)

;; "H"
(assert (= andbqtresultqtunused2 o57))

(declare-const o58 Int)

(declare-const lastqtresultqtunused4 Int)

(declare-const int__contentqtresultqtunused23 Int)

(declare-const o59 Bool)

(declare-const infix_lseqqtresultqtunused6 Bool)

(declare-const int__contentqtresultqtunused24 Int)

(declare-const o60 Int)

(declare-const firstqtresultqtunused4 Int)

(declare-const o61 Bool)

(declare-const infix_lseqqtresultqtunused7 Bool)

(declare-const andbqtresultqtunused3 Bool)

;; "H"
(assert
  (ite (= o57 true)
    (and
      (= o58 (last s2))
      (and
        (= lastqtresultqtunused4 o58)
        (and
          (= int__contentqtresultqtunused23 j22)
          (and
            (= o59 (ite (<= j22 o58) true false))
            (and
              (= infix_lseqqtresultqtunused6 o59)
              (and
                (= int__contentqtresultqtunused24 j22)
                (and
                  (= o60 (first s2))
                  (and
                    (= firstqtresultqtunused4 o60)
                    (and
                      (= o61 (ite (<= o60 j22) true false))
                      (and
                        (= infix_lseqqtresultqtunused7 o61)
                        (and
                          (= o52 (and o61 o59))
                          (= andbqtresultqtunused3 o52))))))))))))
    (= o52 false)))

;; "H"
(assert (= o52 true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused25 () Int
  j22)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused26 () Int
  j12)

;; "o"
(define-fun o62 () Int
  (+ j12 j22))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused5 () Int
  o62)

;; "Ensures"
(assert (in_range o62))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused4 () Int
  o62)

;; "o"
(define-fun o63 () Int
  (- o62 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused1 () Int
  o63)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused27 () Int
  j4)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused1 () Bool
  (ite (= j4 o63) true false))

;; "loop_var_new___43245'unused"
(define-fun loop_var_new___43245qtunused () Int
  j22)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused28 () Int
  j22)

;; "loop_var_new___43231'unused"
(define-fun loop_var_new___43231qtunused () Int
  j12)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused29 () Int
  j12)

;; "H"
(assert (or (< j11 j12) (and (= j12 j11) (< j21 j22))))

;; "LoopInvariant"
(assert (= j4 (- (+ j12 j22) 1)))

;; "LoopInvariant"
(assert
  (=>
    (< 1 j4)
    (<= (to_rep (select r3 (- j4 1))) (to_rep (select (to_array s1) j12)))))

;; "LoopInvariant"
(assert
  (=>
    (< 1 j4)
    (<= (to_rep (select r3 (- j4 1))) (to_rep (select (to_array s2) j22)))))

(declare-const l Int)

;; "H"
(assert (<= 2 l))

;; "H"
(assert (<= l (- j4 1)))

;; Goal "def'vc"
;; File "ghc_sort.ads", line 36, characters 0-0
(assert
  (not (<= (to_rep (select r3 (- l 1))) (to_rep (select r3 l)))))

(check-sat)
