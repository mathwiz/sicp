#lang racket

(provide carmichael-fail)


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

(define (carmichael-fail n)
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
(writeln 10)
(writeln (prime? 10))
(writeln (carmichael-fail 10))
(writeln 11)
(writeln (prime? 11))
(writeln (carmichael-fail 11))
(writeln 561)
(writeln (prime? 561))
(writeln (carmichael-fail 561))
;; more to try 1105, 1729, 2465, 2821, 6601
(writeln 1729)
(writeln (prime? 1729))
(writeln (carmichael-fail 1729))


