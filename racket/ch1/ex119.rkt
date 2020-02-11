(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a b (+ (* p p) (* q q)) (+ (* q q) (* p q 2)) (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- count 1)))))


(println (= (fib 0) 0))
(println (= (fib 1) 1))
(println (= (fib 2) 1))
(println (= (fib 3) 2))
(println (= (fib 4) 3))
(println (= (fib 5) 5))
(println (= (fib 6) 8))
(println (= (fib 15) 610))

(println 'done)
