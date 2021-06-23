import Control.Lens.Each

runRofiml :: Text -> Rofiml
runRofiml "" = do
    entries <- asks rofimlEntries
    entries&each (pure . entryName)
        >>= liftIO . putStr . show . foldr1 (\a b -> a ++ "\n" ++ b)
runRofiml selected = do
    entries <- asks rofimlEntries
    possibleAction <- traverse ()
