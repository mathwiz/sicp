#lang racket

(define (square x) (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (expt-inv b p)
  (expt-invariant b p 1))

(define (expt-invariant b p a)
  (cond ((= p 0) a)
        ((even? p) (expt-invariant (square b) (/ p 2) a))
        (else (expt-invariant b (sub1 p) (* a b)))))


(require rackunit)

(check-true (= (expt-inv 2 0) 1))
(check-true (= (expt-inv 2 1) 2))
(check-true (= (expt-inv 2 2) 4))
(check-true (= (expt-inv 2 5) 32))
(check-true (= (expt-inv 2 9) 512))
(check-true (= (expt-inv 3 4) 81))
(check-true (= (expt-inv 3 5) 243))
(write 'done)

