module CommonTypes
  ( TimeLog
  ) where

import Data.Map.Strict as Map
import Data.Time.Clock (UTCTime)

type TimeLog = Map.Map String UTCTime
