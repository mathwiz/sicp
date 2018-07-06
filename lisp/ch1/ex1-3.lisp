(load "../functions.lisp")

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


(check-expect '(larger-sq 2 3 4) 25)
(check-expect '(larger-sq 2 4 3) 25)
(check-expect '(larger-sq 3 2 4) 25)
(check-expect '(larger-sq 3 4 2) 25)
(check-expect '(larger-sq 4 3 2) 25)
(check-expect '(larger-sq 4 2 3) 25)
(check-expect '(larger-sq 5 3 4) 41)
(check-expect '(larger-sq 2 2 2) 8)

