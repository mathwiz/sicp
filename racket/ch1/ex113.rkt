;; Produce the nth Fibonacci number
(define psi (/ (+ 1 (sqrt 5)) 2))
(define phi (/ (- 1 (sqrt 5)) 2))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (round (/ (- (expt psi n) (expt phi n)) (sqrt 5))))))


(println (= (fib 0) 0))
(println (= (fib 1) 1))
(println (= (fib 2) 1))
(println (= (fib 3) 2))
(println (= (fib 4) 3))
(println (= (fib 5) 5))
(println (= (fib 15 ) 610))
(write 'done)
