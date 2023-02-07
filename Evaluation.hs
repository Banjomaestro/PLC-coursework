module Evaluation where
import Data.List
import Grammar

type Table = String

evaluatorFrom :: Exp -> [String]
evaluatorFrom (From connector expr1 expr2 expr3) = evalFrom connector

evalFrom :: Exp -> [String]
evalFrom(Table name) = [name]
evalFrom(And expr1 expr2) = evalFrom expr1 ++ evalFrom expr2 

readTable ::  String -> IO String
readTable fileName = do readFile fileName

addCSV :: [String] -> [String]
addCSV [] = []
addCSV (file:files) = (file++".csv"):addCSV files

addFilesNames :: [String] -> [String] -> [(String, String)]
addFilesNames [] [] = []
addFilesNames (name:names) (file:files) = (name, removeSpace (getRows (removeLastLine (file)) "")) : addFilesNames names files

removeLastLine :: Table -> Table
removeLastLine [] = []
removeLastLine fileContent | last fileContent == '\n' = init fileContent
                           | otherwise = fileContent

loadFiles :: [String] -> [IO String]
loadFiles [] = []
loadFiles (file:files) = [(readFile (file++".csv"))] ++ loadFiles files 

getRow :: Int -> String -> String -> String
getRow index [] return = return 
getRow index (cell:table) return | index == 0 && cell /= '\n' = getRow index table (return++[cell])
                                 | index == 0 && cell == '\n' = return
                                 | index > 0 && cell == '\n' = getRow (index-1) table return
                                 | otherwise = getRow index table return

getRows :: Table  -> String -> [Table]
getRows [] return = [reverse return]
getRows (cell:table) return | cell == '\n' = reverse return : getRows table ""
                            | otherwise = getRows table (cell:return)

getCols :: Table  ->String -> [Table]
getCols [] return = [reverse return]
getCols (cell:table) return | cell == ',' = reverse return : getRows table ""
                            | otherwise = getCols table (cell:return)

conj :: [Table] -> [Table] -> [Table] -> Table 
conj [] [] [] = []
conj [] table22 table2 = []
conj (row1:table1) table22 [] = conj table1 table22 table22
conj (row1:[]) table22 (row2:[]) = (row1++","++row2) ++ (conj (row1:[]) table22 ([]) )
conj (row1:[]) table22 (row2:table2) = (row1++","++row2++"\n") ++ (conj (row1:[]) table22 (table2) )
conj (row1:table1) table22 (row2:table2) = (row1++","++row2++"\n") ++ (conj (row1:table1) table22 (table2) )

conjunctions :: Table -> Table -> Table
conjunctions [] table2 = []
conjunctions table1 [] = []
conjunctions table1 table2 = conj (getRows table1 "") (getRows table2 "") (getRows table2 "") 



getCol :: Int -> Int -> String -> String -> String
getCol count colNum [] return = return
getCol count colNum (cell:table) return | cell == '\n' = getCol 0 colNum table (return++['\n'])
                                        | cell == ',' = getCol (count+1) colNum table return
                                        | count == colNum = getCol count colNum table (return++[cell])
                                        | otherwise = getCol count colNum table return

getColumn :: Int -> Table -> Table
getColumn index table = getCol 0 index table []

mergeTables :: [String] -> [String] -> String
mergeTables [] [] = []
mergeTables (row1:[]) (row2:[]) = row1++","++row2 ++ (mergeTables [] [])
mergeTables (row1 : []) [] = row1 ++ mergeTables [] []
mergeTables [] (row2 : []) = row2 ++ mergeTables [] []
mergeTables (row1 : table1) [] = row1 ++ "\n" ++ mergeTables [] table1
mergeTables [] (row2 : table2) = row2 ++ "\n" ++ mergeTables [] table2
mergeTables (row1:table1) (row2:table2) = row1++","++row2 ++ "\n" ++ (mergeTables table1 table2)

comma :: Table -> Table -> Table 
comma [] [] = []
comma [] table2 = table2
comma table1 [] = table1
comma table1 table2 = mergeTablesUnequal theTable1 theTable2 theTable1 theTable2
                      where
                          theTable1 = getRows table1 ""
                          theTable2 = getRows table2 ""

