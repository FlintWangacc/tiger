
  type linenum = int
  type token = string

  let type1 (i, _) = "TYPE  "  ^ (string_of_int i)
  let var1 (i, _) = "VAR  " ^ (string_of_int i)
  let int1 (c,i,_) = "INT(" ^ (string_of_int c) ^ ")   " ^ (string_of_int i)