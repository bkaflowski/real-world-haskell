module Direction where

data Point = Point {
       x  :: Float
     , y  :: Float } deriving (Show)

data Direction = Left_Turn | Right_Turn | Straight deriving Show

turn :: Point -> Point -> Point -> Direction
turn a b c
   | ccw < 0  = Right_Turn
   | ccw == 0 = Straight
   | ccw > 0 = Left_Turn
   where ccw = ((x b) - (x a)) * ((y c) - (y a)) - ((y b) - (y a)) * ((x c) - (x a))

turnWindow :: [Point] -> [Direction]
turnWindow (a:b:c:xs)   = turn a b c : (turnWindow $ b:c:xs)
turnWindow _            = []

eqDirection :: Direction -> Direction -> Bool
eqDirection Right_Turn Right_Turn = True
eqDirection Left_Turn Left_Turn = True
eqDirection Straight Straight = True
eqDirection _ _ = False