mergeTablesUnequal :: [String] -> [String] -> [String] -> [String] -> String
mergeTablesUnequal [] [] table1save table2save = []
mergeTablesUnequal table1 [] table1save table2save = mergeTablesUnequal table1 table2save table1save table2save
mergeTablesUnequal [] table2 table1save table2save = mergeTablesUnequal table1save table2 table1save table2save
mergeTablesUnequal (row1:[]) (row2:[]) table1save table2save = row1++","++row2 ++ (mergeTablesUnequal [] [] table1save table2save)
mergeTablesUnequal (row1:table1) (row2:table2) table1save table2save = row1++","++row2 ++ "\n" ++ (mergeTablesUnequal table1 table2 table1save table2save)

mergeTableUnequal :: Table -> Table -> String
mergeTableUnequal [] [] = []
mergeTableUnequal table1 [] = []
mergeTableUnequal [] table2 = []
mergeTableUnequal table1 table2 = mergeTablesUnequal tables1 tables2 tables1 tables2
                                  where
                                      tables1 = getRows table1 ""
                                      tables2 = getRows table2 ""

merge :: Table -> Table -> Table
merge [] [] = []
merge table1 table2 = mergeTables (getRows table1 "") (getRows table2 "")

linkRows :: [Table] -> Table
linkRows [] = []
linkRows (row:[]) = row
linkRows (row:table) = row++"\n"++linkRows table

alphabetical :: Table -> Table
alphabetical table = linkRows (sort (getRows table ""))

alphabeticalOnN :: [Table] -> Int -> [Table]
alphabeticalOnN [] _ = []
alphabeticalOnN (x:xs) n = ls ++ [x] ++ rs 
 where
     ls = alphabeticalOnN [a | a <- xs, (getCol 0 n a []) < (getCol 0 n x [])] n
     rs = alphabeticalOnN [a | a <- xs, (getCol 0 n a []) >= (getCol 0 n x [])] n

rightJoin :: Table -> Table -> Int -> Table
rightJoin t1 t2 n = leftJoin t2 t1 n

getLast :: Table -> Int
getLast t = countCommas (getRows t "") 1
 where
     countCommas ((x:xs):xs2) n | x == ','  = countCommas ((xs):xs2) (n+1)
                                | x == '\n' = n
                                | otherwise = countCommas ((xs):xs2) n

leftJoin :: Table -> Table -> Int -> Table
leftJoin t1 t2 n = cleanTable $ leftJoinFuse (leftJoinAlign (alphabeticalOnN (getRows t1 "") n) (alphabeticalOnN (getRows t2 "") n) n ([],[]))

leftJoinAlign :: [Table] -> [Table] -> Int -> (Table,Table) -> (Table,Table)
leftJoinAlign [] [] n (mem1,mem2) = (mem1,mem2)
leftJoinAlign [] t2 n (mem1,mem2) = (mem1,mem2)
leftJoinAlign t1 [] n (mem1,mem2) = (mem1,mem2)
leftJoinAlign (x:xs) (x2:xs2) n (mem1,mem2) | getCol 0 n x [] == getCol 0 n x2 [] && (getCol 0 n (fstLine (linkRows xs)) []) < (getCol 0 n (fstLine (linkRows xs2)) []) = leftJoinAlign xs (x2:xs2) n ((mem1 ++ x ++ ['\n']),(mem2 ++ x2 ++ ['\n']))
                                            | getCol 0 n x [] == getCol 0 n x2 [] && (getCol 0 n (fstLine (linkRows xs)) []) >= (getCol 0 n (fstLine (linkRows xs2)) []) = leftJoinAlign (x:xs) xs2 n ((mem1 ++ x ++ ['\n']),(mem2 ++ x2 ++ ['\n']))
                                            | getCol 0 n x [] /= getCol 0 n x2 [] && (getCol 0 n x []) < (getCol 0 n x2 []) = leftJoinAlign xs (x2:xs2) n (mem1,mem2)
                                            | getCol 0 n x [] /= getCol 0 n x2 [] && (getCol 0 n x []) > (getCol 0 n x2 []) = leftJoinAlign (x:xs) xs2 n (mem1,mem2)
