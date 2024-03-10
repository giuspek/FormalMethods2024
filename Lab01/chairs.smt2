(declare-const xA1 Bool)
(declare-const xA2 Bool)
(declare-const xA3 Bool)
(declare-const xB1 Bool)
(declare-const xB2 Bool)
(declare-const xB3 Bool)
(declare-const xC1 Bool)
(declare-const xC2 Bool)
(declare-const xC3 Bool)

; First constraint
(assert (not (and xA1 xC2)))
(assert (not (and xC1 xA2)))
(assert (not (and xA2 xC3)))
(assert (not (and xA3 xC2)))

; Second constraint
(assert (not xA1))

; Third constraint
(assert (not (and xB2 xC1)))
(assert (not (and xB3 xC2)))

; At least every person should sit somewhere
(assert (or xA1 xA2 xA3))
(assert (or xB1 xB2 xB3))
(assert (or xC1 xC2 xC3))

; At least every person should sit in at most one chair 
(assert (=> xA1 (and (not xA2) (not xA3))))
(assert (=> xA2 (and (not xA1) (not xA3))))
(assert (=> xA3 (and (not xA2) (not xA1))))

(assert (=> xB1 (and (not xB2) (not xB3))))
(assert (=> xB2 (and (not xB1) (not xB3))))
(assert (=> xB3 (and (not xB2) (not xB1))))

(assert (=> xC1 (and (not xC2) (not xC3))))
(assert (=> xC2 (and (not xC1) (not xC3))))
(assert (=> xC3 (and (not xC2) (not xC1))))

; At least one chair should be used
(assert (or xA1 xB1 xC1))
(assert (or xA2 xB2 xC2))
(assert (or xA3 xB3 xC3))

(check-sat)
(exit)
