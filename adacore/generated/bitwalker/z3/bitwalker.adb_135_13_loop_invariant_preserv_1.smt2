;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(define-fun __cdiv ((x Int) (y Int)) Int (ite (>= x 0) (div x y) (- (div (- x) y))))
(define-fun __cmod ((x Int) (y Int)) Int (ite (>= x 0) (mod x y) (- (mod (- x) y))))
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-datatypes ()
  ((int__ref (int__refqtmk (int__content Int)))))

(declare-datatypes ()
  ((bool__ref (bool__refqtmk (bool__content Bool)))))

;; "length"
(define-fun length ((x Int) (y Int)) Int
  (ite (<= x y) (+ (- y x) 1) 0))

(declare-const two_power_size_minus_one Int)

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

;; "in_range"
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

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

(declare-const two_power_size_minus_one1 Int)

(declare-sort unsigned_8 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

;; "in_range"
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483646)))

;; "to_rep"
(declare-fun to_rep1 (unsigned_8) (_ BitVec 8))

;; "of_rep"
(declare-fun of_rep1 ((_ BitVec 8)) unsigned_8)

;; "inversion_axiom"
(assert
  (forall ((x unsigned_8))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; "range_axiom"
(assert true)

;; "coerce_axiom"
(assert
  (forall ((x (_ BitVec 8)))
    (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(declare-datatypes ()
  ((map__ref (map__refqtmk (map__content (Array Int unsigned_8))))))

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
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ()
  ((us_t (us_tqtmk (elts (Array Int unsigned_8))(rt t)))))

;; "to_array"
(define-fun to_array ((a us_t)) (Array Int unsigned_8)
  (elts a))

;; "of_array"
(define-fun of_array ((a (Array Int unsigned_8)) (f Int) (l Int)) us_t
  (us_tqtmk a (mk f l)))

;; "first"
(define-fun first ((a us_t)) Int
  (to_rep (rec__first (rt a))))

;; "last"
(define-fun last ((a us_t)) Int
  (to_rep (rec__last (rt a))))

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

;; "nth8_stream"
(declare-fun nth8_stream (us_t
  Int) Bool)

;; "nth"
(define-fun nth ((param__x (_ BitVec 8)) (param__pos Int)) Bool
  (= (bvand (ite (< param__pos 8)
              (bvlshr param__x ((_ int2bv 8) param__pos))
              #x00) #x01) #x01))

;; "nth"
(define-fun nth1 ((param__x (_ BitVec 64)) (param__pos Int)) Bool
  (= (bvand (bvlshr param__x ((_ int2bv 64) param__pos)) #x0000000000000001) #x0000000000000001))

;; "peekbit64"
(declare-fun peekbit64 ((_ BitVec 64)
  Int) Bool)

;; "peekbit64__function_guard"
(declare-fun peekbit64__function_guard (Bool
  (_ BitVec 64)
  Int) Bool)

;; "dynamic_invariant"
(define-fun dynamic_invariant ((temp___expr_204 us_t) (temp___is_init_200 Bool) (temp___skip_constant_201 Bool) (temp___do_toplevel_202 Bool) (temp___do_typ_inv_203 Bool)) Bool
  (=>
    (not (= temp___skip_constant_201 true))
    (dynamic_property
      0
      2147483646
      (first temp___expr_204)
      (last temp___expr_204))))

(declare-const start Int)

(declare-const len Int)

(declare-const addr__first integer)

(declare-const addr__last integer)

(declare-const value (_ BitVec 64))

;; "maxvalue"
(declare-fun maxvalue (Int) (_ BitVec 64))

;; "maxvalue__function_guard"
(declare-fun maxvalue__function_guard ((_ BitVec 64)
  Int) Bool)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

;; "nth8_stream__post_axiom"
(assert true)

;; "nth8_stream__def_axiom"
(assert
  (forall ((param__stream us_t))
    (forall ((param__pos Int))
      (! (=
           (= (nth8_stream param__stream param__pos) true)
           (= (nth
                (to_rep1
                  (select (to_array param__stream) (__cdiv param__pos 8)))
                (- 7 (__cmod param__pos 8))) true)) :pattern ((nth8_stream
                                                                param__stream
                                                                param__pos)) ))))

;; "maxvalue__post_axiom"
(assert true)

;; "maxvalue__def_axiom"
(assert
  (forall ((param__len Int))
    (! (= (maxvalue param__len) (bvshl #x0000000000000001 ((_ int2bv 64) param__len))) :pattern (
    (maxvalue
      param__len)) )))

(declare-const addr (Array Int unsigned_8))

(declare-const result__ Int)

(declare-const flag Bool)

;; "flag'unused"
(define-fun flagqtunused () bool__ref
  (bool__refqtmk flag))

;; "addr'unused"
(define-fun addrqtunused () map__ref
  (map__refqtmk addr))

;; "addr'unused"
(define-fun addrqtunused1 () map__ref
  (map__refqtmk addr))

;; "Assume"
(assert (in_range1 start))

;; "Assume"
(assert (in_range1 len))

;; "Assume"
(assert
  (dynamic_property 0 2147483646 (to_rep addr__first) (to_rep addr__last)))

;; "Assume"
(assert true)

;; "Assume"
(assert (in_range result__))

;; "Assume"
(assert
  (and
    (and
      (and
        (= (to_rep addr__first) 0)
        (<= (* 8 (length (to_rep addr__first) (to_rep addr__last))) 2147483647))
      (< (+ start len) 2147483647))
    (and (<= 0 len) (<= len 63))))

(declare-const o Int)

;; "Ensures"
(assert (= (to_rep addr__last) o))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused () Int
  o)

(declare-const o1 Int)

;; "Ensures"
(assert (= (to_rep addr__first) o1))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused1 () Int
  o1)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused () (Array Int unsigned_8)
  addr)

;; "temp___old_444"
(define-fun temp___old_444 () us_t
  (of_array addr o1 o))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused () us_t
  temp___old_444)

(declare-const o2 Int)

;; "Ensures"
(assert (= (to_rep addr__last) o2))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused2 () Int
  o2)

(declare-const o3 Int)

;; "Ensures"
(assert (= (to_rep addr__first) o3))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused3 () Int
  o3)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused1 () (Array Int unsigned_8)
  addr)

;; "temp___old_430"
(define-fun temp___old_430 () us_t
  (of_array addr o3 o2))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused1 () us_t
  temp___old_430)

(declare-const o4 Int)

;; "Ensures"
(assert (= (to_rep addr__last) o4))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused4 () Int
  o4)

(declare-const o5 Int)

;; "Ensures"
(assert (= (to_rep addr__first) o5))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused5 () Int
  o5)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused2 () (Array Int unsigned_8)
  addr)

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused2 () us_t
  (of_array addr o5 o4))

