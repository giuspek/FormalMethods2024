(set-option :produce-models true)

(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)
(declare-const x5 Int)
(declare-const x6 Int)
(declare-const x7 Int)
(declare-const x8 Int)

(assert (and (>= x1 0) (< x1 8)))
(assert (and (>= x2 0) (< x2 8)))
(assert (and (>= x3 0) (< x3 8)))
(assert (and (>= x4 0) (< x4 8)))
(assert (and (>= x5 0) (< x5 8)))
(assert (and (>= x6 0) (< x6 8)))
(assert (and (>= x7 0) (< x7 8)))
(assert (and (>= x8 0) (< x8 8)))


(assert (not(or (= x1 x2) (= x1 x3))))
(assert (not(or (= x2 x1) (= x2 x3) (= x2 x4))))
(assert (not(or (= x3 x2) (= x3 x1) (= x3 x4) (= x3 x5) (= x3 x6) (= x3 x8))))
(assert (not(or (= x4 x2) (= x4 x5) (= x4 x3))))
(assert (not(or (= x5 x3) (= x5 x4) (= x5 x6) (= x5 x7))))
(assert (not(or (= x6 x3) (= x6 x5) (= x6 x7) (= x6 x8))))
(assert (not(or (= x7 x6) (= x7 x8) (= x7 x5))))
(assert (not(or (= x8 x3) (= x8 x6) (= x8 x7))))

(define-const c1 Int (ite (
    or 
    (= x1 1)
    (= x2 1)
    (= x3 1)
    (= x4 1)
    (= x5 1)
    (= x6 1)
    (= x7 1)
    (= x8 1)
) 1 0))

(define-const c0 Int (ite (
    or 
    (= x1 0)
    (= x2 0)
    (= x3 0)
    (= x4 0)
    (= x5 0)
    (= x6 0)
    (= x7 0)
    (= x8 0)
) 1 0))
(define-const c2 Int (ite (
    or 
    (= x1 2)
    (= x2 2)
    (= x3 2)
    (= x4 2)
    (= x5 2)
    (= x6 2)
    (= x7 2)
    (= x8 2)
) 1 0))
(define-const c3 Int (ite (
    or 
    (= x1 3)
    (= x2 3)
    (= x3 3)
    (= x4 3)
    (= x5 3)
    (= x6 3)
    (= x7 3)
    (= x8 3)
) 1 0))
(define-const c4 Int (ite (
    or 
    (= x1 4)
    (= x2 4)
    (= x3 4)
    (= x4 4)
    (= x5 4)
    (= x6 4)
    (= x7 4)
    (= x8 4)
) 1 0))
(define-const c5 Int (ite (
    or 
    (= x1 5)
    (= x2 5)
    (= x3 5)
    (= x4 5)
    (= x5 5)
    (= x6 5)
    (= x7 5)
    (= x8 5)
) 1 0))
(define-const c6 Int (ite (
    or 
    (= x1 6)
    (= x2 6)
    (= x3 6)
    (= x4 6)
    (= x5 6)
    (= x6 6)
    (= x7 6)
    (= x8 6)
) 1 0))
(define-const c7 Int (ite (
    or 
    (= x1 7)
    (= x2 7)
    (= x3 7)
    (= x4 7)
    (= x5 7)
    (= x6 7)
    (= x7 7)
    (= x8 7)
) 1 0))

(minimize (+ c1 c2 c3 c4 c5 c6 c7 x8))


(check-sat)
(get-objectives)
(get-model)