leftJoinAlign _ _ n (mem1,mem2) = (mem1,mem2)

fstLine :: Table -> String
fstLine [] = []
fstLine [x]    | x == '\n' = []
               | otherwise = [x]
fstLine (x:xs) | x /= '\n' = [x] ++ fstLine xs
               | otherwise = []

restLine :: Table -> Table
restLine []  = []
restLine [x] = []
restLine (x:xs) | x == '\n' = xs
                | otherwise = restLine xs

leftJoinFuse :: (Table,Table) -> Table
leftJoinFuse ([],[]) = []
leftJoinFuse (('\n':s1),('\n':s2)) | isSpace (fstElmt s1) = ['\n'] ++ (fstElmt s2) ++ [','] ++ (leftJoinFuse (restElmt s1,restElmt s2))
                                   | otherwise            = ['\n'] ++ (fstElmt s1) ++ [','] ++ (leftJoinFuse (restElmt s1,restElmt s2))  
leftJoinFuse (s1,s2)               | isSpace (fstElmt s1) = (fstElmt s2) ++ [','] ++ (leftJoinFuse (restElmt s1,restElmt s2))
                                   | otherwise            = (fstElmt s1) ++ [','] ++ (leftJoinFuse (restElmt s1,restElmt s2))                                        

fstElmt :: String -> String
fstElmt [] = []
fstElmt [x]    | x == '\n' || x == ',' = []
               | otherwise = [x]
fstElmt (x:xs) | x /= '\n' && x /= ',' = [x] ++ fstElmt xs
               | otherwise = []

restElmt :: Table -> Table
restElmt []  = []
restElmt [x] = []
restElmt (x:xs) | x == ',' = xs
                | x == '\n' = (x:xs)
                | otherwise = restElmt xs

cleanTable :: Table -> Table
cleanTable []         = []
cleanTable (",")      = []
cleanTable ("\n")     = []
cleanTable [x]        = [x]
cleanTable (',':'\n':xs) = "\n" ++ (cleanTable xs)
cleanTable (x:xs)     = [x] ++ (cleanTable xs)

isSpace :: String -> Bool
isSpace s | s == " "  = True
          | otherwise = False

xor :: Bool -> Bool -> Bool
xor bool1 bool2 = (bool1 || bool2) && ((bool1 && bool2)==False)


evalSelect :: Exp -> [(String,String)] -> Table
evalSelect (From exp1 (Select exp) (Where expWhere) exp3) myTables = eval exp myTables

evalWhere :: Exp -> [(String, Table)] -> Table -> Table
evalWhere (From exp1 (Select exp2) (Where Empty ) exp3) myTables table = table
evalWhere (From exp1 (Select exp2) (Where exp ) exp3) myTables table = linkRows(removeEmpty(evalWhereAllRows exp myTables table  numberOfRows 0))
                                                                       where
                                                                           numberOfRows = length(getRows table "")

removeEmpty :: [String] -> [String]
removeEmpty [] = []
removeEmpty (x:xs) | x == "" = removeEmpty xs
                   | otherwise = x:removeEmpty xs

