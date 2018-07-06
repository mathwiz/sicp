(defn square [x]
  (* x x))

(defn average [x y]
  (/ (+ x y) 2))

(defn improve [guess x]
  (average guess (/ x guess)))

(defn good-enough? [guess x]
  (< (Math/abs (- (square guess) x)) (/ guess 100000)))

(defn sqrt-iter [guess x]
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(defn my-sqrt [x]
  (sqrt-iter 1.0 x))

(require
 'clojure.test)

(def delta 0.00001)
(clojure.test/is (< (Math/abs (- (my-sqrt 2) (Math/sqrt 2))) delta))
(clojure.test/is (< (Math/abs (- (my-sqrt 0.2) (Math/sqrt 0.2))) delta))
(clojure.test/is (< (Math/abs (- (my-sqrt 0.00002) (Math/sqrt 0.00002))) delta))
