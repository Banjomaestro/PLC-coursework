{-# OPTIONS_GHC -w #-}
module Grammar where
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,213) ([61440,6403,47696,1,0,32768,0,36927,42241,27,47616,649,0,0,0,0,0,0,0,0,0,0,0,16386,0,61440,6403,47696,1,1,0,0,36927,42241,27,16636,37894,110,1008,20505,442,4032,16484,1769,0,0,0,64512,1600,28308,0,0,0,0,3,16384,0,36927,42241,27,0,0,0,59648,2598,0,0,0,64,0,0,256,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64512,1600,28308,16384,0,128,49152,25615,59712,6,36927,42241,27,16636,37894,110,1008,20505,442,4032,16484,1769,16128,400,7077,64512,1600,28308,61440,6403,47696,49153,25615,59712,6,28288,162,4,0,0,0,0,0,0,0,0,0,0,0,0,0,35770,2,0,0,0,0,48032,40,0,0,0,0,0,0,0,0,512,0,0,1024,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,36927,42241,27,47616,653,0,64,0,0,4032,16484,1769,16128,400,7077,0,0,0,0,0,0,0,0,0,0,36927,42241,27,47616,1673,0,1008,20505,442,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","Type","in","Bool","Int","String","Ordering","Empty","Cell","true","false","int","var","select","column","concatenate","and","any","conjunction","composition","rightJoin","threePaths","matchPairs","leftJoin","on","where","','","'_'","row","'.'","'=='","drop","merge","'order by'","'='","alphabetical","all","or","not","xor","empty","'\"'","'('","')'","from","last","%eof"]
        bit_start = st Prelude.* 50
        bit_end = (st Prelude.+ 1) Prelude.* 50
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..49]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (13) = happyShift action_4
action_0 (14) = happyShift action_5
action_0 (15) = happyShift action_6
action_0 (16) = happyShift action_7
action_0 (17) = happyShift action_8
action_0 (18) = happyShift action_9
action_0 (25) = happyShift action_10
action_0 (28) = happyShift action_11
action_0 (29) = happyShift action_12
action_0 (37) = happyShift action_13
action_0 (39) = happyShift action_14
action_0 (42) = happyShift action_15
action_0 (44) = happyShift action_16
action_0 (45) = happyShift action_17
action_0 (46) = happyShift action_2
action_0 (48) = happyShift action_18
action_0 (49) = happyShift action_19
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (46) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (13) = happyShift action_4
action_2 (14) = happyShift action_5
action_2 (15) = happyShift action_6
action_2 (16) = happyShift action_7
action_2 (17) = happyShift action_8
action_2 (18) = happyShift action_9
action_2 (25) = happyShift action_10
action_2 (28) = happyShift action_11
action_2 (29) = happyShift action_12
action_2 (37) = happyShift action_13
action_2 (39) = happyShift action_14
action_2 (42) = happyShift action_15
action_2 (44) = happyShift action_16
action_2 (45) = happyShift action_17
action_2 (46) = happyShift action_2
action_2 (48) = happyShift action_18
action_2 (49) = happyShift action_19
action_2 (4) = happyGoto action_42
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (20) = happyShift action_33
action_3 (22) = happyShift action_34
action_3 (23) = happyShift action_35
action_3 (24) = happyShift action_36
action_3 (26) = happyShift action_37
action_3 (27) = happyShift action_38
action_3 (30) = happyShift action_39
action_3 (34) = happyShift action_40
action_3 (36) = happyShift action_41
action_3 (50) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 _ = happyReduce_4

action_7 (20) = happyShift action_31
action_7 (33) = happyShift action_32
action_7 _ = happyReduce_12

action_8 (13) = happyShift action_4
action_8 (14) = happyShift action_5
action_8 (15) = happyShift action_6
action_8 (16) = happyShift action_7
action_8 (17) = happyShift action_8
action_8 (18) = happyShift action_9
action_8 (25) = happyShift action_10
action_8 (28) = happyShift action_11
action_8 (29) = happyShift action_12
action_8 (37) = happyShift action_13
action_8 (39) = happyShift action_14
action_8 (42) = happyShift action_15
action_8 (44) = happyShift action_16
action_8 (45) = happyShift action_17
action_8 (46) = happyShift action_2
action_8 (48) = happyShift action_18
action_8 (49) = happyShift action_19
action_8 (4) = happyGoto action_30
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (15) = happyShift action_29
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (13) = happyShift action_4
action_10 (14) = happyShift action_5
action_10 (15) = happyShift action_6
action_10 (16) = happyShift action_7
action_10 (17) = happyShift action_8
action_10 (18) = happyShift action_9
action_10 (25) = happyShift action_10
action_10 (28) = happyShift action_11
action_10 (29) = happyShift action_12
action_10 (37) = happyShift action_13
action_10 (39) = happyShift action_14
action_10 (42) = happyShift action_15
action_10 (44) = happyShift action_16
action_10 (45) = happyShift action_17
action_10 (46) = happyShift action_2
action_10 (48) = happyShift action_18
action_10 (49) = happyShift action_19
action_10 (4) = happyGoto action_28
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (13) = happyShift action_4
action_11 (14) = happyShift action_5
action_11 (15) = happyShift action_6
action_11 (16) = happyShift action_7
action_11 (17) = happyShift action_8
action_11 (18) = happyShift action_9
action_11 (25) = happyShift action_10
action_11 (28) = happyShift action_11
action_11 (29) = happyShift action_12
action_11 (37) = happyShift action_13
action_11 (39) = happyShift action_14
action_11 (42) = happyShift action_15
action_11 (44) = happyShift action_16
action_11 (45) = happyShift action_17
action_11 (46) = happyShift action_2
action_11 (48) = happyShift action_18
action_11 (49) = happyShift action_19
action_11 (4) = happyGoto action_27
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (13) = happyShift action_4
action_12 (14) = happyShift action_5
action_12 (15) = happyShift action_6
action_12 (16) = happyShift action_7
action_12 (17) = happyShift action_8
action_12 (18) = happyShift action_9
action_12 (25) = happyShift action_10
action_12 (28) = happyShift action_11
action_12 (29) = happyShift action_12
action_12 (37) = happyShift action_13
action_12 (39) = happyShift action_14
action_12 (42) = happyShift action_15
action_12 (44) = happyShift action_16
action_12 (45) = happyShift action_17
action_12 (46) = happyShift action_2
action_12 (48) = happyShift action_18
action_12 (49) = happyShift action_19
action_12 (4) = happyGoto action_26
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (13) = happyShift action_4
action_13 (14) = happyShift action_5
action_13 (15) = happyShift action_6
action_13 (16) = happyShift action_7
action_13 (17) = happyShift action_8
action_13 (18) = happyShift action_9
action_13 (25) = happyShift action_10
action_13 (28) = happyShift action_11
action_13 (29) = happyShift action_12
action_13 (37) = happyShift action_13
action_13 (39) = happyShift action_14
action_13 (42) = happyShift action_15
action_13 (44) = happyShift action_16
action_13 (45) = happyShift action_17
action_13 (46) = happyShift action_2
action_13 (48) = happyShift action_18
action_13 (49) = happyShift action_19
action_13 (4) = happyGoto action_25
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_9

action_15 (13) = happyShift action_4
action_15 (14) = happyShift action_5
action_15 (15) = happyShift action_6
action_15 (16) = happyShift action_7
action_15 (17) = happyShift action_8
action_15 (18) = happyShift action_9
action_15 (25) = happyShift action_10
action_15 (28) = happyShift action_11
action_15 (29) = happyShift action_12
action_15 (37) = happyShift action_13
action_15 (39) = happyShift action_14
action_15 (42) = happyShift action_15
action_15 (44) = happyShift action_16
action_15 (45) = happyShift action_17
action_15 (46) = happyShift action_2
action_15 (48) = happyShift action_18
action_15 (49) = happyShift action_19
action_15 (4) = happyGoto action_24
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_10

action_17 (15) = happyShift action_21
action_17 (16) = happyShift action_22
action_17 (45) = happyShift action_23
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (13) = happyShift action_4
action_18 (14) = happyShift action_5
action_18 (15) = happyShift action_6
action_18 (16) = happyShift action_7
action_18 (17) = happyShift action_8
action_18 (18) = happyShift action_9
action_18 (25) = happyShift action_10
action_18 (28) = happyShift action_11
action_18 (29) = happyShift action_12
action_18 (37) = happyShift action_13
action_18 (39) = happyShift action_14
action_18 (42) = happyShift action_15
action_18 (44) = happyShift action_16
action_18 (45) = happyShift action_17
action_18 (46) = happyShift action_2
action_18 (48) = happyShift action_18
action_18 (49) = happyShift action_19
action_18 (4) = happyGoto action_20
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_11

action_20 (17) = happyShift action_58
action_20 (20) = happyShift action_33
action_20 (22) = happyShift action_34
action_20 (23) = happyShift action_35
action_20 (24) = happyShift action_36
action_20 (26) = happyShift action_37
action_20 (27) = happyShift action_38
action_20 (30) = happyShift action_39
action_20 (34) = happyShift action_40
action_20 (36) = happyShift action_41
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (45) = happyShift action_57
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (45) = happyShift action_56
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_30

action_24 (22) = happyShift action_34
action_24 (23) = happyShift action_35
action_24 (24) = happyShift action_36
action_24 (26) = happyShift action_37
action_24 (27) = happyShift action_38
action_24 (30) = happyShift action_39
action_24 (34) = happyShift action_40
action_24 (36) = happyShift action_41
action_24 _ = happyReduce_26

action_25 (22) = happyShift action_34
action_25 (23) = happyShift action_35
action_25 (24) = happyShift action_36
action_25 (26) = happyShift action_37
action_25 (27) = happyShift action_38
action_25 (30) = happyShift action_39
action_25 (36) = happyShift action_41
action_25 _ = happyReduce_8

action_26 (22) = happyShift action_34
action_26 (23) = happyShift action_35
action_26 (24) = happyShift action_36
action_26 (26) = happyShift action_37
action_26 (27) = happyShift action_38
action_26 (30) = happyShift action_39
action_26 (36) = happyShift action_41
action_26 _ = happyReduce_7

action_27 (20) = happyShift action_33
action_27 (22) = happyShift action_34
action_27 (23) = happyShift action_35
action_27 (24) = happyShift action_36
action_27 (26) = happyShift action_37
action_27 (27) = happyShift action_38
action_27 (30) = happyShift action_39
action_27 (34) = happyShift action_40
action_27 (36) = happyShift action_41
action_27 _ = happyReduce_32

action_28 (20) = happyShift action_33
action_28 (22) = happyShift action_34
action_28 (23) = happyShift action_35
action_28 (24) = happyShift action_36
action_28 (26) = happyShift action_37
action_28 (27) = happyShift action_38
action_28 (30) = happyShift action_39
action_28 (34) = happyShift action_40
action_28 (36) = happyShift action_41
action_28 _ = happyReduce_21

action_29 _ = happyReduce_31

action_30 (22) = happyShift action_34
action_30 (23) = happyShift action_35
action_30 (24) = happyShift action_36
action_30 (26) = happyShift action_37
action_30 (27) = happyShift action_38
action_30 (30) = happyShift action_39
action_30 (36) = happyShift action_41
action_30 _ = happyReduce_5

action_31 (13) = happyShift action_4
action_31 (14) = happyShift action_5
action_31 (15) = happyShift action_6
action_31 (16) = happyShift action_7
action_31 (17) = happyShift action_8
action_31 (18) = happyShift action_9
action_31 (25) = happyShift action_10
action_31 (28) = happyShift action_11
action_31 (29) = happyShift action_12
action_31 (37) = happyShift action_13
action_31 (39) = happyShift action_14
action_31 (42) = happyShift action_15
action_31 (44) = happyShift action_16
action_31 (45) = happyShift action_17
action_31 (46) = happyShift action_2
action_31 (48) = happyShift action_18
action_31 (49) = happyShift action_19
action_31 (4) = happyGoto action_55
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (15) = happyShift action_53
action_32 (40) = happyShift action_54
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (13) = happyShift action_4
action_33 (14) = happyShift action_5
action_33 (15) = happyShift action_6
action_33 (16) = happyShift action_7
action_33 (17) = happyShift action_8
action_33 (18) = happyShift action_9
action_33 (25) = happyShift action_10
action_33 (28) = happyShift action_11
action_33 (29) = happyShift action_12
action_33 (37) = happyShift action_13
action_33 (39) = happyShift action_14
action_33 (42) = happyShift action_15
action_33 (44) = happyShift action_16
action_33 (45) = happyShift action_17
action_33 (46) = happyShift action_2
action_33 (48) = happyShift action_18
action_33 (49) = happyShift action_19
action_33 (4) = happyGoto action_52
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (13) = happyShift action_4
action_34 (14) = happyShift action_5
action_34 (15) = happyShift action_6
action_34 (16) = happyShift action_7
action_34 (17) = happyShift action_8
action_34 (18) = happyShift action_9
action_34 (25) = happyShift action_10
action_34 (28) = happyShift action_11
action_34 (29) = happyShift action_12
action_34 (37) = happyShift action_13
action_34 (39) = happyShift action_14
action_34 (42) = happyShift action_15
action_34 (44) = happyShift action_16
action_34 (45) = happyShift action_17
action_34 (46) = happyShift action_2
action_34 (48) = happyShift action_18
action_34 (49) = happyShift action_19
action_34 (4) = happyGoto action_51
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (13) = happyShift action_4
action_35 (14) = happyShift action_5
action_35 (15) = happyShift action_6
action_35 (16) = happyShift action_7
action_35 (17) = happyShift action_8
action_35 (18) = happyShift action_9
action_35 (25) = happyShift action_10
action_35 (28) = happyShift action_11
action_35 (29) = happyShift action_12
action_35 (37) = happyShift action_13
action_35 (39) = happyShift action_14
action_35 (42) = happyShift action_15
action_35 (44) = happyShift action_16
action_35 (45) = happyShift action_17
action_35 (46) = happyShift action_2
action_35 (48) = happyShift action_18
action_35 (49) = happyShift action_19
action_35 (4) = happyGoto action_50
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (13) = happyShift action_4
action_36 (14) = happyShift action_5
action_36 (15) = happyShift action_6
action_36 (16) = happyShift action_7
action_36 (17) = happyShift action_8
action_36 (18) = happyShift action_9
action_36 (25) = happyShift action_10
action_36 (28) = happyShift action_11
action_36 (29) = happyShift action_12
action_36 (37) = happyShift action_13
action_36 (39) = happyShift action_14
action_36 (42) = happyShift action_15
action_36 (44) = happyShift action_16
action_36 (45) = happyShift action_17
action_36 (46) = happyShift action_2
action_36 (48) = happyShift action_18
action_36 (49) = happyShift action_19
action_36 (4) = happyGoto action_49
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (13) = happyShift action_4
action_37 (14) = happyShift action_5
action_37 (15) = happyShift action_6
action_37 (16) = happyShift action_7
action_37 (17) = happyShift action_8
action_37 (18) = happyShift action_9
action_37 (25) = happyShift action_10
action_37 (28) = happyShift action_11
action_37 (29) = happyShift action_12
action_37 (37) = happyShift action_13
action_37 (39) = happyShift action_14
action_37 (42) = happyShift action_15
action_37 (44) = happyShift action_16
action_37 (45) = happyShift action_17
action_37 (46) = happyShift action_2
action_37 (48) = happyShift action_18
action_37 (49) = happyShift action_19
action_37 (4) = happyGoto action_48
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (13) = happyShift action_4
action_38 (14) = happyShift action_5
action_38 (15) = happyShift action_6
action_38 (16) = happyShift action_7
action_38 (17) = happyShift action_8
action_38 (18) = happyShift action_9
action_38 (25) = happyShift action_10
action_38 (28) = happyShift action_11
action_38 (29) = happyShift action_12
action_38 (37) = happyShift action_13
action_38 (39) = happyShift action_14
action_38 (42) = happyShift action_15
action_38 (44) = happyShift action_16
action_38 (45) = happyShift action_17
action_38 (46) = happyShift action_2
action_38 (48) = happyShift action_18
action_38 (49) = happyShift action_19
action_38 (4) = happyGoto action_47
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (13) = happyShift action_4
action_39 (14) = happyShift action_5
action_39 (15) = happyShift action_6
action_39 (16) = happyShift action_7
action_39 (17) = happyShift action_8
action_39 (18) = happyShift action_9
action_39 (25) = happyShift action_10
action_39 (28) = happyShift action_11
action_39 (29) = happyShift action_12
action_39 (37) = happyShift action_13
action_39 (39) = happyShift action_14
action_39 (42) = happyShift action_15
action_39 (44) = happyShift action_16
action_39 (45) = happyShift action_17
action_39 (46) = happyShift action_2
action_39 (48) = happyShift action_18
action_39 (49) = happyShift action_19
action_39 (4) = happyGoto action_46
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (13) = happyShift action_4
action_40 (14) = happyShift action_5
action_40 (15) = happyShift action_6
action_40 (16) = happyShift action_7
action_40 (17) = happyShift action_8
action_40 (18) = happyShift action_9
action_40 (25) = happyShift action_10
action_40 (28) = happyShift action_11
action_40 (29) = happyShift action_12
action_40 (37) = happyShift action_13
action_40 (39) = happyShift action_14
action_40 (42) = happyShift action_15
action_40 (44) = happyShift action_16
action_40 (45) = happyShift action_17
action_40 (46) = happyShift action_2
action_40 (48) = happyShift action_18
action_40 (49) = happyShift action_19
action_40 (4) = happyGoto action_45
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (13) = happyShift action_4
action_41 (14) = happyShift action_5
action_41 (15) = happyShift action_6
action_41 (16) = happyShift action_7
action_41 (17) = happyShift action_8
action_41 (18) = happyShift action_9
action_41 (25) = happyShift action_10
action_41 (28) = happyShift action_11
action_41 (29) = happyShift action_12
action_41 (37) = happyShift action_13
action_41 (39) = happyShift action_14
action_41 (42) = happyShift action_15
action_41 (44) = happyShift action_16
action_41 (45) = happyShift action_17
action_41 (46) = happyShift action_2
action_41 (48) = happyShift action_18
action_41 (49) = happyShift action_19
action_41 (4) = happyGoto action_44
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (20) = happyShift action_33
action_42 (22) = happyShift action_34
action_42 (23) = happyShift action_35
action_42 (24) = happyShift action_36
action_42 (26) = happyShift action_37
action_42 (27) = happyShift action_38
action_42 (30) = happyShift action_39
action_42 (34) = happyShift action_40
action_42 (36) = happyShift action_41
action_42 (47) = happyShift action_43
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_1

action_44 (20) = happyShift action_33
action_44 (22) = happyShift action_34
action_44 (23) = happyShift action_35
action_44 (24) = happyShift action_36
action_44 (26) = happyShift action_37
action_44 (27) = happyShift action_38
action_44 (30) = happyShift action_39
action_44 (34) = happyShift action_40
action_44 (36) = happyShift action_41
action_44 _ = happyReduce_25

action_45 (22) = happyShift action_34
action_45 (23) = happyShift action_35
action_45 (24) = happyShift action_36
action_45 (26) = happyShift action_37
action_45 (27) = happyShift action_38
action_45 (30) = happyShift action_39
action_45 (36) = happyShift action_41
action_45 _ = happyReduce_23

action_46 (20) = happyShift action_33
action_46 (22) = happyShift action_34
action_46 (23) = happyShift action_35
action_46 (24) = happyShift action_36
action_46 (26) = happyShift action_37
action_46 (27) = happyShift action_38
action_46 (30) = happyShift action_39
action_46 (34) = happyShift action_40
action_46 (36) = happyShift action_41
action_46 _ = happyReduce_17

action_47 (20) = happyShift action_33
action_47 (22) = happyShift action_34
action_47 (23) = happyShift action_35
action_47 (24) = happyShift action_36
action_47 (26) = happyShift action_37
action_47 (27) = happyShift action_38
action_47 (28) = happyShift action_62
action_47 (30) = happyShift action_39
action_47 (34) = happyShift action_40
action_47 (36) = happyShift action_41
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (20) = happyShift action_33
action_48 (22) = happyShift action_34
action_48 (23) = happyShift action_35
action_48 (24) = happyShift action_36
action_48 (26) = happyShift action_37
action_48 (27) = happyShift action_38
action_48 (30) = happyShift action_39
action_48 (34) = happyShift action_40
action_48 (36) = happyShift action_41
action_48 _ = happyReduce_22

action_49 (20) = happyShift action_33
action_49 (22) = happyShift action_34
action_49 (23) = happyShift action_35
action_49 (24) = happyShift action_36
action_49 (26) = happyShift action_37
action_49 (27) = happyShift action_38
action_49 (28) = happyShift action_61
action_49 (30) = happyShift action_39
action_49 (34) = happyShift action_40
action_49 (36) = happyShift action_41
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (20) = happyShift action_33
action_50 (22) = happyShift action_34
action_50 (23) = happyShift action_35
action_50 (24) = happyShift action_36
action_50 (26) = happyShift action_37
action_50 (27) = happyShift action_38
action_50 (30) = happyShift action_39
action_50 (34) = happyShift action_40
action_50 (36) = happyShift action_41
action_50 _ = happyReduce_19

action_51 (20) = happyShift action_33
action_51 (22) = happyShift action_34
action_51 (23) = happyShift action_35
action_51 (24) = happyShift action_36
action_51 (26) = happyShift action_37
action_51 (27) = happyShift action_38
action_51 (30) = happyShift action_39
action_51 (34) = happyShift action_40
action_51 (36) = happyShift action_41
action_51 _ = happyReduce_18

action_52 (22) = happyShift action_34
action_52 (23) = happyShift action_35
action_52 (24) = happyShift action_36
action_52 (26) = happyShift action_37
action_52 (27) = happyShift action_38
action_52 (30) = happyShift action_39
action_52 (34) = happyShift action_40
action_52 (36) = happyShift action_41
action_52 _ = happyReduce_14

action_53 (33) = happyShift action_60
action_53 _ = happyReduce_15

action_54 _ = happyReduce_16

action_55 (22) = happyShift action_34
action_55 (23) = happyShift action_35
action_55 (24) = happyShift action_36
action_55 (26) = happyShift action_37
action_55 (27) = happyShift action_38
action_55 (30) = happyShift action_39
action_55 (34) = happyShift action_40
action_55 (36) = happyShift action_41
action_55 _ = happyReduce_13

action_56 _ = happyReduce_28

action_57 _ = happyReduce_29

action_58 (13) = happyShift action_4
action_58 (14) = happyShift action_5
action_58 (15) = happyShift action_6
action_58 (16) = happyShift action_7
action_58 (17) = happyShift action_8
action_58 (18) = happyShift action_9
action_58 (25) = happyShift action_10
action_58 (28) = happyShift action_11
action_58 (29) = happyShift action_12
action_58 (37) = happyShift action_13
action_58 (39) = happyShift action_14
action_58 (42) = happyShift action_15
action_58 (44) = happyShift action_16
action_58 (45) = happyShift action_17
action_58 (46) = happyShift action_2
action_58 (48) = happyShift action_18
action_58 (49) = happyShift action_19
action_58 (4) = happyGoto action_59
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (20) = happyShift action_33
action_59 (22) = happyShift action_34
action_59 (23) = happyShift action_35
action_59 (24) = happyShift action_36
action_59 (26) = happyShift action_37
action_59 (27) = happyShift action_38
action_59 (29) = happyShift action_66
action_59 (30) = happyShift action_39
action_59 (34) = happyShift action_40
action_59 (36) = happyShift action_41
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (15) = happyShift action_65
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (13) = happyShift action_4
action_61 (14) = happyShift action_5
action_61 (15) = happyShift action_6
action_61 (16) = happyShift action_7
action_61 (17) = happyShift action_8
action_61 (18) = happyShift action_9
action_61 (25) = happyShift action_10
action_61 (28) = happyShift action_11
action_61 (29) = happyShift action_12
action_61 (37) = happyShift action_13
action_61 (39) = happyShift action_14
action_61 (42) = happyShift action_15
action_61 (44) = happyShift action_16
action_61 (45) = happyShift action_17
action_61 (46) = happyShift action_2
action_61 (48) = happyShift action_18
action_61 (49) = happyShift action_19
action_61 (4) = happyGoto action_64
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (13) = happyShift action_4
action_62 (14) = happyShift action_5
action_62 (15) = happyShift action_6
action_62 (16) = happyShift action_7
action_62 (17) = happyShift action_8
action_62 (18) = happyShift action_9
action_62 (25) = happyShift action_10
action_62 (28) = happyShift action_11
action_62 (29) = happyShift action_12
action_62 (37) = happyShift action_13
action_62 (39) = happyShift action_14
action_62 (42) = happyShift action_15
action_62 (44) = happyShift action_16
action_62 (45) = happyShift action_17
action_62 (46) = happyShift action_2
action_62 (48) = happyShift action_18
action_62 (49) = happyShift action_19
action_62 (4) = happyGoto action_63
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (20) = happyShift action_33
action_63 (22) = happyShift action_34
action_63 (23) = happyShift action_35
action_63 (24) = happyShift action_36
action_63 (26) = happyShift action_37
action_63 (27) = happyShift action_38
action_63 (30) = happyShift action_39
action_63 (34) = happyShift action_40
action_63 (36) = happyShift action_41
action_63 _ = happyReduce_24

action_64 (20) = happyShift action_33
action_64 (22) = happyShift action_34
action_64 (23) = happyShift action_35
action_64 (24) = happyShift action_36
action_64 (26) = happyShift action_37
action_64 (27) = happyShift action_38
action_64 (30) = happyShift action_39
action_64 (34) = happyShift action_40
action_64 (36) = happyShift action_41
action_64 _ = happyReduce_20

action_65 _ = happyReduce_27

action_66 (13) = happyShift action_4
action_66 (14) = happyShift action_5
action_66 (15) = happyShift action_6
action_66 (16) = happyShift action_7
action_66 (17) = happyShift action_8
action_66 (18) = happyShift action_9
action_66 (25) = happyShift action_10
action_66 (28) = happyShift action_11
action_66 (29) = happyShift action_12
action_66 (37) = happyShift action_13
action_66 (39) = happyShift action_14
action_66 (42) = happyShift action_15
action_66 (44) = happyShift action_16
action_66 (45) = happyShift action_17
action_66 (46) = happyShift action_2
action_66 (48) = happyShift action_18
action_66 (49) = happyShift action_19
action_66 (4) = happyGoto action_67
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (20) = happyShift action_33
action_67 (22) = happyShift action_34
action_67 (23) = happyShift action_35
action_67 (24) = happyShift action_36
action_67 (26) = happyShift action_37
action_67 (27) = happyShift action_38
action_67 (30) = happyShift action_39
action_67 (34) = happyShift action_40
action_67 (36) = happyShift action_41
action_67 (37) = happyShift action_68
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (13) = happyShift action_4
action_68 (14) = happyShift action_5
action_68 (15) = happyShift action_6
action_68 (16) = happyShift action_7
action_68 (17) = happyShift action_8
action_68 (18) = happyShift action_9
action_68 (25) = happyShift action_10
action_68 (28) = happyShift action_11
action_68 (29) = happyShift action_12
action_68 (37) = happyShift action_13
action_68 (39) = happyShift action_14
action_68 (42) = happyShift action_15
action_68 (44) = happyShift action_16
action_68 (45) = happyShift action_17
action_68 (46) = happyShift action_2
action_68 (48) = happyShift action_18
action_68 (49) = happyShift action_19
action_68 (4) = happyGoto action_69
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (22) = happyShift action_34
action_69 (23) = happyShift action_35
action_69 (24) = happyShift action_36
action_69 (26) = happyShift action_37
action_69 (27) = happyShift action_38
action_69 (30) = happyShift action_39
action_69 (36) = happyShift action_41
action_69 _ = happyReduce_6

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn4
		 (TmTrue
	)

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (TmFalse
	)

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn4
		 (Int happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Select happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happyReduce 8 4 happyReduction_6
happyReduction_6 ((HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (From happy_var_2 (Select happy_var_4) (Where happy_var_6) (OrderBy happy_var_8)
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_2  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Where happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (OrderBy happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  4 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn4
		 (Alphabetical
	)

happyReduce_10 = happySpecReduce_1  4 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn4
		 (Empty
	)

happyReduce_11 = happySpecReduce_1  4 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn4
		 (Last
	)

happyReduce_12 = happySpecReduce_1  4 happyReduction_12
happyReduction_12 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn4
		 (Table happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn4
		 (And (Table happy_var_1) happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (And happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyTerminal (TokenInt _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn4
		 (FromTable (Table happy_var_1) (Column happy_var_3)
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 _
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn4
		 (FromTable (Table happy_var_1) All
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Comma happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  4 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Conjunction happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Composition happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 5 4 happyReduction_20
happyReduction_20 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (RightJoin happy_var_1 happy_var_3 (On happy_var_5)
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_2  4 happyReduction_21
happyReduction_21 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (ThreePaths happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  4 happyReduction_22
happyReduction_22 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (MatchPairs happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  4 happyReduction_23
happyReduction_23 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Equal happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 5 4 happyReduction_24
happyReduction_24 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LeftJoin happy_var_1 happy_var_3 (On happy_var_5)
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  4 happyReduction_25
happyReduction_25 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Merge happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  4 happyReduction_26
happyReduction_26 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Not happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 5 4 happyReduction_27
happyReduction_27 ((HappyTerminal (TokenInt _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Cell (Table happy_var_1) (Column happy_var_3) (Row happy_var_5)
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_3  4 happyReduction_28
happyReduction_28 _
	(HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmString happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  4 happyReduction_29
happyReduction_29 _
	(HappyTerminal (TokenInt _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmInt happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  4 happyReduction_30
happyReduction_30 _
	_
	 =  HappyAbsSyn4
		 (Empty
	)

happyReduce_31 = happySpecReduce_2  4 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInt _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (Column happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  4 happyReduction_32
happyReduction_32 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (On happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  5 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn5
		 (TyBool
	)

happyReduce_34 = happySpecReduce_1  5 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn5
		 (TyInt
	)

happyReduce_35 = happySpecReduce_1  5 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn5
		 (TyString
	)

happyReduce_36 = happySpecReduce_1  5 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn5
		 (TyOrdering
	)

happyReduce_37 = happySpecReduce_1  5 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn5
		 (TyEmpty
	)

happyReduce_38 = happySpecReduce_1  5 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn5
		 (TyCell
	)

happyNewToken action sts stk [] =
	action 50 50 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIn _ -> cont 6;
	TokenTypeBool _ -> cont 7;
	TokenTypeInt _ -> cont 8;
	TokenTypeString _ -> cont 9;
	TokenTypeOrdering _ -> cont 10;
	TokenTypeEmpty _ -> cont 11;
	TokenTypeCell _ -> cont 12;
	TokenTrue _ -> cont 13;
	TokenFalse _ -> cont 14;
	TokenInt _ happy_dollar_dollar -> cont 15;
	TokenVar _ happy_dollar_dollar -> cont 16;
	TokenSelect _ -> cont 17;
	TokenColumn _ happy_dollar_dollar -> cont 18;
	TokenConcatenate _ -> cont 19;
	TokenAnd _ -> cont 20;
	TokenAny _ -> cont 21;
	TokenConjunction _ -> cont 22;
	TokenComposition _ -> cont 23;
	TokenRightJoin _ -> cont 24;
	TokenThreePaths _ -> cont 25;
	TokenMatchPairs _ -> cont 26;
	TokenLeftJoin _ -> cont 27;
	TokenOn _ -> cont 28;
	TokenWhere _ -> cont 29;
	TokenComma _ -> cont 30;
	TokenUnder _ -> cont 31;
	TokenRow _ -> cont 32;
	TokenDot _ -> cont 33;
	TokenEqual _ -> cont 34;
	TokenDrop _ -> cont 35;
	TokenMerge _ -> cont 36;
	TokenOrderBy _ -> cont 37;
	TokenAssign _ -> cont 38;
	TokenAlphabetical _ -> cont 39;
	TokenAll _ -> cont 40;
	TokenOr _ -> cont 41;
	TokenNot _ -> cont 42;
	TokenXor _ -> cont 43;
	TokenEmpty _ -> cont 44;
	TokenQuotation _ -> cont 45;
	TokenRParenthesis _ -> cont 46;
	TokenLParenthesis _ -> cont 47;
	TokenFrom _ -> cont 48;
	TokenLast _ -> cont 49;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 50 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error"
parseError (t:_) = error ("Parse error at line:column " ++ (tokenPosn t))

data Type = TyBool
          | TyInt
          | TyString
          | TyOrdering
          | TyEmpty
          | TyCell
          deriving (Show,Eq)

type Environment = [ (String,Exp) ]

data Exp = Var String
         | TmTrue
         | TmFalse
         | Select Exp
         | From Exp Exp Exp Exp
         | Concatenate Exp Exp
         | Any Exp
         | Where Exp
         | Under Exp Exp
         | Drop Exp Exp
         | OrderBy Exp
         | Assign Exp Exp
         | Alphabetical
         | Empty
         | And Exp Exp
         | Dot Exp Exp
         | Or Exp Exp
         | Xor Exp Exp
         | Table String
         | FromTable Exp Exp
         | Comma Exp Exp
         | Conjunction Exp Exp
         | Composition Exp Exp
         | RightJoin Exp Exp Exp
         | ThreePaths Exp
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
         deriving (Show,Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
