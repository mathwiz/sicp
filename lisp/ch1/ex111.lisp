;; Load with (load "ex111.lisp")
;; or run > clisp ex111.lisp

(defun f_rec (n)
  (cond ((< n 3) n)
        (t (+ (f_rec (- n 1)) (* 2 (f_rec (- n 2))) (* 3 (f_rec (- n 3)))))))

(defun f_single (a b c)
  (+ a (* 2 b) (* 3 c)))

(defun f_it_helper (a b c n)
  (cond ((= n 3) (f_single a b c))
        (t (f_it_helper (f_single a b c) a b (- n 1)))))

(defun f_it (n)
  (cond ((< n 3) n)
        (t (f_it_helper 2 1 0 n))))


(print (= (f_rec 0) 0))
(print (= (f_rec 1) 1))
(print (= (f_rec 2) 2))
(print (= (f_rec 3) 4))
(print (= (f_rec 4) 11))
(print (= (f_rec 4) (f_it 4)))
(print (= (f_rec 5) (f_it 5)))
(print (= (f_rec 8) (f_it 8)))
(print (= (f_rec 16) (f_it 16)))
(print "done")
