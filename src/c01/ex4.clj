(defn a-plus-abs-b [a b]
  ((if (> b 0) + -) a b))


(require
 'clojure.test)

(clojure.test/is (= (a-plus-abs-b 1 2) 3))
(clojure.test/is (= (a-plus-abs-b 1 -2) 3))
(clojure.test/is (= (a-plus-abs-b -1 2) 1))
(clojure.test/is (= (a-plus-abs-b -1 -2) 1))
