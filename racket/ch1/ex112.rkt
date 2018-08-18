#lang racket

;; Produce the elements of pascal's triangle
(define (pascal r n)
  (cond ((= n 1) 1)
        ((= n r) 1)
        (else (+ (pascal (- r 1) (- n 1)) (pascal (- r 1) n)))))


(require rackunit)

(check-true (= (pascal 1 1) 1))
(check-true (= (pascal 2 1) 1))
(check-true (= (pascal 2 2) 1))
(check-true (= (pascal 3 1) 1))
(check-true (= (pascal 3 2) 2))
(check-true (= (pascal 3 3) 1))
(check-true (= (pascal 4 2) 3))
(check-true (= (pascal 4 3) 3))
(check-true (= (pascal 5 2) 4))
(check-true (= (pascal 5 3) 6))
(check-true (= (pascal 5 4) 4))
(write 'done)

