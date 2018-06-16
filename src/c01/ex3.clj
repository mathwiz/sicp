(defn larger-sq [x y z]
  (cond (= (min x y z) x) (sum-sq y z)
        (= (min x y z) y) (sum-sq x z)
        :else (sum-sq x y)))

(defn sum-sq [x y] (+ (* x x) (* y y)))
