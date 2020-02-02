;; (load-file "filename.clj")

(defn halve [x] (/ x 2))

(defn mult-invariant [a b acc]
  (cond (= b 0)   acc
        (even? b) (recur (double a) (halve b) acc)
        :else     (recur a (dec b) (+ acc a))))

(defn times [a b]
  (mult-invariant a b 0))


(require
 'clojure.test)

(clojure.test/is (= (times 2 0) 0))
(clojure.test/is (= (times 2 1) 2))
(clojure.test/is (= (times 2 2) 4))
(clojure.test/is (= (times 2 5) 10))
(clojure.test/is (= (times 2 9) 18))
(clojure.test/is (= (times 3 4) 12))
(clojure.test/is (= (times 3 5) 15))

(println 'done)
