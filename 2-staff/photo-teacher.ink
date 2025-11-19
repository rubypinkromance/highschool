/*
- Teacher: Bob Ross
*/
CONST PHOTO_TEACHER = "Mr. Ross"
CONST PHOTO_TEACHER_TITLE = "the photography teacher"
LIST PhotoTeacherState = (PhotoTeacherObserved)
VAR PhotoTeacherMood = Neutral
VAR PhotoTeacherBaseMood = Neutral

=== talk_to_photo_teacher ===
Approach {PHOTO_TEACHER}.
- (opts)
* "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave him alone] ->->
- -> opts

=== access_denied_photo_teacher ===
~ temp whenHasClass = hasClass(HealthClass)
{PHOTO_TEACHER} stops you as you try to enter.
{ whenHasClass:
- Nowhen:
    "{PLAYER}? I don't have you on my roster."
- else:
    "{PLAYER}? You're not in this class. Come back at {nameOfTimeWeekday(whenHasClass)}."
}
- (access_denied_photo_teacher_opts)
+ {not permission_to_change_schedule} "Can I transfer to this {whenHasClass == Nowhen:class|period}?"
    ~ permission_to_change_schedule = true
    "Sure, that's fine by me. Head to the office."
    -> access_denied_photo_teacher_opts
+ [Leave] ->->

=== observe_photo_teacher ===
~ PhotoTeacherState += PhotoTeacherObserved
->->

=== dream_of_photo_teacher ===
You have a filthy dream about {PHOTO_TEACHER}.
(How did that happen?)
->->