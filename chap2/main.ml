(* File calc.ml *)
let _ =
  (*try*)
    let lexbuf = Lexing.from_channel stdin in
    while true do
      let result = Lexer.token lexbuf in
      print_newline(); flush stdout
    done
  (*with Lexer.Eof ->
    exit 0*)