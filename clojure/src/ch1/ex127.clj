;; (load-file "filename.clj")
;; or on command line> clj filename.clj


(def FAST-TIMES 20)


(defn divides? [a b]
  (= (rem b a) 0))


(defn square [n]
  (* n n))


(defn expmod [base exp m]
  (cond (= exp 0) 1
        (not (odd? exp))
          (rem (square (expmod base (/ exp 2) m)) m)
        :else 
          (rem (* base (expmod base (dec exp) m)) m)))
  

(defn fermat-test [n]
  (let [try-it (fn [a] (= (expmod a n n) a))]
    (try-it (inc (rand-int (dec n))))))


(defn fast-prime? [n times]
  (cond (= times 0) true
        (fermat-test n) (fast-prime? n (dec times))
        :else false))


(defn find-divisor [n test-divisor]
    (cond (> (square test-divisor) n) n
          (divides? test-divisor n) test-divisor
          :else (find-divisor n (inc test-divisor))))


(defn smallest-divisor [n]
    (find-divisor n 2))
    

(defn prime? [n]
  (= n (smallest-divisor n)))


(defn carmichael? [n]
  (let 
    [try-it (fn [a] (= a (expmod a n n)))
     iter (fn [x] 
            (cond 
                (= x 0) true
                (try-it x) (recur (dec x))
                :else false))]
     (and (not (prime? n)) (iter (dec n)))))


(defn test-case [n]
  (let [p format]
    (p "%d  \tPrime: %s Fast Prime: %s  Carmichael: %s" n (prime? n) (fast-prime? n FAST-TIMES) (carmichael? n))))


(require
 'clojure.test)

(println (test-case 10))
(println (test-case 11))
(println (test-case 13))
(println (test-case 561))
(println (test-case 1105))
(println (test-case 1729))
(println (test-case 2465))
(println (test-case 6601))
(println (test-case 6603))

(println "done")