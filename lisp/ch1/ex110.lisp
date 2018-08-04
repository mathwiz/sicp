(defun A (x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (T (A (- x 1)
               (A x (- y 1))))))

(defun f (n) (A 0 n)) ;; 2n
(defun g (n) (A 1 n)) ;; 2^n
(defun h (n) (A 2 n)) ;; ???
(defun k (n) (* 5 n n))  ;; 5n^2
