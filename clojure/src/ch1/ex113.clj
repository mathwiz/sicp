;; Produce the nth Fibonacci number
(def psi (/ (+ 1 (Math/sqrt 5)) 2))
(def phi (/ (- 1 (Math/sqrt 5)) 2))

(defn fib [n] 
  (cond (= n 0)  0 (= n 1)  1 
        :else (Math/round (/ (- (Math/pow psi n) 
                                (Math/pow phi n)) 
                             (Math/sqrt 5)))))


(require 'clojure.test)

(clojure.test/is (= (fib 0) 0))
(clojure.test/is (= (fib 1) 1))
(clojure.test/is (= (fib 2) 1))
(clojure.test/is (= (fib 3) 2))
(clojure.test/is (= (fib 4) 3))
(clojure.test/is (= (fib 5) 5))
(clojure.test/is (= (fib 15) 610))

(println 'done)
