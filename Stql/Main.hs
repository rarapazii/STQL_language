module Main where

import Grammar
import Token
import System.Environment (getArgs)
import Interpret (runProg)

readProg :: String -> IO Prog
readProg src = readFile "prelude.stql" >>= \prelude ->
    readFile src >>= pure . parseProg . alexScanTokens . (prelude ++)

readToks :: String -> IO [Token]
readToks src = readFile src >>= pure . alexScanTokens

main :: IO ()
main = getArgs >>= \[arg] -> readProg arg >>= runProg