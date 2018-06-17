(defn sum-sq [x y] (+ (* x x) (* y y)))

(defn larger-sq [x y z]
  (cond (= (min x y z) x) (sum-sq y z)
        (= (min x y z) y) (sum-sq x z)
        :else (sum-sq x y)))


(require 'clojure.test)
(clojure.test/is (= (larger-sq 1 2 3) 13))
(clojure.test/is (= (larger-sq 4 2 3) 25))
(clojure.test/is (= (larger-sq 4 5 3) 41))
(clojure.test/is (= (larger-sq 2 1 4) 20))

