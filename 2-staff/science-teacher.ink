/*
- Teacher: Neil D. Tyson
*/
CONST SCIENCE_TEACHER = "Mr. Tyson"
CONST SCIENCE_TEACHER_TITLE = "the science teacher"
LIST ScienceTeacherState = ScienceTeacherInPlay, (ScienceTeacherObserved)
VAR ScienceTeacherMood = Neutral
VAR ScienceTeacherBaseMood = Neutral

=== talk_to_science_teacher ===
Approach {SCIENCE_TEACHER}.
- (opts)
* "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave him alone] ->->
- -> opts

=== access_denied_science_teacher ===
~ temp whenHasClass = hasClass(HealthClass)
{SCIENCE_TEACHER} stops you as you try to enter.
{ whenHasClass:
- Nowhen:
    "{PLAYER}? I don't have you on my roster."
- else:
    "{PLAYER}? You're not in this class. Come back at {nameOfTimeWeekday(whenHasClass)}."
}
- (access_denied_science_teacher_opts)
+ {not permission_to_change_schedule} "Can I transfer to this {whenHasClass == Nowhen:class|period}?"
    ~ permission_to_change_schedule = true
    "Sure, that's fine by me. Head to the office."
    -> access_denied_science_teacher_opts
+ [Leave] ->->

=== observe_science_teacher ===
~ ScienceTeacherState += ScienceTeacherObserved
->->

=== dream_of_science_teacher ===
You have a filthy dream about {SCIENCE_TEACHER}.
(How did that happen?)
->->

=== science_teacher_hints ===
Try observing {SCIENCE_TEACHER}.
->->
