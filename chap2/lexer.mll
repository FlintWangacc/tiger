{
    (*open Parser*)
    exception EOF

    let lineNum = Errormsg.lineNum
    let linePos = Errormsg.linePos

    let advance_line line_pos =
        Errormsg.lineNum := !Errormsg.lineNum + 1;
        Errormsg.linePos := line_pos :: !Errormsg.linePos
}

rule token = parse
        "\n" as newline           {advance_line (Lexing.lexeme_start lexbuf); String.make 1 newline (*continue() *)}
    |   ","            {(Tokens.comma1(Tokens.of_int (Lexing.lexeme_start lexbuf), Tokens.of_int (Lexing.lexeme_end lexbuf))) |> Tokens.to_string }
    |   "var"            {Tokens.var1(Tokens.of_int (Lexing.lexeme_start lexbuf), Tokens.of_int (Lexing.lexeme_end lexbuf)) |> Tokens.to_string }
    |   "123"            {Tokens.int1(123, Tokens.of_int (Lexing.lexeme_start lexbuf), Tokens.of_int (Lexing.lexeme_end lexbuf)) |> Tokens.to_string }
    |   _              {let str = Lexing.lexeme lexbuf in
                        Errormsg.error (Lexing.lexeme_start lexbuf) ("illegal character " ^ str); ""}
