use "resources/tokens.sml";
use "tiger.lex.sml";



(* val strings = ref ["let\n", "/*this is /* a nested comment */ a comment*/ var s = \"name\""]; *)
val strings = ref ["let\n", "var 3 ", "&"];

fun f n =
        case !strings of
            [] => ""
            |h::t => let val _ = strings := t in let val _ = print("call returning: '"^h^"'\n") in h end end

val lexer = Mlex.makeLexer(f);

fun do_lex() =
    let fun loop result =
        let val t = lexer()
        in if String.isPrefix "EOF" t then t::result else loop(t::result) end
    in rev (loop []) end;

val tokens = do_lex();