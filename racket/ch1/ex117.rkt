(define (mult a b)
  (mult-invariant a b 0))

(define (mult-invariant a b acc)
  (cond ((= b 0) acc)
        ((even? b) (mult-invariant (* a 2) (/ b 2) acc))
        (else (mult-invariant a (- b 1) (+ a acc)))))


(println (mult 2 3))
(println (mult 2 4))
(println (mult 2 9))
(println (mult 3 3))
(println (mult 3 4))

(println 'done)
