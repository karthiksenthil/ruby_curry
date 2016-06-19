module Utils where

import Char

-- A Curry program variable must be translated into a Ruby local
-- variable because some Curry identifiers like '++' are not Ruby
-- identifiers.  The idea is that disallowed characters are replaced
-- by some allowed characters.
--
-- The goals of the translation are:
--    1. different Curry identifiers are translated
--       into different Ruby identifiers
--    2. translated Ruby identifiers should be different
--       from library Ruby identifiers
-- It does not seem possible to enforce the second condition.

-- These are the rules:
--    1. Any non alphanumeric character c is translated
--       into "_xy" where xy is the hex code of c.
--       E.g., '+' is translated into "_2B",
--       in particular '_' becomes "_5F"
-- All translated identifiers start with some string under the assumption
-- that library identifiers do not start with that string
-- This or another string could also be added as a suffix.

translate x = "CT_" ++ concatMap conv_non_id_char x

conv_non_id_char x
  | isAlphaNum x = [x]
  | otherwise    = "_" ++ charToHex x

charToHex c 
  | x < 256 = [y !! (x `div` 16), y !! (x `mod` 16)]
  | otherwise = error ("charToHex error \"" ++ show c ++ "\"")
  where x = ord c
        y = "0123456789ABCDEF"

------------------------------------------------------------------

capitalize :: String -> String
capitalize (x:xs) = toUpper x : xs

ruby_qual (mod,name) = capitalize mod ++ "::" ++ translate name

ruby_unqual name = translate name
