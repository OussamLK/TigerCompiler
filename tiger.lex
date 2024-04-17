type lexresult = Tokens.token;
fun eof () = Tokens.EOF(0, 0)

%%
id=[_a-zA-Z]+[a-zA-Z0-9]*;

%%

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
"or" => (Tokens.OR(yypos, yypos + size yytext));
"and" => (Tokens.AND(yypos, yypos + size yytext));
">=" => (Tokens.GE(yypos, yypos + size yytext));
">" => (Tokens.GT(yypos, yypos + size yytext));
"<=" => (Tokens.LE(yypos, yypos + size yytext));
"<" => (Tokens.LT(yypos, yypos + size yytext));
"!=" => (Tokens.NEQ(yypos, yypos + size yytext));
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
"string" => (Tokens.STRING(yypos, yypos + size yytext));
"int" => (Tokens.INT(yypos, yypos + size yytext));
{id} => (Tokens.ID(yytext, yypos, yypos + size yytext));

" " => (continue());
\n => (eof());