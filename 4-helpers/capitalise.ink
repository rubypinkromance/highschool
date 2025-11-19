// Ink capitalisation code (v2) created by IFcoltransG
// Released into public domain
// May be used under the MIT No Attribution License

/*
    This is a sentinel token. It should be set to something that won't appear in any words.
*/
CONST START = "^^"

/*
    All letters supported by this tool.
    Lowercase and uppercase should match and have same order as each other.
    Lowercase should have (brackets) around.
    Punctuation should have an entry in get_string().
*/
LIST letters = /*
    lowercase:
    */ (a), (b), (c), (d), (e), (f), (g), (h), (i), (j), (k), (l), (m), (n), (o), (p), (q), (r), (s), (t), (u), (v), (w), (x), (y), (z), (á), /*
    uppercase:
    */ A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, Á, /*
    punctuation:
    */ Space, Comma, FullStop

/*
    Capitalises the first letter of a word made of supported symbols.
    Will cut off any word at the first unsupported symbol.
    e.g. capitalise_start("hello") == "Hello"
    e.g. capitalise_start("HELLO") == "HELLO"
*/
=== function capitalise_start(word) ===
    {word == "":
        ~ return ""
    }
    ~ temp start = first_letter_after(word, "", LIST_ALL(letters))
    ~ return "{capitalise_letter(start)}" + rest_of_letters(word, get_string(start))

/*
    Capitalises a word made of supported symbols.
    Will cut off any word at the first unsupported symbol.
    e.g. capitalise_whole("hello") == "HELLO"
    e.g. capitalise_whole("HELLO") == "HELLO"
*/
=== function capitalise_whole(word) ===
    {word == "":
        ~ return ""
    }
    ~ temp start = first_letter_after(word, "", LIST_ALL(letters))
    ~ temp rest = rest_of_letters(word, get_string(start))
    ~ return "{capitalise_letter(start)}" + capitalise_whole(rest)


// OTHER FUNCTIONS BELOW

/*
    Returns the string version of a letter.
    Has special cases for punctuation — otherwise just returns the name.
    e.g. get_string(A) == "A"
    e.g. get_string(FullStop) == "."
*/
=== function get_string(letter)
    {letter:
        - Space:
            ~ return " "
        - Comma:
            ~ return ","
        - FullStop:
            ~ return "."
        - else:
            ~ return "{letter}"
    }

/*
    Gets the rest of the symbols after a certain start (supported symbols only).
    e.g. rest_of_letters("hello", "he") == "llo"
*/
=== function rest_of_letters(word, start) ===
    {word == start:
        ~ return ""
    }
    ~ temp next_letter = get_string(first_letter_after(word, start, LIST_ALL(letters)))
    {next_letter == "":
            ~ return ""
        - else:
            ~ return next_letter + rest_of_letters(word, start + next_letter)
    }

/*
    Takes a list element from `letters` and capitalises it.
    e.g. capitalise_letter(a) == A
    e.g. capitalise_letter(A) == A
*/
=== function capitalise_letter(letter) ===
    {letters ? letter:
            ~ return letter + LIST_COUNT(letters)
        - else:
            ~ return letter
    }

/*
    Gets the first symbol after a certain start (supported symbols only).
    `options` parameter is an internal detail and should be passed `LIST_ALL(letters)`
    e.g. first_letter_after("hello", "he", LIST_ALL(letters)) == "l"
*/
=== function first_letter_after(word, start, options) ===
    {options:
            ~ temp test_letter = pop(options)
            {starts_with(word, "{start}{get_string(test_letter)}"):
                ~ return test_letter
            }
            ~ return first_letter_after(word, start, options)
        - else:
            ~ return ()
    }

/*
    Checks if a certain string starts with another string.
    The `START` constant should be set to a value that does not appear within strings.
*/
=== function starts_with(word, start) ===
    ~ return START + word ? START + start
