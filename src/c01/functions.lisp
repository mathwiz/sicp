(defun check-expect (sexp expected)
  (print 
   (let ((val (eval sexp))
         (pass (concatenate 'string "passed: " (write-to-string expected)))
         (fail (concatenate 'string "failed: " (write-to-string expected))))
     (cond ((stringp expected) (if (string= val expected) pass fail))
           (t (if (= val expected) pass fail))))))


(defun sum-squares (xs)
  (reduce (lambda (x y) (+ x (* y y))) xs :initial-value 0))
