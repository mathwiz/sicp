#lang racket

(provide smallest-divisor)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next n)
  (cond ((= n 2) 3)
        (else (+ n 2))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))


;; usage: racket filename.rkt
;;
(writeln (smallest-divisor 199))
(writeln (smallest-divisor 1999))
(writeln (smallest-divisor 19999))


