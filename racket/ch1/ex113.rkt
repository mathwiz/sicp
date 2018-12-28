#lang racket

;; Produce the nth Fibonacci number
(define psi (/ (+ 1 (sqrt 5)) 2))
(define phi (/ (- 1 (sqrt 5)) 2))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (round (/ (- (expt psi n) (expt phi n)) (sqrt 5))))))


(require rackunit)

(check-true (= (fib 0) 0))
(check-true (= (fib 1) 1))
(check-true (= (fib 2) 1))
(check-true (= (fib 3) 2))
(check-true (= (fib 4) 3))
(check-true (= (fib 5) 5))
(check-true (= (fib 15 ) 610))
(write 'done)
