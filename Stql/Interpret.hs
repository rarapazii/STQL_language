module Interpret where

import Grammar (Prog, Def, Expr(..), Pattern(..))
import qualified Data.Map as M
import Decode (readSimpleRDF, SimpleRDF, Triple(..), SimpleURI(..), Literal(..))
import Control.Monad.State
import Data.IORef
import Text.Read (readMaybe)
import Debug.Trace

data Value = VString String 
           | VInt Int
           | VBool Bool
           | VList [Value]
           | VTriple Value Value Value
           | VUnit
           | VErr
           | VClosure Closure
        deriving (Eq, Ord)

instance Show Value where
    show (VString str) = str
    show (VInt int)    = show int
    show (VBool bool)  = if bool then "true" else "false"
    show (VList vs)    = show vs
    show (VTriple x y z) = "(" ++ show x ++ "," ++ show y ++ ", " ++ show z ++ ")"
    show VUnit  = "()"
    show VErr = "runtime error"
    show _ = "<abs>"

data Closure = Closure String Expr Env

instance Show Closure where
    show _ = "<abs>"

instance Eq Closure where
    _ == _ = True

instance Ord Closure where
    compare _ _ = EQ

type Env = M.Map String (IORef Value)

type App = StateT Env IO 

local :: (Env -> Env) -> App a -> App a
local f mx = do
    env <- get
    x <- modify f >> mx
    put env
    pure x

exec :: Prog -> App ()
exec prog = forM_ prog execDef

execDef :: Def -> App ()
execDef (name, expr) = do
    valueRef <- liftIO $ newIORef VUnit
    modify $ M.insert name valueRef
    value <- evalExpr expr
    liftIO $ writeIORef valueRef value

