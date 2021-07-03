#lang racket

(provide search-for-primes)
(provide search-for-primes-fast)


;; Inefficient use of 2 multiplications rather than function to square
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (search-for-primes start end)
  (search-helper (if (odd? start) start (add1 start)) end))

(define (search-for-primes-fast start end)
  (search-helper-fast (if (odd? start) start (add1 start)) end))

(define (search-helper n end)
  (cond ((<= n end) (timed-prime-test n) (search-helper (+ n 2) end))
        (else (begin (newline) (writeln "finished")))))

(define (search-helper-fast n end)
  (cond ((<= n end) (timed-prime-test n) (search-helper (+ n 2) end))
        (else (begin (newline) (writeln "finished")))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (timed-prime-test-fast n)
  (newline)
  (display n)
  (start-prime-test-fast n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (report-nonprime)))

(define (start-prime-test-fast n start-time)
  (if (fast-prime? n 2)
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

(writeln (search-for-primes-fast 1000 1020))
(writeln (search-for-primes-fast 10000 10040))
(writeln (search-for-primes-fast 100000 100080))