eval :: Exp-> [(String, String)] -> Table
eval(Conjunction exp1 exp2) myTables = conjunctions (eval exp1 myTables) (eval exp2 myTables)
eval(LeftJoin exp1 exp2 (On (Int index))) myTables = leftJoin (eval exp1 myTables) (eval exp2 myTables) index
eval(Merge exp1 exp2) myTables = mergeTableUnequal (alphabetical(eval exp1 myTables)) (alphabetical(eval exp2 myTables))
eval(LeftJoin exp1 exp2 (On Last)) myTables = leftJoin (eval exp1 myTables) (eval exp2 myTables) (getLast (eval exp1 myTables))
eval(RightJoin exp1 exp2 (On (Int index))) myTables = rightJoin (eval exp1 myTables) (eval exp2 myTables) index
eval(RightJoin exp1 exp2 (On Last)) myTables = rightJoin (eval exp1 myTables) (eval exp2 myTables) (getLast (eval exp1 myTables))
eval(FromTable (Table name) (Column index)) myTables = getColumn index  (getTheTable (name) myTables)
eval(FromTable (Table name) All) myTables = getTheTable (name) myTables
eval(TmInt value) myTables = show value
eval(TmString value) myTables = value
eval(Empty) myTables = ""
eval(Comma exp1 exp2) myTables = merge(eval exp1 myTables) (eval exp2 myTables)
eval(Composition exp1 exp2) myTables = removeLastLine (pairedComposition (eval exp1 myTables) (eval exp2 myTables))
eval(MatchPairs exp1 exp2) myTables = removeLastLine (matchingPairs (eval exp1 myTables) (eval exp2 myTables))
eval(ThreePaths exp ) myTables = path (eval exp myTables)
eval exp myTables = error "invalid keyword"

getTheTable :: String -> [(String, Table)] -> Table
getTheTable name [] = error "The table you are referencing is missing from your from statement"
getTheTable name ((name2,table):tables) | name2 == name = table
                                        | otherwise = getTheTable name (tables)

orderBy :: Exp -> Table -> Table
orderBy (From exp (Select exp1) (Where exp2) (OrderBy Alphabetical)) myTable = alphabetical myTable
orderBy (From exp (Select exp1) (Where exp2) (OrderBy empty)) myTable = myTable
orderBy exp myTable = error "Expression invalid"

getOnlyRow :: [(String,Table)] -> Int -> [(String,Table)]
getOnlyRow ((name,table):list) index = (name,(getRow index table "")) : (getOnlyRow list index)

evalWhereAllRows :: Exp -> [(String,Table)] -> Table -> Int -> Int ->  [Table]
evalWhereAllRows connector myTables theTable numberOfRows index | index == numberOfRows = []
                                                                | otherwise = evalWhereByRow connector myTables theTable index :  evalWhereAllRows connector myTables theTable numberOfRows (index+1)
                                               
evalWhereByRow :: Exp -> [(String,Table)] -> Table -> Int -> Table
evalWhereByRow connector myTables theTable rowIndex | whereInter connector myTables rowIndex = getRow rowIndex theTable ""
                                                    | otherwise = ""

getStringValue :: Exp -> [(String,Table)] -> Int ->  String
getStringValue(Empty) myTables rowIndex = ""
getStringValue(TmString string) myTables rowIndex = string
getStringValue(TmInt int) myTables rowIndex = show int 
getStringValue(FromTable (Table name) (Column colIndex)) myTables rowIndex = getRow rowIndex (getColumn colIndex (getTheTable name myTables)) ""

whereInter :: Exp -> [(String, Table)] -> Int -> Bool
whereInter (Equal exp1 exp2) myTables rowIndex | isColumnConnectorValue exp1 = getStringValue exp1 myTables rowIndex == getStringValue exp2 myTables rowIndex 
                                               | otherwise = (whereInter exp1 myTables rowIndex) == (whereInter exp2 myTables rowIndex) 
whereInter (Not exp) myTables rowIndex = not (whereInter exp myTables rowIndex)
whereInter (And exp1 exp2) myTables rowIndex = (whereInter exp1 myTables rowIndex) && (whereInter exp2 myTables rowIndex)
whereInter (Or exp1 exp2) myTables rowIndex = (whereInter exp1 myTables rowIndex) || (whereInter exp2 myTables rowIndex)
whereInter (Xor exp1 exp2) myTables rowIndex = xor (whereInter exp1 myTables rowIndex) (whereInter exp2 myTables rowIndex)

isColumnConnectorValue :: Exp -> Bool
isColumnConnectorValue (Empty) = True
isColumnConnectorValue (TmString s) = True
isColumnConnectorValue (TmInt s) = True
isColumnConnectorValue (FromTable table col) = True
isColumnConnectorValue expr = False

pairedComposition :: Table -> Table -> Table
pairedComposition table1 table2 = checkeroo (getRows (relation rows1 rows2 rows1) "" )
                                 where
                                     rows1 = getRows table1 ""
                                     rows2 = getRows table2 ""

