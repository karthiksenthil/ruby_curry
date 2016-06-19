import System
import IO
import ReadShowTerm
import ICurry
import PPICurry_Ex
import RCurry
import ICurryToAbstractRuby
import PPRCurry

main :: Prelude.IO ()
main = do
  args <- getArgs
  foldr ((>>) . process_file) (return ()) args

process_file :: [Prelude.Char] -> Prelude.IO ()
process_file file = do
  -- putStrLn ("*** file *** " ++ file)
  icur_handle <- openFile (file ++ ".icur") ReadMode
  icur_contents <- hGetContents icur_handle
  -- putStrLn (show icur_contents)

  let code = readQTerm icur_contents
  -- putStrLn (PPICurry_Ex.execute code)

  let abstractRuby = ICurryToAbstractRuby.execute code
  -- putStrLn (show abstractRuby)

  let ruby = PPRCurry.rcurryToRuby abstractRuby
  ruby_handle <- openFile (file ++ ".rb") WriteMode
  hPutStr ruby_handle ruby
  
