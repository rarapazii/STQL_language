{
module Grammar where
import Token
}

%name parseProg
%tokentype { Token }
%error { failwith }

%token
int {TInt  _ $$}
bool {TBool _ $$}
string {TString _ $$}
var {TVar _ $$}
proc {TProc _}
imply {TArr _}
'.$' {TApp _}
let {TLet _}
in {TIn _}
if {TIf _}
then {TThen _}
else {TElse _}
endCase {TEnd _}
plus {TPlus _}
minus {TMinus _}
times {TTimes _}
div {TDiv _}
and {TAnd _}
or {TOr _}
not {TNot _}
lessThan {TLessThan _}
def {TDef _}
empty {TEmptyList _}
cons {TCons _}
',' {TComma _}
'(' {TParenL _}
')' {TParenR _}
readTtlFile {TReadTtlFile _}
case {TCase _}
of {TOf _}
print {TPrint _}
read {TRead _}
nl {TNl _}
space {TSpace _}
show {TShow _}
bar {TBar _}

%right imply
%right in
%right else
%right of
%right or
%right and
%nonassoc lessThan
%right cons
%left plus minus
%left times div
%nonassoc not readTtlFile print read show
%left '.$'

%%
Prog : Def                 {$1 : []}
        | Def Prog         {$1 : $2}

Def : var def Expr        {($1, $3)}

Expr : if Expr then Expr else Expr  {If $2 $4 $6}
        | let var def Expr in Expr       {Let $2 $4 $6}
        | case Expr of Clauses endCase {CaseOf $2 $4}
        | proc var imply Expr              {Proc $2 $4}
        | Expr plus Expr      {Plus $1 $3}
        | Expr minus Expr {Minus $1 $3}
        | Expr times Expr {Times $1 $3}
        | Expr div Expr {Div $1 $3}
        | Expr cons Expr {Cons $1 $3}
        | Expr lessThan Expr {LessThan $1 $3}
        | Expr and Expr {And $1 $3}
        | Expr or Expr {Or $1 $3}
        | not Expr {Not $2}
        | empty     {EmptyList}
        | '(' Expr ',' Expr ',' Expr ')' {Triplet $2 $4 $6}
        | readTtlFile Expr {ReadTtlFile $2}
        | Expr '.$' Expr           {App $1 $3}
        | int       {CInt $1}
        | bool    {CBool $1}
        | string  {CString $1}
        | var {CVar $1}
        | '(' Expr ')' {$2}
        | print Expr {Print $2}
        | read Expr {Read $2}
        | show Expr {Show $2}
        | nl      {Nl}
        | space  {Space}


Clauses : Clause                  {[$1]}
             | Clause Clauses       {$1 : $2}

Clause : bar Pattern imply Expr {($2,  $4)}

Pattern : var    {PatternVar $1}
            | Pattern cons Pattern                   {PatternList $1 $3}
            | '(' Pattern ',' Pattern ',' Pattern ')' {PatternTriplet  $2 $4 $6}
            | empty         {PatternEmptyList} 
{
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

}