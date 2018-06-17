(defn check-expect [sexp expected]
  (println
   (cond (= (eval sexp) expected) (str "passed: " expected)
         :else                    (str "should be " expected))))


(defn sum-squares [xs] (reduce #(+ %1 (* (Math/pow %2 2))) 0.0 xs))

