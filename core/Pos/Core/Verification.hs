{-# LANGUAGE DataKinds #-}

-- | This is module that imports/exports different functions for
-- (de)verifying data. See "Pos.Util.Verification" for a general
-- framework.

-- TODO CSL-2072 Maybe remove this module or rename or move elsewhere?

module Pos.Core.Verification
    ( toVerProxySignature
    , toVerPsk
    , toVerUnsafeBlockHeader
    , toVerUnsafeBlock
    ) where

import           Universum

import           Data.Coerce (coerce)

import           Pos.Core.Block (Block, BlockHeader, GenesisBlock)
import           Pos.Crypto.Signing (toVerProxySignature, toVerPsk)
import           Pos.Util.Verification (Ver (..))


toVerUnsafeBlockHeader :: BlockHeader 'Unver -> BlockHeader 'Ver
toVerUnsafeBlockHeader = undefined

toVerUnsafeBlock :: Block 'Unver -> Block 'Ver
toVerUnsafeBlock = undefined
