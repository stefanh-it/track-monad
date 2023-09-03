-- Configuration of the program 
--

module Config
  ( getConfigDir
  ) where

getConfigDir :: IO FilePath
getConfigDir = return "./tests/output"
