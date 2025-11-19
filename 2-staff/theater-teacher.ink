/*
- Teacher: Nathan Lane
*/
CONST THEATER_TEACHER = "Mr. Lane"
CONST THEATER_TEACHER_TITLE = "the drama teacher"
LIST TheaterTeacherState = (TheaterTeacherObserved)
VAR TheaterTeacherMood = Neutral
VAR TheaterTeacherBaseMood = Neutral

=== talk_to_theater_teacher ===
Approach {THEATER_TEACHER}.
- (opts)
* "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave him alone] ->->
- -> opts

=== access_denied_theater_teacher ===
~ temp whenHasClass = hasClass(HealthClass)
{THEATER_TEACHER} stops you as you try to enter.
{ whenHasClass:
- Nowhen:
    "{PLAYER}? I don't have you on my roster."
- else:
    "{PLAYER}? You're not in this class. Come back at {nameOfTimeWeekday(whenHasClass)}."
}
- (access_denied_theater_teacher_opts)
+ {not permission_to_change_schedule} "Can I transfer to this {whenHasClass == Nowhen:class|period}?"
    ~ permission_to_change_schedule = true
    "Sure, that's fine by me. Head to the office."
    -> access_denied_theater_teacher_opts
+ [Leave] ->->

=== observe_theater_teacher ===
~ TheaterTeacherState += TheaterTeacherObserved
->->

=== dream_of_theater_teacher ===
You have a filthy dream about {THEATER_TEACHER}.
(How did that happen?)
->->