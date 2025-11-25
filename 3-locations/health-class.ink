/*

    The Health Classroom

*/
=== health_class ===
CONST HEALTH_CLASS = "health classroom"
CONST HEALTH_CLASS_NAME = "health class"
VAR HealthClassPeople = ()
~ here = HealthClass
-> access_restrictions ->

You are in the {HEALTH_CLASS}. The walls are covered in posters showing human anatomy. A life-size plastic skeleton hangs from a rolling stand near {HEALTH_TEACHER}'s desk.

{listRoomPeopleSentence(HealthClassPeople)}

- (health_class_opts)
<- talkAndObserveAllCharacters(HealthClassPeople, -> health_class_opts)

+ [Leave the {HEALTH_CLASS}] -> pass_time -> hallway
- -> health_class_opts

= access_restrictions
{ isClassTime() and now != hasClass(HealthClass):
    -> access_denied_health_teacher -> hallway
- else:
    ->->
}
