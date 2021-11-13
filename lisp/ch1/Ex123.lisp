(defun smallest-divisor (n)
  (find-divisor n 2))

(defun find-divisor (n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (t (find-divisor n (next test-divisor)))))

(defun square (n)
  (* n n))

(defun divides? (a b)
  (= (mod b a) 0))

(defun next (n)
  (cond ((= n 2) 3)
        (t (+ n 2))))


;; testing
(print (smallest-divisor 199))
(print (smallest-divisor 1999))
(print (smallest-divisor 19999))

