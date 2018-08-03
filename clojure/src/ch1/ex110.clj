(defn A [x y]
  (cond (= y 0) 0
        (= x 0) (* 2 y)
        (= y 1) 2
        :else (A (- x 1)
                 (A x (- y 1)))))

(require
 'clojure.test)

(clojure.test/is (= (A 1 10) 1024))
(clojure.test/is (= (A 2 4) 65536))
(clojure.test/is (= (A 3 3) 65536))
