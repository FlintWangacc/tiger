
  type linenum = int
  type token = string

  let type1 (i, _) = "TYPE  "  ^ (string_of_int i)
  let var1 (i, _) = "VAR  " ^ (string_of_int i)
  let int1 (c,i,_) = "INT(" ^ (string_of_int c) ^ ")   " ^ (string_of_int i)
  let comma1(i, _) = "COMMA " ^ (string_of_int i)

  let of_int (n : int) : linenum = n
  let to_string (t : token) : string = t