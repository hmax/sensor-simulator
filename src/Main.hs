module Main where
import qualified Data.Vector.V2 as V
import qualified Data.Vector.Transform.T2 as T
import Data.Vector.Class


type Position = V.Vector2
type Rotation = V.Vector2

data RobotState = RobotState Position Rotation
main::IO()
main = undefined

rotate :: RobotState -> Rotation -> RobotState
rotate st rot = undefined

rotationTransform :: Scalar -> T.Transform2
rotationTransform θ = T.Transform2 (cos θ) (- sin θ) 0
                                   (sin θ) (cos θ)   0


rotateVectorByAngle :: V.Vector2 -> Double -> V.Vector2
rotateVectorByAngle v θ = T.transformP2 (rotationTransform θ) v


moveForward :: RobotState -> Double -> RobotState
moveForward (RobotState pos rot) len = RobotState (len *| rot + pos) rot
