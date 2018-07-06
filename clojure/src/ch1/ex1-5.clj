(defn p [] (p))

(defn test [x y]
  (if (= x 0)
    0
    y))

;; see how this runs
;; (test 0 (p)) => StackOverflowError

