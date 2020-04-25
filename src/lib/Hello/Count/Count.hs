module Hello.Count.Count (State, get, increment) where

import           Data.Default.Class

newtype State = State Int

instance Default State where
  def = State 0

get :: State -> Int
get (State i) = i

increment :: State -> State
increment (State i) = State $ i + 1
