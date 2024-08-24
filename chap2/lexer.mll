{
    open Lexing
    (*open Parser*)
    exception EOF

    let lineNum = Errormsg.lineNum
    let linePos = Errormsg.linePos

    let advance_line line_pos =
        Errormsg.lineNum := !Errormsg.lineNum + 1;
        Errormsg.linePos := line_pos :: !Errormsg.linePos
}

rule token = parse
        "\n"           {advance_line (Lexing.lexeme_start lexbuf); (*continue() *)}
    |   ","            {let p = Lexing.lexeme_start lexbuf in Tokens.comma1(p, p+1)}
    |   "var"            {let p = Lexing.lexeme_start lexbuf in Tokens.var1(p, p+3)}
    |   "123"            {let p = Lexing.lexeme_start lexbuf in Tokens.int1(p, p+3)}
    |   _              {let p = Lexing.lexeme_start lexbuf in
                        let str = Lexing.lexeme lexbuf in 
                        ErrorMsg.error p ("illegal character " ^ str); (*continue()*) }
