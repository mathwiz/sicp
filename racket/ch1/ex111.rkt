(define (f_rec n)
  (cond ((< n 3) n)
        (else (+ (f_rec (- n 1)) (* 2 (f_rec (- n 2))) (* 3 (f_rec (- n 3)))))))

(define (f_single a b c)
  (+ a (* 2 b) (* 3 c)))

(define (f_it_helper a b c n)
  (cond ((= n 3) (f_single a b c))
        (else (f_it_helper (f_single a b c) a b (- n 1)))))

(define (f_it n)
  (cond ((< n 3) n)
        (else (f_it_helper 2 1 0 n))))


(println (= (f_rec 0) 0))
(println (= (f_rec 1) 1))
(println (= (f_rec 2) 2))
(println (= (f_rec 3) 4))
(println (= (f_rec 4) 11))
(println (= (f_rec 4) (f_it 4)))
(println (= (f_rec 5) (f_it 5)))
(println (= (f_rec 8) (f_it 8)))
(println (= (f_rec 16) (f_it 16)))
(write 'done)
