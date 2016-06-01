module Paths_haskell_learning (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/flack/development/git/haskell-learning/.stack-work/install/x86_64-osx/lts-6.1/7.10.3/bin"
libdir     = "/Users/flack/development/git/haskell-learning/.stack-work/install/x86_64-osx/lts-6.1/7.10.3/lib/x86_64-osx-ghc-7.10.3/haskell-learning-0.1.0.0-DRNRzXyk6Dx2n8UFlkUKGe"
datadir    = "/Users/flack/development/git/haskell-learning/.stack-work/install/x86_64-osx/lts-6.1/7.10.3/share/x86_64-osx-ghc-7.10.3/haskell-learning-0.1.0.0"
libexecdir = "/Users/flack/development/git/haskell-learning/.stack-work/install/x86_64-osx/lts-6.1/7.10.3/libexec"
sysconfdir = "/Users/flack/development/git/haskell-learning/.stack-work/install/x86_64-osx/lts-6.1/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_learning_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_learning_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskell_learning_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_learning_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_learning_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
