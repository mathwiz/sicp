module Ex109 where

plus_r a b =
  if a == 0 then b
  else succ (plus_r (pred a) b)
                        
plus_it a b =
  if a == 0 then b
  else plus_it (pred a) (succ b)
                        
plus_r' 0 b = b
plus_r' a b = succ (plus_r' (pred a) b)

plus_it' 0 b = b
plus_it' a b = plus_it' (pred a) (succ b)