(load "functions.lisp")

(defun a-plus-abs-b (a b)
  (funcall (if (> b 0) #'+ #'-) a b))


(check-expect '(a-plus-abs-b 1 2) 3)
(check-expect '(a-plus-abs-b 1 -2) 3)
(check-expect '(a-plus-abs-b -1 2) 1)
(check-expect '(a-plus-abs-b -1 -2) 1)
