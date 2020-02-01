(defun mult (a b)
  (cond ((= b 0) 0)
        ((evenp b) (double (mult a (halve b))))
        (t (+ a (mult a (1- b))))))

(defun double (x) (* x 2))
(defun halve (x) (/ x 2))

(print (mult 2 3))
(print (mult 2 4))
(print (mult 2 9))
(print (mult 3 3))
(print (mult 3 4))

(print 'done)

