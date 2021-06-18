;; (load-file "filename.clj")
;; or on command line> clj filename.clj


(defn divides? [a b]
  (= (rem b a) 0))


(defn square [n]
  (* n n))


(defn find-divisor [n test-divisor]
  (cond (> (square test-divisor) n) n
        (divides? test-divisor n) test-divisor
        :else (find-divisor n (inc test-divisor))))


(defn smallest-divisor [n]
  (find-divisor n 2))


(require
 'clojure.test)

(clojure.test/is (= (smallest-divisor 199) 199))
(clojure.test/is (= (smallest-divisor 1999) 1999))
(clojure.test/is (= (smallest-divisor 19999) 7))

(println "done")