use "tiger.lex.sml";
val strings = ref ["mustapha23", "23a"];
fun f n =
        case !strings of
            [] => "\n"
            |h::t => let val _ = strings := t in let val _ = print("call returning: '"^h^"'\n") in h end end

val lexer = Mlex.makeLexer(f);