;; (load-file "filename.clj")

(defn square [x] (* x x))


(defn expt-invariant [b p a]
  (cond (= p 0)   a
        (even? p) (expt-invariant (square b) (/ p 2) a)
        :else     (expt-invariant b (dec p) (* a b))))

(defn expt [b p]
  (expt-invariant b p 1))

(defn times [a b]
  (cond (= b 0) 0
        :else   (+ a (times a (dec b)))))


(require
 'clojure.test)

(clojure.test/is (= (expt 2 0) 1))
(clojure.test/is (= (expt 2 1) 2))
(clojure.test/is (= (expt 2 2) 4))
(clojure.test/is (= (expt 2 5) 32))
(clojure.test/is (= (expt 2 9) 512))
(clojure.test/is (= (expt 3 4) 81))
(clojure.test/is (= (expt 3 5) 243))

(clojure.test/is (= (times 2 0) 0))
(clojure.test/is (= (times 2 1) 2))
(clojure.test/is (= (times 2 2) 4))
(clojure.test/is (= (times 2 5) 10))
(clojure.test/is (= (times 2 9) 18))
(clojure.test/is (= (times 3 4) 12))
(clojure.test/is (= (times 3 5) 15))

(println 'done)
