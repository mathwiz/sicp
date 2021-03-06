(defn f_rec [n]
  (cond (< n 3) n
        :else (+ (f_rec (- n 1)) (* 2 (f_rec (- n 2))) (* 3 (f_rec (- n 3))))))

(defn f_single [a b c]
  (+ a (* 2 b) (* 3 c)))

(defn f_it_helper [a b c n]
  (cond (= n 3) (f_single a b c)
        :else (f_it_helper (f_single a b c) a b (- n 1))))

(defn f_it [n]
  (cond (< n 3) n
        :else (f_it_helper 2 1 0 n)))

(require
 'clojure.test)

(clojure.test/is (= (f_rec 0) 0))
(clojure.test/is (= (f_rec 1) 1))
(clojure.test/is (= (f_rec 2) 2))
(clojure.test/is (= (f_rec 3) 4))
(clojure.test/is (= (f_rec 4) 11))
(clojure.test/is (= (f_rec 4) (f_it 4)))
(clojure.test/is (= (f_rec 5) (f_it 5)))
(clojure.test/is (= (f_rec 8) (f_it 8)))
(clojure.test/is (= (f_rec 16) (f_it 16)))
