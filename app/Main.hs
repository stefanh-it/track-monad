import qualified Data.Map.Strict as Map
import Data.Time.Calendar
import Data.Time.Clock
import Data.Time.Format
import System.Directory
import System.Environment
import System.IO
import TimeLogIO (readTimeLog, writeTimeLog)
import CommonTypes (TimeLog)
import Config (getConfigDir)

type ProjectName = String

main :: IO ()
main = do
  -- Catch CLI Args for starting and stopping

  args <- getArgs
  case args of
    ("start" : project : _) -> handleCommand "start" project
    ("stop" : project : _) -> handleCommand "stop" project
    _ -> putStrLn "Invalid command"
-- declare function of command 
handleCommand :: String -> String -> IO ()
handleCommand cmd project = do
  configDir <- getConfigDir
  timeLog <- readTimeLog configDir
  currentTime <- getCurrentTime
  let weekNumber = formatTime defaultTimeLocale "%U" currentTime
  putStrLn cmd
  putStrLn project
  putStrLn configDir
  case cmd of
    "start" -> do
      writeTimeLog configDir weekNumber (Map.insert project currentTime timeLog)
      putStrLn $ "New timelog created for " ++ show timeLog
    "stop" -> do
      case Map.lookup project timeLog of
        Just startTime -> do
          appendFile
            (configDir ++ "/" ++ weekNumber ++ ".log")
            (project ++ " " ++ show (diffUTCTime currentTime startTime) ++ "\n")
          writeTimeLog configDir weekNumber (Map.delete project timeLog)
        Nothing -> putStrLn "Project not yet created yet"
    "quit" -> return ()
    _ -> do
      putStrLn "Invalid command"



