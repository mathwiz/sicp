#lang racket


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (iter x)
    (cond ((= 0 x) #f)
          ((try-it x) (iter (sub1 x)))
          (else x)))
  (iter (sub1 n)))

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
(define (my-test n)
  (writeln n)
  (writeln (prime? n))
  (writeln (fermat-test n))
  (writeln (miller-rabin-test n))
  (writeln 'done))

(my-test 10)
(my-test 11)
;; Carmichael numbers 561, 1105, 1729, 2465, 2821, 6601
(my-test 561)
(my-test 1105)
(my-test 1729)
(my-test 2465)
(my-test 2821)
(my-test 6601)
;; A non-prime
(my-test 6603)


