module Prelude

  require 'src/runtime/function_N.rb'
  require 'src/runtime/function_A.rb'
  require 'src/compiler/expressions_include.rb'
  require 'src/compiler/symbols.rb'
  require 'src/compiler/utilities.rb'
  require 'src/compiler/repl.rb'
  require 'CT_System.rb'
  require 'integers.rb'
  require 'CT_Character.rb'
  require 'CT_External.rb'

  Prelude::CT__28_29 = Constructor.new('Prelude::CT__28_29',0)
  Prelude::CT__28_29.token_value = 4
  Prelude::CT__5B_5D = Constructor.new('Prelude::CT__5B_5D',0)
  Prelude::CT__5B_5D.token_value = 4
  Prelude::CT__3A = Constructor.new('Prelude::CT__3A',2)
  Prelude::CT__3A.token_value = 5
  Prelude::CT__28_2C_29 = Constructor.new('Prelude::CT__28_2C_29',2)
  Prelude::CT__28_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_29',3)
  Prelude::CT__28_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_29',4)
  Prelude::CT__28_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_29',5)
  Prelude::CT__28_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_29',6)
  Prelude::CT__28_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_2C_29',7)
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_29',8)
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_29',9)
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_29',10)
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29',11)
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29',12)
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29',13)
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29',14)
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29 = Constructor.new('Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29',15)
  Prelude::CT__28_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_2C_29.token_value = 4
  Prelude::CT_False = Constructor.new('Prelude::CT_False',0)
  Prelude::CT_False.token_value = 4
  Prelude::CT_True = Constructor.new('Prelude::CT_True',0)
  Prelude::CT_True.token_value = 5
  Prelude::CT_LT = Constructor.new('Prelude::CT_LT',0)
  Prelude::CT_LT.token_value = 4
  Prelude::CT_EQ = Constructor.new('Prelude::CT_EQ',0)
  Prelude::CT_EQ.token_value = 5
  Prelude::CT_GT = Constructor.new('Prelude::CT_GT',0)
  Prelude::CT_GT.token_value = 6
  Prelude::CT_Nothing = Constructor.new('Prelude::CT_Nothing',0)
  Prelude::CT_Nothing.token_value = 4
  Prelude::CT_Just = Constructor.new('Prelude::CT_Just',1)
  Prelude::CT_Just.token_value = 5
  Prelude::CT_Left = Constructor.new('Prelude::CT_Left',1)
  Prelude::CT_Left.token_value = 4
  Prelude::CT_Right = Constructor.new('Prelude::CT_Right',1)
  Prelude::CT_Right.token_value = 5
  Prelude::CT_IOError = Constructor.new('Prelude::CT_IOError',1)
  Prelude::CT_IOError.token_value = 4
  Prelude::CT_UserError = Constructor.new('Prelude::CT_UserError',1)
  Prelude::CT_UserError.token_value = 5
  Prelude::CT_FailError = Constructor.new('Prelude::CT_FailError',1)
  Prelude::CT_FailError.token_value = 6
  Prelude::CT_NondetError = Constructor.new('Prelude::CT_NondetError',1)
  Prelude::CT_NondetError.token_value = 7

  Prelude::CT__2E = Operation.new('Prelude::CT__2E',2) # "."
  Prelude::CT__2E_2E_5F_23lambda1 = Operation.new('Prelude::CT__2E_2E_5F_23lambda1',3) # ".._#lambda1"
  Prelude::CT_id = Operation.new('Prelude::CT_id',1) # "id"
  Prelude::CT_const = Operation.new('Prelude::CT_const',2) # "const"
  Prelude::CT_curry = Operation.new('Prelude::CT_curry',3) # "curry"
  Prelude::CT_uncurry = Operation.new('Prelude::CT_uncurry',2) # "uncurry"
  Prelude::CT_flip = Operation.new('Prelude::CT_flip',3) # "flip"
  Prelude::CT_until = Operation.new('Prelude::CT_until',3) # "until"
  Prelude::CT_seq = Operation.new('Prelude::CT_seq',2) # "seq"
  Prelude::CT_ensureNotFree = Operation.new('Prelude::CT_ensureNotFree',1) # "ensureNotFree"
  Prelude::CT_ensureSpine = Operation.new('Prelude::CT_ensureSpine',1) # "ensureSpine"
  Prelude::CT_ensureSpine_2EensureList_2E20 = Operation.new('Prelude::CT_ensureSpine_2EensureList_2E20',1) # "ensureSpine.ensureList.20"
  Prelude::CT__24 = Operation.new('Prelude::CT__24',2) # "$"
  Prelude::CT__24_21 = Operation.new('Prelude::CT__24_21',2) # "$!"
  Prelude::CT__24_21_21 = Operation.new('Prelude::CT__24_21_21',2) # "$!!"
  Prelude::CT__24_23 = Operation.new('Prelude::CT__24_23',2) # "$#"
  Prelude::CT__24_23_23 = Operation.new('Prelude::CT__24_23_23',2) # "$##"
  Prelude::CT_error = Operation.new('Prelude::CT_error',1) # "error"
  Prelude::CT_prim_5Ferror = Operation.new('Prelude::CT_prim_5Ferror',1) # "prim_error"
  Prelude::CT_failed = Operation.new('Prelude::CT_failed',0) # "failed"
  Prelude::CT__26_26 = Operation.new('Prelude::CT__26_26',2) # "&&"
  Prelude::CT__7C_7C = Operation.new('Prelude::CT__7C_7C',2) # "||"
  Prelude::CT_not = Operation.new('Prelude::CT_not',1) # "not"
  Prelude::CT_otherwise = Operation.new('Prelude::CT_otherwise',0) # "otherwise"
  Prelude::CT_if_5Fthen_5Felse = Operation.new('Prelude::CT_if_5Fthen_5Felse',3) # "if_then_else"
  Prelude::CT_solve = Operation.new('Prelude::CT_solve',1) # "solve"
  Prelude::CT__26_3E = Operation.new('Prelude::CT__26_3E',2) # "&>"
  Prelude::CT__3D_3D = Operation.new('Prelude::CT__3D_3D',2) # "=="
  Prelude::CT__2F_3D = Operation.new('Prelude::CT__2F_3D',2) # "/="
  Prelude::CT__3D_3A_3D = Operation.new('Prelude::CT__3D_3A_3D',2) # "=:="
  Prelude::CT__26 = Operation.new('Prelude::CT__26',2) # "&"
  Prelude::CT_compare = Operation.new('Prelude::CT_compare',2) # "compare"
  Prelude::CT__3C = Operation.new('Prelude::CT__3C',2) # "<"
  Prelude::CT__3C_5Fcase_5F_231 = Operation.new('Prelude::CT__3C_5Fcase_5F_231',3) # "<_case_#1"
  Prelude::CT__3E = Operation.new('Prelude::CT__3E',2) # ">"
  Prelude::CT__3E_5Fcase_5F_231 = Operation.new('Prelude::CT__3E_5Fcase_5F_231',3) # ">_case_#1"
  Prelude::CT__3C_3D = Operation.new('Prelude::CT__3C_3D',2) # "<="
  Prelude::CT__3E_3D = Operation.new('Prelude::CT__3E_3D',2) # ">="
  Prelude::CT_max = Operation.new('Prelude::CT_max',2) # "max"
  Prelude::CT_min = Operation.new('Prelude::CT_min',2) # "min"
  Prelude::CT_fst = Operation.new('Prelude::CT_fst',1) # "fst"
  Prelude::CT_snd = Operation.new('Prelude::CT_snd',1) # "snd"
  Prelude::CT_head = Operation.new('Prelude::CT_head',1) # "head"
  Prelude::CT_tail = Operation.new('Prelude::CT_tail',1) # "tail"
  Prelude::CT_null = Operation.new('Prelude::CT_null',1) # "null"
  Prelude::CT__2B_2B = Operation.new('Prelude::CT__2B_2B',2) # "++"
  Prelude::CT_length = Operation.new('Prelude::CT_length',1) # "length"
  Prelude::CT__21_21 = Operation.new('Prelude::CT__21_21',2) # "!!"
  Prelude::CT_map = Operation.new('Prelude::CT_map',2) # "map"
  Prelude::CT_foldl = Operation.new('Prelude::CT_foldl',3) # "foldl"
  Prelude::CT_foldl1 = Operation.new('Prelude::CT_foldl1',2) # "foldl1"
  Prelude::CT_foldr = Operation.new('Prelude::CT_foldr',3) # "foldr"
  Prelude::CT_foldr1 = Operation.new('Prelude::CT_foldr1',2) # "foldr1"
  Prelude::CT_filter = Operation.new('Prelude::CT_filter',2) # "filter"
  Prelude::CT_zip = Operation.new('Prelude::CT_zip',2) # "zip"
  Prelude::CT_zip3 = Operation.new('Prelude::CT_zip3',3) # "zip3"
  Prelude::CT_zipWith = Operation.new('Prelude::CT_zipWith',3) # "zipWith"
  Prelude::CT_zipWith3 = Operation.new('Prelude::CT_zipWith3',4) # "zipWith3"
  Prelude::CT_unzip = Operation.new('Prelude::CT_unzip',1) # "unzip"
  Prelude::CT_unzip_5Flet_5F_231 = Operation.new('Prelude::CT_unzip_5Flet_5F_231',3) # "unzip_let_#1"
  Prelude::CT_unzip_2E_5F_23selFP2_23xs = Operation.new('Prelude::CT_unzip_2E_5F_23selFP2_23xs',1) # "unzip._#selFP2#xs"
  Prelude::CT_unzip_2E_5F_23selFP3_23ys = Operation.new('Prelude::CT_unzip_2E_5F_23selFP3_23ys',1) # "unzip._#selFP3#ys"
  Prelude::CT_unzip3 = Operation.new('Prelude::CT_unzip3',1) # "unzip3"
  Prelude::CT_unzip3_5Flet_5F_231 = Operation.new('Prelude::CT_unzip3_5Flet_5F_231',4) # "unzip3_let_#1"
  Prelude::CT_unzip3_2E_5F_23selFP5_23xs = Operation.new('Prelude::CT_unzip3_2E_5F_23selFP5_23xs',1) # "unzip3._#selFP5#xs"
  Prelude::CT_unzip3_2E_5F_23selFP6_23ys = Operation.new('Prelude::CT_unzip3_2E_5F_23selFP6_23ys',1) # "unzip3._#selFP6#ys"
  Prelude::CT_unzip3_2E_5F_23selFP7_23zs = Operation.new('Prelude::CT_unzip3_2E_5F_23selFP7_23zs',1) # "unzip3._#selFP7#zs"
  Prelude::CT_concat = Operation.new('Prelude::CT_concat',1) # "concat"
  Prelude::CT_concatMap = Operation.new('Prelude::CT_concatMap',1) # "concatMap"
  Prelude::CT_iterate = Operation.new('Prelude::CT_iterate',2) # "iterate"
  Prelude::CT_repeat = Operation.new('Prelude::CT_repeat',1) # "repeat"
  Prelude::CT_replicate = Operation.new('Prelude::CT_replicate',2) # "replicate"
  Prelude::CT_take = Operation.new('Prelude::CT_take',2) # "take"
  Prelude::CT_take_2Etakep_2E220 = Operation.new('Prelude::CT_take_2Etakep_2E220',2) # "take.takep.220"
  Prelude::CT_drop = Operation.new('Prelude::CT_drop',2) # "drop"
  Prelude::CT_drop_2Edropp_2E229 = Operation.new('Prelude::CT_drop_2Edropp_2E229',2) # "drop.dropp.229"
  Prelude::CT_splitAt = Operation.new('Prelude::CT_splitAt',2) # "splitAt"
  Prelude::CT_splitAt_2EsplitAtp_2E239 = Operation.new('Prelude::CT_splitAt_2EsplitAtp_2E239',2) # "splitAt.splitAtp.239"
  Prelude::CT_splitAt_2EsplitAtp_2E239_5Flet_5F_231 = Operation.new('Prelude::CT_splitAt_2EsplitAtp_2E239_5Flet_5F_231',3) # "splitAt.splitAtp.239_let_#1"
  Prelude::CT_splitAt_2EsplitAtp_2E239_2E_5F_23selFP9_23ys = Operation.new('Prelude::CT_splitAt_2EsplitAtp_2E239_2E_5F_23selFP9_23ys',1) # "splitAt.splitAtp.239._#selFP9#ys"
  Prelude::CT_splitAt_2EsplitAtp_2E239_2E_5F_23selFP10_23zs = Operation.new('Prelude::CT_splitAt_2EsplitAtp_2E239_2E_5F_23selFP10_23zs',1) # "splitAt.splitAtp.239._#selFP10#zs"
  Prelude::CT_takeWhile = Operation.new('Prelude::CT_takeWhile',2) # "takeWhile"
  Prelude::CT_dropWhile = Operation.new('Prelude::CT_dropWhile',2) # "dropWhile"
  Prelude::CT_span = Operation.new('Prelude::CT_span',2) # "span"
  Prelude::CT_span_5Flet_5F_231 = Operation.new('Prelude::CT_span_5Flet_5F_231',3) # "span_let_#1"
  Prelude::CT_span_2E_5F_23selFP12_23ys = Operation.new('Prelude::CT_span_2E_5F_23selFP12_23ys',1) # "span._#selFP12#ys"
  Prelude::CT_span_2E_5F_23selFP13_23zs = Operation.new('Prelude::CT_span_2E_5F_23selFP13_23zs',1) # "span._#selFP13#zs"
  Prelude::CT_break = Operation.new('Prelude::CT_break',1) # "break"
  Prelude::CT_lines = Operation.new('Prelude::CT_lines',1) # "lines"
  Prelude::CT_lines_2Esplitline_2E271 = Operation.new('Prelude::CT_lines_2Esplitline_2E271',1) # "lines.splitline.271"
  Prelude::CT_lines_2Esplitline_2E271_5Flet_5F_231 = Operation.new('Prelude::CT_lines_2Esplitline_2E271_5Flet_5F_231',2) # "lines.splitline.271_let_#1"
  Prelude::CT_lines_2Esplitline_2E271_2E_5F_23selFP15_23ds = Operation.new('Prelude::CT_lines_2Esplitline_2E271_2E_5F_23selFP15_23ds',1) # "lines.splitline.271._#selFP15#ds"
  Prelude::CT_lines_2Esplitline_2E271_2E_5F_23selFP16_23es = Operation.new('Prelude::CT_lines_2Esplitline_2E271_2E_5F_23selFP16_23es',1) # "lines.splitline.271._#selFP16#es"
  Prelude::CT_lines_2E_5F_23selFP18_23l = Operation.new('Prelude::CT_lines_2E_5F_23selFP18_23l',1) # "lines._#selFP18#l"
  Prelude::CT_lines_2E_5F_23selFP19_23xs_5Fl = Operation.new('Prelude::CT_lines_2E_5F_23selFP19_23xs_5Fl',1) # "lines._#selFP19#xs_l"
  Prelude::CT_unlines = Operation.new('Prelude::CT_unlines',1) # "unlines"
  Prelude::CT_words = Operation.new('Prelude::CT_words',1) # "words"
  Prelude::CT_words_5Fcase_5F_231 = Operation.new('Prelude::CT_words_5Fcase_5F_231',1) # "words_case_#1"
  Prelude::CT_words_2EisSpace_2E283 = Operation.new('Prelude::CT_words_2EisSpace_2E283',1) # "words.isSpace.283"
  Prelude::CT_words_2E_5F_23selFP21_23w = Operation.new('Prelude::CT_words_2E_5F_23selFP21_23w',1) # "words._#selFP21#w"
  Prelude::CT_words_2E_5F_23selFP22_23s2 = Operation.new('Prelude::CT_words_2E_5F_23selFP22_23s2',1) # "words._#selFP22#s2"
  Prelude::CT_unwords = Operation.new('Prelude::CT_unwords',1) # "unwords"
  Prelude::CT_unwords_2E_5F_23lambda5 = Operation.new('Prelude::CT_unwords_2E_5F_23lambda5',2) # "unwords._#lambda5"
  Prelude::CT_reverse = Operation.new('Prelude::CT_reverse',0) # "reverse"
  Prelude::CT_and = Operation.new('Prelude::CT_and',0) # "and"
  Prelude::CT_or = Operation.new('Prelude::CT_or',0) # "or"
  Prelude::CT_any = Operation.new('Prelude::CT_any',1) # "any"
  Prelude::CT_all = Operation.new('Prelude::CT_all',1) # "all"
  Prelude::CT_elem = Operation.new('Prelude::CT_elem',1) # "elem"
  Prelude::CT_notElem = Operation.new('Prelude::CT_notElem',1) # "notElem"
  Prelude::CT_lookup = Operation.new('Prelude::CT_lookup',2) # "lookup"
  Prelude::CT_enumFrom = Operation.new('Prelude::CT_enumFrom',1) # "enumFrom"
  Prelude::CT_enumFromThen = Operation.new('Prelude::CT_enumFromThen',2) # "enumFromThen"
  Prelude::CT_enumFromTo = Operation.new('Prelude::CT_enumFromTo',2) # "enumFromTo"
  Prelude::CT_enumFromThenTo = Operation.new('Prelude::CT_enumFromThenTo',3) # "enumFromThenTo"
  Prelude::CT_enumFromThenTo_2Ep_2E321 = Operation.new('Prelude::CT_enumFromThenTo_2Ep_2E321',4) # "enumFromThenTo.p.321"
  Prelude::CT_ord = Operation.new('Prelude::CT_ord',1) # "ord"
  Prelude::CT_prim_5Ford = Operation.new('Prelude::CT_prim_5Ford',1) # "prim_ord"
  Prelude::CT_chr = Operation.new('Prelude::CT_chr',1) # "chr"
  Prelude::CT_prim_5Fchr = Operation.new('Prelude::CT_prim_5Fchr',1) # "prim_chr"
  Prelude::CT__2B = Operation.new('Prelude::CT__2B',2) # "+"
  Prelude::CT_prim_5FInt_5Fplus = Operation.new('Prelude::CT_prim_5FInt_5Fplus',2) # "prim_Int_plus"
  Prelude::CT__2D = Operation.new('Prelude::CT__2D',2) # "-"
  Prelude::CT_prim_5FInt_5Fminus = Operation.new('Prelude::CT_prim_5FInt_5Fminus',2) # "prim_Int_minus"
  Prelude::CT__2A = Operation.new('Prelude::CT__2A',2) # "*"
  Prelude::CT_prim_5FInt_5Ftimes = Operation.new('Prelude::CT_prim_5FInt_5Ftimes',2) # "prim_Int_times"
  Prelude::CT_div = Operation.new('Prelude::CT_div',2) # "div"
  Prelude::CT_prim_5FInt_5Fdiv = Operation.new('Prelude::CT_prim_5FInt_5Fdiv',2) # "prim_Int_div"
  Prelude::CT_mod = Operation.new('Prelude::CT_mod',2) # "mod"
  Prelude::CT_prim_5FInt_5Fmod = Operation.new('Prelude::CT_prim_5FInt_5Fmod',2) # "prim_Int_mod"
  Prelude::CT_divMod = Operation.new('Prelude::CT_divMod',2) # "divMod"
  Prelude::CT_quot = Operation.new('Prelude::CT_quot',2) # "quot"
  Prelude::CT_prim_5FInt_5Fquot = Operation.new('Prelude::CT_prim_5FInt_5Fquot',2) # "prim_Int_quot"
  Prelude::CT_rem = Operation.new('Prelude::CT_rem',2) # "rem"
  Prelude::CT_prim_5FInt_5Frem = Operation.new('Prelude::CT_prim_5FInt_5Frem',2) # "prim_Int_rem"
  Prelude::CT_quotRem = Operation.new('Prelude::CT_quotRem',2) # "quotRem"
  Prelude::CT_negate = Operation.new('Prelude::CT_negate',1) # "negate"
  Prelude::CT_negateFloat = Operation.new('Prelude::CT_negateFloat',1) # "negateFloat"
  Prelude::CT_prim_5FnegateFloat = Operation.new('Prelude::CT_prim_5FnegateFloat',1) # "prim_negateFloat"
  Prelude::CT_success = Operation.new('Prelude::CT_success',0) # "success"
  Prelude::CT_maybe = Operation.new('Prelude::CT_maybe',3) # "maybe"
  Prelude::CT_either = Operation.new('Prelude::CT_either',3) # "either"
  Prelude::CT__3E_3E_3D = Operation.new('Prelude::CT__3E_3E_3D',2) # ">>="
  Prelude::CT_return = Operation.new('Prelude::CT_return',1) # "return"
  Prelude::CT__3E_3E = Operation.new('Prelude::CT__3E_3E',2) # ">>"
  Prelude::CT__3E_3E_2E_5F_23lambda6 = Operation.new('Prelude::CT__3E_3E_2E_5F_23lambda6',2) # ">>._#lambda6"
  Prelude::CT_done = Operation.new('Prelude::CT_done',0) # "done"
  Prelude::CT_putChar = Operation.new('Prelude::CT_putChar',1) # "putChar"
  Prelude::CT_prim_5FputChar = Operation.new('Prelude::CT_prim_5FputChar',1) # "prim_putChar"
  Prelude::CT_getChar = Operation.new('Prelude::CT_getChar',0) # "getChar"
  Prelude::CT_readFile = Operation.new('Prelude::CT_readFile',1) # "readFile"
  Prelude::CT_prim_5FreadFile = Operation.new('Prelude::CT_prim_5FreadFile',1) # "prim_readFile"
  Prelude::CT_prim_5FreadFileContents = Operation.new('Prelude::CT_prim_5FreadFileContents',1) # "prim_readFileContents"
  Prelude::CT_writeFile = Operation.new('Prelude::CT_writeFile',2) # "writeFile"
  Prelude::CT_prim_5FwriteFile = Operation.new('Prelude::CT_prim_5FwriteFile',2) # "prim_writeFile"
  Prelude::CT_appendFile = Operation.new('Prelude::CT_appendFile',2) # "appendFile"
  Prelude::CT_prim_5FappendFile = Operation.new('Prelude::CT_prim_5FappendFile',2) # "prim_appendFile"
  Prelude::CT_putStr = Operation.new('Prelude::CT_putStr',1) # "putStr"
  Prelude::CT_putStrLn = Operation.new('Prelude::CT_putStrLn',1) # "putStrLn"
  Prelude::CT_getLine = Operation.new('Prelude::CT_getLine',0) # "getLine"
  Prelude::CT_getLine_2E_5F_23lambda7 = Operation.new('Prelude::CT_getLine_2E_5F_23lambda7',1) # "getLine._#lambda7"
  Prelude::CT_getLine_2E_5F_23lambda7_2E_5F_23lambda8 = Operation.new('Prelude::CT_getLine_2E_5F_23lambda7_2E_5F_23lambda8',2) # "getLine._#lambda7._#lambda8"
  Prelude::CT_userError = Operation.new('Prelude::CT_userError',1) # "userError"
  Prelude::CT_ioError = Operation.new('Prelude::CT_ioError',1) # "ioError"
  Prelude::CT_showError = Operation.new('Prelude::CT_showError',1) # "showError"
  Prelude::CT_catch = Operation.new('Prelude::CT_catch',2) # "catch"
  Prelude::CT_show = Operation.new('Prelude::CT_show',1) # "show"
  Prelude::CT_prim_5Fshow = Operation.new('Prelude::CT_prim_5Fshow',1) # "prim_show"
  Prelude::CT_print = Operation.new('Prelude::CT_print',1) # "print"
  Prelude::CT_doSolve = Operation.new('Prelude::CT_doSolve',1) # "doSolve"
  Prelude::CT_sequenceIO = Operation.new('Prelude::CT_sequenceIO',1) # "sequenceIO"
  Prelude::CT_sequenceIO_2E_5F_23lambda9 = Operation.new('Prelude::CT_sequenceIO_2E_5F_23lambda9',2) # "sequenceIO._#lambda9"
  Prelude::CT_sequenceIO_2E_5F_23lambda9_2E_5F_23lambda10 = Operation.new('Prelude::CT_sequenceIO_2E_5F_23lambda9_2E_5F_23lambda10',2) # "sequenceIO._#lambda9._#lambda10"
  Prelude::CT_sequenceIO_5F = Operation.new('Prelude::CT_sequenceIO_5F',0) # "sequenceIO_"
  Prelude::CT_mapIO = Operation.new('Prelude::CT_mapIO',1) # "mapIO"
  Prelude::CT_mapIO_5F = Operation.new('Prelude::CT_mapIO_5F',1) # "mapIO_"
  Prelude::CT_foldIO = Operation.new('Prelude::CT_foldIO',3) # "foldIO"
  Prelude::CT_foldIO_2E_5F_23lambda11 = Operation.new('Prelude::CT_foldIO_2E_5F_23lambda11',3) # "foldIO._#lambda11"
  Prelude::CT_liftIO = Operation.new('Prelude::CT_liftIO',2) # "liftIO"
  Prelude::CT_forIO = Operation.new('Prelude::CT_forIO',2) # "forIO"
  Prelude::CT_forIO_5F = Operation.new('Prelude::CT_forIO_5F',2) # "forIO_"
  Prelude::CT_unless = Operation.new('Prelude::CT_unless',2) # "unless"
  Prelude::CT_when = Operation.new('Prelude::CT_when',2) # "when"
  Prelude::CT__3F = Operation.new('Prelude::CT__3F',2) # "?"
  Prelude::CT_anyOf = Operation.new('Prelude::CT_anyOf',0) # "anyOf"
  Prelude::CT_unknown = Operation.new('Prelude::CT_unknown',0) # "unknown"
  Prelude::CT_PEVAL = Operation.new('Prelude::CT_PEVAL',1) # "PEVAL"
  Prelude::CT_normalForm = Operation.new('Prelude::CT_normalForm',1) # "normalForm"
  Prelude::CT_groundNormalForm = Operation.new('Prelude::CT_groundNormalForm',1) # "groundNormalForm"
  Prelude::CT_apply = Operation.new('Prelude::CT_apply',2) # "apply"
  Prelude::CT_cond = Operation.new('Prelude::CT_cond',2) # "cond"
  Prelude::CT_letrec = Operation.new('Prelude::CT_letrec',2) # "letrec"
  Prelude::CT__3D_3A_3C_3D = Operation.new('Prelude::CT__3D_3A_3C_3D',2) # "=:<="
  Prelude::CT__3D_3A_3C_3C_3D = Operation.new('Prelude::CT__3D_3A_3C_3C_3D',2) # "=:<<="
  Prelude::CT_ifVar = Operation.new('Prelude::CT_ifVar',3) # "ifVar"
  Prelude::CT_failure = Operation.new('Prelude::CT_failure',2) # "failure"

  def CT__2E.H(expr) # "."
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2E_2E_5F_23lambda1,[var1, var2]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT__2E_2E_5F_23lambda1.H(expr) # ".._#lambda1"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var2, var3]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_id.H(expr) # "id"
    var1 = expr.content.arguments[0]
    rhs = var1
    expr.replace(rhs.content)
    if expr.content.symbol.token == OPERATION
      expr.H()
    end
    return expr
  end

  def CT_const.H(expr) # "const"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = var1
    expr.replace(rhs.content)
    if expr.content.symbol.token == OPERATION
      expr.H()
    end
    return expr
  end

  def CT_curry.H(expr) # "curry"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[var2, var3]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_uncurry.H(expr) # "uncurry"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var3])), var4]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_flip.H(expr) # "flip"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var3])), var2]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_until.H(expr) # "until"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var4 case selector
    var4 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var3]))
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_until,[var1, var2, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var2, var3]))]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "True" => CT_True
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_seq.H(expr) # "seq"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_21,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_const,[var2]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_ensureNotFree.H(expr) # "ensureNotFree"
    rhs = CT_External::CT_ensureNotFree(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_ensureSpine.H(expr) # "ensureSpine"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_ensureSpine_2EensureList_2E20,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_ensureNotFree,[var1]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_ensureSpine_2EensureList_2E20.H(expr) # "ensureSpine.ensureList.20"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var2, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_ensureSpine,[var3]))]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT__24.H(expr) # "$"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var2]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT__24_21.H(expr) # "$!"
    rhs = CT_External::CT__24_21(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__24_21_21.H(expr) # "$!!"
    rhs = CT_External::CT__24_21_21(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__24_23.H(expr) # "$#"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_21,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_ensureNotFree,[var2]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT__24_23_23.H(expr) # "$##"
    rhs = CT_External::CT__24_23_23(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_error.H(expr) # "error"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5Ferror,[]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5Ferror.H(expr) # "prim_error"
    rhs = CT_External::CT_prim_5Ferror(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_failed.H(expr) # "failed"
    rhs = CT_External::CT_failed(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__26_26.H(expr) # "&&"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = var1
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_False,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # "True" => CT_True
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT__7C_7C.H(expr) # "||"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = var1
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_not.H(expr) # "not"
    var1 = expr.content.arguments[0]
    # var2 case selector
    var2 = var1
    loop {
      case var2.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var2.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_False,[]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_otherwise.H(expr) # "otherwise"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_if_5Fthen_5Felse.H(expr) # "if_then_else"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # "True" => CT_True
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_solve.H(expr) # "solve"
    var1 = expr.content.arguments[0]
    # var2 case selector
    var2 = var1
    loop {
      case var2.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var2.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_External::FAILED
        expr.replace(rhs.content)
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT__26_3E.H(expr) # "&>"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = var1
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_External::FAILED
        expr.replace(rhs.content)
        return expr
      when 5 # "True" => CT_True
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT__3D_3D.H(expr) # "=="
    rhs = CT_External::CT__3D_3D(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__2F_3D.H(expr) # "/="
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_not,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var1, var2]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT__3D_3A_3D.H(expr) # "=:="
    rhs = CT_External::CT__3D_3A_3D(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__26.H(expr) # "&"
    rhs = CT_External::CT__26(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_compare.H(expr) # "compare"
    rhs = CT_External::CT_compare(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__3C.H(expr) # "<"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # [(3,[])]
    var3 = nil # to be bound soon
    var3 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_False,[]))
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3C_5Fcase_5F_231,[var1, var2, var3]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT__3C_5Fcase_5F_231.H(expr) # "<_case_#1"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var4 case selector
    var4 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_compare,[var1, var2]))
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "LT" => CT_LT
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # "EQ" => CT_EQ
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 6 # "GT" => CT_GT
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT__3E.H(expr) # ">"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # [(3,[])]
    var3 = nil # to be bound soon
    var3 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_False,[]))
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_5Fcase_5F_231,[var1, var2, var3]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT__3E_5Fcase_5F_231.H(expr) # ">_case_#1"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var4 case selector
    var4 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_compare,[var1, var2]))
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "LT" => CT_LT
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # "EQ" => CT_EQ
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 6 # "GT" => CT_GT
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT__3C_3D.H(expr) # "<="
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_not,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E,[var1, var2]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT__3E_3D.H(expr) # ">="
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_not,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3C,[var1, var2]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_max.H(expr) # "max"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3D,[var1, var2]))
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # "True" => CT_True
        rhs = var1
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_min.H(expr) # "min"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3C_3D,[var1, var2]))
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # "True" => CT_True
        rhs = var1
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_fst.H(expr) # "fst"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_snd.H(expr) # "snd"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_head.H(expr) # "head"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_External::FAILED
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_tail.H(expr) # "tail"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_External::FAILED
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_null.H(expr) # "null"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_False,[]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT__2B_2B.H(expr) # "++"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var1
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B_2B,[var4, var2]))]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_length.H(expr) # "length"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = make_int(0)
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B,[make_int(1), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_length,[var3]))]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT__21_21.H(expr) # "!!"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var1
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_External::FAILED
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        # var6 case selector
        var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var2, make_int(0)]))
        loop {
          case var6.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var6.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "False" => CT_False
            # var7 case selector
            var7 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E,[var2, make_int(0)]))
            loop {
              case var7.content.symbol.token
              when 0 # VARIABLE
                raise 'Handling Variables not implemented yet'
              when 1, 3 # CHOICE, OPERATION
                var7.H
                next
              when 2 # FAIL
                expr.replace(CT_External::FAILED.content)
                return expr
              when 4 # "False" => CT_False
                rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
                expr.replace(rhs.content)
                expr.H()
                return expr
              when 5 # "True" => CT_True
                rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__21_21,[var4, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2D,[var2, make_int(1)]))]))
                expr.replace(rhs.content)
                expr.H()
                return expr
              end
            }
          when 5 # "True" => CT_True
            rhs = var3
            expr.replace(rhs.content)
            if expr.content.symbol.token == OPERATION
              expr.H()
            end
            return expr
          end
        }
      end
    }
  end

  def CT_map.H(expr) # "map"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var3])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_map,[var1, var4]))]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_foldl.H(expr) # "foldl"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var6 case selector
    var6 = var3
    loop {
      case var6.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var6.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # ":" => CT__3A
        var4 = var6.content.arguments[0]
        var5 = var6.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldl,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var2])), var4])), var5]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_foldl1.H(expr) # "foldl1"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_External::FAILED
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldl,[var1, var3, var4]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_foldr.H(expr) # "foldr"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var6 case selector
    var6 = var3
    loop {
      case var6.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var6.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # ":" => CT__3A
        var4 = var6.content.arguments[0]
        var5 = var6.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var4])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldr,[var1, var2, var5]))]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_foldr1.H(expr) # "foldr1"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var7 case selector
    var7 = var2
    loop {
      case var7.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var7.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_External::FAILED
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var7.content.arguments[0]
        var4 = var7.content.arguments[1]
        # var8 case selector
        var8 = var4
        loop {
          case var8.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var8.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "[]" => CT__5B_5D
            rhs = var3
            expr.replace(rhs.content)
            if expr.content.symbol.token == OPERATION
              expr.H()
            end
            return expr
          when 5 # ":" => CT__3A
            var5 = var8.content.arguments[0]
            var6 = var8.content.arguments[1]
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var3])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldr1,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var5, var6]))]))]))
            expr.replace(rhs.content)
            expr.H()
            return expr
          end
        }
      end
    }
  end

  def CT_filter.H(expr) # "filter"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        # var6 case selector
        var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var3]))
        loop {
          case var6.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var6.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "False" => CT_False
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_filter,[var1, var4]))
            expr.replace(rhs.content)
            expr.H()
            return expr
          when 5 # "True" => CT_True
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_filter,[var1, var4]))]))
            expr.replace(rhs.content)
            return expr
          end
        }
      end
    }
  end

  def CT_zip.H(expr) # "zip"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var7 case selector
    var7 = var1
    loop {
      case var7.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var7.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var7.content.arguments[0]
        var4 = var7.content.arguments[1]
        # var8 case selector
        var8 = var2
        loop {
          case var8.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var8.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "[]" => CT__5B_5D
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
            expr.replace(rhs.content)
            return expr
          when 5 # ":" => CT__3A
            var5 = var8.content.arguments[0]
            var6 = var8.content.arguments[1]
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[var3, var5])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_zip,[var4, var6]))]))
            expr.replace(rhs.content)
            return expr
          end
        }
      end
    }
  end

  def CT_zip3.H(expr) # "zip3"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var10 case selector
    var10 = var1
    loop {
      case var10.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var10.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var4 = var10.content.arguments[0]
        var5 = var10.content.arguments[1]
        # var11 case selector
        var11 = var2
        loop {
          case var11.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var11.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "[]" => CT__5B_5D
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
            expr.replace(rhs.content)
            return expr
          when 5 # ":" => CT__3A
            var6 = var11.content.arguments[0]
            var7 = var11.content.arguments[1]
            # var12 case selector
            var12 = var3
            loop {
              case var12.content.symbol.token
              when 0 # VARIABLE
                raise 'Handling Variables not implemented yet'
              when 1, 3 # CHOICE, OPERATION
                var12.H
                next
              when 2 # FAIL
                expr.replace(CT_External::FAILED.content)
                return expr
              when 4 # "[]" => CT__5B_5D
                rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
                expr.replace(rhs.content)
                return expr
              when 5 # ":" => CT__3A
                var8 = var12.content.arguments[0]
                var9 = var12.content.arguments[1]
                rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_2C_29,[var4, var6, var8])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_zip3,[var5, var7, var9]))]))
                expr.replace(rhs.content)
                return expr
              end
            }
          end
        }
      end
    }
  end

  def CT_zipWith.H(expr) # "zipWith"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var8 case selector
    var8 = var2
    loop {
      case var8.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var8.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var4 = var8.content.arguments[0]
        var5 = var8.content.arguments[1]
        # var9 case selector
        var9 = var3
        loop {
          case var9.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var9.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "[]" => CT__5B_5D
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
            expr.replace(rhs.content)
            return expr
          when 5 # ":" => CT__3A
            var6 = var9.content.arguments[0]
            var7 = var9.content.arguments[1]
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var4])), var6])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_zipWith,[var1, var5, var7]))]))
            expr.replace(rhs.content)
            return expr
          end
        }
      end
    }
  end

  def CT_zipWith3.H(expr) # "zipWith3"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    var4 = expr.content.arguments[3]
    # var11 case selector
    var11 = var2
    loop {
      case var11.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var11.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var5 = var11.content.arguments[0]
        var6 = var11.content.arguments[1]
        # var12 case selector
        var12 = var3
        loop {
          case var12.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var12.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "[]" => CT__5B_5D
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
            expr.replace(rhs.content)
            return expr
          when 5 # ":" => CT__3A
            var7 = var12.content.arguments[0]
            var8 = var12.content.arguments[1]
            # var13 case selector
            var13 = var4
            loop {
              case var13.content.symbol.token
              when 0 # VARIABLE
                raise 'Handling Variables not implemented yet'
              when 1, 3 # CHOICE, OPERATION
                var13.H
                next
              when 2 # FAIL
                expr.replace(CT_External::FAILED.content)
                return expr
              when 4 # "[]" => CT__5B_5D
                rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
                expr.replace(rhs.content)
                return expr
              when 5 # ":" => CT__3A
                var9 = var13.content.arguments[0]
                var10 = var13.content.arguments[1]
                rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var5])), var7])), var9])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_zipWith3,[var1, var6, var8, var10]))]))
                expr.replace(rhs.content)
                return expr
              end
            }
          end
        }
      end
    }
  end

  def CT_unzip.H(expr) # "unzip"
    var1 = expr.content.arguments[0]
    # var6 case selector
    var6 = var1
    loop {
      case var6.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var6.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var2 = var6.content.arguments[0]
        var3 = var6.content.arguments[1]
        # var7 case selector
        var7 = var2
        loop {
          case var7.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var7.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "(,)" => CT__28_2C_29
            var4 = var7.content.arguments[0]
            var5 = var7.content.arguments[1]
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unzip_5Flet_5F_231,[var4, var5, var3]))
            expr.replace(rhs.content)
            expr.H()
            return expr
          end
        }
      end
    }
  end

  def CT_unzip_5Flet_5F_231.H(expr) # "unzip_let_#1"
    var4 = expr.content.arguments[0]
    var5 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # [(6,[]),(7,[]),(8,[])]
    var6 = nil # to be bound soon
    var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unzip,[var3]))
    var7 = nil # to be bound soon
    var7 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unzip_2E_5F_23selFP2_23xs,[var6]))
    var8 = nil # to be bound soon
    var8 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unzip_2E_5F_23selFP3_23ys,[var6]))
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var4, var7])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var5, var8]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_unzip_2E_5F_23selFP2_23xs.H(expr) # "unzip._#selFP2#xs"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_unzip_2E_5F_23selFP3_23ys.H(expr) # "unzip._#selFP3#ys"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_unzip3.H(expr) # "unzip3"
    var1 = expr.content.arguments[0]
    # var7 case selector
    var7 = var1
    loop {
      case var7.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var7.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var2 = var7.content.arguments[0]
        var3 = var7.content.arguments[1]
        # var8 case selector
        var8 = var2
        loop {
          case var8.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var8.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "(,,)" => CT__28_2C_2C_29
            var4 = var8.content.arguments[0]
            var5 = var8.content.arguments[1]
            var6 = var8.content.arguments[2]
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unzip3_5Flet_5F_231,[var4, var5, var6, var3]))
            expr.replace(rhs.content)
            expr.H()
            return expr
          end
        }
      end
    }
  end

  def CT_unzip3_5Flet_5F_231.H(expr) # "unzip3_let_#1"
    var4 = expr.content.arguments[0]
    var5 = expr.content.arguments[1]
    var6 = expr.content.arguments[2]
    var3 = expr.content.arguments[3]
    # [(7,[]),(8,[]),(9,[]),(10,[])]
    var7 = nil # to be bound soon
    var7 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unzip3,[var3]))
    var8 = nil # to be bound soon
    var8 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unzip3_2E_5F_23selFP5_23xs,[var7]))
    var9 = nil # to be bound soon
    var9 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unzip3_2E_5F_23selFP6_23ys,[var7]))
    var10 = nil # to be bound soon
    var10 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unzip3_2E_5F_23selFP7_23zs,[var7]))
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var4, var8])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var5, var9])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var6, var10]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_unzip3_2E_5F_23selFP5_23xs.H(expr) # "unzip3._#selFP5#xs"
    var1 = expr.content.arguments[0]
    # var5 case selector
    var5 = var1
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,,)" => CT__28_2C_2C_29
        var2 = var5.content.arguments[0]
        var3 = var5.content.arguments[1]
        var4 = var5.content.arguments[2]
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_unzip3_2E_5F_23selFP6_23ys.H(expr) # "unzip3._#selFP6#ys"
    var1 = expr.content.arguments[0]
    # var5 case selector
    var5 = var1
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,,)" => CT__28_2C_2C_29
        var2 = var5.content.arguments[0]
        var3 = var5.content.arguments[1]
        var4 = var5.content.arguments[2]
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_unzip3_2E_5F_23selFP7_23zs.H(expr) # "unzip3._#selFP7#zs"
    var1 = expr.content.arguments[0]
    # var5 case selector
    var5 = var1
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,,)" => CT__28_2C_2C_29
        var2 = var5.content.arguments[0]
        var3 = var5.content.arguments[1]
        var4 = var5.content.arguments[2]
        rhs = var4
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_concat.H(expr) # "concat"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldr,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B_2B,[]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_concatMap.H(expr) # "concatMap"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2E,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_concat,[]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_map,[var1]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_iterate.H(expr) # "iterate"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var2, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_iterate,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var2]))]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_repeat.H(expr) # "repeat"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_repeat,[var1]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_replicate.H(expr) # "replicate"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_take,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_repeat,[var2]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_take.H(expr) # "take"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3C_3D,[var1, make_int(0)]))
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_take_2Etakep_2E220,[var1, var2]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_take_2Etakep_2E220.H(expr) # "take.takep.220"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_take,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2D,[var1, make_int(1)])), var4]))]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_drop.H(expr) # "drop"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3C_3D,[var1, make_int(0)]))
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_drop_2Edropp_2E229,[var1, var2]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "True" => CT_True
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_drop_2Edropp_2E229.H(expr) # "drop.dropp.229"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_drop,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2D,[var1, make_int(1)])), var4]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_splitAt.H(expr) # "splitAt"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3C_3D,[var1, make_int(0)]))
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_splitAt_2EsplitAtp_2E239,[var1, var2]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), var2]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_splitAt_2EsplitAtp_2E239.H(expr) # "splitAt.splitAtp.239"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_splitAt_2EsplitAtp_2E239_5Flet_5F_231,[var3, var1, var4]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_splitAt_2EsplitAtp_2E239_5Flet_5F_231.H(expr) # "splitAt.splitAtp.239_let_#1"
    var3 = expr.content.arguments[0]
    var1 = expr.content.arguments[1]
    var4 = expr.content.arguments[2]
    # [(5,[]),(6,[]),(7,[])]
    var5 = nil # to be bound soon
    var5 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_splitAt,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2D,[var1, make_int(1)])), var4]))
    var6 = nil # to be bound soon
    var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_splitAt_2EsplitAtp_2E239_2E_5F_23selFP9_23ys,[var5]))
    var7 = nil # to be bound soon
    var7 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_splitAt_2EsplitAtp_2E239_2E_5F_23selFP10_23zs,[var5]))
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3, var6])), var7]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_splitAt_2EsplitAtp_2E239_2E_5F_23selFP9_23ys.H(expr) # "splitAt.splitAtp.239._#selFP9#ys"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_splitAt_2EsplitAtp_2E239_2E_5F_23selFP10_23zs.H(expr) # "splitAt.splitAtp.239._#selFP10#zs"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_takeWhile.H(expr) # "takeWhile"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        # var6 case selector
        var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var3]))
        loop {
          case var6.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var6.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "False" => CT_False
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
            expr.replace(rhs.content)
            return expr
          when 5 # "True" => CT_True
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_takeWhile,[var1, var4]))]))
            expr.replace(rhs.content)
            return expr
          end
        }
      end
    }
  end

  def CT_dropWhile.H(expr) # "dropWhile"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        # var6 case selector
        var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var3]))
        loop {
          case var6.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var6.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "False" => CT_False
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3, var4]))
            expr.replace(rhs.content)
            return expr
          when 5 # "True" => CT_True
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_dropWhile,[var1, var4]))
            expr.replace(rhs.content)
            expr.H()
            return expr
          end
        }
      end
    }
  end

  def CT_span.H(expr) # "span"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var2
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        # var6 case selector
        var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var3]))
        loop {
          case var6.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var6.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "False" => CT_False
            # var7 case selector
            var7 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_otherwise,[]))
            loop {
              case var7.content.symbol.token
              when 0 # VARIABLE
                raise 'Handling Variables not implemented yet'
              when 1, 3 # CHOICE, OPERATION
                var7.H
                next
              when 2 # FAIL
                expr.replace(CT_External::FAILED.content)
                return expr
              when 4 # "False" => CT_False
                rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
                expr.replace(rhs.content)
                expr.H()
                return expr
              when 5 # "True" => CT_True
                rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3, var4]))]))
                expr.replace(rhs.content)
                return expr
              end
            }
          when 5 # "True" => CT_True
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_span_5Flet_5F_231,[var3, var1, var4]))
            expr.replace(rhs.content)
            expr.H()
            return expr
          end
        }
      end
    }
  end

  def CT_span_5Flet_5F_231.H(expr) # "span_let_#1"
    var3 = expr.content.arguments[0]
    var1 = expr.content.arguments[1]
    var4 = expr.content.arguments[2]
    # [(5,[]),(6,[]),(7,[])]
    var5 = nil # to be bound soon
    var5 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_span,[var1, var4]))
    var6 = nil # to be bound soon
    var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_span_2E_5F_23selFP12_23ys,[var5]))
    var7 = nil # to be bound soon
    var7 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_span_2E_5F_23selFP13_23zs,[var5]))
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3, var6])), var7]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_span_2E_5F_23selFP12_23ys.H(expr) # "span._#selFP12#ys"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_span_2E_5F_23selFP13_23zs.H(expr) # "span._#selFP13#zs"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_break.H(expr) # "break"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_span,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2E,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_not,[]))])), var1]))]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_lines.H(expr) # "lines"
    var1 = expr.content.arguments[0]
    # var7 case selector
    var7 = var1
    loop {
      case var7.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var7.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var2 = var7.content.arguments[0]
        var3 = var7.content.arguments[1]
        # [(4,[]),(5,[]),(6,[])]
        var4 = nil # to be bound soon
        var4 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_lines_2Esplitline_2E271,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var2, var3]))]))
        var5 = nil # to be bound soon
        var5 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_lines_2E_5F_23selFP18_23l,[var4]))
        var6 = nil # to be bound soon
        var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_lines_2E_5F_23selFP19_23xs_5Fl,[var4]))
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var5, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_lines,[var6]))]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_lines_2Esplitline_2E271.H(expr) # "lines.splitline.271"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        # var5 case selector
        var5 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var2, CT_Character::make_char("\x0a")]))
        loop {
          case var5.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var5.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "False" => CT_False
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_lines_2Esplitline_2E271_5Flet_5F_231,[var2, var3]))
            expr.replace(rhs.content)
            expr.H()
            return expr
          when 5 # "True" => CT_True
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])), var3]))
            expr.replace(rhs.content)
            return expr
          end
        }
      end
    }
  end

  def CT_lines_2Esplitline_2E271_5Flet_5F_231.H(expr) # "lines.splitline.271_let_#1"
    var2 = expr.content.arguments[0]
    var3 = expr.content.arguments[1]
    # [(4,[]),(5,[]),(6,[])]
    var4 = nil # to be bound soon
    var4 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_lines_2Esplitline_2E271,[var3]))
    var5 = nil # to be bound soon
    var5 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_lines_2Esplitline_2E271_2E_5F_23selFP15_23ds,[var4]))
    var6 = nil # to be bound soon
    var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_lines_2Esplitline_2E271_2E_5F_23selFP16_23es,[var4]))
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var2, var5])), var6]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_lines_2Esplitline_2E271_2E_5F_23selFP15_23ds.H(expr) # "lines.splitline.271._#selFP15#ds"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_lines_2Esplitline_2E271_2E_5F_23selFP16_23es.H(expr) # "lines.splitline.271._#selFP16#es"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_lines_2E_5F_23selFP18_23l.H(expr) # "lines._#selFP18#l"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_lines_2E_5F_23selFP19_23xs_5Fl.H(expr) # "lines._#selFP19#xs_l"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_unlines.H(expr) # "unlines"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_concatMap,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_flip,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B_2B,[]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("\x0a"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))]))]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_words.H(expr) # "words"
    var1 = expr.content.arguments[0]
    # [(2,[])]
    var2 = nil # to be bound soon
    var2 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_dropWhile,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_words_2EisSpace_2E283,[]))])), var1]))
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_words_5Fcase_5F_231,[var2]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_words_5Fcase_5F_231.H(expr) # "words_case_#1"
    var2 = expr.content.arguments[0]
    # var6 case selector
    var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var2, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))
    loop {
      case var6.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var6.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        # [(3,[]),(4,[]),(5,[])]
        var3 = nil # to be bound soon
        var3 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_break,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_words_2EisSpace_2E283,[]))]))])), var2]))
        var4 = nil # to be bound soon
        var4 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_words_2E_5F_23selFP21_23w,[var3]))
        var5 = nil # to be bound soon
        var5 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_words_2E_5F_23selFP22_23s2,[var3]))
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var4, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_words,[var5]))]))
        expr.replace(rhs.content)
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_words_2EisSpace_2E283.H(expr) # "words.isSpace.283"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__7C_7C,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var1, CT_Character::make_char(" ")])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__7C_7C,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var1, CT_Character::make_char("\x09")])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__7C_7C,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var1, CT_Character::make_char("\x0a")])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var1, CT_Character::make_char("\x0d")]))]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_words_2E_5F_23selFP21_23w.H(expr) # "words._#selFP21#w"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_words_2E_5F_23selFP22_23s2.H(expr) # "words._#selFP22#s2"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "(,)" => CT__28_2C_29
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = var3
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT_unwords.H(expr) # "unwords"
    var1 = expr.content.arguments[0]
    # var2 case selector
    var2 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))
    loop {
      case var2.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var2.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldr1,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_unwords_2E_5F_23lambda5,[]))])), var1]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_unwords_2E_5F_23lambda5.H(expr) # "unwords._#lambda5"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B_2B,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(" "), var2]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_reverse.H(expr) # "reverse"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldl,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_flip,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[]))]))]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_and.H(expr) # "and"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldr,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__26_26,[]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_or.H(expr) # "or"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldr,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__7C_7C,[]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_False,[]))]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_any.H(expr) # "any"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2E,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_or,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_map,[var1]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_all.H(expr) # "all"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2E,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_and,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_map,[var1]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_elem.H(expr) # "elem"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_any,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var1]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_notElem.H(expr) # "notElem"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_all,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2F_3D,[var1]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_lookup.H(expr) # "lookup"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var7 case selector
    var7 = var2
    loop {
      case var7.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var7.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_Nothing,[]))
        expr.replace(rhs.content)
        return expr
      when 5 # ":" => CT__3A
        var3 = var7.content.arguments[0]
        var4 = var7.content.arguments[1]
        # var8 case selector
        var8 = var3
        loop {
          case var8.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var8.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "(,)" => CT__28_2C_29
            var5 = var8.content.arguments[0]
            var6 = var8.content.arguments[1]
            # var9 case selector
            var9 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var1, var5]))
            loop {
              case var9.content.symbol.token
              when 0 # VARIABLE
                raise 'Handling Variables not implemented yet'
              when 1, 3 # CHOICE, OPERATION
                var9.H
                next
              when 2 # FAIL
                expr.replace(CT_External::FAILED.content)
                return expr
              when 4 # "False" => CT_False
                # var10 case selector
                var10 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_otherwise,[]))
                loop {
                  case var10.content.symbol.token
                  when 0 # VARIABLE
                    raise 'Handling Variables not implemented yet'
                  when 1, 3 # CHOICE, OPERATION
                    var10.H
                    next
                  when 2 # FAIL
                    expr.replace(CT_External::FAILED.content)
                    return expr
                  when 4 # "False" => CT_False
                    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
                    expr.replace(rhs.content)
                    expr.H()
                    return expr
                  when 5 # "True" => CT_True
                    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_lookup,[var1, var4]))
                    expr.replace(rhs.content)
                    expr.H()
                    return expr
                  end
                }
              when 5 # "True" => CT_True
                rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_Just,[var6]))
                expr.replace(rhs.content)
                return expr
              end
            }
          end
        }
      end
    }
  end

  def CT_enumFrom.H(expr) # "enumFrom"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_enumFrom,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B,[var1, make_int(1)]))]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_enumFromThen.H(expr) # "enumFromThen"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_iterate,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2D,[var2, var1]))]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_enumFromTo.H(expr) # "enumFromTo"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E,[var1, var2]))
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_enumFromTo,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B,[var1, make_int(1)])), var2]))]))
        expr.replace(rhs.content)
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_enumFromThenTo.H(expr) # "enumFromThenTo"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_takeWhile,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_enumFromThenTo_2Ep_2E321,[var3, var1, var2]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_enumFromThen,[var1, var2]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_enumFromThenTo_2Ep_2E321.H(expr) # "enumFromThenTo.p.321"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    var4 = expr.content.arguments[3]
    # var5 case selector
    var5 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3D,[var3, var2]))
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        # var6 case selector
        var6 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_otherwise,[]))
        loop {
          case var6.content.symbol.token
          when 0 # VARIABLE
            raise 'Handling Variables not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            var6.H
            next
          when 2 # FAIL
            expr.replace(CT_External::FAILED.content)
            return expr
          when 4 # "False" => CT_False
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
            expr.replace(rhs.content)
            expr.H()
            return expr
          when 5 # "True" => CT_True
            rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3D,[var4, var1]))
            expr.replace(rhs.content)
            expr.H()
            return expr
          end
        }
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3C_3D,[var4, var1]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_ord.H(expr) # "ord"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5Ford,[]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5Ford.H(expr) # "prim_ord"
    rhs = CT_External::CT_prim_5Ford(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_chr.H(expr) # "chr"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5Fchr,[]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5Fchr.H(expr) # "prim_chr"
    rhs = CT_External::CT_prim_5Fchr(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__2B.H(expr) # "+"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FInt_5Fplus,[]))])), var2])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FInt_5Fplus.H(expr) # "prim_Int_plus"
    rhs = CT_External::CT_prim_5FInt_5Fplus(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__2D.H(expr) # "-"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FInt_5Fminus,[]))])), var2])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FInt_5Fminus.H(expr) # "prim_Int_minus"
    rhs = CT_External::CT_prim_5FInt_5Fminus(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__2A.H(expr) # "*"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FInt_5Ftimes,[]))])), var2])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FInt_5Ftimes.H(expr) # "prim_Int_times"
    rhs = CT_External::CT_prim_5FInt_5Ftimes(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_div.H(expr) # "div"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FInt_5Fdiv,[]))])), var2])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FInt_5Fdiv.H(expr) # "prim_Int_div"
    rhs = CT_External::CT_prim_5FInt_5Fdiv(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_mod.H(expr) # "mod"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FInt_5Fmod,[]))])), var2])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FInt_5Fmod.H(expr) # "prim_Int_mod"
    rhs = CT_External::CT_prim_5FInt_5Fmod(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_divMod.H(expr) # "divMod"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_div,[var1, var2])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_mod,[var1, var2]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_quot.H(expr) # "quot"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FInt_5Fquot,[]))])), var2])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FInt_5Fquot.H(expr) # "prim_Int_quot"
    rhs = CT_External::CT_prim_5FInt_5Fquot(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_rem.H(expr) # "rem"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FInt_5Frem,[]))])), var2])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FInt_5Frem.H(expr) # "prim_Int_rem"
    rhs = CT_External::CT_prim_5FInt_5Frem(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_quotRem.H(expr) # "quotRem"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_2C_29,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_quot,[var1, var2])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_rem,[var1, var2]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_negate.H(expr) # "negate"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2D,[make_int(0), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_negateFloat.H(expr) # "negateFloat"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FnegateFloat,[]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FnegateFloat.H(expr) # "prim_negateFloat"
    rhs = CT_External::CT_prim_5FnegateFloat(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_success.H(expr) # "success"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_maybe.H(expr) # "maybe"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var5 case selector
    var5 = var3
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "Nothing" => CT_Nothing
        rhs = var1
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # "Just" => CT_Just
        var4 = var5.content.arguments[0]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var2, var4]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_either.H(expr) # "either"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var6 case selector
    var6 = var3
    loop {
      case var6.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var6.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "Left" => CT_Left
        var4 = var6.content.arguments[0]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var4]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "Right" => CT_Right
        var5 = var6.content.arguments[0]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var2, var5]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT__3E_3E_3D.H(expr) # ">>="
    rhs = CT_External::CT__3E_3E_3D(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_return.H(expr) # "return"
    rhs = CT_External::CT_return(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__3E_3E.H(expr) # ">>"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E_3D,[var1, CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E_2E_5F_23lambda6,[var2]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT__3E_3E_2E_5F_23lambda6.H(expr) # ">>._#lambda6"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = var1
    expr.replace(rhs.content)
    if expr.content.symbol.token == OPERATION
      expr.H()
    end
    return expr
  end

  def CT_done.H(expr) # "done"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_return,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_29,[]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_putChar.H(expr) # "putChar"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FputChar,[]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FputChar.H(expr) # "prim_putChar"
    rhs = CT_External::CT_prim_5FputChar(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_getChar.H(expr) # "getChar"
    rhs = CT_External::CT_getChar(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_readFile.H(expr) # "readFile"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FreadFile,[]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FreadFile.H(expr) # "prim_readFile"
    rhs = CT_External::CT_prim_5FreadFile(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_prim_5FreadFileContents.H(expr) # "prim_readFileContents"
    rhs = CT_External::CT_prim_5FreadFileContents(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_writeFile.H(expr) # "writeFile"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FwriteFile,[]))])), var1])), var2]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FwriteFile.H(expr) # "prim_writeFile"
    rhs = CT_External::CT_prim_5FwriteFile(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_appendFile.H(expr) # "appendFile"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5FappendFile,[]))])), var1])), var2]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5FappendFile.H(expr) # "prim_appendFile"
    rhs = CT_External::CT_prim_5FappendFile(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_putStr.H(expr) # "putStr"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_done,[]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # ":" => CT__3A
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_putChar,[var2])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_putStr,[var3]))]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_putStrLn.H(expr) # "putStrLn"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_putStr,[var1])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_putChar,[CT_Character::make_char("\x0a")]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_getLine.H(expr) # "getLine"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E_3D,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_getChar,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_getLine_2E_5F_23lambda7,[]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_getLine_2E_5F_23lambda7.H(expr) # "getLine._#lambda7"
    var1 = expr.content.arguments[0]
    # var2 case selector
    var2 = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3D_3D,[var1, CT_Character::make_char("\x0a")]))
    loop {
      case var2.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var2.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E_3D,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_getLine,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_getLine_2E_5F_23lambda7_2E_5F_23lambda8,[var1]))]))]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_return,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_getLine_2E_5F_23lambda7_2E_5F_23lambda8.H(expr) # "getLine._#lambda7._#lambda8"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_return,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var1, var2]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_userError.H(expr) # "userError"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_UserError,[var1]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_ioError.H(expr) # "ioError"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_error,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_showError,[var1]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_showError.H(expr) # "showError"
    var1 = expr.content.arguments[0]
    # var6 case selector
    var6 = var1
    loop {
      case var6.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var6.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "IOError" => CT_IOError
        var2 = var6.content.arguments[0]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B_2B,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("i"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("/"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("o"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(" "), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("e"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("o"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(":"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(" "), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))]))]))]))]))]))]))]))]))]))])), var2]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "UserError" => CT_UserError
        var3 = var6.content.arguments[0]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B_2B,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("u"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("s"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("e"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(" "), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("e"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("o"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(":"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(" "), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))]))]))]))]))]))]))]))]))]))]))])), var3]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 6 # "FailError" => CT_FailError
        var4 = var6.content.arguments[0]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B_2B,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("f"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("a"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("i"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("l"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(" "), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("e"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("o"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(":"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(" "), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))]))]))]))]))]))]))]))]))]))]))])), var4]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 7 # "NondetError" => CT_NondetError
        var5 = var6.content.arguments[0]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2B_2B,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("n"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("o"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("n"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("d"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("e"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("t"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(" "), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("e"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("o"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char("r"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(":"), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Character::make_char(" "), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))]))]))]))]))]))]))]))]))]))]))]))]))])), var5]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_catch.H(expr) # "catch"
    rhs = CT_External::CT_catch(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_show.H(expr) # "show"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_prim_5Fshow,[]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_prim_5Fshow.H(expr) # "prim_show"
    rhs = CT_External::CT_prim_5Fshow(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_print.H(expr) # "print"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_putStrLn,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_show,[var1]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_doSolve.H(expr) # "doSolve"
    var1 = expr.content.arguments[0]
    # var2 case selector
    var2 = var1
    loop {
      case var2.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var2.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_done,[]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_sequenceIO.H(expr) # "sequenceIO"
    var1 = expr.content.arguments[0]
    # var4 case selector
    var4 = var1
    loop {
      case var4.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var4.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_return,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # ":" => CT__3A
        var2 = var4.content.arguments[0]
        var3 = var4.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E_3D,[var2, CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_sequenceIO_2E_5F_23lambda9,[var3]))]))]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_sequenceIO_2E_5F_23lambda9.H(expr) # "sequenceIO._#lambda9"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E_3D,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_sequenceIO,[var1])), CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_sequenceIO_2E_5F_23lambda9_2E_5F_23lambda10,[var2]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_sequenceIO_2E_5F_23lambda9_2E_5F_23lambda10.H(expr) # "sequenceIO._#lambda9._#lambda10"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_return,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var1, var2]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_sequenceIO_5F.H(expr) # "sequenceIO_"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldr,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E,[]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_done,[]))]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_mapIO.H(expr) # "mapIO"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2E,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_sequenceIO,[]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_map,[var1]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_mapIO_5F.H(expr) # "mapIO_"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2E,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_sequenceIO_5F,[])), CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_map,[var1]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_foldIO.H(expr) # "foldIO"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    # var6 case selector
    var6 = var3
    loop {
      case var6.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var6.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_return,[var2]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # ":" => CT__3A
        var4 = var6.content.arguments[0]
        var5 = var6.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E_3D,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[var1, var2])), var4])), CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldIO_2E_5F_23lambda11,[var1, var5]))]))]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_foldIO_2E_5F_23lambda11.H(expr) # "foldIO._#lambda11"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    var3 = expr.content.arguments[2]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldIO,[var1, var3, var2]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_liftIO.H(expr) # "liftIO"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3E_3E_3D,[var2, CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__2E,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_return,[]))])), var1]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_forIO.H(expr) # "forIO"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_mapIO,[var2])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_forIO_5F.H(expr) # "forIO_"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_mapIO_5F,[var2])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_unless.H(expr) # "unless"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = var1
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # "True" => CT_True
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_done,[]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      end
    }
  end

  def CT_when.H(expr) # "when"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var3 case selector
    var3 = var1
    loop {
      case var3.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var3.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "False" => CT_False
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_done,[]))
        expr.replace(rhs.content)
        expr.H()
        return expr
      when 5 # "True" => CT_True
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      end
    }
  end

  def CT__3F.H(expr) # "?"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_choice,[var1,var2]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_anyOf.H(expr) # "anyOf"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_foldr1,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(2)),CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_choice,[]))]))]))]))
    expr.replace(rhs.content)
    return expr
  end

  def CT_unknown.H(expr) # "unknown"
    abort "Free variable var1 not implemented"
    rhs = var1
    expr.replace(rhs.content)
    if expr.content.symbol.token == OPERATION
      expr.H()
    end
    return expr
  end

  def CT_PEVAL.H(expr) # "PEVAL"
    var1 = expr.content.arguments[0]
    rhs = var1
    expr.replace(rhs.content)
    if expr.content.symbol.token == OPERATION
      expr.H()
    end
    return expr
  end

  def CT_normalForm.H(expr) # "normalForm"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_21_21,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_id,[]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_groundNormalForm.H(expr) # "groundNormalForm"
    var1 = expr.content.arguments[0]
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__24_23_23,[CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Expressions::Box.new(Int_expression.new(1)),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_id,[]))])), var1]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  def CT_apply.H(expr) # "apply"
    rhs = CT_External::CT_apply(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_cond.H(expr) # "cond"
    rhs = CT_External::CT_cond(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_letrec.H(expr) # "letrec"
    rhs = CT_External::CT_letrec(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__3D_3A_3C_3D.H(expr) # "=:<="
    rhs = CT_External::CT__3D_3A_3C_3D(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT__3D_3A_3C_3C_3D.H(expr) # "=:<<="
    rhs = CT_External::CT__3D_3A_3C_3C_3D(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_ifVar.H(expr) # "ifVar"
    rhs = CT_External::CT_ifVar(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

  def CT_failure.H(expr) # "failure"
    rhs = CT_External::CT_failure(expr)
    expr.replace(rhs.content)
    expr.H() if expr.content.symbol.token == OPERATION
    return expr
  end

end
