structure Tokens =
    struct
        datatype token = COMMAND of string | NUM of int | COMMA | EOC | EOF;
        exception Error of string;
    end;

use "chip8Lexer.lex.sml";

fun input_f n = "SWAP 12, 3 ; ADD 5, 13;\nend."

val lexer = Mlex.makeLexer(input_f)

fun do_lex () =
    let fun loop (result: Tokens.token list) = 
        case lexer() of
            Tokens.EOF => result
            | x => (loop (x::result) handle (Mlex.LexError) => let val _ = print("error\n") in result end)
        in rev (loop []) end 

val res = do_lex();