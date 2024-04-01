(set-option :produce-models true)

; number n = x_1 x_2 x_3 x_4 x_5
(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)
(declare-const x5 Int)
(define-const n Int (+ (* 10000 x1) (* 1000 x2) (* 100 x3) (* 10 x4) x5))
; Boolean variable to check each security constraint
(define-const c1 Bool (xor (= 0 (mod n 3)) (= 0 (mod n 5))))
(define-const c2 Bool (= 0 (mod (+ x1 x2 x3 x4 x5) 10)))
(define-const c3 Bool (and (= x1 x5) (= x2 x4)))
(define-const c4 Bool (and (<= x1 x2) (<= x2 x3) (<= x3 x4) (<= x4 x5)))
(define-const security Int (- 4 (+ (ite c1 1 0) (ite c2 1 0) (ite c3 1 0) (ite c4 1 0))))

(assert (and (>= x1 1) (<= x1 9)))
(assert (and (>= x2 0) (<= x2 9)))
(assert (and (>= x3 0) (<= x3 9)))
(assert (and (>= x4 0) (<= x4 9)))
(assert (and (>= x5 0) (<= x5 9)))

(assert (and (>= security 0) (<= security 4)))

(assert (= security 2))

(check-sat)
(get-model)
(exit)


