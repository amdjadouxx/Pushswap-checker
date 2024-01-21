{-
--
-- EPITECH PROJECT, 2024
-- B-PDG-300-RUN-3-1-PDGRUSH1-pierre-alexandre.grosset
-- File description:
-- Rush1 - Pushswap Checker
--
-}

import System.Environment(getArgs)
import Data.List
import System.Exit

exitWithError :: String -> IO ()
exitWithError a = putStrLn a >> exitWith (ExitFailure 84)

exitWithSuccess :: String -> IO ()
exitWithSuccess a = putStrLn a >> exitWith (ExitSuccess)

isNumber :: [Char] -> Bool
isNumber [] = True
isNumber ('-':xs) = isNumber xs
isNumber ('+':xs) = isNumber xs
isNumber (x:xs)
    | ('0' <= x && x <= '9') = isNumber xs
    | otherwise = False

readInt :: [Char] -> Int
readInt a = read a :: Int

verifArgs :: [String] -> Bool
verifArgs [] = False
verifArgs [x] 
    | isNumber x == False = False
    | otherwise = True
verifArgs (x:xs)
    | isNumber x == False = False
    | otherwise = verifArgs xs

verifOps :: [String] -> Bool
verifOps [] = True
verifOps ("sa":xs) = verifOps xs
verifOps ("sb":xs) = verifOps xs
verifOps ("sc":xs) = verifOps xs
verifOps ("pa":xs) = verifOps xs
verifOps ("pb":xs) = verifOps xs
verifOps ("ra":xs) = verifOps xs
verifOps ("rb":xs) = verifOps xs
verifOps ("rr":xs) = verifOps xs
verifOps ("rra":xs) = verifOps xs
verifOps ("rrb":xs) = verifOps xs
verifOps ("rrr":xs) = verifOps xs
verifOps _ = False

stringListToIntList :: [String] -> [Int]
stringListToIntList [] = []
stringListToIntList (arg:args) = readInt arg:(stringListToIntList args)

swapList :: [Int] -> [Int]
swapList [] = []
swapList [x] = [x]
swapList (x:y:xs) = y : x : xs

rotateListBeg :: [Int] -> [Int]
rotateListBeg [] = []
rotateListBeg [x] = [x]
rotateListBeg (x:xs) = xs ++ [x]

rotateListEnd :: [Int] -> [Int]
rotateListEnd [] = []
rotateListEnd [x] = [x]
rotateListEnd x = last x : init x

sa :: ([Int],[Int]) -> ([Int],[Int])
sa (la, lb) = (swapList la, lb)

sb :: ([Int],[Int]) -> ([Int],[Int])
sb (la, lb) = (la, swapList lb)

sc :: ([Int],[Int]) -> ([Int],[Int])
sc (la, lb) = (swapList la, swapList lb)

pa :: ([Int],[Int]) -> ([Int],[Int])
pa (la, []) = (la, [])
pa (la, y:ys) = (y:la, ys)

pb :: ([Int],[Int]) -> ([Int],[Int])
pb ([], lb) = pa ([], lb)
pb (y:ys, lb) = (ys, y:lb)

ra :: ([Int],[Int]) -> ([Int],[Int])
ra (la, lb) = (rotateListBeg la, lb)

rb :: ([Int],[Int]) -> ([Int],[Int])
rb (la, lb) = (la, rotateListBeg lb)

rr :: ([Int],[Int]) -> ([Int],[Int])
rr (la, lb) = (rotateListBeg la, rotateListBeg lb)

rra :: ([Int],[Int]) -> ([Int],[Int])
rra (la, lb) = (rotateListEnd la, lb)

rrb :: ([Int],[Int]) -> ([Int],[Int])
rrb (la, lb) = (la, rotateListEnd lb)

rrr :: ([Int],[Int]) -> ([Int],[Int])
rrr (la, lb) = (rotateListEnd la, rotateListEnd lb)

execOp :: ([Int], [Int]) -> String -> ([Int], [Int])
execOp lalb "sa" = sa lalb
execOp lalb "sb" = sb lalb
execOp lalb "sc" = sc lalb
execOp lalb "pa" = pa lalb
execOp lalb "pb" = pb lalb
execOp lalb "ra" = ra lalb
execOp lalb "rb" = rb lalb
execOp lalb "rr" = rr lalb
execOp lalb "rra" = rra lalb
execOp lalb "rrb" = rrb lalb
execOp lalb "rrr" = rrr lalb

pushswapExec :: ([Int], [Int]) -> [String] -> ([Int], [Int])
pushswapExec a [] = a
pushswapExec a (s:sx) = pushswapExec (execOp a s) sx

pushswapCheckResult :: ([Int], [Int]) -> [Int] -> IO ()
pushswapCheckResult (a,b) list_not_sort
    | a == sort list_not_sort = exitWithSuccess "OK"
    | otherwise =  exitWithSuccess ("KO: (" ++ show a ++ "," ++ show b ++ ")")

main :: IO ()
main = do
    args <- getArgs
    ops <- getLine
    case (verifArgs args, verifOps (words ops)) of
        (True, True) -> pushswapCheckResult ((pushswapExec (stringListToIntList 
            args, [])) (words ops)) (stringListToIntList args)
        _ -> exitWithError "Error : Invalid Args or Ops given."
