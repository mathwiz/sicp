#lang racket
(require rackunit rackunit/gui)

(check-eq? 1.0 1 "fixnums not eq?")
(check-not-eq? 1.0 1 "fixnums are eq?")
(check-eqv? 1.0 1 "fixnums not eqv?")
(check-equal? 1.0 1 "fixnums not equal?")

(check-eq? 1.0 1.0 "fixnums not eq?")
(check-not-eq? 1.0 1.0 "fixnums are eq?")
(check-eqv? 1.0 1.0 "fixnums not eqv?")
(check-equal? 1.0 1.0 "fixnums not equal?")

(check-eq? 1 1 "integers not eq?")
(check-eqv? 1 1 "integers not eqv?")
(check-equal? 1 1 "integers not equal?")

(check-eq? (list 1) (list 1) "allocated data not eq?")

;; Gui window should be displayed
(test/gui
 (test-suite
  "all tests"
  (test-suite
   "math tests"
   (test-case "addition" (check-equal? (+ 1 1) 2))
   (test-case "subtraction" (check-equal? (- 0 0) 0))
   (test-case "multiplication" (check-equal? (* 2 2) 5)))
  (test-suite
   "string tests"
   (test-case "append" (check-equal? (string-append "a" "b") "ab"))
   (test-case "ref" (check-equal? (string-ref "abc" 1) #\b)))))

(read-line)
(write 'done)
