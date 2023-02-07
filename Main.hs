import Tokens
import Grammar
import System.Environment
import Control.Exception
import System.IO
import Evaluation
import Types

main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs
           sourceText <- readFile fileName
           --putStrLn ("Parsing : " ++ sourceText)
           let alexProg = alexScanTokens sourceText
           --putStrLn ("parseroo" ++ (show alexProg))
           let parsedProg = (parseCalc . alexScanTokens) sourceText
           --putStrLn ("Parsed as " ++ (show parsedProg))
           let typedProg = typeOf [] parsedProg
           --putStrLn ("Type Checking Passed with type " ++ (unparseType typedProg) ++ "\n") 
           let from = evaluatorFrom parsedProg
           --putStrLn ("From as " ++ (show from))
           files <- (mapM readFile (addCSV from))
           let filesWithNames = addFilesNames (from) (files)
           --putStrLn ("Files" ++ (show filesWithNames))
           let table = evalSelect parsedProg filesWithNames
           --putStrLn ("evaluates to :\n"++table) 
           let wheredTable = evalWhere parsedProg filesWithNames table
           --putStrLn ("The whered table is :\n"++wheredTable) 
           let orderedTable = orderBy parsedProg wheredTable
           putStrLn (orderedTable) 
           
           
noParse :: ErrorCall -> IO ()
noParse e = do let err = show e
               hPutStr stderr err
               return ()
