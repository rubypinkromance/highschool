/*
- Teacher: Jackson Lamb
*/
CONST STUDY_HALL_TEACHER = "Mr. Lamb"
CONST STUDY_HALL_TEACHER_TITLE = ""
LIST StudyHallTeacherState = (StudyHallTeacherObserved)
VAR StudyHallTeacherInPlay = false
VAR StudyHallTeacherMood = Neutral
VAR StudyHallTeacherBaseMood = Neutral

=== talk_to_study_hall_teacher ===
Approach {STUDY_HALL_TEACHER}.
- (opts)
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave conversation]
    ->->
- -> opts

=== access_denied_study_hall_teacher ===
~ temp whenHasClass = hasClass(HealthClass)
{STUDY_HALL_TEACHER} stops you as you try to enter.
"{PLAYER}? You don't have detention. Clear off. This isn't a social hour."
+ [Leave conversation]
    ->->

=== observe_study_hall_teacher ===
~ StudyHallTeacherState = StudyHallTeacherObserved
->->

=== dream_of_study_hall_teacher ===
You have a filthy dream about {STUDY_HALL_TEACHER}.
(How did that happen?)
->->

=== study_hall_teacher_hints ===
Try observing {STUDY_HALL_TEACHER}.
->->
