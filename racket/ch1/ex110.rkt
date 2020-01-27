(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
               (A x (- y 1))))))


(define (f n) (A 0 n)) ;; 2n
(define (g n) (A 1 n)) ;; 2^n
(define (h n) (A 2 n)) ;; ???
(define (k n) (* 5 n n))  ;; 5n^2

(println "begin testing")

(println (= (A 0 0) 0))
(println (= (A 1 0) 0))
(println (= (A 0 1) 2))
(println (= (A 1 1) 2))
(println (= (A 0 2) 4))
(println (= (A 1 10) 1024))
(println (= (A 2 4) 65536))
(println (= (A 3 3) 65536))
(println (= (f 4) 8))
(println (= (f 78) 156))
(println (= (g 4) 16))
(println (= (h 4) 65536))

(writeln 'done)
