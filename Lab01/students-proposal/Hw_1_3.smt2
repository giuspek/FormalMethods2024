
(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

;Initial statements

(assert (and (not B) C))
(assert (=> (not A) (not C)))
(assert (and C (or 
    (or (not A) B)
    (or  A (not B))
    (or (not A) (not B)
))))


(check-sat)
