#lang racket
(require rackunit)

(provide my-sqrt my-bad-sqrt)

(define (sqrt-iter guess x) 
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(define (improve guess x) 
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (good-enough?  guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (bad-sqrt-iter guess x)
  (new-if (good-enough? guess x) guess (bad-sqrt-iter (improve guess x) x)))

;; this will not complete
(define (my-bad-sqrt x)
  (bad-sqrt-iter 1.0 x))


(define delta 0.00001)
(check-= (my-sqrt 2) 1.4142135623730951  delta)
(write "done")
