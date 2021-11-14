;; (load-file "filename.clj")
;; or on command line> clj filename.clj


(def *FAST-TIMES* 2)


(defn divides? [a b]
  (= (rem b a) 0))


(defn square [n]
  (* n n))


(defn odd? [n]
  (not (divides? 2 n)))


(defn expmod [base exp m]
  (cond ((= exp 0) 1
         (not (odd? exp))
           (rem (square (expmod base (/ exp 2) m)) m)
         :else 
           (rem (* base (expmod base (dec exp) m)) m))))
  

(defn fermat-test [n]
  (let [try-it (fn [a] (= (expmod a n n) a))]
    (try-it (inc (rand-int (dec n))))))


(defn fast-prime? [n times]
  (cond ((= times 0) true
         (fermat-test n) (fast-prime? n (dec times))
         :else false)))


(defn prime? [n]
  (fast-prime? n *FAST-TIMES*))


(defn prime-test [n]
  (if (prime? n)
    (println n " *** ")
    (println n)))


(defn search-helper [n end]
  (if (<= n end)
    (do (prime-test n)
      (search-helper (+ n 2) end))
    (do (println "finished\n"))))


(defn search-for-primes [start end]
  (search-helper (if (odd? start) start (inc start)) end))


(require
 'clojure.test)

(println (search-for-primes 1000 1020))
(println (search-for-primes 10000 10040))
(println (search-for-primes 100000 100080))

(println "done")