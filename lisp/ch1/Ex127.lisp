(defparameter *FAST-TIMES* 16)

(defun expmod (base exp m)
  (cond ((= exp 0) 1)
        ((not (odd? exp)) 
         (mod (square (expmod base (/ exp 2) m)) m))
        (t
         (mod (* base (expmod base (1- exp) m)) m))))


(defun fermat-test (n)
  (labels ((try-it (a)
             (= (expmod a n n) a)))
    (try-it (1+ (random (1- n))))))


(defun carmichael-num (n)
  (labels ((try-it (a)
             (= (expmod a n n) a))
           (iter (x)
             (cond ((= 0 x) t)
                   ((try-it x) (iter (1- x)))
                   (t nil))))
    (and (not (prime? n)) (iter (1- n)))))


(defun fast-prime? (n times)
  (cond ((= times 0) t)
        ((fermat-test n) (fast-prime? n (1- times)))
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
  (format t "~S ~%" v))

(defun carmichael-test (n)
  (print-val n)
  (print-val (prime? n))
  (print-val (carmichael-num n)))

(carmichael-test 10)
(carmichael-test 11)
(carmichael-test 561)
;; more to try 1105, 1729, 2465, 2821, 6601
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)
;; non carmichael
(carmichael-test 6603)
