(defn check-expect [sexp expected]
  (println
   (cond (= (eval sexp) expected) (str "passed: " expected)
         :else                    (str "should be " expected))))

