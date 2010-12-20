-- file ch03/ex12.hs
-- Complex hull calculation
-- Probably could be done shorter, and there might be edge cases that aren't handled.
-- Also, the convexHull 3-fold evaluation might be done in two-fold....

import Data.List

-- Class definitions
data Turn = LeftTurn | RightTurn | Straight deriving (Eq, Show)
data Point2d = Point2d Double Double
             deriving (Eq, Show)

-- Find turning direction of three points
turnDir :: Point2d -> Point2d -> Point2d -> Turn
turnDir (Point2d p1x p1y) (Point2d p2x p2y) (Point2d p3x p3y)
  | ccw > 0 = LeftTurn
  | ccw < 0 = RightTurn
  | otherwise = Straight
    where ccw = (p2x - p1x) * (p3y - p1y) - (p2y - p1y) * (p3x - p1x)

-- Ordering by y coordinate
ycoord :: Point2d -> Point2d -> Ordering
ycoord (Point2d _ p1y) (Point2d _ p2y)  
  | p1y > p2y = GT 
  | p1y < p2y = LT 
  | p1y == p2y = EQ

-- Calculate polar coordinate (direct copy of Wikipedia)
polar :: Point2d -> Double
polar (Point2d x y) 
  | (x > 0) && (y >= 0) = atan (y / x)
  | (x > 0) && (y < 0) = atan (y / x) + 2 * pi
  | (x < 0) = atan (y / x) + pi
  | (x == 0) && (y > 0) = pi / 2 
  | (x == 0) && (y < 0) = 3 * pi / 2
  | otherwise = 0

-- Compare polar angle of two points based on a pivot point
comparepolarwith :: Point2d -> Point2d -> Point2d -> Ordering
comparepolarwith (Point2d px py) (Point2d ax ay) (Point2d bx by) = compare (polar ap) (polar bp)
  where ap = Point2d (ax - px) (ay - py)
        bp = Point2d (bx - px) (by - py)

-- Prepare points for the Graham scan: pivot has minimal y-coordinate, rest is ordered by polar angle
sortPoints :: [Point2d] -> [Point2d]
sortPoints list = pivot : (sortBy (comparepolarwith pivot) (delete pivot (nub list)))
  where pivot = minimumBy ycoord list

-- Get them convex hull
convexHull :: [Point2d] -> [Point2d]
convexHull list = pivot : (hullify (sorted ++ [pivot]))
  where pivot = head sorted
        sorted = sortPoints list
        hullify (p1:p2:p3:ps)
          | turnDir p1 p2 p3 == LeftTurn = [p2] ++ hullify(p2:p3:ps)
          | turnDir p1 p2 p3 == Straight = [p2] ++ hullify(p2:p3:ps)
          | turnDir p1 p2 p3 == RightTurn = hullify(p2:p3:ps)
        hullify (p1:p2:p3:[])
          | turnDir p1 p2 p3 == LeftTurn = [p2] ++ [p3]
          | turnDir p1 p2 p3 == Straight = [p2] ++ [p3]
          | turnDir p1 p2 p3 == RightTurn = [p3]
        hullify _ = []


-- Example code
x = Point2d 1.0 1.0
y = Point2d 1.5 1
z = Point2d 1.5 1.5
w = Point2d 1 1.5
ww = Point2d 2.0 1
ff = convexHull [y, z, w, x, ww]
