{-# LANGUAGE TemplateHaskell #-}
{-|
Module      : Rofiml.Type
Description : Basic types for Rofiml application
Copyright   : (c) Cj.bc_sd a.k.a Cj-bc, 2021
Maintainer  : cj.bc-sd@outlook.jp
Stability   : experimental

-}
module Rofiml.Type where
import Data.Text
import Data.Map
import Control.Monad.Reader
import Control.Lens.TH

-- | An Action that will be evaluated as shell command.
newtype Action = Action { unAction :: Text }

-- | One Rofi entry.
-- It have its name, action, etc.
--
-- TODO: Add more options
type RofimlEntries = Map Text (Either Action RofimlEntries)


-- | Body of Rofiml yaml file.
data RofimlBody = RofimlBody {
                      rofimlName :: Text
                    , rofimlEntries :: RofimlEntries
                    }

newtype Rofiml = Rofiml { unRofiml :: ReaderT RofimlBody (IO ()) }
