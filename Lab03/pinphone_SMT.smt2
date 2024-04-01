(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)

(assert (>= A 1))
(assert (>= B 1))
(assert (>= C 1))
(assert (>= D 1))

(assert (<= A 4))
(assert (<= B 4))
(assert (<= C 4))
(assert (<= D 4))

(assert (distinct A B C D))

(assert (=> (= A 1) (not (= D 2))))
(assert (=> (= B 1) (not (= C 2))))
(assert (=> (= C 1) (not (= B 2))))
(assert (=> (= D 1) (not (= A 2))))

(assert (=> (= A 2) (not (= D 3))))
(assert (=> (= B 2) (not (= C 3))))
(assert (=> (= C 2) (not (= B 3))))
(assert (=> (= D 2) (not (= A 3))))

(assert (=> (= A 3) (not (= D 4))))
(assert (=> (= B 3) (not (= C 4))))
(assert (=> (= C 3) (not (= B 4))))
(assert (=> (= D 3) (not (= A 4))))

(check-allsat ( 
	A B C D
))

(exit)
