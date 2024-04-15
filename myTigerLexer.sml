use "tiger.lex.sml";
val strings = ref ["mustapha oussam larkem the third", " ", "darky", " ", "nassim"];
fun f n =
        case !strings of
            [] => "\n"
            |h::t => let val _ = strings := t in let val _ = print("call returning: '"^h^"'\n") in h end end

val lexer = Mlex.makeLexer(f);