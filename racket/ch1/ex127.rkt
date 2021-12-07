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

(define (carmichael-num n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (iter x)
    (cond ((= 0 x) #t)
          ((try-it x) (iter (sub1 x)))
          (else #f)))
  (and (not (prime? n)) (iter (sub1 n))))

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
(define (carmichael-test n)
  (writeln n)
  (writeln (prime? n))
  (writeln (carmichael-num n)))

(carmichael-test 10)
(carmichael-test 11)
(carmichael-test 561)
;; more to try 1105, 1729, 2465, 2821, 6601
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)
;; non carmichael
(carmichael-test 6603)


