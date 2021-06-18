(defun search-for-primes (start end)
  (search-helper (if (odd? start) start (1+ start)) end))


(defun search-helper (n end)
  (if (<= n end)
      (progn (prime-test n)
             (search-helper (+ n 2) end))
      (progn (format t "finished~%")
             t)))


(defun prime-test (n)
  (if (prime? n)
      (format t "~S *** ~%" n)
      (format t "~S ~%" n)))


(defun prime? (n)
  (= n (smallest-divisor n)))


(defun odd? (n)
  (not (divides? 2 n)))


(defun smallest-divisor (n)
  (find-divisor n 2))


(defun find-divisor (n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (t (find-divisor n (1+ test-divisor)))))


(defun square (n)
  (* n n))


(defun divides? (a b)
  (= (mod b a) 0))


;; testing
(print (search-for-primes 1000 1020))
(print (search-for-primes 10000 10040))
(print (search-for-primes 100000 100080))

