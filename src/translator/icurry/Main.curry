-- Convert FlatCurry to ICurry
-- Sergio Antoy
-- Mon Apr 28 10:51:09 PDT 2014

import System
import IO
import FlatCurry.Types
import FlatCurry.Files
import FlatCurry.Read


import ICurry
import TypeTable
-- import VarTable
-- import CountRef
import PPFlat
import FlatToICurry
import PPICurry_Ex
-- import PPICurry
import FixCount
import RemoveInnerCases
import RemoveInnerLets

-- Some variables are never referenced and should not be declared

main = do
  args <- getArgs
  foldr ((>>) . process_file) (return ()) args

process_file file = do 

  flat <- readFlatCurry file
  -- putStrLn "--------- FLAT INITIAL ---------"
  -- putStrLn (show flat)
  -- putStrLn (PPFlat.execute flat)

  -- Find constructors used by the program, but defined in other modules.
  modules <- readFlatCurryIntWithImports file
  -- Find constructors used by the program, but defined in other modules.
  let type_table = TypeTable.execute modules
  -- putStrLn "--------- TYPE TABLE ---------"
  -- putStrLn (ppTypeTable type_table)

  -- Replace case statements that are arguments of an application
  -- with new functions.
  let non_inner_cases = RemoveInnerCases.execute flat
  -- putStrLn "--------- NO INNER CASES ---------"
  -- putStrLn (PPFlat.execute non_inner_cases)

  -- Replace let-blocks that are arguments of an application
  -- with new functions.
  let non_inner_lets = RemoveInnerLets.execute non_inner_cases
  -- putStrLn "--------- NO INNER LETS ---------"
  -- putStrLn (PPFlat.execute non_inner_lets)

  let icurry = FlatToICurry.execute type_table non_inner_lets
  -- seq (id $## icurry) done
  -- putStrLn "--------- UNFIXED ---------"
  -- putStrLn (showAnyTerm icurry)

  let n = FixCount.execute icurry
  -- force the execution of FixCount
  icurry_handle <- seq n (openFile (file ++ ".icur") WriteMode)
  -- putStrLn "-------RAW ICURRY ---------"
  -- putStrLn (showAnyTerm icurry)

  hPutStr icurry_handle (show icurry)
  hClose icurry_handle
  -- putStrLn (PPICurry_Ex.execute icurry)
  
  read_handle <- openFile (file ++ ".read") WriteMode
  hPutStrLn read_handle (PPICurry_Ex.execute icurry)
  hClose read_handle

  -- putStrLn "END"