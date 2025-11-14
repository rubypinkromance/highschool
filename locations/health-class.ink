/*
- The Health Classroom
- Sex with Teacher
*/
=== health_class ===
CONST HEALTH_CLASS = "health classroom"
VAR HealthClassPeople = ()
~ here = HealthClass
-> access_restrictions ->

You are in the {HEALTH_CLASS}.

{listRoomPeopleSentence(HealthClassPeople)}

- (health_class_opts)
<- talkAndObserveAllCharacters(HealthClassPeople, -> health_class_opts)

+ [Leave the {HEALTH_CLASS}] -> pass_time -> hallway
- -> health_class_opts

= access_restrictions
{
- isClassTime() and now != Period2:
    You're not in this class! Back to the hallway…
    -> hallway
}
->->
