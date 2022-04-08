{
module Token where
}

%wrapper "posn"
$digit = 0-9
$alpha = [a-zA-Z]

token :-
    $white+  ;
    "=D".*   ;
  $digit+  { \p s -> TInt p (read s)  }
  true       {\p _ -> TBool p True}
  false     {\p _ -> TBool p False}
  read     {\p _ -> TRead p}
  show     {\p _ -> TShow p}
  proc             {\p _ -> TProc p}
   \->          {\p _ -> TArr p}
   \.\$           {\p _ -> TApp p}
   let {\p _ -> TLet p}
   in {\p _ -> TIn p}
   if {\p _ -> TIf p}
   then {\p _ -> TThen p}
  else {\p _ -> TElse p}
  end {\p _ -> TEnd p}
  \+ {\p _ -> TPlus p}
  \- {\p _ -> TMinus p}
  \* {\p _ -> TTimes p}
  \/     {\p _ -> TDiv p}
  \&& {\p _ -> TAnd p}
  not {\p _ -> TNot p}  
  \< {\p _ -> TLessThan p}
  \= {\p _ -> TDef p}    
  \[\]        {\p _ -> TEmptyList p}
  \:          {\p _ -> TCons p}
  \,          {\p _ -> TComma p}
  \(    {\p _ -> TParenL p}
  \)    {\p _ -> TParenR p}
  readTtlFile {\p _ -> TReadTtlFile p}
  case {\p _ -> TCase p}
  of {\p _ -> TOf p}
  nl {\p _ -> TNl p}
  space {\p _ -> TSpace p}
  print {\p _ -> TPrint p}
      \|\| {\p _ -> TOr p}
   \" [$digit $alpha \. \< \> \\ \/ \# \_ \: ]*  " {\p s -> TString p (read s)}
     $alpha [$alpha $digit \_ \']*   { \p s -> TVar p s }
     \| {\p _ -> TBar p}
{
type P = AlexPosn 

data Token = TInt P Int
                   | TBool P Bool
                   | TString P String
                   | TVar P String
                   | TProc P
                   | TArr P
                   | TLet P
                   | TIn P
                   | TIf P
                   | TThen P
                   | TElse P
                   | TEnd P
                   | TPlus P
                   | TMinus P
                   | TTimes P
                   | TDiv P
                   | TAnd P
                   | TOr P
                   | TNot P
                   | TLessThan P
                   | TDef P
                   | TEmptyList P
                   | TCons P
                   | TComma P
                   | TParenL P
                   | TParenR P
                   | TReadTtlFile P
                   | TCase P
                   | TOf P
                   | TPrint P
                   | TApp P
                   | TBar P
                   | TRead P
                   | TShow P
                   | TNl P
                   | TSpace P
    deriving Show
}