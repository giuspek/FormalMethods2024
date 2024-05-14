;the grid is 5x6 and hints are in cells: {12,13,14,21,31,41,44,45,52,62}
(set-option :produce-models true)

(define-const x12 Int 9)
(define-const x13 Int 34)
(define-const x14 Int 4)

(define-const x21 Int 9)
(define-const x31 Int 13)
(define-const x41 Int 13)

(define-const x44 Int 11)
(define-const x45 Int 3)

(define-const x52 Int 7)
(define-const x62 Int 19)


(declare-const x22 Int)
(declare-const x23 Int)
(declare-const x24 Int)

(declare-const x32 Int)
(declare-const x33 Int)
(declare-const x34 Int)

(declare-const x42 Int)
(declare-const x43 Int)

(declare-const x53 Int)
(declare-const x54 Int)
(declare-const x55 Int)

(declare-const x63 Int)
(declare-const x64 Int)
(declare-const x65 Int)

(assert (= (+ x22 x23 x24) x21))
(assert (distinct x22 x23 x24))
(assert (= (+ x22 x32 x42) x12))
(assert (distinct x22 x32 x42))

(assert (= x13 (+ x23 x33 x43 x53 x63)))
(assert (distinct x23 x33 x43 x53 x63))
(assert (= x14 (+ x24 x34)))
(assert (distinct x24 x34))

(assert (= x31 (+ x32 x33 x34)))
(assert (distinct x32 x33 x34))
(assert (= x41 (+ x42 x43)))
(assert (distinct x42 x43))

(assert (= x52 (+ x53 x54 x55)))
(assert (distinct x53 x54 x55))
(assert (= x62 (+ x63 x64 x65)))
(assert (distinct x63 x64 x65))


(assert (= x44 (+ x54 x64)))
(assert (distinct x54 x64))
(assert (= x45 (+ x55 x65)))
(assert (distinct x55 x65))

(assert (and (>= x22 1) (<= x22 9)))
(assert (and (>= x23 1) (<= x23 9)))
(assert (and (>= x24 1) (<= x24 9)))

(assert (and (>= x32 1) (<= x32 9)))
(assert (and (>= x33 1) (<= x33 9)))
(assert (and (>= x34 1) (<= x34 9)))

(assert (and (>= x43 1) (<= x43 9)))
(assert (and (>= x42 1) (<= x42 9)))

(assert (and (>= x53 1) (<= x53 9)))
(assert (and (>= x54 1) (<= x54 9)))
(assert (and (>= x55 1) (<= x55 9)))

(assert (and (>= x63 1) (<= x63 9)))
(assert (and (>= x64 1) (<= x64 9)))
(assert (and (>= x65 1) (<= x65 9)))

(check-sat)

(get-model)