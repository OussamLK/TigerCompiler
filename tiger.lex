type lexresult = Tokens.token;
fun eof () = Tokens.EOF(0, 0);
val nesting = ref 0;
val linecount = ref 1;
fun inc n = let val _ = n:= !n +1 in 0 end;
fun altNesting (n:int) = let val _ = nesting := !nesting + n in NONE end;
exception LexError
val error = fn (text, pos, line) => let val [pos, line] = map Int.toString [pos, line] ;
                                  val _ = print("lexing error: `"^text^"` at position: "^pos^" line: "^line^"\n") in
                                  raise LexError end

%%
id=[_a-zA-Z]+[a-zA-Z0-9]*;
%s IN_COMMENT;

%%
"/*" => (altNesting(1); YYBEGIN IN_COMMENT; continue());
<IN_COMMENT>[^("/*" | "*/")]* => (continue());
<IN_COMMENT>"*/" => (altNesting(~1) ; if !nesting = 0 then YYBEGIN INITIAL else YYBEGIN IN_COMMENT;  continue());
"type" => (Tokens.TYPE(yypos, yypos + size yytext));
"var" => (Tokens.VAR(yypos, yypos + size yytext));
"function" => (Tokens.FUNCTION(yypos, yypos + size yytext));
"break" => (Tokens.BREAK(yypos, yypos + size yytext));
"of" => (Tokens.OF(yypos, yypos + size yytext));
"end" => (Tokens.END(yypos, yypos + size yytext));
"in" => (Tokens.IN(yypos, yypos + size yytext));
"nil" => (Tokens.NIL(yypos, yypos + size yytext));
"let" => (Tokens.LET(yypos, yypos + size yytext));
"do" => (Tokens.DO(yypos, yypos + size yytext));
"to" => (Tokens.TO(yypos, yypos + size yytext));
"for" => (Tokens.FOR(yypos, yypos + size yytext));
"while" => (Tokens.WHILE(yypos, yypos + size yytext));
"else" => (Tokens.ELSE(yypos, yypos + size yytext));
"then" => (Tokens.THEN(yypos, yypos + size yytext));
"if" => (Tokens.IF(yypos, yypos + size yytext));
"array" => (Tokens.ARRAY(yypos, yypos + size yytext));
":=" => (Tokens.ASSIGN(yypos, yypos + size yytext));
"|" => (Tokens.OR(yypos, yypos + size yytext));
"&" => (Tokens.AND(yypos, yypos + size yytext));
">=" => (Tokens.GE(yypos, yypos + size yytext));
">" => (Tokens.GT(yypos, yypos + size yytext));
"<=" => (Tokens.LE(yypos, yypos + size yytext));
"<" => (Tokens.LT(yypos, yypos + size yytext));
"<>" => (Tokens.NEQ(yypos, yypos + size yytext));
"=" => (Tokens.EQ(yypos, yypos + size yytext));
"/" => (Tokens.DIVIDE(yypos, yypos + size yytext));
"*" => (Tokens.TIMES(yypos, yypos + size yytext));
"-" => (Tokens.MINUS(yypos, yypos + size yytext));
"+" => (Tokens.PLUS(yypos, yypos + size yytext));
"." => (Tokens.DOT(yypos, yypos + size yytext));
"}" => (Tokens.RBRACE(yypos, yypos + size yytext));
"{" => (Tokens.LBRACE(yypos, yypos + size yytext));
"]" => (Tokens.RBRACK(yypos, yypos + size yytext));
"[" => (Tokens.LBRACK(yypos, yypos + size yytext));
"\)" => (Tokens.RPAREN(yypos, yypos + size yytext));
"\(" => (Tokens.LPAREN(yypos, yypos + size yytext));
";" => (Tokens.SEMICOLON(yypos, yypos + size yytext));
":" => (Tokens.COLON(yypos, yypos + size yytext));
"," => (Tokens.COMMA(yypos, yypos + size yytext));
\"[a-zA-Z]*\" => (Tokens.STRING(yytext, yypos, yypos+1));

[0-9]+ => (case Int.fromString(yytext) of
                SOME v => Tokens.INT(v ,yypos, yypos + size yytext)
                |NONE => raise LexError);
{id} => (Tokens.ID(yytext, yypos, yypos + size yytext));
" " => (continue());
"\n" => (inc linecount; continue());
.=>(error(yytext, yypos, !linecount));