
  type linenum = int
  type token = string

  let type1 (i, j) = "TYPE  "  ^ (string_of_int i) ^ " " ^ (string_of_int j)
  let var1 (i, j) = "VAR  " ^ (string_of_int i) ^ " " ^ (string_of_int j)
  let int1 (c,i,j) = "INT(" ^ (string_of_int c) ^ ")   " ^ (string_of_int i) ^ " " ^ (string_of_int j)
  let comma1(i, _) = "COMMA " ^ (string_of_int i)

  let of_int (n : int) : linenum = n
  let to_string (t : token) : string = t