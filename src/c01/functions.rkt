#lang racket

(provide sum-squares)

(define (squares xs)
  (map (lambda (x) (* x x)) xs))


(define (sum-squares xs)
  (foldl + 0 (squares xs)))
