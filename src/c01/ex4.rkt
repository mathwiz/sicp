#lang racket
(require rackunit)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(check-eq? (a-plus-abs-b 1 2) 3)
(check-eq? (a-plus-abs-b 1 -2) 3)
(check-eq? (a-plus-abs-b -1 2) 1)
(check-eq? (a-plus-abs-b -1 -2) 1)
(write 'done)