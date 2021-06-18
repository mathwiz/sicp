;; (load-file "filename.clj")
;; or on command line> clj filename.clj


(defn divides? [a b]
  (= (rem b a) 0))


(defn square [n]
  (* n n))


(defn odd? [n]
  (not (divides? 2 n)))


(defn find-divisor [n test-divisor]
  (cond (> (square test-divisor) n) n
        (divides? test-divisor n) test-divisor
        :else (find-divisor n (inc test-divisor))))


(defn smallest-divisor [n]
  (find-divisor n 2))


(defn prime? [n]
  (= n (smallest-divisor n)))


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