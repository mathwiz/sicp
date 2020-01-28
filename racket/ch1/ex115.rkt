;;; Model sine function via:
;;; sin(x) approx= x if x is small, and the identity
;;; sin(x) = 3sin(x/3) - 4(sin(x/3))^3

(define (cube x) (* x x x))

(define (p x)
  (begin
    (trace x)
    (- (* 3 x) (* 4 (cube x)))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(define (trace arg)
  (display "got here with arg ") (display arg) (newline))

;;; a) How many times is p applied when (sine 12.15) is evaluated? 5
;;; b) What is the order of growth in space and number of steps (as a function of a) when (sine a) is evaluated? O(log a)

(println "Testing sine")
(println (sine 0))
(println (sine pi))
(println (sine (/ pi 2)))
(println (sine (/ pi 4)))
(writeln 'done)
