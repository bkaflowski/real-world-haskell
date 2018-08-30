data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

data TreeMaybe a = NodeMaybe a (Maybe (TreeMaybe a)) (Maybe (TreeMaybe a))
                   deriving (Show)