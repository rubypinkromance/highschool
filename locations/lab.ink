/*
- The Science Lab
- Sex with Scientist
*/
=== lab ===
CONST LAB = "science classroom"
CONST LAB_CLASS_NAME = "science class"
VAR LabPeople = ()
~ here = Lab
-> access_restrictions ->

You are in the {LAB}.

{listRoomPeopleSentence(LabPeople)}

- (lab_opts)
<- talkAndObserveAllCharacters(LabPeople, -> lab_opts)

+ [Leave the {LAB}] -> pass_time -> hallway
- -> lab_opts

= access_restrictions
{
- isClassTime() and now != hasClass(Lab):
    You're not in this class! Back to the hallway…
    -> hallway
}
->->
