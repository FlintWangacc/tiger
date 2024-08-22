/* File parser.mly */
{%
  type pos = int
  type lexresult = Tokens.token

  let lineNum = ErrorMsg.lineNum
  let linePos = ErrorMsg.linePos
  let err(p1,p2) = ErrorMsg.error p1

  let eof () = let pos = List.hd (!linePos) in Tokens.EOF(pos, pos)
%}
%token <int> INT
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token EOL
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */
%start main             /* the entry point */
%type <int> main
%%
main:
  expr EOL                { $1 }
;
  expr:
    INT                     { $1 }
  | LPAREN expr RPAREN      { $2 }
  | expr PLUS expr          { $1 + $3 }
  | expr MINUS expr         { $1 - $3 }
  | expr TIMES expr         { $1 * $3 }
  | expr DIV expr           { $1 / $3 }
  | MINUS expr %prec UMINUS { - $2 }
;
