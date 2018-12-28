;; Produce the nth Fibonacci number
(defvar psi (/ (+ 1 (sqrt 5)) 2))
(defvar phi (/ (- 1 (sqrt 5)) 2))

(defun fib (n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (t (round (/ (- (expt psi n) (expt phi n)) (sqrt 5))))))


(print (= (fib 0) 0))
(print (= (fib 1) 1))
(print (= (fib 2) 1))
(print (= (fib 3) 2))
(print (= (fib 4) 3))
(print (= (fib 5) 5))
(print (= (fib 15 ) 610))
(print 'done)
