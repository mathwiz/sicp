#lang racket


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-expmod base exp m)
  (define (non-trivial-square-root x square)
       (if (and (= square 1) 
                (not (= x 1)) 
                (not (= x (- m 1)))) 
           0 
           square))
  (define (squaremod-with-check x)
    (non-trivial-square-root x (remainder (square x) m)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (squaremod-with-check (miller-rabin-expmod base (/ exp 2) m)))
        (else
         (remainder (* base (miller-rabin-expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (miller-rabin-test n)
  (define (try-it a)
    (let ((result (miller-rabin-expmod a (sub1 n) n)))
      (= result 1)))
      (try-it (+ 1 (random (- n 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fast-miller-rabin? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-miller-rabin? n (- times 1)))
        (else false)))

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
  (writeln (fast-prime? n 100))
  (writeln (fast-miller-rabin? n 100))
  (writeln 'done))

;; Primes
(my-test 11)
(my-test 13)
(my-test 97)
(my-test 127)
;; Non-primes
(my-test 9)
(my-test 77)
(my-test 6603)
(my-test 16601)
;; Carmichael numbers 561, 1105, 1729, 2465, 2821, 6601
(my-test 561)
(my-test 1105)
(my-test 1729)
(my-test 2465)
(my-test 2821)
(my-test 6601)


