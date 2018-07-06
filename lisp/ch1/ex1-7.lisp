(defn sqrt-iter (guess x) 
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(defn improve (guess x) 
  (average guess (/ x guess)))

(defn average (x y) 
  (/ (+ x y) 2))

(defn good-enough?  (guess x)
  (< (abs (- (square guess) x)) (/ guess 100000)))

(defn my-sqrt (x)
  (sqrt-iter 1.0 x))

(defn square (x)
  (* x x))

