(defun biggest-denomination (kinds-of-coins) 
  (cond ((= kinds-of-coins 1) 1) 
        ((= kinds-of-coins 2) 5) 
        ((= kinds-of-coins 3) 10) 
        ((= kinds-of-coins 4) 25) 
        ((= kinds-of-coins 5) 50)))


(defun cc (amount kinds-of-coins) 
  (cond ((= amount 0) 1) 
        ((or 
          (< amount 0) 
          (= kinds-of-coins 0)) 0) 
        (t (+ (cc amount (1- kinds-of-coins)) 
              (cc (- amount (biggest-denomination kinds-of-coins)) kinds-of-coins)))))


(defun count-change (amount) 
  (cc amount 5))


(print (= (count-change 0) 1))
(print (= (count-change 1) 1))
(print (= (count-change 2) 1))
(print (= (count-change 11) 4))
(print (= (count-change 100) 292))

(print 'done)
