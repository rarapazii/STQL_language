{-# OPTIONS_GHC -w #-}
module Grammar where
import Token
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,220) ([4096,0,0,1024,0,0,0,0,0,0,256,0,0,0,0,4,0,0,0,0,63488,16404,16082,32768,12224,1,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,1,0,63488,16404,16082,15872,36869,4020,0,0,0,21472,18688,251,5368,53824,62,1342,46224,32783,335,60708,57347,83,64329,0,0,0,0,0,0,20352,9217,1005,2048,0,0,512,0,0,128,0,0,61472,4171,0,8,0,0,48898,44,32768,0,0,8192,19442,0,0,1024,0,256,0,0,1342,46224,32783,335,60708,57347,83,64329,63488,16404,16082,15872,36869,4020,20352,9217,1005,21472,18688,251,5368,53824,62,1342,46224,15,61472,64,0,15368,16,0,48898,4,32768,10176,1,8192,0,0,2048,0,0,512,12,0,128,3,0,0,0,57344,83,64329,63488,16404,16082,15872,36869,4020,20352,9217,1005,0,0,0,0,0,64,8192,0,0,0,0,4,1,72,0,48898,12,32768,12240,1,40960,19440,0,2048,4860,0,5368,53824,62,1342,46224,32783,335,60708,3,4,16,0,0,0,0,0,0,1024,8192,1,0,0,0,0,0,0,0,768,32768,335,60708,3,1,72,0,48898,36,32768,12224,1,8192,19440,0,0,0,0,0,1024,0,49280,303,0,4,288,0,0,48,16384,0,18,0,0,9,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseProg","Prog","Def","Expr","Clauses","Clause","Pattern","int","bool","string","var","proc","imply","'.$'","let","in","if","then","else","endCase","plus","minus","times","div","and","or","not","lessThan","def","empty","cons","','","'('","')'","readTtlFile","case","of","print","read","nl","space","show","bar","%eof"]
        bit_start = st Prelude.* 46
        bit_end = (st Prelude.+ 1) Prelude.* 46
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..45]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (13) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (13) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (31) = happyShift action_7
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (46) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (13) = happyShift action_3
action_5 (4) = happyGoto action_6
action_5 (5) = happyGoto action_5
action_5 _ = happyReduce_1

action_6 _ = happyReduce_2

action_7 (10) = happyShift action_9
action_7 (11) = happyShift action_10
action_7 (12) = happyShift action_11
action_7 (13) = happyShift action_12
action_7 (14) = happyShift action_13
action_7 (17) = happyShift action_14
action_7 (19) = happyShift action_15
action_7 (29) = happyShift action_16
action_7 (32) = happyShift action_17
action_7 (35) = happyShift action_18
action_7 (37) = happyShift action_19
action_7 (38) = happyShift action_20
action_7 (40) = happyShift action_21
action_7 (41) = happyShift action_22
action_7 (42) = happyShift action_23
action_7 (43) = happyShift action_24
action_7 (44) = happyShift action_25
action_7 (6) = happyGoto action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (16) = happyShift action_36
action_8 (23) = happyShift action_37
action_8 (24) = happyShift action_38
action_8 (25) = happyShift action_39
action_8 (26) = happyShift action_40
action_8 (27) = happyShift action_41
action_8 (28) = happyShift action_42
action_8 (30) = happyShift action_43
action_8 (33) = happyShift action_44
action_8 _ = happyReduce_3

action_9 _ = happyReduce_21

action_10 _ = happyReduce_22

action_11 _ = happyReduce_23

action_12 _ = happyReduce_24

action_13 (13) = happyShift action_35
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (13) = happyShift action_34
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (10) = happyShift action_9
action_15 (11) = happyShift action_10
action_15 (12) = happyShift action_11
action_15 (13) = happyShift action_12
action_15 (14) = happyShift action_13
action_15 (17) = happyShift action_14
action_15 (19) = happyShift action_15
action_15 (29) = happyShift action_16
action_15 (32) = happyShift action_17
action_15 (35) = happyShift action_18
action_15 (37) = happyShift action_19
action_15 (38) = happyShift action_20
action_15 (40) = happyShift action_21
action_15 (41) = happyShift action_22
action_15 (42) = happyShift action_23
action_15 (43) = happyShift action_24
action_15 (44) = happyShift action_25
action_15 (6) = happyGoto action_33
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (10) = happyShift action_9
action_16 (11) = happyShift action_10
action_16 (12) = happyShift action_11
action_16 (13) = happyShift action_12
action_16 (14) = happyShift action_13
action_16 (17) = happyShift action_14
action_16 (19) = happyShift action_15
action_16 (29) = happyShift action_16
action_16 (32) = happyShift action_17
action_16 (35) = happyShift action_18
action_16 (37) = happyShift action_19
action_16 (38) = happyShift action_20
action_16 (40) = happyShift action_21
action_16 (41) = happyShift action_22
action_16 (42) = happyShift action_23
action_16 (43) = happyShift action_24
action_16 (44) = happyShift action_25
action_16 (6) = happyGoto action_32
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_17

action_18 (10) = happyShift action_9
action_18 (11) = happyShift action_10
action_18 (12) = happyShift action_11
action_18 (13) = happyShift action_12
action_18 (14) = happyShift action_13
action_18 (17) = happyShift action_14
action_18 (19) = happyShift action_15
action_18 (29) = happyShift action_16
action_18 (32) = happyShift action_17
action_18 (35) = happyShift action_18
action_18 (37) = happyShift action_19
action_18 (38) = happyShift action_20
action_18 (40) = happyShift action_21
action_18 (41) = happyShift action_22
action_18 (42) = happyShift action_23
action_18 (43) = happyShift action_24
action_18 (44) = happyShift action_25
action_18 (6) = happyGoto action_31
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (10) = happyShift action_9
action_19 (11) = happyShift action_10
action_19 (12) = happyShift action_11
action_19 (13) = happyShift action_12
action_19 (14) = happyShift action_13
action_19 (17) = happyShift action_14
action_19 (19) = happyShift action_15
action_19 (29) = happyShift action_16
action_19 (32) = happyShift action_17
action_19 (35) = happyShift action_18
action_19 (37) = happyShift action_19
action_19 (38) = happyShift action_20
action_19 (40) = happyShift action_21
action_19 (41) = happyShift action_22
action_19 (42) = happyShift action_23
action_19 (43) = happyShift action_24
action_19 (44) = happyShift action_25
action_19 (6) = happyGoto action_30
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (10) = happyShift action_9
action_20 (11) = happyShift action_10
action_20 (12) = happyShift action_11
action_20 (13) = happyShift action_12
action_20 (14) = happyShift action_13
action_20 (17) = happyShift action_14
action_20 (19) = happyShift action_15
action_20 (29) = happyShift action_16
action_20 (32) = happyShift action_17
action_20 (35) = happyShift action_18
action_20 (37) = happyShift action_19
action_20 (38) = happyShift action_20
action_20 (40) = happyShift action_21
action_20 (41) = happyShift action_22
action_20 (42) = happyShift action_23
action_20 (43) = happyShift action_24
action_20 (44) = happyShift action_25
action_20 (6) = happyGoto action_29
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (10) = happyShift action_9
action_21 (11) = happyShift action_10
action_21 (12) = happyShift action_11
action_21 (13) = happyShift action_12
action_21 (14) = happyShift action_13
action_21 (17) = happyShift action_14
action_21 (19) = happyShift action_15
action_21 (29) = happyShift action_16
action_21 (32) = happyShift action_17
action_21 (35) = happyShift action_18
action_21 (37) = happyShift action_19
action_21 (38) = happyShift action_20
action_21 (40) = happyShift action_21
action_21 (41) = happyShift action_22
action_21 (42) = happyShift action_23
action_21 (43) = happyShift action_24
action_21 (44) = happyShift action_25
action_21 (6) = happyGoto action_28
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (10) = happyShift action_9
action_22 (11) = happyShift action_10
action_22 (12) = happyShift action_11
action_22 (13) = happyShift action_12
action_22 (14) = happyShift action_13
action_22 (17) = happyShift action_14
action_22 (19) = happyShift action_15
action_22 (29) = happyShift action_16
action_22 (32) = happyShift action_17
action_22 (35) = happyShift action_18
action_22 (37) = happyShift action_19
action_22 (38) = happyShift action_20
action_22 (40) = happyShift action_21
action_22 (41) = happyShift action_22
action_22 (42) = happyShift action_23
action_22 (43) = happyShift action_24
action_22 (44) = happyShift action_25
action_22 (6) = happyGoto action_27
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_29

action_24 _ = happyReduce_30

action_25 (10) = happyShift action_9
action_25 (11) = happyShift action_10
action_25 (12) = happyShift action_11
action_25 (13) = happyShift action_12
action_25 (14) = happyShift action_13
action_25 (17) = happyShift action_14
action_25 (19) = happyShift action_15
action_25 (29) = happyShift action_16
action_25 (32) = happyShift action_17
action_25 (35) = happyShift action_18
action_25 (37) = happyShift action_19
action_25 (38) = happyShift action_20
action_25 (40) = happyShift action_21
action_25 (41) = happyShift action_22
action_25 (42) = happyShift action_23
action_25 (43) = happyShift action_24
action_25 (44) = happyShift action_25
action_25 (6) = happyGoto action_26
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (16) = happyShift action_36
action_26 _ = happyReduce_28

action_27 (16) = happyShift action_36
action_27 _ = happyReduce_27

action_28 (16) = happyShift action_36
action_28 _ = happyReduce_26

action_29 (16) = happyShift action_36
action_29 (23) = happyShift action_37
action_29 (24) = happyShift action_38
action_29 (25) = happyShift action_39
action_29 (26) = happyShift action_40
action_29 (27) = happyShift action_41
action_29 (28) = happyShift action_42
action_29 (30) = happyShift action_43
action_29 (33) = happyShift action_44
action_29 (39) = happyShift action_59
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (16) = happyShift action_36
action_30 _ = happyReduce_19

action_31 (16) = happyShift action_36
action_31 (23) = happyShift action_37
action_31 (24) = happyShift action_38
action_31 (25) = happyShift action_39
action_31 (26) = happyShift action_40
action_31 (27) = happyShift action_41
action_31 (28) = happyShift action_42
action_31 (30) = happyShift action_43
action_31 (33) = happyShift action_44
action_31 (34) = happyShift action_57
action_31 (36) = happyShift action_58
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (16) = happyShift action_36
action_32 _ = happyReduce_16

action_33 (16) = happyShift action_36
action_33 (20) = happyShift action_56
action_33 (23) = happyShift action_37
action_33 (24) = happyShift action_38
action_33 (25) = happyShift action_39
action_33 (26) = happyShift action_40
action_33 (27) = happyShift action_41
action_33 (28) = happyShift action_42
action_33 (30) = happyShift action_43
action_33 (33) = happyShift action_44
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (31) = happyShift action_55
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (15) = happyShift action_54
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (10) = happyShift action_9
action_36 (11) = happyShift action_10
action_36 (12) = happyShift action_11
action_36 (13) = happyShift action_12
action_36 (14) = happyShift action_13
action_36 (17) = happyShift action_14
action_36 (19) = happyShift action_15
action_36 (29) = happyShift action_16
action_36 (32) = happyShift action_17
action_36 (35) = happyShift action_18
action_36 (37) = happyShift action_19
action_36 (38) = happyShift action_20
action_36 (40) = happyShift action_21
action_36 (41) = happyShift action_22
action_36 (42) = happyShift action_23
action_36 (43) = happyShift action_24
action_36 (44) = happyShift action_25
action_36 (6) = happyGoto action_53
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (10) = happyShift action_9
action_37 (11) = happyShift action_10
action_37 (12) = happyShift action_11
action_37 (13) = happyShift action_12
action_37 (14) = happyShift action_13
action_37 (17) = happyShift action_14
action_37 (19) = happyShift action_15
action_37 (29) = happyShift action_16
action_37 (32) = happyShift action_17
action_37 (35) = happyShift action_18
action_37 (37) = happyShift action_19
action_37 (38) = happyShift action_20
action_37 (40) = happyShift action_21
action_37 (41) = happyShift action_22
action_37 (42) = happyShift action_23
action_37 (43) = happyShift action_24
action_37 (44) = happyShift action_25
action_37 (6) = happyGoto action_52
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (10) = happyShift action_9
action_38 (11) = happyShift action_10
action_38 (12) = happyShift action_11
action_38 (13) = happyShift action_12
action_38 (14) = happyShift action_13
action_38 (17) = happyShift action_14
action_38 (19) = happyShift action_15
action_38 (29) = happyShift action_16
action_38 (32) = happyShift action_17
action_38 (35) = happyShift action_18
action_38 (37) = happyShift action_19
action_38 (38) = happyShift action_20
action_38 (40) = happyShift action_21
action_38 (41) = happyShift action_22
action_38 (42) = happyShift action_23
action_38 (43) = happyShift action_24
action_38 (44) = happyShift action_25
action_38 (6) = happyGoto action_51
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (10) = happyShift action_9
action_39 (11) = happyShift action_10
action_39 (12) = happyShift action_11
action_39 (13) = happyShift action_12
action_39 (14) = happyShift action_13
action_39 (17) = happyShift action_14
action_39 (19) = happyShift action_15
action_39 (29) = happyShift action_16
action_39 (32) = happyShift action_17
action_39 (35) = happyShift action_18
action_39 (37) = happyShift action_19
action_39 (38) = happyShift action_20
action_39 (40) = happyShift action_21
action_39 (41) = happyShift action_22
action_39 (42) = happyShift action_23
action_39 (43) = happyShift action_24
action_39 (44) = happyShift action_25
action_39 (6) = happyGoto action_50
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (10) = happyShift action_9
action_40 (11) = happyShift action_10
action_40 (12) = happyShift action_11
action_40 (13) = happyShift action_12
action_40 (14) = happyShift action_13
action_40 (17) = happyShift action_14
action_40 (19) = happyShift action_15
action_40 (29) = happyShift action_16
action_40 (32) = happyShift action_17
action_40 (35) = happyShift action_18
action_40 (37) = happyShift action_19
action_40 (38) = happyShift action_20
action_40 (40) = happyShift action_21
action_40 (41) = happyShift action_22
action_40 (42) = happyShift action_23
action_40 (43) = happyShift action_24
action_40 (44) = happyShift action_25
action_40 (6) = happyGoto action_49
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (10) = happyShift action_9
action_41 (11) = happyShift action_10
action_41 (12) = happyShift action_11
action_41 (13) = happyShift action_12
action_41 (14) = happyShift action_13
action_41 (17) = happyShift action_14
action_41 (19) = happyShift action_15
action_41 (29) = happyShift action_16
action_41 (32) = happyShift action_17
action_41 (35) = happyShift action_18
action_41 (37) = happyShift action_19
action_41 (38) = happyShift action_20
action_41 (40) = happyShift action_21
action_41 (41) = happyShift action_22
action_41 (42) = happyShift action_23
action_41 (43) = happyShift action_24
action_41 (44) = happyShift action_25
action_41 (6) = happyGoto action_48
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (10) = happyShift action_9
action_42 (11) = happyShift action_10
action_42 (12) = happyShift action_11
action_42 (13) = happyShift action_12
action_42 (14) = happyShift action_13
action_42 (17) = happyShift action_14
action_42 (19) = happyShift action_15
action_42 (29) = happyShift action_16
action_42 (32) = happyShift action_17
action_42 (35) = happyShift action_18
action_42 (37) = happyShift action_19
action_42 (38) = happyShift action_20
action_42 (40) = happyShift action_21
action_42 (41) = happyShift action_22
action_42 (42) = happyShift action_23
action_42 (43) = happyShift action_24
action_42 (44) = happyShift action_25
action_42 (6) = happyGoto action_47
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (10) = happyShift action_9
action_43 (11) = happyShift action_10
action_43 (12) = happyShift action_11
action_43 (13) = happyShift action_12
action_43 (14) = happyShift action_13
action_43 (17) = happyShift action_14
action_43 (19) = happyShift action_15
action_43 (29) = happyShift action_16
action_43 (32) = happyShift action_17
action_43 (35) = happyShift action_18
action_43 (37) = happyShift action_19
action_43 (38) = happyShift action_20
action_43 (40) = happyShift action_21
action_43 (41) = happyShift action_22
action_43 (42) = happyShift action_23
action_43 (43) = happyShift action_24
action_43 (44) = happyShift action_25
action_43 (6) = happyGoto action_46
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (10) = happyShift action_9
action_44 (11) = happyShift action_10
action_44 (12) = happyShift action_11
action_44 (13) = happyShift action_12
action_44 (14) = happyShift action_13
action_44 (17) = happyShift action_14
action_44 (19) = happyShift action_15
action_44 (29) = happyShift action_16
action_44 (32) = happyShift action_17
action_44 (35) = happyShift action_18
action_44 (37) = happyShift action_19
action_44 (38) = happyShift action_20
action_44 (40) = happyShift action_21
action_44 (41) = happyShift action_22
action_44 (42) = happyShift action_23
action_44 (43) = happyShift action_24
action_44 (44) = happyShift action_25
action_44 (6) = happyGoto action_45
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (16) = happyShift action_36
action_45 (23) = happyShift action_37
action_45 (24) = happyShift action_38
action_45 (25) = happyShift action_39
action_45 (26) = happyShift action_40
action_45 (33) = happyShift action_44
action_45 _ = happyReduce_12

action_46 (16) = happyShift action_36
action_46 (23) = happyShift action_37
action_46 (24) = happyShift action_38
action_46 (25) = happyShift action_39
action_46 (26) = happyShift action_40
action_46 (30) = happyFail []
action_46 (33) = happyShift action_44
action_46 _ = happyReduce_13

action_47 (16) = happyShift action_36
action_47 (23) = happyShift action_37
action_47 (24) = happyShift action_38
action_47 (25) = happyShift action_39
action_47 (26) = happyShift action_40
action_47 (27) = happyShift action_41
action_47 (28) = happyShift action_42
action_47 (30) = happyShift action_43
action_47 (33) = happyShift action_44
action_47 _ = happyReduce_15

action_48 (16) = happyShift action_36
action_48 (23) = happyShift action_37
action_48 (24) = happyShift action_38
action_48 (25) = happyShift action_39
action_48 (26) = happyShift action_40
action_48 (27) = happyShift action_41
action_48 (30) = happyShift action_43
action_48 (33) = happyShift action_44
action_48 _ = happyReduce_14

action_49 (16) = happyShift action_36
action_49 _ = happyReduce_11

action_50 (16) = happyShift action_36
action_50 _ = happyReduce_10

action_51 (16) = happyShift action_36
action_51 (25) = happyShift action_39
action_51 (26) = happyShift action_40
action_51 _ = happyReduce_9

action_52 (16) = happyShift action_36
action_52 (25) = happyShift action_39
action_52 (26) = happyShift action_40
action_52 _ = happyReduce_8

action_53 _ = happyReduce_20

action_54 (10) = happyShift action_9
action_54 (11) = happyShift action_10
action_54 (12) = happyShift action_11
action_54 (13) = happyShift action_12
action_54 (14) = happyShift action_13
action_54 (17) = happyShift action_14
action_54 (19) = happyShift action_15
action_54 (29) = happyShift action_16
action_54 (32) = happyShift action_17
action_54 (35) = happyShift action_18
action_54 (37) = happyShift action_19
action_54 (38) = happyShift action_20
action_54 (40) = happyShift action_21
action_54 (41) = happyShift action_22
action_54 (42) = happyShift action_23
action_54 (43) = happyShift action_24
action_54 (44) = happyShift action_25
action_54 (6) = happyGoto action_66
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (10) = happyShift action_9
action_55 (11) = happyShift action_10
action_55 (12) = happyShift action_11
action_55 (13) = happyShift action_12
action_55 (14) = happyShift action_13
action_55 (17) = happyShift action_14
action_55 (19) = happyShift action_15
action_55 (29) = happyShift action_16
action_55 (32) = happyShift action_17
action_55 (35) = happyShift action_18
action_55 (37) = happyShift action_19
action_55 (38) = happyShift action_20
action_55 (40) = happyShift action_21
action_55 (41) = happyShift action_22
action_55 (42) = happyShift action_23
action_55 (43) = happyShift action_24
action_55 (44) = happyShift action_25
action_55 (6) = happyGoto action_65
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (10) = happyShift action_9
action_56 (11) = happyShift action_10
action_56 (12) = happyShift action_11
action_56 (13) = happyShift action_12
action_56 (14) = happyShift action_13
action_56 (17) = happyShift action_14
action_56 (19) = happyShift action_15
action_56 (29) = happyShift action_16
action_56 (32) = happyShift action_17
action_56 (35) = happyShift action_18
action_56 (37) = happyShift action_19
action_56 (38) = happyShift action_20
action_56 (40) = happyShift action_21
action_56 (41) = happyShift action_22
action_56 (42) = happyShift action_23
action_56 (43) = happyShift action_24
action_56 (44) = happyShift action_25
action_56 (6) = happyGoto action_64
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (10) = happyShift action_9
action_57 (11) = happyShift action_10
action_57 (12) = happyShift action_11
action_57 (13) = happyShift action_12
action_57 (14) = happyShift action_13
action_57 (17) = happyShift action_14
action_57 (19) = happyShift action_15
action_57 (29) = happyShift action_16
action_57 (32) = happyShift action_17
action_57 (35) = happyShift action_18
action_57 (37) = happyShift action_19
action_57 (38) = happyShift action_20
action_57 (40) = happyShift action_21
action_57 (41) = happyShift action_22
action_57 (42) = happyShift action_23
action_57 (43) = happyShift action_24
action_57 (44) = happyShift action_25
action_57 (6) = happyGoto action_63
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_25

action_59 (45) = happyShift action_62
action_59 (7) = happyGoto action_60
action_59 (8) = happyGoto action_61
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (22) = happyShift action_75
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (45) = happyShift action_62
action_61 (7) = happyGoto action_74
action_61 (8) = happyGoto action_61
action_61 _ = happyReduce_31

action_62 (13) = happyShift action_71
action_62 (32) = happyShift action_72
action_62 (35) = happyShift action_73
action_62 (9) = happyGoto action_70
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (16) = happyShift action_36
action_63 (23) = happyShift action_37
action_63 (24) = happyShift action_38
action_63 (25) = happyShift action_39
action_63 (26) = happyShift action_40
action_63 (27) = happyShift action_41
action_63 (28) = happyShift action_42
action_63 (30) = happyShift action_43
action_63 (33) = happyShift action_44
action_63 (34) = happyShift action_69
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (16) = happyShift action_36
action_64 (21) = happyShift action_68
action_64 (23) = happyShift action_37
action_64 (24) = happyShift action_38
action_64 (25) = happyShift action_39
action_64 (26) = happyShift action_40
action_64 (27) = happyShift action_41
action_64 (28) = happyShift action_42
action_64 (30) = happyShift action_43
action_64 (33) = happyShift action_44
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (16) = happyShift action_36
action_65 (18) = happyShift action_67
action_65 (23) = happyShift action_37
action_65 (24) = happyShift action_38
action_65 (25) = happyShift action_39
action_65 (26) = happyShift action_40
action_65 (27) = happyShift action_41
action_65 (28) = happyShift action_42
action_65 (30) = happyShift action_43
action_65 (33) = happyShift action_44
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (16) = happyShift action_36
action_66 (23) = happyShift action_37
action_66 (24) = happyShift action_38
action_66 (25) = happyShift action_39
action_66 (26) = happyShift action_40
action_66 (27) = happyShift action_41
action_66 (28) = happyShift action_42
action_66 (30) = happyShift action_43
action_66 (33) = happyShift action_44
action_66 _ = happyReduce_7

action_67 (10) = happyShift action_9
action_67 (11) = happyShift action_10
action_67 (12) = happyShift action_11
action_67 (13) = happyShift action_12
action_67 (14) = happyShift action_13
action_67 (17) = happyShift action_14
action_67 (19) = happyShift action_15
action_67 (29) = happyShift action_16
action_67 (32) = happyShift action_17
action_67 (35) = happyShift action_18
action_67 (37) = happyShift action_19
action_67 (38) = happyShift action_20
action_67 (40) = happyShift action_21
action_67 (41) = happyShift action_22
action_67 (42) = happyShift action_23
action_67 (43) = happyShift action_24
action_67 (44) = happyShift action_25
action_67 (6) = happyGoto action_81
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (10) = happyShift action_9
action_68 (11) = happyShift action_10
action_68 (12) = happyShift action_11
action_68 (13) = happyShift action_12
action_68 (14) = happyShift action_13
action_68 (17) = happyShift action_14
action_68 (19) = happyShift action_15
action_68 (29) = happyShift action_16
action_68 (32) = happyShift action_17
action_68 (35) = happyShift action_18
action_68 (37) = happyShift action_19
action_68 (38) = happyShift action_20
action_68 (40) = happyShift action_21
action_68 (41) = happyShift action_22
action_68 (42) = happyShift action_23
action_68 (43) = happyShift action_24
action_68 (44) = happyShift action_25
action_68 (6) = happyGoto action_80
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (10) = happyShift action_9
action_69 (11) = happyShift action_10
action_69 (12) = happyShift action_11
action_69 (13) = happyShift action_12
action_69 (14) = happyShift action_13
action_69 (17) = happyShift action_14
action_69 (19) = happyShift action_15
action_69 (29) = happyShift action_16
action_69 (32) = happyShift action_17
action_69 (35) = happyShift action_18
action_69 (37) = happyShift action_19
action_69 (38) = happyShift action_20
action_69 (40) = happyShift action_21
action_69 (41) = happyShift action_22
action_69 (42) = happyShift action_23
action_69 (43) = happyShift action_24
action_69 (44) = happyShift action_25
action_69 (6) = happyGoto action_79
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (15) = happyShift action_77
action_70 (33) = happyShift action_78
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_34

action_72 _ = happyReduce_37

action_73 (13) = happyShift action_71
action_73 (32) = happyShift action_72
action_73 (35) = happyShift action_73
action_73 (9) = happyGoto action_76
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_32

action_75 _ = happyReduce_6

action_76 (33) = happyShift action_78
action_76 (34) = happyShift action_85
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (10) = happyShift action_9
action_77 (11) = happyShift action_10
action_77 (12) = happyShift action_11
action_77 (13) = happyShift action_12
action_77 (14) = happyShift action_13
action_77 (17) = happyShift action_14
action_77 (19) = happyShift action_15
action_77 (29) = happyShift action_16
action_77 (32) = happyShift action_17
action_77 (35) = happyShift action_18
action_77 (37) = happyShift action_19
action_77 (38) = happyShift action_20
action_77 (40) = happyShift action_21
action_77 (41) = happyShift action_22
action_77 (42) = happyShift action_23
action_77 (43) = happyShift action_24
action_77 (44) = happyShift action_25
action_77 (6) = happyGoto action_84
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (13) = happyShift action_71
action_78 (32) = happyShift action_72
action_78 (35) = happyShift action_73
action_78 (9) = happyGoto action_83
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (16) = happyShift action_36
action_79 (23) = happyShift action_37
action_79 (24) = happyShift action_38
action_79 (25) = happyShift action_39
action_79 (26) = happyShift action_40
action_79 (27) = happyShift action_41
action_79 (28) = happyShift action_42
action_79 (30) = happyShift action_43
action_79 (33) = happyShift action_44
action_79 (36) = happyShift action_82
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (16) = happyShift action_36
action_80 (23) = happyShift action_37
action_80 (24) = happyShift action_38
action_80 (25) = happyShift action_39
action_80 (26) = happyShift action_40
action_80 (27) = happyShift action_41
action_80 (28) = happyShift action_42
action_80 (30) = happyShift action_43
action_80 (33) = happyShift action_44
action_80 _ = happyReduce_4

action_81 (16) = happyShift action_36
action_81 (23) = happyShift action_37
action_81 (24) = happyShift action_38
action_81 (25) = happyShift action_39
action_81 (26) = happyShift action_40
action_81 (27) = happyShift action_41
action_81 (28) = happyShift action_42
action_81 (30) = happyShift action_43
action_81 (33) = happyShift action_44
action_81 _ = happyReduce_5

action_82 _ = happyReduce_18

action_83 (33) = happyShift action_78
action_83 _ = happyReduce_35

action_84 (16) = happyShift action_36
action_84 (23) = happyShift action_37
action_84 (24) = happyShift action_38
action_84 (25) = happyShift action_39
action_84 (26) = happyShift action_40
action_84 (27) = happyShift action_41
action_84 (28) = happyShift action_42
action_84 (30) = happyShift action_43
action_84 (33) = happyShift action_44
action_84 _ = happyReduce_33

action_85 (13) = happyShift action_71
action_85 (32) = happyShift action_72
action_85 (35) = happyShift action_73
action_85 (9) = happyGoto action_86
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (33) = happyShift action_78
action_86 (34) = happyShift action_87
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (13) = happyShift action_71
action_87 (32) = happyShift action_72
action_87 (35) = happyShift action_73
action_87 (9) = happyGoto action_88
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (33) = happyShift action_78
action_88 (36) = happyShift action_89
action_88 _ = happyFail (happyExpListPerState 88)

action_89 _ = happyReduce_36

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1 : []
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1 : happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TVar _ happy_var_1))
	 =  HappyAbsSyn5
		 ((happy_var_1, happy_var_3)
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 6 6 happyReduction_4
happyReduction_4 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 6 6 happyReduction_5
happyReduction_5 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 5 6 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CaseOf happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Proc happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Times happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Div happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Cons happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (LessThan happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (And happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Or happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  6 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Not happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  6 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn6
		 (EmptyList
	)

happyReduce_18 = happyReduce 7 6 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Triplet happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_2  6 happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (ReadTtlFile happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  6 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (App happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  6 happyReduction_21
happyReduction_21 (HappyTerminal (TInt  _ happy_var_1))
	 =  HappyAbsSyn6
		 (CInt happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  6 happyReduction_22
happyReduction_22 (HappyTerminal (TBool _ happy_var_1))
	 =  HappyAbsSyn6
		 (CBool happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  6 happyReduction_23
happyReduction_23 (HappyTerminal (TString _ happy_var_1))
	 =  HappyAbsSyn6
		 (CString happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  6 happyReduction_24
happyReduction_24 (HappyTerminal (TVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (CVar happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  6 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  6 happyReduction_26
happyReduction_26 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Print happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  6 happyReduction_27
happyReduction_27 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Read happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  6 happyReduction_28
happyReduction_28 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Show happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  6 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn6
		 (Nl
	)

happyReduce_30 = happySpecReduce_1  6 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn6
		 (Space
	)

happyReduce_31 = happySpecReduce_1  7 happyReduction_31
happyReduction_31 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  7 happyReduction_32
happyReduction_32 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 4 8 happyReduction_33
happyReduction_33 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ((happy_var_2,  happy_var_4)
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_1  9 happyReduction_34
happyReduction_34 (HappyTerminal (TVar _ happy_var_1))
	 =  HappyAbsSyn9
		 (PatternVar happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  9 happyReduction_35
happyReduction_35 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (PatternList happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happyReduce 7 9 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (PatternTriplet  happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_1  9 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn9
		 (PatternEmptyList
	)

happyNewToken action sts stk [] =
	action 46 46 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TInt  _ happy_dollar_dollar -> cont 10;
	TBool _ happy_dollar_dollar -> cont 11;
	TString _ happy_dollar_dollar -> cont 12;
	TVar _ happy_dollar_dollar -> cont 13;
	TProc _ -> cont 14;
	TArr _ -> cont 15;
	TApp _ -> cont 16;
	TLet _ -> cont 17;
	TIn _ -> cont 18;
	TIf _ -> cont 19;
	TThen _ -> cont 20;
	TElse _ -> cont 21;
	TEnd _ -> cont 22;
	TPlus _ -> cont 23;
	TMinus _ -> cont 24;
	TTimes _ -> cont 25;
	TDiv _ -> cont 26;
	TAnd _ -> cont 27;
	TOr _ -> cont 28;
	TNot _ -> cont 29;
	TLessThan _ -> cont 30;
	TDef _ -> cont 31;
	TEmptyList _ -> cont 32;
	TCons _ -> cont 33;
	TComma _ -> cont 34;
	TParenL _ -> cont 35;
	TParenR _ -> cont 36;
	TReadTtlFile _ -> cont 37;
	TCase _ -> cont 38;
	TOf _ -> cont 39;
	TPrint _ -> cont 40;
	TRead _ -> cont 41;
	TNl _ -> cont 42;
	TSpace _ -> cont 43;
	TShow _ -> cont 44;
	TBar _ -> cont 45;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 46 tk tks = happyError' (tks, explist)
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
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> failwith tokens)
parseProg tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


type Prog = [Def]

type Def = (String, Expr)

data Expr = CInt Int
                | CBool Bool
                | CString String
                | CVar String
                | App Expr Expr
                | Proc String Expr
                | Let String Expr Expr
                | If Expr Expr Expr
                | Plus Expr Expr
                | Minus Expr Expr
                | Times Expr Expr
                | Div Expr Expr
                | And Expr Expr
                | Or Expr Expr
                | Nl
                | Space
                | Not Expr
                | LessThan Expr Expr
                | EmptyList
                | Cons Expr Expr
                | Triplet Expr Expr Expr
                | CaseOf Expr [(Pattern, Expr)]
                | ReadTtlFile Expr
                | Print Expr
                | Read Expr
                | Show Expr
   deriving Show

data Pattern = PatternVar String
                     | PatternList Pattern Pattern
                     | PatternTriplet Pattern Pattern Pattern
                     | PatternEmptyList
  deriving Show

failwith :: [Token] -> a
failwith []        = error "parse fail"
failwith (t : _)   = error $ "parse fail :" ++ show t
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
