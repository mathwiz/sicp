;; hack to show the evaluations in this file as separate lines in console
(def p println)

(p 10)

(p (+ 5 3 4))

(p (- 9 1))

(p (/ 6 2))

(p (+ (* 2 4) 
      (- 4 6)))

(def a 3)

(def b (+ a 1))

(p (+ a b (* a b)))

(p (= a b))

(p 
 (if (and (> b a) 
          (< b (* a b))) 
   b
   a))

(p 
 (cond (= a 4) 
       6
       (= b 4) 
       (+ 6 7 a) 
       :else 25))

(p (+ 2 
      (if (> b a) 
        b
        a)))

(p
 (*
  (cond (> a b) 
        a
        (< a b)
        b 
        :else -1)
  (+ a 1)))
