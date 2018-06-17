(load-file "functions.clj")

(defn larger-sq [x y z]
  (int
    (cond (= (min x y z) x) (sum-squares [y z])
          (= (min x y z) y) (sum-squares [x z])
          :else             (sum-squares [x y]))))


(require
  'clojure.test)

(clojure.test/is (= (sum-squares nil) 0.0))
(clojure.test/is (= (sum-squares [1]) 1.0))
(clojure.test/is (= (sum-squares [1 2]) 5.0))
(clojure.test/is (= (sum-squares [1 2 3]) 14.0))
(clojure.test/is (= (sum-squares [1 2 3 4]) 30.0))
(clojure.test/is (= (larger-sq 1 2 3) 13))
(clojure.test/is (= (larger-sq 4 2 3) 25))
(clojure.test/is (= (larger-sq 4 5 3) 41))
(clojure.test/is (= (larger-sq 2 1 4) 20))

