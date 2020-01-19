(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; this will blow up
;;(test 0 (p))
