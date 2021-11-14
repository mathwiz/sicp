(defparameter *FAST-TIMES* 2)


(defun fast-expt (b n)
  (cond ((= n 0) 1)
        ((not (odd? n)) (square (fast-expt b (/ n 2))))
        (t (* b (fast-expt b (1- n))))))


;It's slow
(defun expmod (base exp m)
  (mod (fast-expt base exp) m))


(defun fermat-test (n)
  (labels ((try-it (a)
             (= (expmod a n n) a)))
    (try-it (1+ (random (1- n))))))


(defun fast-prime? (n times)
  (cond ((= times 0) t)
        ((fermat-test n) (fast-prime? n (1- times)))
        (t nil)))


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
  (fast-prime? n *FAST-TIMES*))


(defun odd? (n)
  (not (divides? 2 n)))


(defun square (n)
  (* n n))


(defun divides? (a b)
  (= (mod b a) 0))


;; testing
(print (search-for-primes 1000 1020))
(print (search-for-primes 10000 10040))
(print (search-for-primes 100000 100080))

