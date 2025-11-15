/*
- The Teacher's Lounge
*/
=== lounge ===
CONST LOUNGE = "teacher’s lounge"
VAR LoungePeople = ()
~ here = Lounge

You are in the {LOUNGE}.

{listRoomPeopleSentence(LibraryPeople)}

- (lounge_opts)
<- talkAndObserveAllCharacters(LoungePeople, -> lounge_opts)

+ [Leave the {LOUNGE}] -> pass_time -> hallway
- -> lounge_opts