(declare-const o6 Int)

;; "Ensures"
(assert (= (to_rep addr__last) o6))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused6 () Int
  o6)

(declare-const o7 Int)

;; "Ensures"
(assert (= (to_rep addr__first) o7))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused7 () Int
  o7)

;; "o"
(define-fun o8 () Int
  (length o7 o6))

;; "length'result'unused"
(define-fun lengthqtresultqtunused () Int
  o8)

;; "Ensures"
(assert (in_range o8))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused () Int
  o8)

;; "o"
(define-fun o9 () Int
  (* o8 8))

;; "infix *'result'unused"
(define-fun infix_asqtresultqtunused () Int
  o9)

;; "Ensures"
(assert (in_range o9))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused1 () Int
  o9)

;; "o"
(define-fun o10 () Int
  (+ start len))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused () Int
  o10)

;; "Ensures"
(assert (in_range o10))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused2 () Int
  o10)

;; "o"
(define-fun o11 () Bool
  (ite (< o9 o10) true false))

;; "infix >'result'unused"
(define-fun infix_gtqtresultqtunused () Bool
  o11)

(declare-const spark__branch Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused () bool__ref
  (bool__refqtmk spark__branch))

;; "H"
(assert (= spark__branch o11))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused () Bool
  spark__branch)

;; "H"
(assert (not (= spark__branch true)))

;; "o"
(define-fun o12 () Int
  len)

;; "o"
(define-fun o13 () (_ BitVec 64)
  (maxvalue o12))

;; "H"
(assert (maxvalue__function_guard o13 o12))

;; "H"
(assert true)

