;; run with racket -f ex1-1.rkt

(println 10)

(println (+ 5 3 4))

(println (- 9 1))

(println (/ 6 2))

(println (+ (* 2 4) (- 4 6)))

(define a 3)

(define b (+ a 1))

(println (+ a b (* a b)))

(println (= a b))

(println (if (and (> b a) (< b (* a b)))
     b
     a))

(println (cond ((= a 4) 6)
       ((= b 4) (+ 6 7 a))
       (else 25)))

(println (+ 2 (if (> b a) b a)))

(println (* (cond ((> a b) a)
          ((< a b) b)
          (else -1))
    (+ a 1)))
