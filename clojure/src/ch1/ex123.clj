;; (load-file "filename.clj")
;; or on command line> clj filename.clj


(defn divides? [a b]
  (= (rem b a) 0))


(defn square [n]
  (* n n))


(defn odd? [n]
  (not (divides? 2 n)))


(defn next [n]
  (cond (= n 2) 3
        :else (+ n 2)))
        

(defn find-divisor [n test-divisor]
  (cond (> (square test-divisor) n) n
        (divides? test-divisor n) test-divisor
        :else (find-divisor n (next test-divisor))))


(defn smallest-divisor [n]
  (find-divisor n 2))



(require
 'clojure.test)

(println (smallest-divisor 199))
(println (smallest-divisor 1999))
(println (smallest-divisor 19999))

(println "done")