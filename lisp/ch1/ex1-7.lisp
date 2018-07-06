#lang racket
(require rackunit)

; load with (require "ex1-7.rkt")
(provide my-sqrt)

(define (sqrt-iter guess x) 
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(define (improve guess x) 
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (good-enough?  guess x)
  (< (abs (- (square guess) x)) (/ guess 100000)))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))


(define delta 0.00001)
(define small (expt 2 -10))
(check-= (my-sqrt 2) (sqrt 2)  delta)
(check-= (my-sqrt .2) (sqrt .2) delta)
(check-= (my-sqrt small) (sqrt small) delta)
(write "done")
