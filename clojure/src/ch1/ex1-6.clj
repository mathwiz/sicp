(defn square [x]
  (* x x))

(defn average [x y]
  (/ (+ x y) 2))

(defn improve [guess x]
  (average guess (/ x guess)))

(defn good-enough? [guess x]
  (< (Math/abs (- (square guess) x)) 0.001))

(defn sqrt-iter [guess x]
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(defn my-sqrt [x]
  (sqrt-iter 1.0 x))

(defn new-if [predicate then-clause else-clause]
  (cond predicate then-clause
        :else     else-clause))

(defn bad-sqrt-iter [guess x]
  (new-if (good-enough? guess x) guess (bad-sqrt-iter (improve guess x) x)))

;; this will not complete
(defn my-bad-sqrt [x]
  (bad-sqrt-iter 1.0 x))
