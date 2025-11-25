/*

    The Teacher's Lounge

*/
=== lounge ===
CONST LOUNGE = "teacher’s lounge"
VAR LoungePeople = ()
~ here = Lounge

TODO description
You are in the {LOUNGE}.

{listRoomPeopleSentence(LoungePeople)}

- (lounge_opts)
<- talkAndObserveAllCharacters(LoungePeople, -> lounge_opts)

+ [Leave the {LOUNGE}] -> pass_time -> hallway
- -> lounge_opts
