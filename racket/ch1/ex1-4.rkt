(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(println (= (a-plus-abs-b 1 2) 3))
(println (= (a-plus-abs-b 1 -2) 3))
(println (= (a-plus-abs-b -1 2) 1))
(println (= (a-plus-abs-b -1 -2) 1))
(writeln 'done)