;; "H"
(assert (= o13 (bvshl #x0000000000000001 ((_ int2bv 64) o12))))

;; "maxvalue'result'unused"
(define-fun maxvalueqtresultqtunused () (_ BitVec 64)
  o13)

;; "o"
(define-fun o14 () Bool
  (ite (bvuge value o13) true false))

;; "uge'result'unused"
(define-fun ugeqtresultqtunused () Bool
  o14)

(declare-const spark__branch1 Bool)

;; "spark__branch'unused"
(define-fun spark__branchqtunused1 () bool__ref
  (bool__refqtmk spark__branch1))

;; "H"
(assert (= spark__branch1 o14))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused1 () Bool
  spark__branch1)

;; "H"
(assert (not (= spark__branch1 true)))

;; "temp___371"
(define-fun temp___371 () Int
  (- len 1))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused () Int
  temp___371)

(declare-const i Int)

;; "i'unused"
(define-fun iqtunused () int__ref
  (int__refqtmk i))

;; "H"
(assert (= i 0))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused () Int
  i)

;; "o"
(define-fun o15 () Bool
  (ite (<= i temp___371) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused () Bool
  o15)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused1 () Int
  i)

;; "o"
(define-fun o16 () Bool
  (ite (<= 0 i) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused1 () Bool
  o16)

;; "o"
(define-fun o17 () Bool
  (and o16 o15))

;; "andb'result'unused"
(define-fun andbqtresultqtunused () Bool
  o17)

;; "H"
(assert (= o17 true))

(declare-const o18 Int)

;; "Ensures"
(assert (= (to_rep addr__last) o18))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused8 () Int
  o18)

(declare-const o19 Int)

;; "Ensures"
(assert (= (to_rep addr__first) o19))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused9 () Int
  o19)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused3 () (Array Int unsigned_8)
  addr)

;; "temp___loop_entry_396"
(define-fun temp___loop_entry_396 () us_t
  (of_array addr o19 o18))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused3 () us_t
  temp___loop_entry_396)

(declare-const o20 Int)

;; "Ensures"
(assert (= (to_rep addr__last) o20))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused10 () Int
  o20)

(declare-const o21 Int)

;; "Ensures"
(assert (= (to_rep addr__first) o21))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused11 () Int
  o21)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused4 () (Array Int unsigned_8)
  addr)

;; "temp___loop_entry_414"
(define-fun temp___loop_entry_414 () us_t
  (of_array addr o21 o20))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused4 () us_t
  temp___loop_entry_414)

;; "temp___loop_entry_391'unused"
(define-fun temp___loop_entry_391qtunused () Bool
  flag)

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused2 () Bool
  flag)

(declare-const o22 Int)

;; "Ensures"
(assert (= (to_rep addr__last) o22))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused12 () Int
  o22)

(declare-const o23 Int)

;; "Ensures"
(assert (= (to_rep addr__first) o23))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused13 () Int
  o23)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused5 () (Array Int unsigned_8)
  addr)

;; "temp___loop_entry_390'unused"
(define-fun temp___loop_entry_390qtunused () us_t
  (of_array addr o23 o22))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused5 () us_t
  (of_array addr o23 o22))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused2 () Int
  i)

;; "o"
(define-fun o24 () Bool
  (ite (<= i len) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused2 () Bool
  o24)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused3 () Int
  i)

;; "o"
(define-fun o25 () Bool
  (ite (<= 0 i) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused3 () Bool
  o25)

;; "andb'result'unused"
(define-fun andbqtresultqtunused1 () Bool
  (and o25 o24))

(declare-const addr1 (Array Int unsigned_8))

(declare-const i1 Int)

;; "i'unused"
(define-fun iqtunused1 () int__ref
  (int__refqtmk i1))

;; "addr'unused"
(define-fun addrqtunused2 () map__ref
  (map__refqtmk addr1))

;; "LoopInvariant"
(assert (and (<= 0 i1) (<= i1 len)))

;; "LoopInvariant"
(assert
  (forall ((j Int))
    (=>
      (and (<= 0 j) (<= j (- start 1)))
      (=
        (= (nth8_stream (of_array addr o21 o20) j) true)
        (= (nth8_stream
             (let ((temp___422 (of_array
                                 addr1
                                 (to_rep addr__first)
                                 (to_rep addr__last))))
               (of_array addr1 (to_rep addr__first) (to_rep addr__last)))
             j) true)))))

;; "LoopInvariant"
(assert
  (forall ((j Int))
    (=>
      (and (<= start j) (<= j (- (+ start i1) 1)))
      (=
        (= (nth8_stream
             (let ((temp___411 (of_array
                                 addr1
                                 (to_rep addr__first)
                                 (to_rep addr__last))))
               (of_array addr1 (to_rep addr__first) (to_rep addr__last)))
             j) true)
        (= (nth1 value (+ (- (- len j) 1) start)) true)))))

;; "LoopInvariant"
(assert
  (forall ((j Int))
    (=>
      (and
        (<= (+ start i1) j)
        (<= j (- (* 8 (length (to_rep addr__first) (to_rep addr__last))) 1)))
      (=
        (= (nth8_stream
             (let ((temp___403 (of_array
                                 addr1
                                 (to_rep addr__first)
                                 (to_rep addr__last))))
               (of_array addr1 (to_rep addr__first) (to_rep addr__last)))
             j) true)
        (= (nth8_stream (of_array addr o19 o18) j) true)))))

;; "Assume"
(assert
  (= (and (ite true true false) (ite (and (<= 0 i1) (<= i1 (- len 1)))
                                  true
                                  false)) true))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused4 () Int
  i1)

