/*

    Study Hall

*/
=== study_hall ===
CONST STUDY_HALL = "study hall"
CONST STUDY_HALL_CLASS_NAME = "study hall"
CONST DETENTION_NAME = "detention"
VAR StudyHallPeople = ()
VAR study_hall_supervised = true
~ here = StudyHall
// -> access_restrictions ->

You are in {STUDY_HALL}, a standard classroom lacking in any personality at all. The white board says "Welcome to {isWeekday() and now == AfterSchool:{DETENTION_NAME}|{STUDY_HALL}}. Rules: 1. No talking. 2. Stay in your seat."
{ isClassTime() or now == AfterSchool: <> {STUDY_HALL_TEACHER} has his feet on the desk and appears to be sleeping, except he grumbles whenever a student makes too much noise. }

{lookForRoomPeople(StudyHallPeople)}

- (study_hall_opts)
<- character_opts(StudyHallPeople, -> study_hall_opts)

+ [Leave the {STUDY_HALL}] -> pass_time -> hallway
- -> study_hall_opts

= access_restrictions
{
- not has_detention and now == AfterSchool:
    -> access_denied_study_hall_teacher -> hallway
- else:
    ->->
}
