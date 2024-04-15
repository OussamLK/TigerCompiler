type lexresult = Tokens.token
fun eof() = Tokens.EOF

%%

command = [A-Z]+;
str = "\"[a-zA-Z0-9]\"";
num = [0-9]+;

%%
end. =>(eof());
, => (Tokens.COMMA);
(" " | "\n") => (continue());
"\;" =>(Tokens.EOC);
{command} => (Tokens.COMMAND(yytext));
{num} => (Tokens.NUM(case Int.fromString(yytext)
                        of SOME res => res
                        |NONE => raise (Tokens.Error yytext)));
