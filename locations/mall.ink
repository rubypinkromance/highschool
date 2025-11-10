/*
 * The Mall
 *
 * 1-4. ---
 * A. Queen, Twins
 *
 * - Sex with Queen
 */
=== mall ===
CONST MALL = "mall"
VAR MallPeople = ()
~ here = MALL

You are at the {MALL}.

Looking around, you can see {listRoomPeople(MallPeople)}.

- (opts)
<- talkToAllCharacters(MallPeople, -> mall.opts)

+ [Go home]
    -> bedroom
- -> opts
