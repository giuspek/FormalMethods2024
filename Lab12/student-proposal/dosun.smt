(declare-const x11 Int)
(declare-const x21 Int)
(declare-const x31 Int)
(declare-const x41 Int)
(declare-const x51 Int)
(declare-const x12 Int)
(declare-const x22 Int)
(declare-const x32 Int)
(declare-const x42 Int)
(declare-const x52 Int)
(declare-const x13 Int)
(declare-const x23 Int)
(declare-const x33 Int)
(declare-const x43 Int)
(declare-const x53 Int)
(declare-const x14 Int)
(declare-const x24 Int)
(declare-const x34 Int)
(declare-const x44 Int)
(declare-const x54 Int)
(declare-const x15 Int)
(declare-const x25 Int)
(declare-const x35 Int)
(declare-const x45 Int)
(declare-const x55 Int)


(assert ( and (<= x11 4) (>= x11 1)))
(assert ( and (<= x21 4) (>= x21 1)))
(assert ( and (<= x31 4) (>= x31 1)))
(assert ( and (<= x41 4) (>= x41 1)))
(assert ( and (<= x51 4) (>= x51 1)))
(assert ( and (<= x12 4) (>= x12 1)))
(assert ( and (<= x22 4) (>= x22 1)))
(assert ( and (<= x22 4) (>= x22 1)))
(assert ( and (<= x32 4) (>= x32 1)))
(assert ( and (<= x32 4) (>= x32 1)))
(assert ( and (<= x42 4) (>= x42 1)))
(assert ( and (<= x42 4) (>= x42 1)))
(assert ( and (<= x52 4) (>= x52 1)))
(assert ( and (<= x13 4) (>= x13 1)))
(assert ( and (<= x13 4) (>= x13 1)))
(assert ( and (<= x23 4) (>= x23 1)))
(assert ( and (<= x23 4) (>= x23 1)))
(assert ( and (<= x33 4) (>= x33 1)))
(assert ( and (<= x33 4) (>= x33 1)))
(assert ( and (<= x43 4) (>= x43 1)))
(assert ( and (<= x43 4) (>= x43 1)))
(assert ( and (<= x53 4) (>= x53 1)))
(assert ( and (<= x14 4) (>= x14 1)))
(assert ( and (<= x14 4) (>= x14 1)))
(assert ( and (<= x24 4) (>= x24 1)))
(assert ( and (<= x24 4) (>= x24 1)))
(assert ( and (<= x34 4) (>= x34 1)))
(assert ( and (<= x34 4) (>= x34 1)))
(assert ( and (<= x44 4) (>= x44 1)))
(assert ( and (<= x44 4) (>= x44 1)))
(assert ( and (<= x54 4) (>= x54 1)))
(assert ( and (<= x15 4) (>= x15 1)))
(assert ( and (<= x15 4) (>= x15 1)))
(assert ( and (<= x25 4) (>= x25 1)))
(assert ( and (<= x25 4) (>= x25 1)))
(assert ( and (<= x35 4) (>= x35 1)))
(assert ( and (<= x35 4) (>= x35 1)))
(assert ( and (<= x45 4) (>= x45 1)))
(assert ( and (<= x45 4) (>= x45 1)))
(assert ( and (<= x55 4) (>= x55 1)))

(define-const black Int 4)
(define-const empty Int 1)
(define-const baloon Int 2)
(define-const iron Int 3)

(assert (= x12 black))
(assert (= x45 black))
(assert (= x43 black))

(assert ( not (= x11 black)))
(assert ( not (= x21 black)))
(assert ( not (= x31 black)))
(assert ( not (= x41 black)))
(assert ( not (= x51 black)))


(assert ( not (= x22 black)))
(assert ( not (= x22 black)))
(assert ( not (= x32 black)))
(assert ( not (= x32 black)))
(assert ( not (= x42 black)))
(assert ( not (= x42 black)))
(assert ( not (= x52 black)))
(assert ( not (= x13 black)))
(assert ( not (= x13 black)))
(assert ( not (= x23 black)))
(assert ( not (= x23 black)))
(assert ( not (= x33 black)))
(assert ( not (= x33 black)))

