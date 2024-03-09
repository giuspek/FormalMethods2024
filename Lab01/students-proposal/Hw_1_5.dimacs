(declare-const xTL1 Bool)
(declare-const xTL2 Bool)
;(declare-const xTL3 Bool)
 
(declare-const xTR1 Bool)
(declare-const xTR2 Bool)
;(declare-const xTR3 Bool)
 
(declare-const xBL1 Bool)
(declare-const xBL2 Bool)
;(declare-const xBL3 Bool)
 
(declare-const xBR1 Bool)
(declare-const xBR2 Bool)
;(declare-const xBR3 Bool)

(assert (=> xTL1 (and (not xTR1) (not xBR1) (not xBL1))))
(assert (=> xTR1 (and (not xTL1) (not xBR1))))
(assert (=> xBL1 (and (not xTL1) (not xBR1))))
(assert (=> xBR1 (and (not xTL1) (not xBL1) (not xTR1))))

(assert (=> xTL2 (and (not xTR2) (not xBR2) (not xBL2))))
(assert (=> xTR2 (and (not xTL2) (not xBR2))))
(assert (=> xBL2 (and (not xTL2) (not xBR2))))
(assert (=> xBR2 (and (not xTL2) (not xBL2) (not xTR2))))

; Implicit conditions
;Each node must have only one color
(assert (=> xTL1 (not xTL2)))
(assert (=> xTL2 (not xTL1)))

(assert (=> xBR2 (not xBR1)))
(assert (=> xBR1 (not xBR2)))

(assert (=> xBL1 (not xBL2)))
(assert (=> xBL2 (not xBL1)))

(assert (=> xTR1 (not xTR2)))
(assert (=> xTR2 (not xTR1)))

;Each nost must have a color

(assert (or xTL1 xTL2))
(assert (or xBL1 xBL2))
(assert (or xTR1 xTR2))
(assert (or xBR1 xBR2))

(check-sat)
(get-model)
(exit)