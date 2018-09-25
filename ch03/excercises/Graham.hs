import Direction
import Data.List

findLowestPoint :: [Point] -> Point
findLowestPoint (a:as) = findLowestPointInner as a
   where findLowestPointInner [] min = min 
         findLowestPointInner (b:bs) min = if(((y b) < y min) || ((y b) == (y min) && x b < x min)) 
                                           then findLowestPointInner bs b
                                           else findLowestPointInner bs min

eq :: Point -> Point -> Bool
eq a b = x a == x b && y a == y b

polarAngle :: Point -> Point -> Float
polarAngle p0 p1 = atan2 ((y p1) - (y p0)) ((x p1) - (x p0)) 

prepareWithAngles :: [Point] -> Point -> [(Point, Float)]
prepareWithAngles [] p0 = []
prepareWithAngles (x:xs) p0 = (x, polarAngle p0 x) : prepareWithAngles xs p0

sortByAngle :: [(Point, Float)] -> [Point]
sortByAngle arr = map fst $ sortOn snd arr 


graham :: [Point] -> [Point] -> [Point]
graham _ [] = []
graham [] result = reverse result
graham (x:xs) (a2:a1:as) = if(eqDirection (turn a1 a2 x) Right_Turn) 
                           then graham (x:xs) (a1:as)
                           else graham xs (x:a2:a1:as)

fullGraham :: [Point] -> [Point]
fullGraham in_points = graham (drop 3 sortedByAngle) (reverse (take 3 sortedByAngle))
              where sortedByAngle = sortByAngle (prepareWithAngles in_points (findLowestPoint in_points))

testPoints = [(Point 2 6), (Point 4 6), (Point 3 5), (Point 0.1 4), (Point 2.1 4), (Point 4.1 4), (Point 6.1 4), (Point 1.3 3), (Point 3.3 3), (Point 5.3 3), (Point 0 2), (Point 2.1 2), (Point 4.1 2), (Point 6.1 2), (Point 3 1), (Point 2 0), (Point 4 0)]