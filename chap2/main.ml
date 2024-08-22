(* File calc.ml *)
let _ =
  (*try*)
    let lexbuf = Lexing.from_channel stdin in
    while true do
      let result = Lexer.token lexbuf in
      print_endline result; flush stdout
    done
  (*with Lexer.Eof ->
    exit 0*)
