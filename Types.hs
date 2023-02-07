module Types where 
import Grammar

--Data structures as defined in Grammar:

{-
data Type = TyBool 
          | TyInt
          | TyString
          | TyOrdering
          | TyEmpty
          | TyCell
type Environment = [ (String,Exp) ]
data Exp = Var String
         | TmTrue
         | TmFalse
         | Select Exp
         | From Exp Exp Exp Exp
         | Where Exp
         | OrderBy Exp
         | Alphabetical
         | Empty
         | And Exp Exp
         | Dot Exp Exp
         | Table String
         | FromTable Exp Exp
         | Comma Exp Exp
         | Conjunction Exp Exp
         | Composition Exp Exp
         | RightMerge Exp Exp
         | ThreePaths Exp Exp
         | MatchPairs Exp Exp
         | Equal Exp Exp
         | LeftJoin Exp Exp Exp
         | Merge Exp Exp
         | On Exp
         | Not Exp
         | Int Int
         | Column Int
         | Cell Exp Exp Exp
         | TmString String
         | TmInt Int
         | All
         | Last
         | Row Int
-}

type TypeEnvironment = [ (String,Type) ]

getBinding :: String -> TypeEnvironment -> Type
getBinding x [] = error "Variable binding not found"
getBinding x ((y,t):typeEnv) | x == y  = t
                          | otherwise = getBinding x typeEnv
                          
addBinding :: String -> Type -> TypeEnvironment -> TypeEnvironment
addBinding x t typeEnv = (x,t):typeEnv

typeOf :: TypeEnvironment -> Exp -> Type
typeOf typeEnv (Int _ )  = TyInt
typeOf typeEnv (Column _ )  = TyInt
typeOf typeEnv (Row _)  = TyInt
typeOf typeEnv (TmTrue) = TyBool
typeOf typeEnv (TmFalse) = TyBool
typeOf typeEnv (Var x) = getBinding x typeEnv
typeOf typeEnv (Table x) = TyString
typeOf typeEnv (Alphabetical) = TyOrdering
typeOf typeEnv (Empty) = TyEmpty

typeOf typeEnv (Select e1) = TyString
  where (TyString) = (typeOf typeEnv e1)

typeOf typeEnv (From e1 e2 e3 e4) = TyString
  where (TyString,TyString,TyString,TyOrdering) = (typeOf typeEnv e1, typeOf typeEnv e2, typeOf typeEnv e3, typeOf typeEnv e4)

typeOf typeEnv (Where e1) = TyString
  where (TyString) = (typeOf typeEnv e1)

typeOf typeEnv (OrderBy e1) = TyOrdering
  where (TyOrdering) = (typeOf typeEnv e1)

typeOf typeEnv (And e1 e2) = TyString
  where (TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2)

typeOf typeEnv (Dot e1 e2) = TyString
  where (TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2)

typeOf typeEnv (FromTable e1 e2) = TyString
  where (TyString,TyInt) = (typeOf typeEnv e1, typeOf typeEnv e2)

typeOf typeEnv (Comma e1 e2) = TyString
  where (TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2)

typeOf typeEnv (Conjunction e1 e2) = TyString
  where (TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2)

typeOf typeEnv (Composition e1 e2) = TyString
  where (TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2)

typeOf typeEnv (RightJoin e1 e2 e3) = TyString
  where (TyString,TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2, typeOf typeEnv e3)

typeOf typeEnv (ThreePaths e1) = TyString
  where (TyString) = (typeOf typeEnv e1)

typeOf typeEnv (MatchPairs e1 e2) = TyString
  where (TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2)

typeOf typeEnv (Equal e1 e2) = TyBool
  where (TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2)

typeOf typeEnv (LeftJoin e1 e2 e3) = TyString
  where (TyString,TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2, typeOf typeEnv e3)

typeOf typeEnv (Merge e1 e2) = TyString
  where (TyString,TyString) = (typeOf typeEnv e1, typeOf typeEnv e2)

typeOf typeEnv (On e1) = TyString
  where (TyString) = (typeOf typeEnv e1)

typeOf typeEnv (Not e1) = TyBool
  where (TyBool) = (typeOf typeEnv e1)

typeOf typeEnv (Cell e1 e2 e3) = TyCell
  where (TyString,TyInt,TyInt) = (typeOf typeEnv e1, typeOf typeEnv e2, typeOf typeEnv e3)

typeOf typeEnv (TmString x) = getBinding x typeEnv

typeOf typeEnv (TmInt e1) = TyInt

typeOf typeEnv (All) = TyString

typeOf typeEnv (Last) = TyString

typeOf typeEnv _ = error "Type Error"

unparseType :: Type -> String
unparseType TyBool = "Bool"
unparseType TyInt = "Int"
unparseType TyString = "String"
unparseType TyOrdering = "Ordering"
unparseType TyEmpty = "Empty"
unparseType TyCell = "Cell"
