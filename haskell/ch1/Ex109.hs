module Ex109 where

plus_r a b =
  if a == 0 then b
  else succ (plus_r (pred a) b)
                        
plus_it a b =
  if a == 0 then b
  else plus_it (pred a) (succ b)
                        
