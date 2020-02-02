;; (load-file "filename.clj")

(defn sq [n]
  (* n n))

(defn fib-iter [a b p q count]
  (cond (= count 0) b
        (even? count)
          (fib-iter a
                    b
                    (+ (sq p) (sq q))
                    (+ (sq q) (* 2 p q))
                    (/ count 2))
        :else (fib-iter (+ (* b q) (* a q) (* a p))
                     (+ (* b p) (* a q))
                     p
                     q
                     (- count 1))))

(defn fib [n]
  (fib-iter 1 0 0 1 n))


(require
 'clojure.test)

(clojure.test/is (= (fib 0) 0))
(clojure.test/is (= (fib 1) 1))
(clojure.test/is (= (fib 2) 1))
(clojure.test/is (= (fib 3) 2))
(clojure.test/is (= (fib 4) 3))
(clojure.test/is (= (fib 5) 5))
(clojure.test/is (= (fib 6) 8))
(clojure.test/is (= (fib 7) 13))
(clojure.test/is (= (fib 8) 21))
(clojure.test/is (= (fib 15) 610))
(println (fib 0))
(println (fib 1))
(println (fib 2))
(println (fib 3))
(println (fib 4))
(println (fib 5))
(println (fib 6))
(println (fib 7))
(println (fib 8))
(println (fib 9))


(println "done")