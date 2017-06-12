module Main where

import Criterion.Main
import System.IO.Unsafe
import qualified MDParse1 as M
import qualified ParsersFreer as PF
import Text.Pandoc

fname = "/home/geo2a/Workspace/mmcs/bachelor/2014_15/parsers-benchmark/markdown-samples/t3.md"

mdEx :: String
mdEx = unsafePerformIO $
  readFile fname

-- Our benchmark harness.
main =
  -- mdEx <- readFile "/home/geo2a/Workspace/mmcs/bachelor/2014_15/parsers-benchmark/markdown-samples/t.md"
  defaultMain [
  -- bgroup "fib" [ bench "1"  $ whnf fib 1
  --              , bench "5"  $ whnf fib 5
  --              , bench "9"  $ whnf fib 9
  --              , bench "11" $ whnf fib 11
  --              ]
  bgroup "parsers"
               [
                 bench "Monad Transformers" $ whnf M.parseMarkdown mdEx
               , bench "Freer" $ whnf PF.parseMarkdown mdEx
               , bench "Pandoc" $ whnf (readMarkdown def) mdEx
               ]
  ]
