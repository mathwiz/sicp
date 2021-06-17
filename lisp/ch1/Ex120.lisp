(defun verbose-gcd (a b)
  (cond ((= b 0) (progn
                   (format t "(verbose-gcd ~D ~D)~%" a b)
                   a))
        (t (progn
             (format t "(mod ~D ~D)~%" a b)
             (verbose-gcd b (mod a b))))))


;; Testing
(print (verbose-gcd 206 40))
