import Data.List

sortLists :: (Eq a) => [[a]] -> [[a]]
sortLists arr = sortBy compareLists arr
  where compareLists list1 list2
                   | length list1 < length list2  = LT
                   | length list1 == length list2 = EQ
                   | length list1 > length list2  = GT