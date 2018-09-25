palindrome :: [a] -> [a]
palindrome []      =   []
palindrome arr  = arr ++ (reverse arr)

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome arr = arr == reverse arr  