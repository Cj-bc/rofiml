{-# LANGUAGE TemplateHaskell #-}
{-|
Module      : Rofiml.Type
Description : Basic types for Rofiml application
Copyright   : (c) Cj.bc_sd a.k.a Cj-bc, 2021
Maintainer  : cj.bc-sd@outlook.jp
Stability   : experimental

-}
import Data.Text
import Control.Lens.TH

-- | An Action that will be evaluated as shell command.
newtype Action = Action { unAction :: Text }

-- | One Rofi entry.
-- It have its name, action, etc.
--
-- TODO: Add more options
data RofimlEntry = RofimlFinalEntry {
      _entryName :: Text -- ^ Name of the entry. This will be displayed in rofi
    , _action :: Action  -- ^ Action to do when this entry is selected.
    }
                 | RofimlEntry {
      _entryName :: Text
    , _next :: [RofimlEntry]
    }

makeLenses ''RofimlEntry
makePrisms ''RofimlEntry

-- | Body of Rofiml yaml file.
data RofimlBody = RofimlBody {
                      rofimlName :: Text
                    , rofimlEntries :: [RofimlEntry]
                    }

newtype Rofiml = Rofiml { unRofiml :: ReaderT RofimlBody (IO ()) }
