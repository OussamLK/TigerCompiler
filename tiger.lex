type lexresult = string
fun eof () = "end"

%%
ids=[a-z]+;

%%
{ids} => (yytext);
" " => (continue());
\n => (eof());