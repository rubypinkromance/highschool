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
    */ Space, Comma, FullStop, Ampersand

/*
    Capitalises the first letter of a word made of supported symbols.
    Will cut off any word at the first unsupported symbol.
    e.g. capitalise_start("hello") == "Hello"
    e.g. capitalise_start("HELLO") == "HELLO"
*/
=== function capitaliseStart(word) ===
    {word == "":
        ~ return ""
    }
    ~ temp start = firstLetterAfter(word, "", LIST_ALL(letters))
    ~ return "{capitaliseLetter(start)}" + restOfLetters(word, getString(start))

/*
    Capitalises a word made of supported symbols.
    Will cut off any word at the first unsupported symbol.
    e.g. capitalise_whole("hello") == "HELLO"
    e.g. capitalise_whole("HELLO") == "HELLO"
*/
=== function capitaliseWhole(word) ===
    {word == "":
        ~ return ""
    }
    ~ temp start = firstLetterAfter(word, "", LIST_ALL(letters))
    ~ temp rest = restOfLetters(word, getString(start))
    ~ return "{capitaliseLetter(start)}" + capitaliseWhole(rest)


// OTHER FUNCTIONS BELOW

/*
    Returns the string version of a letter.
    Has special cases for punctuation — otherwise just returns the name.
    e.g. get_string(A) == "A"
    e.g. get_string(FullStop) == "."
*/
=== function getString(letter)
    {letter:
        - Space:
            ~ return " "
        - Comma:
            ~ return ","
        - FullStop:
            ~ return "."
        - Ampersand:
            ~ return "&"
        - else:
            ~ return "{letter}"
    }

/*
    Gets the rest of the symbols after a certain start (supported symbols only).
    e.g. rest_of_letters("hello", "he") == "llo"
*/
=== function restOfLetters(word, start) ===
    {word == start:
        ~ return ""
    }
    ~ temp next_letter = getString(firstLetterAfter(word, start, LIST_ALL(letters)))
    {next_letter == "":
            ~ return ""
        - else:
            ~ return next_letter + restOfLetters(word, start + next_letter)
    }

/*
    Takes a list element from `letters` and capitalises it.
    e.g. capitalise_letter(a) == A
    e.g. capitalise_letter(A) == A
*/
=== function capitaliseLetter(letter) ===
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
=== function firstLetterAfter(word, start, options) ===
    {options:
            ~ temp test_letter = pop(options)
            {startsWith(word, "{start}{getString(test_letter)}"):
                ~ return test_letter
            }
            ~ return firstLetterAfter(word, start, options)
        - else:
            ~ return ()
    }

/*
    Checks if a certain string starts with another string.
    The `START` constant should be set to a value that does not appear within strings.
*/
=== function startsWith(word, start) ===
    ~ return START + word ? START + start
