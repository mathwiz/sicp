;; Produce the elements of pascal's triangle
(defn pascal [r n]
  (cond (= n 1)  1
        (= n r)  1
        :else    (+
                  (pascal (- r 1)
                          (- n 1))
                  (pascal (- r 1) n))))


(defn p-alt [r n]
  (if (or (= n 1)
          (= n r))
    1
    (+
     (pascal (- r 1)
             (- n 1))
     (pascal (- r 1) n))))


(require
 'clojure.test)

(clojure.test/is (= (pascal 1 1) 1))
(clojure.test/is (= (pascal 2 1) 1))
(clojure.test/is (= (pascal 2 2) 1))
(clojure.test/is (= (pascal 3 1) 1))
(clojure.test/is (= (pascal 3 2) 2))
(clojure.test/is (= (pascal 3 3) 1))
(clojure.test/is (= (pascal 4 2) 3))
(clojure.test/is (= (pascal 4 3) 3))
(clojure.test/is (= (pascal 5 2) 4))
(clojure.test/is (= (pascal 5 3) 6))
(clojure.test/is (= (pascal 5 4) 4))
(clojure.test/is (= (p-alt 5 4) 4))

(println 'done)
