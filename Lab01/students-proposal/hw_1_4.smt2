(declare-const x11 Bool)
(declare-const x12 Bool)
(declare-const x13 Bool)

(declare-const x21 Bool)
(declare-const x22 Bool)
(declare-const x23 Bool)

(declare-const x31 Bool)
(declare-const x32 Bool)
(declare-const x33 Bool)

(declare-const x41 Bool)
(declare-const x42 Bool)
(declare-const x43 Bool)


; Explicti rules
;Even
(assert (or x23 x43))

;Same digits must not be adjacent

(assert (=> x11 (not x12)))
(assert (=> x12 (or (not x11) (not x13))))
(assert (=> x13 (not x12)))


(assert (=> x21 (not x22)))
(assert (=> x22 (or (not x21) (not x23))))
(assert (=> x23 (not x22)))

(assert (=> x31 (not x32)))
(assert (=> x32 (or (not x31) (not x33))))
(assert (=> x33 (not x32)))

(assert (=> x41 (not x42)))
(assert (=> x42 (or (not x41) (not x43))))
(assert (=> x43 (not x42)))

;Implicit conditions 
; At least 1 cell must be selected

(assert (or x11 x21 x31 x41))
(assert (or x12 x22 x32 x42))
(assert (or x13 x23 x33 x43))

;check if it is unique

(assert (not x23))

(check-sat)
(get-model)
(exit)
