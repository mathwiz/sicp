;; (load-file "filename.clj")

(defn gcd [a b]
  (cond (= b 0) (do
                  (println "returning" a)
                  a)
        :else (do
                (println "remainder" a b)
                (gcd b (rem a b)))))


(require
 'clojure.test)

(clojure.test/is (= (gcd 206 40) 2))
(clojure.test/is (= (gcd 24 12) 12))
(clojure.test/is (= (gcd 60 45) 15))

(println "done")