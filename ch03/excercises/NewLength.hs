newlength :: [a] -> Int
newlength []     = 0
newlength [_]    = 1
newlength (x:xs) = 1 + newlength xs