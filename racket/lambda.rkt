#lang racket
;;lambda calculus
(define T (lambda (x) (lambda (y) x)))
(define F (lambda (x) (lambda (y) y)))
