module Decode where 

import Data.Char
import Text.ParserCombinators.ReadP hiding (get)
import Data.List
import qualified Data.Map as M
import Control.Monad.State
import Control.Monad.Writer

type RDF = [Item]

data Item = Prefix Name URI
          | Triple URI [(URI, [Object])]
    deriving Show

type Name = String

data URI = URI [Domain] [Domain] (Maybe Tag)
         | UsePrefix Name [Domain] (Maybe Tag)
    deriving Show

type Domain = String
type Tag = String

data Object = URIObj URI
            | StrObj String
            | IntObj Integer
            | BoolObj Bool
    deriving Show

many' :: ReadP a -> ReadP [a]
many' mx = some' mx <++ pure []

some' :: ReadP a -> ReadP [a]
some' mx = (:) <$> mx <*> many' mx 

sepBy1' :: ReadP a -> ReadP sep -> ReadP [a]
sepBy1' mx my = (:) <$> mx <*> many' (my >> mx)

domainP :: ReadP Domain
domainP = munch $ \c -> c `notElem` "./ #<>"

domsP :: ReadP [Domain]
domsP = (:) <$> domainP <*> many' (char '.' >> domainP)

domainsP :: ReadP [Domain]
domainsP = ((:) <$> domainP <*> (char '/' >> domainsP))
         <++ (pure <$> domainP) 
         <++ pure []

tagP :: ReadP (Maybe Tag)
tagP = (char '#' >> (pure . ('#' :)) <$> munch1 isAlphaNum) <++ pure Nothing

uriP :: ReadP URI
uriP = case1 <++ case2 where
    case1 = do
        string "<http://"
        doms <- domsP
        char '/'
        domains <- domainsP
        tag <- tagP
        char '>'
        pure $ URI doms domains tag
    case2 = choice
        [ char '<' >> domainsP >>= \domains -> tagP >>= \tag -> char '>' >> pure (UsePrefix "base" domains tag)
        , munch1 isAlphaNum >>= \name -> char ':' >> domainsP >>= \domains -> tagP >>= \tag -> pure $ UsePrefix name domains tag]
     
objectP :: ReadP Object
objectP = (URIObj <$> uriP)
        <++ (StrObj <$> strP)
        <++ (IntObj <$> intP)
        <++ (string "true" >> pure (BoolObj True))
        <++ (string "false" >> pure (BoolObj False))
  where
      strP = do
          char '"'
          xs <- munch isAlphaNum
          char '"'
          pure xs
      intP = do
          op <- (char '-' >> pure negate) <++ (char '+' >> pure id) <++ (pure id)
          skipSpaces
          xs <- munch1 isDigit
          pure . op . foldl (\acc x -> 10 * acc + read [x]) 0 $ xs

itemP = case1 <++ case2 where
    case1 = do
        char '@'
        prefix <- string "base" <++ (string "prefix" >> skipSpaces >> munch1 isAlphaNum >>= \xs -> char ':' >> pure xs)
        skipSpaces
        uri <- uriP
        skipSpaces
        char '.'
        pure $ Prefix prefix uri
    case2 = Triple <$> uriP <*> auxP
    auxP = do
        skipSpaces
        x <- sepBy1' ((,) <$> (uriP >>= \uri -> skipSpaces >> pure uri) <*> sepBy1' objectP (skipSpaces >> char ',' >> skipSpaces)) (skipSpaces >> char ';' >> skipSpaces)
        skipSpaces
        char '.'
        skipSpaces
        pure x

rdfP :: ReadP RDF
rdfP = many' (skipSpaces *> itemP <* skipSpaces)

readRDF :: String -> IO (Maybe RDF)
readRDF fname = readFile fname >>= \src -> case readP_to_S rdfP src of
    [(out, [])] -> pure . Just $ out
    _           -> pure Nothing

type SimpleRDF = [Triple]

data Triple = Tri SimpleURI SimpleURI (Either SimpleURI Literal) deriving (Eq, Ord)

instance Show Triple where
    show (Tri uri1 uri2 obj) = show uri1 ++ show uri2 ++ either show ((" " ++) . show) obj ++ " ."

data Literal = StrLit String | IntLit Integer | BoolLit Bool deriving (Eq, Ord)

instance Show Literal where
    show (StrLit lit)  = show lit
    show (BoolLit lit)
      | lit            = "true"
      | otherwise      = "false" 
    show (IntLit lit) = show lit

data SimpleURI = SimpleURI [Domain] [Domain] (Maybe Tag) deriving (Eq, Ord)

instance Show SimpleURI where
    show (SimpleURI doms sub_doms tag) = "<http://" 
                                       ++ concat (intersperse "." doms)
                                       ++ concat (map ("/" ++ ) . filter (not . null) $ sub_doms) 
                                       ++ maybe "" ("/#" ++) tag 
                                       ++ ">"

type Env = M.Map Name SimpleURI

evalRDF :: RDF -> StateT Env (Writer SimpleRDF) ()
evalRDF rdf = forM_ rdf $ \item ->
    case item of
        Prefix name uri -> evalURI uri >>= \uri' -> modify $ M.insert name uri'
        Triple uri1 xs   -> forM_ xs $ \(uri2, ys) -> 
            forM_ ys $ \obj -> do
                tri <- Tri <$> evalURI uri1 <*> evalURI uri2 <*> evalObj obj
                tell [tri]

evalURI :: URI -> StateT Env (Writer SimpleRDF) SimpleURI
evalURI uri = case uri of
    URI doms sub_doms tag       -> pure $ SimpleURI doms sub_doms tag
    UsePrefix name sub_doms tag -> do
        env <- get
        case M.lookup name env of
            Nothing             -> pure $ SimpleURI ["not such prefix!"] [] Nothing
            Just (SimpleURI doms sub_doms' _)
                                -> pure $ SimpleURI doms (sub_doms' ++ sub_doms) tag

evalObj :: Object -> StateT Env (Writer SimpleRDF) (Either SimpleURI Literal)
evalObj obj = case obj of
    URIObj uri        -> Left <$> evalURI uri
    StrObj str        -> pure . Right $ StrLit str
    IntObj int        -> pure . Right $ IntLit int
    BoolObj bool      -> pure . Right $ BoolLit bool

simpleRDF_of_RDF :: RDF -> SimpleRDF
simpleRDF_of_RDF rdf = snd . runWriter . runStateT (evalRDF rdf) $ M.empty

readSimpleRDF :: String -> IO (Maybe SimpleRDF)
readSimpleRDF fname = readRDF fname >>= maybe (pure Nothing) (pure . Just . simpleRDF_of_RDF)