evalExpr :: Expr -> App Value
evalExpr expr = case expr of
    CInt int      -> pure . VInt $ int
    CBool bool    -> pure . VBool $ bool
    CString str   -> pure . VString $ str
    CVar name     -> get >>= \env -> 
        case M.lookup name env of
            Nothing     -> pure VErr
            Just ref    -> liftIO $ readIORef ref
    App e1 e2     -> do
        v1 <- evalExpr e1
        case v1 of
            VClosure (Closure arg body env) -> evalExpr e2 >>= \v2 -> liftIO (newIORef v2) >>= \v2_ref ->
                local (\_ -> M.insert arg v2_ref env) $ evalExpr body
            _                     -> pure VErr
    Proc arg body -> get >>= pure . VClosure . Closure arg body
    Let name e1 e2   -> do
        valueRef <- liftIO $ newIORef VUnit
        local (M.insert name valueRef) $ do
            v1 <- evalExpr e1
            liftIO $ writeIORef valueRef v1
            evalExpr e2
    If e1 e2 e3      -> do
        v1 <- evalExpr e1
        case v1 of
            VBool bool -> if bool then evalExpr e2 else evalExpr e3
            _          -> pure VErr
    Plus e1 e2       -> do
        vs <- (,) <$> evalExpr e1 <*> evalExpr e2
        case vs of
            (VInt x, VInt y)   -> pure . VInt $ x + y
            _                  -> pure VErr
    Minus e1 e2      -> do
        vs <- (,) <$> evalExpr e1 <*> evalExpr e2
        case vs of
            (VInt x, VInt y)   -> pure . VInt $ x - y
            _                  -> pure VErr
    Times e1 e2      -> do
        vs <- (,) <$> evalExpr e1 <*> evalExpr e2
        case vs of
            (VInt x, VInt y)   -> pure . VInt $ x * y
            _                  -> pure VErr
    Div e1 e2        -> do
        vs <- (,) <$> evalExpr e1 <*> evalExpr e2
        case vs of
            (VInt x, VInt y)   -> pure . VInt $ x `div` y
            _                  -> pure VErr
    And e1 e2        -> do
        vs <- (,) <$> evalExpr e1 <*> evalExpr e2
        case vs of
            (VBool x, VBool y)   -> pure . VBool $ x && y
            _                    -> pure VErr       
    Or e1 e2         -> do
        vs <- (,) <$> evalExpr e1 <*> evalExpr e2
        case vs of
            (VBool x, VBool y)   -> pure . VBool $ x || y
            _                    -> pure VErr
    Not e1           -> do
        v1 <- evalExpr e1
        case v1 of
            VBool x         -> pure . VBool . not $ x
            _               -> pure VErr        
    Nl               -> do
        liftIO $ putStr "\n"
        pure VUnit
    Space            -> do
        liftIO $ putStr " "
        pure VUnit
    LessThan e1 e2   -> do
        (v1, v2) <- (,) <$> evalExpr e1 <*> evalExpr e2
        pure . VBool $ v1 < v2
    EmptyList        -> pure $ VList []
    Cons e es        -> do
        (v, vs) <- (,) <$> evalExpr e <*> evalExpr es
        case vs of
            VList xs      -> pure . VList $ v : xs
            _             -> pure VErr
    Triplet e1 e2 e3  -> VTriple <$> evalExpr e1 <*> evalExpr e2 <*> evalExpr e3
    CaseOf e1 cases   -> do
        v1 <- evalExpr e1
        -- liftIO . print $ v1
        -- liftIO . print $ cases
        case [(bindings, caseBody) | (pattern, caseBody) <- cases, bindings <- patternMatch v1 pattern] of
            (bindings, caseBody) : _        -> do
                -- liftIO . print $ bindings
                bindings' <- forM bindings $ \(name, value) -> (,) name <$> (liftIO $ newIORef value)
                local (M.union (M.fromList bindings')) $ evalExpr caseBody
            _                               -> pure VErr
    ReadTtlFile e1  -> do
        v1 <- evalExpr e1
        case v1 of
            VString fname -> liftIO (readSimpleRDF fname) >>= \rdf -> case rdf of
                Nothing   -> pure VErr
                Just rdf' -> pure $ value_of_simpleRDF rdf'
            _             -> pure VErr
    Print e1        -> do
        evalExpr e1 >>= liftIO . putStr . show
        pure $ VUnit
    Read e1         -> evalExpr e1 >>= \v ->
        case v of
            VString str -> maybe (pure VErr) (pure . VInt) $ readMaybe str
            VInt _      -> pure v
            _           -> pure VErr
    Show e1         -> evalExpr e1 >>= \v ->
        case v of 
            VString str -> pure . VString . show $ str
            _           -> pure . VString . show $ v
 
-- type SimpleRDF = [Triple]
-- data Triple = Tri SimpleURI SimpleURI (Either SimpleURI Literal) deriving (Eq, Ord)
-- data Literal = StrLit String | IntLit Integer | BoolLit Bool deriving (Eq, Ord)
-- data SimpleURI = SimpleURI [Domain] [Domain] (Maybe Tag) deriving (Eq, Ord)

value_of_simpleRDF :: SimpleRDF -> Value
value_of_simpleRDF rdf = VList [VTriple (value_of_uri $ uri1) (value_of_uri uri2) (either value_of_uri value_of_literal obj) | Tri uri1 uri2 obj <- rdf]
  where
      value_of_literal (StrLit str) = VString . show $ str
      value_of_literal (IntLit int) = VInt . fromInteger $ int
      value_of_literal (BoolLit bool) = VBool bool

      value_of_uri (SimpleURI ds ds' tag) = VTriple (VList $ value_of_domain <$> ds) (VList $ value_of_domain <$> (filter (not . null) ds')) (maybe (VList []) (\str -> VList [VString str]) tag)

      value_of_domain = VString 

type Bindings = [(String, Value)]

-- data Pattern = PatternVar String
--                      | PatternList Pattern Pattern
--                      | PatternTriplet Pattern Pattern Pattern
--                      | PatternEmptyList
--   deriving Show

-- data Value = VString String 
--            | VInt Int
--            | VBool Bool
--            | VList [Value]
--            | VTriple Value Value Value
--            | VUnit
--            | VErr
--            | VClosure Closure

patternMatch :: Value -> Pattern -> [Bindings]
patternMatch v (PatternVar name) = pure [(name, v)]
patternMatch (VList (v : vs)) (PatternList p ps) = (++) <$> patternMatch v p <*> patternMatch (VList vs) ps
patternMatch (VTriple x y z) (PatternTriplet px py pz) = do
    bs1 <- patternMatch x px
    bs2 <- patternMatch y py
    bs3 <- patternMatch z pz
    pure $ bs1 ++ bs2 ++ bs3
patternMatch (VList []) PatternEmptyList = pure []
patternMatch _ _                         = []

runProg :: Prog -> IO ()
runProg prog = fst <$> runStateT (exec prog) (M.empty)