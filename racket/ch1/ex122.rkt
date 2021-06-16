#lang racket

(provide search-for-primes)

(define (search-for-primes start end)
  (search-helper (if (odd? start) start (add1 start)) end))

(define (search-helper n end)
  (cond ((<= n end) (timed-prime-test n) (search-helper (+ n 2) end))
        (else (begin (newline) (writeln "finished")))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (report-nonprime)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (report-nonprime)
  (display ""))

(define (runtime)
  (current-inexact-milliseconds))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (add1 test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))


;; usage: racket filename.rkt
;;
(writeln (search-for-primes 1000 1020))
(writeln (search-for-primes 10000 10040))
(writeln (search-for-primes 100000 100080))



