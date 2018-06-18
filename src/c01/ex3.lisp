(defun larger-sq (x y z) 
    (cond ((and 
            (<= x z) 
            (<= x y)) 
           (+ (* z z) 
              (* y y))) 
          ((and 
            (<= y z) 
            (<= y x)) 
           (+ (* x x) 
              (* z z))) 
          ((and 
            (<= z x) 
            (<= z y)) 
           (+ (* x x) 
              (* y y)))))

(= 25 (larger-sq 2 3 4))
(= 25 (larger-sq 2 4 3))
(= 25 (larger-sq 3 2 4))
(= 25 (larger-sq 3 4 2))
(= 25 (larger-sq 4 3 2))
(= 25 (larger-sq 4 2 3))
(= 41 (larger-sq 5 3 4))
(= 8 (larger-sq 2 2 2))

