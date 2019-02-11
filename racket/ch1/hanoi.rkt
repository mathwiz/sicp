#lang racket

(define (print-move from to)
  (newline)
  (display "move top disk from ") (display from)
  (display " to ") (display to))


(define (move-tower size from to extra)
  (cond ((= size 0) true)
        (else (move-tower (sub1 size) from extra to)
              (print-move from to)
              (move-tower (sub1 size) extra to from))))


(move-tower 3 'left 'right 'center)