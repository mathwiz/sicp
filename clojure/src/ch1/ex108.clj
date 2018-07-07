(defn square [x]
  (* x x))

(defn cube [x]
  (* x x x))

(defn improve [guess x]
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(defn good-enough? [guess x]
  (< (Math/abs (- (cube guess) x)) (/ guess 100000)))

(defn cbrt-iter [guess x]
  (if (good-enough? guess x) guess (cbrt-iter (improve guess x) x)))

(defn my-cbrt [x]
  (cbrt-iter 1.0 x))

(require
 'clojure.test)

(def delta 0.00001)
(clojure.test/is (< (Math/abs (- (my-cbrt 27) 3.0)) delta))
(clojure.test/is (< (Math/abs (- (my-cbrt 0.000027) 0.03)) delta))

