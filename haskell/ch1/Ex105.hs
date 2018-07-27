module Ex105 where

-- try calling test 0 (p 1). This does not do infinite recursion.
test x y = if x == 0 then 0 else y

-- this will not return if called
-- could not define a zero-arg function since that is just a value
p x = p 0
