(define verbose-gcd 
  (lambda (a b)
    (cond ((= b 0) (begin
                     (printf "(verbose-gcd ~a ~a)~n" a b)
                     a))
          (else (begin
                  (printf "(remainder ~a ~a)~n" a b)
                  (verbose-gcd b (remainder a b)))))))


;; run this
;(verbose-gcd 206 40)