matchingPairs :: Table -> Table -> Table
matchingPairs table1 table2 = checkMatch (getRows (relation rows1 rows2 rows1) "" )
                              where
                                  rows1 = getRows table1 ""
                                  rows2 = getRows table2 ""

checkMatch :: [Table] -> Table 
checkMatch [] = []
checkMatch (row: []) | getColumn 0 row == getColumn 1 row && getColumn 4 row == getColumn 5 row = getColumn 2 row ++","++ getColumn 3 row ++ checkMatch []
                        | otherwise = checkMatch []

checkMatch (row: table) | getColumn 0 row == getColumn 1 row && getColumn 4 row == getColumn 5 row = getColumn 2 row ++","++ getColumn 3 row ++ "\n" ++ checkMatch table
                        | otherwise = checkMatch table

relation :: [Table] -> [Table] -> [Table] -> Table
relation [] [] saveroo = []
relation [] (row2 : table2) saveroo = relation saveroo table2 saveroo
relation (row1:[]) (row2:[]) saveroo = row1 ++ "," ++ row2
relation (row1 : table1) (row2:[]) saveroo = row1 ++ "," ++ row2 ++ "\n" ++relation table1 (row2:[]) saveroo
relation (row1 : table1) (row2 : table2) saveroo = row1 ++ "," ++ row2 ++ "\n" ++ relation table1 (row2 : table2) saveroo

checkeroo :: [Table] -> Table
checkeroo [] = []
checkeroo (row:[]) | not (getColumn 1 row == "") && not (getColumn 2 row == "") && getColumn 1 row == getColumn 3 row && getColumn 2 row == getColumn 4 row = (getColumn 0 row) ++ ","++ (getColumn 5 row)
                      | otherwise = checkeroo []
checkeroo (row:table) | not (getColumn 1 row == "") && not (getColumn 2 row == "") && getColumn 1 row == getColumn 3 row && getColumn 2 row == getColumn 4 row = (getColumn 0 row) ++ ","++ (getColumn 5 row) ++ "\n" ++ checkeroo table
                      | otherwise = checkeroo table

path :: Table -> Table
path theTable = removeLastLine(threePath (getRows theTable "") (getRows theTable ""))
                    
threePath :: [Table] -> [Table] -> Table
threePath [] save = []
threePath (row:table1) save | fourth == "" = threePath table1 save
                            | otherwise = fst(toPair row "") ++ "," ++ fourth ++ "\n" ++ threePath table1 save
                        where 
                            fourth = getFourth (fst(toPair row "")) 1 save save 


toPair :: String -> String -> (String,String)
toPair (char:stringeroo) saved | char == ',' = (reverse (saved), stringeroo)
                               | otherwise = toPair stringeroo (char:saved)

getFourth :: String -> Int -> [Table] -> [Table] -> Table
getFourth theString count [] save = []
getFourth theString count (row:table) save | fst thePair == theString && count == 3 = snd thePair
                                           | fst thePair == theString = getFourth (snd thePair) (count+1) save save
                                           | otherwise = getFourth theString count table save
                                            where
                                                thePair = toPair row ""

removeSpace :: [Table] -> Table
removeSpace (row:[]) = removeSpaceByRow (getCells row "")
removeSpace (row:table) = removeSpaceByRow (getCells row "") ++ "\n" ++ removeSpace table

removeSpaceByRow :: [Table] -> Table
removeSpaceByRow (cell:[]) = removePreSpace (removeAfterSpace cell)
removeSpaceByRow (cell:row) = removePreSpace (removeAfterSpace cell) ++ ","++ removeSpaceByRow row

getCells :: Table -> Table -> [Table]
getCells [] save = reverse save : []
getCells (cell:row) save | cell == ',' = reverse(save) : getCells row ""
                         | otherwise = getCells row (cell:save)

removePreSpace :: Table -> Table
removePreSpace [] = []
removePreSpace (char:string) | char == ' ' = removePreSpace string
                             | otherwise = char:string

removeAfterSpace :: Table -> Table
removeAfterSpace string = reverse (removePreSpace (reverse string))