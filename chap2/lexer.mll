{
    (*open Parser*)
    exception EOF

    let lineNum = ErrorMsg.lineNum
    let linePos = ErrorMsg.linePos
}

rule token = parse
        "\n"           {lineNum := !lineNum+1; linePos := yypos :: !linePos; continue()}
    |   ","            {Tokens.comma1(yypos, yypos+1)}
    |   "var"            {Tokens.var1(yypos,yypos+3)}
    |   "123"            {Tokens.int1(yypos,yypos+3)}
    |   _              {ErrorMsg.error yypos ("illegal character " ^ yytext); continue()}
