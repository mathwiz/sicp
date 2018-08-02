module Ex109 where

inc x = x + 1

dec x = x - 1

plus_r a b =
  if a == 0 then b
  else inc (plus_r (dec a) b)
                        
plus_it a b =
  if a == 0 then b
  else plus_it (dec a) (inc b)
                        
