/*
 * The Library
 *
 * 1. ---
 * 2. ---
 * L. Nerd, Scientist
 * 3. ---
 * 4. ---
 * A. Nerd
 *
 * - Sex with Nerd
 */
=== library ===
CONST LIBRARY = "library"
VAR LibraryPeople = ()
~ here = LIBRARY

You are in the {LIBRARY}.

Looking around, you can see {listRoomPeople(LibraryPeople)}.

- (opts)
<- talkToAllCharacters(LibraryPeople, -> library.opts)

+ [Leave the {LIBRARY}]
    -> pass_time -> hallway
- -> opts