;; "o"
(define-fun o26 () Int
  (- 64 len))

;; "infix -'result'unused"
(define-fun infix_mnqtresultqtunused1 () Int
  o26)

;; "o"
(define-fun o27 () Int
  (+ o26 i1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused1 () Int
  o27)

;; "Ensures"
(assert (in_range o27))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused3 () Int
  o27)

;; "Ensures"
(assert (in_range1 o27))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused4 () Int
  o27)

;; "o"
(define-fun o28 () (_ BitVec 64)
  value)

;; "o"
(define-fun o29 () Bool
  (peekbit64 o28 o27))

;; "H"
(assert (peekbit64__function_guard o29 o28 o27))

;; "H"
(assert
  (=
    (= o29 true)
    (not
      (= (bvand o28 (bvshl #x0000000000000001 ((_ int2bv 64) (- 63 o27)))) #x0000000000000000))))

;; "H"
(assert (= (= o29 true) (= (nth1 o28 (- 63 o27)) true)))

;; "peekbit64'result'unused"
(define-fun peekbit64qtresultqtunused () Bool
  o29)

(declare-const flag1 Bool)

;; "flag'unused"
(define-fun flagqtunused1 () bool__ref
  (bool__refqtmk flag1))

;; "H"
(assert (= flag1 o29))

(declare-const o30 Int)

;; "Ensures"
(assert (= (to_rep addr__last) o30))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused14 () Int
  o30)

(declare-const o31 Int)

;; "Ensures"
(assert (= (to_rep addr__first) o31))

;; "to_rep'result'unused"
(define-fun to_repqtresultqtunused15 () Int
  o31)

;; "map__content'result'unused"
(define-fun map__contentqtresultqtunused6 () (Array Int unsigned_8)
  addr1)

;; "temp___373"
(define-fun temp___373 () us_t
  (of_array addr1 o31 o30))

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused6 () us_t
  temp___373)

;; "temp___374"
(define-fun temp___374 () (Array Int unsigned_8)
  addr1)

;; "to_array'result'unused"
(define-fun to_arrayqtresultqtunused () (Array Int unsigned_8)
  temp___374)

;; "o"
(define-fun o32 () Int
  o30)

;; "last'result'unused"
(define-fun lastqtresultqtunused () Int
  o32)

;; "o"
(define-fun o33 () Int
  o31)

;; "first'result'unused"
(define-fun firstqtresultqtunused () Int
  o33)

;; "of_array'result'unused"
(define-fun of_arrayqtresultqtunused7 () us_t
  (of_array temp___374 o33 o32))

;; "bool__content'result'unused"
(define-fun bool__contentqtresultqtunused3 () Bool
  flag1)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused5 () Int
  i1)

;; "o"
(define-fun o34 () Int
  (+ start i1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused2 () Int
  o34)

;; "Ensures"
(assert (in_range o34))

;; "range_check_'result'unused"
(define-fun range_check_qtresultqtunused5 () Int
  o34)

;; "o"
(define-fun o35 () integer
  addr__last)

;; "o"
(define-fun o36 () integer
  addr__first)

;; "param__addr'unused"
(define-fun param__addrqtunused () map__ref
  (map__refqtmk addr1))

(declare-const addr2 (Array Int unsigned_8))

;; "addr'unused"
(define-fun addrqtunused3 () map__ref
  (map__refqtmk addr2))

;; "H"
(assert
  (forall ((i2 Int))
    (=>
      (and (<= 0 i2) (<= i2 (- (* 8 (length (to_rep o36) (to_rep o35))) 1)))
      (=>
        (not (= i2 o34))
        (=
          (= (nth8_stream (of_array addr2 (to_rep o36) (to_rep o35)) i2) true)
          (= (nth8_stream (of_array addr1 (to_rep o36) (to_rep o35)) i2) true))))))

;; "H"
(assert
  (=
    (= (nth8_stream (of_array addr2 (to_rep o36) (to_rep o35)) o34) true)
    (= flag1 true)))

;; "H"
(assert
  (dynamic_invariant
    (of_array addr2 (to_rep o36) (to_rep o35))
    true
    true
    true
    true))

;; "H"
(assert true)

;; "H"
(assert true)

;; "Assert"
(assert
  (=
    (= (nth8_stream
         (let ((temp___378 (of_array
                             addr2
                             (to_rep addr__first)
                             (to_rep addr__last))))
           (of_array addr2 (to_rep addr__first) (to_rep addr__last)))
         (+ start i1)) true)
    (= (nth1 value (- (- len i1) 1)) true)))

;; "Assert"
(assert
  (forall ((k Int))
    (=>
      (and (<= start k) (<= k (- (+ start i1) 1)))
      (and
        (and
          (not (= k (+ start i1)))
          (and
            (<= 0 k)
            (<= k (- (* 8 (length (to_rep addr__first) (to_rep addr__last))) 1))))
        (=
          (= (nth8_stream
               (let ((temp___387 (of_array
                                   addr2
                                   (to_rep addr__first)
                                   (to_rep addr__last))))
                 (of_array addr2 (to_rep addr__first) (to_rep addr__last)))
               k) true)
          (= (nth1 value (- (- (+ start len) k) 1)) true))))))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused6 () Int
  i1)

;; "infix ='result'unused"
(define-fun infix_eqqtresultqtunused () Bool
  (ite (= i1 temp___371) true false))

;; "H"
(assert (not (= i1 temp___371)))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused7 () Int
  i1)

;; "o"
(define-fun o37 () Int
  (+ i1 1))

;; "infix +'result'unused"
(define-fun infix_plqtresultqtunused3 () Int
  o37)

(declare-const i2 Int)

;; "i'unused"
(define-fun iqtunused2 () int__ref
  (int__refqtmk i2))

;; "H"
(assert (= i2 o37))

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused8 () Int
  i2)

;; "o"
(define-fun o38 () Bool
  (ite (<= i2 len) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused4 () Bool
  o38)

;; "int__content'result'unused"
(define-fun int__contentqtresultqtunused9 () Int
  i2)

;; "o"
(define-fun o39 () Bool
  (ite (<= 0 i2) true false))

;; "infix <='result'unused"
(define-fun infix_lseqqtresultqtunused5 () Bool
  o39)

;; "andb'result'unused"
(define-fun andbqtresultqtunused2 () Bool
  (and o39 o38))

;; "LoopInvariant"
(assert (and (<= 0 i2) (<= i2 len)))

;; "LoopInvariant"
(assert
  (forall ((j Int))
    (=>
      (and (<= 0 j) (<= j (- start 1)))
      (=
        (= (nth8_stream (of_array addr o21 o20) j) true)
        (= (nth8_stream
             (let ((temp___422 (of_array
                                 addr2
                                 (to_rep addr__first)
                                 (to_rep addr__last))))
               (of_array addr2 (to_rep addr__first) (to_rep addr__last)))
             j) true)))))

(declare-const j Int)

;; "H"
(assert (<= start j))

;; "H"
(assert (<= j (- (+ start i2) 1)))

;; "H"
(assert
  (= (nth8_stream
       (let ((temp___411 (of_array
                           addr2
                           (to_rep addr__first)
                           (to_rep addr__last))))
         (of_array addr2 (to_rep addr__first) (to_rep addr__last)))
       j) true))

;; Goal "def'vc"
;; File "bitwalker.ads", line 87, characters 0-0
(assert
  (not (= (nth1 value (+ (- (- len j) 1) start)) true)))

(check-sat)