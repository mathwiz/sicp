;; (load-file "filename.clj")

(defn cube [x] (* x x x))

(defn p [x]
  (- (* 3 x) (* 4 (cube x))))

(defn sine [angle]
  (if (not (> (Math/abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))


(require
 'clojure.test)

(clojure.test/is (< (Math/abs (- (sine 10) (Math/sin 10))) 0.01))

(println 'done)
