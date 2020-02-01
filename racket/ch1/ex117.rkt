(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mult a (halve b))))
        (else (+ a (mult a (sub1 b))))))

(define (double x) (+ x x))
(define (halve x) (/ x 2))


(println (mult 2 3))
(println (mult 2 4))
(println (mult 2 9))
(println (mult 3 3))
(println (mult 3 4))

(println 'done)
