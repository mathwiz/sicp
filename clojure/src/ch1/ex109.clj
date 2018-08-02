;; recursive
(defn +rec [a b]
  (if (= a 0)
    b
    (inc (+rec (dec a) b))))

;; iterative
(defn +it [a b]
  (if (= a 0)
    b
    (+it (dec a) (inc b))))
