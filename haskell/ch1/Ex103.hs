-- :load "Ex103.hs"
-- run with > larger_sq 1 2 3

module Ex103 where

larger_sq x y z =
    if x <= y && x <= z
    then y * y + z * z
    else if y <= x && y <= z
    then x * x + z * z
    else x * x + y * y
