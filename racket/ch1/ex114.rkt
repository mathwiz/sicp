#lang racket

(define (biggest-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


(define (cc amount kinds-of-coins)
  (begin (write-node amount kinds-of-coins)
  (cond ((= amount 0) (begin (node-increment) 1))
        ((or (< amount 0) (= kinds-of-coins 0)) (begin (node-zero amount kinds-of-coins) 0))
        (else (+ (cc amount (sub1 kinds-of-coins))
                 (cc (- amount (biggest-denomination kinds-of-coins)) kinds-of-coins))))))


(define (write-node amount kinds-of-coins)
  (display "(cc ") (display amount) (display " ") (display kinds-of-coins) (display ") "))


(define (node-increment)
  (display "Incrementing count ") (newline))


(define (node-zero amount kinds-of-coins)
  (display "Zero terminal for amount: ") (display amount) (display " kinds of coins: ") (display kinds-of-coins) (newline))


(define (count-change amount)
  (cc amount 5))



;(write (count-change 11))
;; There are 4 ways to count 11 cents change
;; Tree
;;                                                       (cc 11 5)
;;                                                      /         \
;;                                                     /           \
;;                                                    /             (cc -39 5)
;;                                           (cc 11 4)               |
;;                                          /         \              0
;;                                         /           \
;;                                        /             (cc -14 4)
;;                               (cc 11 3)               |
;;                              /         \              0
;;                             /           \
;;                            /             (cc 1 3)_____________________________
;;                           /               |                                   \
;;                          /               (cc 1 2)_________________             (cc -9 3)
;;                         /                 |                       \             |
;;                        /                 (cc 1 1)____              (cc -4 2)    0
;;                       /                   |          \              |
;;                    (cc 11 2)             (cc 1 0)     (cc 0 1)      0
;;                   /         \             |            |
;;                  /           \______      0            1
;;                 /                   \
;;        (cc 11 1)                     (cc 6 2)_________
;;       /       |                       |               \
;;      /        |                       |                (cc 1 2)__________________
;;     /         |                       |                 |                        \
;;    /          |                       |                (cc 1 1)____              (cc -4 2)
;;   /           |                       |                 |          \              |
;;  |            |                       |                (cc 1 0)     (cc 0 1)      0
;;  |            |                       |                 |            |
;;  |            |                       |                 0            1
;; (cc 11 0)    (cc 10 1)               (cc 6 1)_____            
;;  |            /     |                 |           \
;;  0   (cc 10 0)     (cc 9 1)          (cc 6 0)      (cc 5 1)______
;;       |           /      |            |             |            \
;;       0    (cc 9 0)     (cc 8 1)      0            (cc 5 0)       (cc 4 1)______
;;             |           /     |                     |              |            \
;;             0    (cc 8 0)    (cc 7 1)               0             (cc 4 0)       (cc 3 1)_____
;;                   |         /      |                               |              |           \
;;                   0  (cc 7 0)     (cc 6 1)                         0             (cc 3 0)      (cc 2 1)_____
;;                       |           /     |                                          |             |          \
;;                       0    (cc 6 0)    (cc 5 1)                                    0            (cc 2 0)    (cc 1 1)____
;;                             |         /      |                                                   |           |          \
;;                             0   (cc 5 0)    (cc 4 1)                                             0          (cc 1 0)     (cc 0 1)
;;                                  |         /      |                                                          |            |
;;                                  0   (cc 4 0)    (cc 3 1)                                                    0            1
;;                                       |          /     |
;;                                       0   (cc 3 0)    (cc 2 1)
;;                                            |         /      |
;;                                            0  (cc 2 0)     (cc 1 1)
;;                                                |          /      |
;;                                                0    (cc 1 0)    (cc 0 1)
;;                                                      |           |
;;                                                      0           1










