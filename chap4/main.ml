let _ =
  try
    Printexc.record_backtrace true;

    if Array.length Sys.argv < 2 then (
      print_endline "no input files";
      exit 1);
    
    let filename = Sys.argv.(1) in
    let lexbuf = Lexing.from_channel (open_in filename) in
    let absyn = Parser.program Lexer.token lexbuf in
    Parsing.clear_parser ();
    (*Find_escape.find_escape absyn;
    Find_illegal_assign.Find_illegal_assign absyn;
    let frags = Semant.trans_prog absyn in
    let oc =
      open_out (Filename.remove_extension (Filename.basename filename) ^ ".s")
    in
    List.iter (emitproc oc) frags;
    close_out oc*)
  with Parsing.Parse_error -> Error_msg.parse_error "syntax error"