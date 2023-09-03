module TimeLogIO
  ( readTimeLog
  , writeTimeLog
  ) where

import System.Directory (doesFileExist)
import Data.Map.Strict as Map
import Data.Time.Calendar
import Data.Time.Clock
import Text.Read (readMaybe)
import CommonTypes (TimeLog)
import Config (getConfigDir)

readTimeLog :: FilePath -> IO TimeLog
readTimeLog dir = do
  let FilePath 

writeTimeLog :: FilePath -> String -> timeLog -> IO ()
writeTimeLog dir weekNumber timeLog = return ()
