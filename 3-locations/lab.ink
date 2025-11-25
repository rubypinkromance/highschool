/*

    The Science Lab

*/
=== lab ===
CONST LAB = "science classroom"
CONST LAB_CLASS_NAME = "science class"
VAR LabPeople = ()
~ here = Lab
-> access_restrictions ->

You are in the {LAB}. Rather than the standard tables, there are rows of workbenches, each with a sink and spigot to connect a bunson burner. A large poster of the periodic table hangs on one wall, and a diagram of the solar system covers the opposite wall.

{listRoomPeopleSentence(LabPeople)}

- (lab_opts)
<- talkAndObserveAllCharacters(LabPeople, -> lab_opts)

+ [Leave the {LAB}] -> pass_time -> hallway
- -> lab_opts

= access_restrictions
{ isClassTime() and now != hasClass(Lab):
    -> access_denied_science_teacher -> hallway
- else:
    ->->
}
