{-# LANGUAGE DataKinds #-}

-- | Delegation types serialization.

module Pos.Binary.Core.Delegation () where

import           Universum

import qualified Data.Set as S

import           Pos.Binary.Class (Bi (..))
import           Pos.Binary.Core.Slotting ()
import           Pos.Binary.Crypto ()
import           Pos.Core.Delegation (DlgPayload (..), HeavyDlgIndex (..), LightDlgIndices (..),
                                      ProxySKHeavy)
import           Pos.Util.Verification (Ver (..))

instance Bi (HeavyDlgIndex) where
    encode = encode . getHeavyDlgIndex
    decode = HeavyDlgIndex <$> decode

instance Bi (LightDlgIndices) where
    encode = encode . getLightDlgIndices
    decode = LightDlgIndices <$> decode

instance Bi (DlgPayload 'Unver) where
    encode = encode . S.toList . getDlgPayload
    decode = do
        (psks :: [ProxySKHeavy 'Unver]) <- decode
        let asSet = S.fromList psks
        when (S.size asSet /= length psks) $ fail "DlgPayload is not a set: it has duplicates"
        pure $ UnsafeDlgPayload asSet
