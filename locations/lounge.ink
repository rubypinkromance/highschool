/*
- The Teacher's Lounge
- Sex with Gossip
*/
=== lounge ===
CONST LOUNGE = "teacher’s lounge"
VAR LoungePeople = ()
~ here = LOUNGE

You are in the {LOUNGE}.

{listRoomPeople(LibraryPeople)}

- (lounge_opts)
<- talkAndObserveAllCharacters(LoungePeople, -> lounge_opts)

+ [Leave the {LOUNGE}]
    -> pass_time -> hallway
- -> lounge_opts
