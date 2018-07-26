#lang racket
(require rackunit)

; load with (require "ex108.rkt")
(provide my-cbrt)

(define (cbrt-iter guess x) 
  (if (good-enough? guess x) guess (cbrt-iter (improve guess x) x)))

(define (improve guess x) 
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough?  guess x)
  (< (abs (- (cube guess) x)) (/ guess 100000)))

(define (my-cbrt x)
  (cbrt-iter 1.0 x))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))


;; Run from shell$ racket ex108.rkt
(define delta 0.0001)
(check-= (cube (my-cbrt 27)) 27 delta)
(check-= (cube (my-cbrt 0.000027)) 0.000027 delta)
(check-= (cube (my-cbrt 2)) 2 delta)
;; Failing test: (check-= (my-cbrt 3) 1.44 delta)
(write "done")
