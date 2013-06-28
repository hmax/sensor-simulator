module Main where
import qualified Data.Vector.V2 as V
import qualified Data.Vector.Transform.T2 as T
import Data.Vector.Class
import Control.Monad

type Position = V.Vector2
type Rotation = V.Vector2

data RobotState = RobotState Position Rotation 
	deriving Show


main::IO()
main = do
	let initialState = RobotState (V.Vector2 0 0) (V.Vector2 1 0)
	readAndUpdateState initialState
	return ()


readAndUpdateState currentState = do
								θ <- getLine
								l <- getLine 
								let newState = rotateAndMove (read θ ::Double) (read l ::Double) currentState
								putStrLn $ show newState
								readAndUpdateState newState

rotateAndMove :: Scalar -> Scalar -> RobotState -> RobotState
rotateAndMove θ l (RobotState pos rot) = moveForward (RobotState pos newrot) l
									where newrot = rotateVectorByAngle rot θ


rotationTransform :: Scalar -> T.Transform2
rotationTransform θ = T.Transform2 (cos θ) (- sin θ) 0
                                   (sin θ) (cos θ)   0


rotateVectorByAngle :: V.Vector2 -> Double -> V.Vector2
rotateVectorByAngle v θ = T.transformP2 (rotationTransform θ) v


moveForward :: RobotState -> Double -> RobotState
moveForward (RobotState pos rot) len = RobotState (len *| rot + pos) rot


rotate :: RobotState -> Double -> RobotState
rotate (RobotState pos rot) θ = RobotState pos (rotateVectorByAngle rot θ)

