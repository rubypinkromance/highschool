/*
- Study Hall
- Sex with Rebel once unsupervised
*/
=== study_hall ===
CONST STUDY_HALL = "study hall"
VAR StudyHallPeople = ()
VAR study_hall_supervised = true
~ here = STUDY_HALL
-> access_restrictions ->

You are in the {STUDY_HALL}.

{listRoomPeopleSentence(StudyHallPeople)}

- (study_hall_opts)
<- talkAndObserveAllCharacters(StudyHallPeople, -> study_hall_opts)

+ [Leave the {STUDY_HALL}]
    -> pass_time -> hallway
- -> study_hall_opts

= access_restrictions
{
- now == AfterSchool:
    You don't have detention! Back to the hallway…
    -> hallway
}
->->