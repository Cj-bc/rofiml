module Rofiml.Core where
import Data.Text (unpack)
import Rofiml.Type

runRofiml :: Text -> Rofiml
runRofiml "" = asks (keys rofimlEntries) >>= printEntries
runRofiml selected = do
    entries <- asks rofimlEntries
    maybe (return ()) (either doAction printEntries)
          $ lookup selected entries

printEntries :: [Text] -> Rofiml
printEntries =
    liftIO . putStr . show . foldr1 (\a b -> a ++ "\n" ++ b)

doAction :: Action -> Rofiml
doAction (unAction action) = liftIO callCommand (unpack action)
