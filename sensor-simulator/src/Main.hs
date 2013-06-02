module Main where
import qualified Data.Vector.V2 as V


data Vec2D = Vec2D Double Double deriving Show
newtype Position = Pos Vec2D
newtype Rotation = Rot Vec2D


normalizedVector :: Double -> Double -> Vec2D
normalizedVector x y = Vec2D (x/norm) (y/norm)
                        where norm = sqrt $ x*x + y*y

data RobotState = RobotState Position Rotation
main::IO()
main = undefined

rotate :: RobotState -> Rotation -> RobotState
rotate st rot = undefined

rotateVectorByAngle :: Vec2D -> Double -> Vec2D
rotateVectorByAngle (Vec2D x y) θ = Vec2D ((x * cos θ) - (y * sin θ)) ((x * sin θ) + (y * cos θ))

moveForward :: RobotState -> Double -> RobotState
moveForward (RobotState pos rot) len = undefined


