;; (load-file "filename.clj")

(defn square [x] (* x x))


(defn expt-invariant [b p a]
        (cond (= p 0) a
              (even? p) (expt-invariant (square b) (/ p 2) a)
              :else (expt-invariant b (dec p) (* a b))))


(defn expt-inv [b p]
  (expt-invariant b p 1))


(require
 'clojure.test)

(clojure.test/is (= (expt-inv 2 0) 1))
(clojure.test/is (= (expt-inv 2 1) 2))
(clojure.test/is (= (expt-inv 2 2) 4))
(clojure.test/is (= (expt-inv 2 5) 32))
(clojure.test/is (= (expt-inv 2 9) 512))
(clojure.test/is (= (expt-inv 3 4) 81))
(clojure.test/is (= (expt-inv 3 5) 243))

(println 'done)
