(defn A [x y]
  (cond (= y 0) 0
        (= x 0) (* 2 y)
        (= y 1) 2
        :else (A (- x 1)
                 (A x (- y 1)))))

(defn f [n] (A 0 n)) ;; 2n
(defn g [n] (A 1 n)) ;; 2^n
(defn h [n] (A 2 n)) ;; ???
(defn k [n] (* 5 n n))  ;; 5n^2


(require
 'clojure.test)

(clojure.test/is (= (A 1 10) 1024))
(clojure.test/is (= (A 2 4) 65536))
(clojure.test/is (= (A 3 3) 65536))
(clojure.test/is (= (f 4) 8))
(clojure.test/is (= (f 78) 156))
(clojure.test/is (= (g 4) 16))
(clojure.test/is (= (h 4) 65536))

