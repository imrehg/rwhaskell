-- file ch03/ex11.hs
data Turn = LeftTurn | RightTurn | Straight deriving (Show)
data Point2d = Point2d Double Double
             deriving (Eq, Show)
turnDir :: Point2d -> Point2d -> Point2d -> Turn
turnDir (Point2d p1x p1y) (Point2d p2x p2y) (Point2d p3x p3y)
  | ccw > 0 = LeftTurn
  | ccw < 0 = RightTurn
  | otherwise = Straight
    where ccw = (p2x - p1x) * (p3y - p1y) - (p2y - p1y) * (p3x - p1x)

turnList :: [Point2d] -> [Turn]
turnList (a:b:c:xs) = (turnDir a b c):(turnList (b:c:xs))  
turnList _ = []

x = Point2d 1 1
y = Point2d 1 1.5
z = Point2d 1.5 1.5
w = Point2d 1.3 1.4
f = turnList [x, y, z, w]