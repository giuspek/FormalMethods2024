(set-option :produce-models true)
(set-option :opt.priority box)


(declare-const x Int)
(declare-const y Int)

(define-fun f ((x Int) (y Int)) Int (* x y y))

(assert (= 9 (+ x y)))
(assert (<= (f x y) 200))


(assert (>= x 0))
(assert (>= y 0))


; Add optimization objectives
(maximize (f x y))    


(check-sat)
(get-model)
(get-objectives)
