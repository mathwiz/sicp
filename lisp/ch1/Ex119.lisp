;; Load with (load "file")
;; or run > clisp file

(defun fib (n)
  (fib-iter 1 0 0 1 n))

(defun sq (n)
  (* n n))

(defun fib-iter (a b p q count)
  (cond ((= count 0) b)
        ((evenp count)
         (fib-iter a
                   b
                   (+ (sq p) (sq q))
                   (+ (sq q) (* 2 p q))
                   (/ count 2)))
        (t (fib-iter (+ (* b q) (* a q) (* a p))
                     (+ (* b p) (* a q))
                     p
                     q
                     (- count 1)))))


(print (= (fib 0) 0))
(print (= (fib 1) 1))
(print (= (fib 2) 1))
(print (= (fib 3) 2))
(print (= (fib 4) 3))
(print (= (fib 5) 5))
(print (= (fib 6) 8))
(print (= (fib 7) 13))
(print (= (fib 8) 21))
(print (= (fib 15) 610))
(print (fib 0))
(print (fib 1))
(print (fib 2))
(print (fib 3))
(print (fib 4))
(print (fib 5))
(print (fib 6))
(print (fib 7))
(print (fib 8))
(print (fib 9))


(print "done")
