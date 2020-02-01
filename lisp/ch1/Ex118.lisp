(defun mult (a b)
  (mult-invariant a b 0))


(defun even? (n)
  (= (mod n 2) 0))


(defun mult-invariant (b n a)
  (cond ((= n 0) a)
        ((even? n) (mult-invariant (* b 2) (/ n 2) a))
        (t (mult-invariant b (- n 1) (+ a b)))))


(print (mult 2 3))
(print (mult 2 4))
(print (mult 2 9))
(print (mult 3 3))
(print (mult 3 4))

(print 'done)

