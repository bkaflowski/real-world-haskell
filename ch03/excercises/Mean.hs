mean :: (Integral a) =>  [a] -> Float
mean []   = 0.0
mean arr  = fromIntegral (sum' arr) / fromIntegral (length arr)
  where sum' [] = 0
        sum' (x:xs) = x + sum' xs