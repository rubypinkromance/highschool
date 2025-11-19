/*
- The Library
- Sex with Nerd
*/
=== library ===
CONST LIBRARY = "library"
VAR LibraryPeople = ()
~ here = Library
-> access_restrictions ->

You are in the {LIBRARY}.

{listRoomPeopleSentence(LibraryPeople)}

- (library_opts)
<- talkAndObserveAllCharacters(LibraryPeople, -> library_opts)

+ [Leave the {LIBRARY}] -> pass_time -> hallway
- -> library_opts

= access_restrictions
{
- isClassTime():
    Shouldn't you be in class right now? Back to the hallway…
    -> hallway
}
->->
