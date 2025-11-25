/*

    The Teacher's Lounge

*/
=== lounge ===
CONST LOUNGE = "teacher’s lounge"
VAR LoungePeople = ()
~ here = Lounge

You are in the {LOUNGE}. A number of couches line the wall. A small kitchenette holds a microwave with a "no fish!" post-it and a coffee maker. A few tables and chairs offer spots for the staff to sit without being bothered by students.
{ isWeekday() and now == Lunch:
    <> The entire staff of the school seems to be here, having a meeting. A few look up as you walk in, but most ignore you. {STUDY_HALL_TEACHER} gestures for you to leave.
}

{listRoomPeopleSentence(LoungePeople)}

- (lounge_opts)
<- talkAndObserveAllCharacters(LoungePeople, -> lounge_opts)

+ [Leave the {LOUNGE}] -> pass_time -> hallway
- -> lounge_opts
