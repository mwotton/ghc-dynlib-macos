{-# LANGUAGE ForeignFunctionInterface #-}
module Fakelib where

import Foreign.C
foreign export ccall foo :: CInt -> CInt
foo :: CInt -> CInt
foo = fromIntegral . (*3) . fromIntegral