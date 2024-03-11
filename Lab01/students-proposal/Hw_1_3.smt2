; False stands for guilty
; True stands for Innocent
(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

;Initial statements

(assert (and (not B) C))
(assert (=> (not A) (not C)))
(assert (and C (or (not A) (not B) )))

(check-sat)
