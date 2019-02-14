;; (load-file "ex114.clj")

(defn biggest-denomination [kinds-of-coins]
  (cond (= kinds-of-coins 1) 1
        (= kinds-of-coins 2) 5
        (= kinds-of-coins 3) 10
        (= kinds-of-coins 4) 25
        (= kinds-of-coins 5) 50))


(defn cc [amount kinds-of-coins]
  (cond (= amount 0)                           1
        (or (< amount 0) (= kinds-of-coins 0)) 0
        :else
        (+ (cc amount (dec kinds-of-coins))
           (cc (- amount (biggest-denomination kinds-of-coins))
               kinds-of-coins))))


(defn count-change [amount]
  (cc amount 5))


(require
  'clojure.test)

(clojure.test/is (= (count-change 0) 1))
(clojure.test/is (= (count-change 1) 1))
(clojure.test/is (= (count-change 2) 1))
(clojure.test/is (= (count-change 11) 4))
(clojure.test/is (= (count-change 100) 292))

(println 'done)
