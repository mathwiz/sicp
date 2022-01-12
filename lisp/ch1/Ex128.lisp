(defparameter *FAST-TIMES* 16)

(defun expmod (base exp m)
  (cond ((= exp 0) 1)
        ((not (odd? exp))
         (mod (square (expmod base (/ exp 2) m)) m))
        (t
         (mod (* base (expmod base (1- exp) m)) m))))


(defun miller-rabin-expmod (base exp m) 
  (labels ((non-trivial-square-root (x square)
             (if (and (= square 1)
                      (not (= x 1))
                      (not (= x (- m 1))))
                 0
                 square))
           (squaremod-with-check (x)
             (non-trivial-square-root x (mod (square x) m)))) 
    (cond ((= exp 0) 1) 
          ((not (odd? exp)) 
           (squaremod-with-check (miller-rabin-expmod base (/ exp 2) m)))
          (t (mod (* base (miller-rabin-expmod base (1- exp) m)) m)))))


(defun fermat-test (n)
  (labels ((try-it (a)
             (= (expmod a n n) a)))
    (try-it (1+ (random (1- n))))))


(defun miller-rabin-test (n)
  (labels ((try-it (a)
             (let ((result (miller-rabin-expmod a (1- n) n)))
               (= result 1))))
    (try-it (1+ (random (1- n))))))


(defun fast-prime? (n times)
  (cond ((= times 0) t)
        ((fermat-test n) (fast-prime? n (1- times)))
        (t nil)))


(defun fast-miller-rabin? (n times)
  (cond ((= times 0) t)
        ((miller-rabin-test n) (fast-miller-rabin? n (1- times)))
        (t nil)))


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
(defun print-val (v)
  (format t "~S " v))


(defun my-test (n)
  (print-val n)
  (print-val (prime? n))
  (print-val (fast-prime? n *FAST-TIMES*))
  (print-val (fast-miller-rabin? n *FAST-TIMES*))
  (format t "~%"))

;; Primes
(my-test 11)
(my-test 13)
(my-test 97)
(my-test 127)
;; Non-primes
(my-test 9)
(my-test 77)
(my-test 6603)
(my-test 16601)
;; Carmichael numbers 561, 1105, 1729, 2465, 2821, 6601
(my-test 561)
(my-test 1105)
(my-test 1729)
(my-test 2465)
(my-test 2821)
(my-test 6601)

(format t "done~%")
