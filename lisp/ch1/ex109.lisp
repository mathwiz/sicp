(defun inc (x) (+ x 1))
(defun dec (x) (- x 1))

;; recursive
(defun +rec (a b)
  (if (= a 0)
      b
      (inc (+rec (dec a) b))))

;; iterative
(defun +it (a b)
  (if (= a 0)
      b
      (+it (dec a) (inc b))))
