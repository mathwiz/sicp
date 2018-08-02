#lang racket

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

;; recursive
(define (+rec a b)
  (if (= a 0)
      b
      (inc (+rec (dec a) b))))

;; iterative
(define (+it a b)
  (if (= a 0)
      b
      (+it (dec a) (inc b))))
