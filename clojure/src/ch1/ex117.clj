;; (load-file "filename.clj")

(defn halve [x] (/ x 2))

(defn mult [a b]
  (cond (= b 0)   0
        (even? b) (double (mult a (halve b)))
        :else     (+ a (mult a (dec b)))))

(defn times [a b]
  (mult a b))


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
