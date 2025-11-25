/*

    The Library

*/
=== library ===
CONST LIBRARY = "library"
VAR LibraryPeople = ()
~ here = Library
-> access_restrictions ->

You are in the {LIBRARY}. Long shelves hold seemingly endless rows of neatly organized books. Near the front a few tables hold computers whose internet filters are so restrictive as to be essentially offline.

{listRoomPeopleSentence(LibraryPeople)}

- (library_opts)
<- talkAndObserveAllCharacters(LibraryPeople, -> library_opts)

+ [Leave the {LIBRARY}] -> pass_time -> hallway
- -> library_opts

= access_restrictions
{
- isClassTime():
    Shouldn't you be in class right now?
    + [Leave the {LIBRARY}] -> hallway
- else:
    ->->
}
