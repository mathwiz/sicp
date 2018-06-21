#lang racket/load
(require rackunit)
(require "functions.rkt")

(define (larger-sq x y z)
  (cond ((and 
          (<= x z) 
          (<= x y)) 
         (sum-squares (list y z)))
        ((and 
          (<= y z) 
          (<= y x)) 
         (sum-squares (list x z))) 
        ((and 
          (<= z x) 
          (<= z y)) 
         (sum-squares (list x y)))))


(check-eq? (larger-sq 2 3 4) 25)
(check-eq? (larger-sq 2 4 3) 25)
(check-eq? (larger-sq 3 2 4) 25)
(check-eq? (larger-sq 3 4 2) 25)
(check-eq? (larger-sq 4 3 2) 25)
(check-eq? (larger-sq 4 2 3) 25)
(check-eq? (larger-sq 5 3 4) 41)
(check-eq? (larger-sq 2 2 2) 8)
(write 'done)