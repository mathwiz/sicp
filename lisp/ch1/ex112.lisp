;; Produce the elements of pascal's triangle
(defun pascal (r n)
  (cond ((= n 1) 1)
        ((= n r) 1)
        (t (+ (pascal (- r 1) (- n 1)) (pascal (- r 1) n)))))


(print (= (pascal 1 1) 1))
(print (= (pascal 2 1) 1))
(print (= (pascal 2 2) 1))
(print (= (pascal 3 1) 1))
(print (= (pascal 3 2) 2))
(print (= (pascal 3 3) 1))
(print (= (pascal 4 2) 3))
(print (= (pascal 4 3) 3))
(print (= (pascal 5 2) 4))
(print (= (pascal 5 3) 6))
(print (= (pascal 5 4) 4))
(print 'done)