(assert ( not (= x53 black)))
(assert ( not (= x14 black)))
(assert ( not (= x14 black)))
(assert ( not (= x24 black)))
(assert ( not (= x24 black)))
(assert ( not (= x34 black)))
(assert ( not (= x34 black)))
(assert ( not (= x44 black)))
(assert ( not (= x44 black)))
(assert ( not (= x54 black)))
(assert ( not (= x15 black)))
(assert ( not (= x15 black)))
(assert ( not (= x25 black)))
(assert ( not (= x25 black)))
(assert ( not (= x35 black)))
(assert ( not (= x35 black)))

(assert ( not (= x55 black)))

-- exctly one baloon and iron
(assert (= 1
    (+
        (ite (= x11 baloon) 1 0)
        (ite (= x21 baloon) 1 0)
        (ite (= x31 baloon) 1 0)
        (ite (= x41 baloon) 1 0)
        (ite (= x51 baloon) 1 0)
        (ite (= x52 baloon) 1 0)
    )
))


(assert (= 1
    (+
        (ite (= x11 iron) 1 0)
        (ite (= x21 iron) 1 0)
        (ite (= x31 iron) 1 0)
        (ite (= x41 iron) 1 0)
        (ite (= x51 iron) 1 0)
        (ite (= x52 iron) 1 0)
    )
))

(assert (= 1
    (+
        (ite (= x22 baloon) 1 0)
        (ite (= x32 baloon) 1 0)
        (ite (= x42 baloon) 1 0)
    )
))

(assert (= 1
    (+
        (ite (= x22 iron) 1 0)
        (ite (= x32 iron) 1 0)
        (ite (= x42 iron) 1 0)
    )
))

(assert (= 1
    (+
        (ite (= x53 baloon) 1 0)
        (ite (= x54 baloon) 1 0)
        (ite (= x55 baloon) 1 0)
    )
))

(assert (= 1
    (+
        (ite (= x53 iron) 1 0)
        (ite (= x54 iron) 1 0)
        (ite (= x55 iron) 1 0)
    )
))
----

(assert (= 1
    (+
        (ite (= x13 baloon) 1 0)
        (ite (= x23 baloon) 1 0)
        (ite (= x33 baloon) 1 0)
    )
))

(assert (= 1
    (+
        (ite (= x13 iron) 1 0)
        (ite (= x23 iron) 1 0)
        (ite (= x33 iron) 1 0)
    )
))
----
(assert (= 1
    (+
        (ite (= x24 iron) 1 0)
        (ite (= x34 iron) 1 0)
        (ite (= x44 iron) 1 0)
    )
))
(assert (= 1
    (+
        (ite (= x24 baloon) 1 0)
        (ite (= x34 baloon) 1 0)
        (ite (= x44 baloon) 1 0)
    )
))

------


(assert (= 1
    (+
        (ite (= x14 baloon) 1 0)
        (ite (= x15 baloon) 1 0)
        (ite (= x25 baloon) 1 0)
        (ite (= x35 baloon) 1 0)
    )
))

(assert (= 1
    (+
        (ite (= x14 iron) 1 0)
        (ite (= x15 iron) 1 0)
        (ite (= x25 iron) 1 0)
        (ite (= x35 iron) 1 0)
    )
))

(assert (= x11 baloon))
(assert ( or
    (= x51 iron) (= x52 iron) ))

(assert (= x22 baloon))
(assert (= x42 iron))

(assert (= x33 iron))
(assert (= x13 baloon))

(assert (= x24 baloon))
(assert (= x44 iron))


(assert (= x35 iron))

(assert ( or
    (= x14 baloon) (= x15 baloon) ))

(assert (= (= x42 iron) (= x52 iron)))
(assert (= (= x44 iron) (= x54 iron)))
(assert (= (= x24 baloon) (= x14 baloon)))


; check if unique

(assert (not (and
  (= x11 2)
  (= x21 1)
  (= x31 1)
  (= x41 1)
  (= x51 1)
  (= x12 4)
  (= x22 2)
  (= x32 1)
  (= x42 3)
  (= x52 3)
  (= x13 2)
  (= x23 1)
  (= x33 3)
  (= x43 4)
  (= x53 2)
  (= x14 2)
  (= x24 2)
  (= x34 1)
  (= x44 3)
  (= x54 3)
  (= x15 1)
  (= x25 1)
  (= x35 3)
  (= x45 4)
  (= x55 1)

)))




(check-sat)
(get-model)
(exit)

