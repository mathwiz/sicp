;; run with racket -f ex1-3.rkt


(define (squares xs)
  (cond ((null? xs) xs)
        (else 
         (let ((hd (first xs)))
           (cons (* hd hd) (squares (rest xs)))))))

(define (sum-squares xs)
  (letrec ((sqs (squares xs))
           (recur (lambda (ss acc)
                    (cond ((null? ss) acc)
                          (else (recur (rest ss) (+ (first ss) acc)))))))
    (recur sqs 0)))

(define (larger-sq x y z)
  (cond ((and 
          (<= x z) 
          (<= x y)) 
         (sum-squares (list y z)))
        ((and 
          (<= y z) 
          (<= y x)) 
         (sum-squares (list x z))) 
        ((and 
          (<= z x) 
          (<= z y)) 
         (sum-squares (list x y)))))


(println (= (larger-sq 2 3 4) 25))
(println (= (larger-sq 2 4 3) 25))
(println (= (larger-sq 3 2 4) 25))
(println (= (larger-sq 3 4 2) 25))
(println (= (larger-sq 4 3 2) 25))
(println (= (larger-sq 4 2 3) 25))
(println (= (larger-sq 5 3 4) 41))
(println (= (larger-sq 2 2 2) 8))
(writeln 'done)
