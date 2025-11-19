/*
- Study Hall
- Sex with Rebel once unsupervised
*/
=== study_hall ===
CONST STUDY_HALL = "study hall"
CONST STUDY_HALL_CLASS_NAME = "study hall"
CONST DETENTION_NAME = "detention"
VAR StudyHallPeople = ()
VAR study_hall_supervised = true
~ here = StudyHall
-> access_restrictions ->

You are in {STUDY_HALL}.

{listRoomPeopleSentence(StudyHallPeople)}

- (study_hall_opts)
<- talkAndObserveAllCharacters(StudyHallPeople, -> study_hall_opts)

+ [Leave the {STUDY_HALL}] -> pass_time -> hallway
- -> study_hall_opts

= access_restrictions
{
- not has_detention and now == AfterSchool:
    -> access_denied_study_hall_teacher -> hallway
}
->->
