;; Produce the elements of pascal's triangle
(define (pascal r n)
  (cond ((= n 1) 1)
        ((= n r) 1)
        (else (+ (pascal (- r 1) (- n 1)) (pascal (- r 1) n)))))


(println (= (pascal 1 1) 1))
(println (= (pascal 2 1) 1))
(println (= (pascal 2 2) 1))
(println (= (pascal 3 1) 1))
(println (= (pascal 3 2) 2))
(println (= (pascal 3 3) 1))
(println (= (pascal 4 2) 3))
(println (= (pascal 4 3) 3))
(println (= (pascal 5 2) 4))
(println (= (pascal 5 3) 6))
(println (= (pascal 5 4) 4))
(write 'done)

