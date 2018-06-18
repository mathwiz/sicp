(load "functions.lisp")

(defun larger-sq (x y z)
    (cond ((and 
            (<= x z) 
            (<= x y)) 
           (sum-squares (list y z)))
          ((and 
            (<= y z) 
            (<= y x)) 
           (sum-squares (list x z))) 
          ((and 
            (<= z x) 
            (<= z y)) 
           (sum-squares (list x y)))))


(= 25 (larger-sq 2 3 4))
(= 25 (larger-sq 2 4 3))
(= 25 (larger-sq 3 2 4))
(= 25 (larger-sq 3 4 2))
(= 25 (larger-sq 4 3 2))
(= 25 (larger-sq 4 2 3))
(= 41 (larger-sq 5 3 4))
(= 8 (larger-sq 2 2 2))

