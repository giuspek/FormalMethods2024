;Variables explaination:
;4 nodes {TopLeft,TopRight,BottomLeft,BottomRight} for abbreviation -> {TL,TR,BL,BR}
;3 colors {1,2,3}

(declare-const xTL1 Bool)
(declare-const xTL2 Bool)
(declare-const xTL3 Bool)
 
(declare-const xTR1 Bool)
(declare-const xTR2 Bool)
(declare-const xTR3 Bool)
 
(declare-const xBL1 Bool)
(declare-const xBL2 Bool)
(declare-const xBL3 Bool)
 
(declare-const xBR1 Bool)
(declare-const xBR2 Bool)
(declare-const xBR3 Bool)

(assert (=> xTL1 (and (not xTR1) (not xBR1) (not xBL1))))
(assert (=> xTR1 (and (not xTL1) (not xBR1))))
(assert (=> xBL1 (and (not xTL1) (not xBR1))))
(assert (=> xBR1 (and (not xTL1) (not xBL1) (not xTR1))))

(assert (=> xTL2 (and (not xTR2) (not xBR2) (not xBL2))))
(assert (=> xTR2 (and (not xTL2) (not xBR2))))
(assert (=> xBL2 (and (not xTL2) (not xBR2))))
(assert (=> xBR2 (and (not xTL2) (not xBL2) (not xTR2))))

(assert (=> xTL3 (and (not xTR3) (not xBR3) (not xBL3))))
(assert (=> xTR3 (and (not xTL3) (not xBR3))))
(assert (=> xBL3 (and (not xTL3) (not xBR3))))
(assert (=> xBR3 (and (not xTL3) (not xBL3) (not xTR3))))


; Implicit conditions
;Each node must have only one color

(assert (xor xTL1 xTL2 xTL3))
(assert (xor xTR1 xTR2 xTR3))
(assert (xor xBL1 xBL2 xBL3))
(assert (xor xBR1 xBR2 xBR3))

;Each nost must have a color

(assert (or xTL1 xTL2 xTL3))
(assert (or xBL1 xBL2 xBL3))
(assert (or xTR1 xTR2 xTR3))
(assert (or xBR1 xBR2 xBR3))

(check-sat)

(exit)