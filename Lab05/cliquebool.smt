(set-option :produce-models true)

(declare-const n1 Bool)
(declare-const n2 Bool)
(declare-const n3 Bool)
(declare-const n4 Bool)

(assert (or (not n2) (not n3)))

; If the assert-soft condition is false, then the cost function "penalty" increases by weight 1
; Penalty here stands for "size_clique, you can change name accordingly
(assert-soft (not n1) :weight 1 :id penalty)
(assert-soft (not n2) :weight 1 :id penalty)
(assert-soft (not n3) :weight 1 :id penalty)
(assert-soft (not n4) :weight 1 :id penalty)

(maximize penalty)
(check-sat)
(get-objectives)
(get-model)
(exit)