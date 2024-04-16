type lexresult = string
fun eof () = "end"

%%
id=[a-zA-Z]+[a-zA-Z0-9]*;

%%
{id} => (yytext);
" " => (continue());
\n => (eof());