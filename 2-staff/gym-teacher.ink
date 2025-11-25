/*
- Teacher: Kristen Stewart
*/
CONST GYM_TEACHER = "Coach Stewart"
CONST GYM_TEACHER_TITLE = ""
LIST GymTeacherState = GymTeacherObserved
VAR GymTeacherInPlay = false
VAR GymTeacherMood = Neutral
VAR GymTeacherBaseMood = Neutral

=== talk_to_gym_teacher ===
Approach {GYM_TEACHER}.
- (opts)
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
- -> opts

=== access_denied_gym_teacher ===
~ temp whenHasClass = hasClass(Gym)
{GYM_TEACHER} stops you as you try to enter.
{ whenHasClass:
- Nowhen:
    "{PLAYER}? I don't have you on my roster."
- else:
    "{PLAYER}? You're not in this class. Come back at {nameOfTimeWeekday(whenHasClass)}."
}
- (access_denied_gym_teacher_opts)
+ {not permission_to_change_schedule} "Can I transfer to this {whenHasClass == Nowhen:class|period}?"
    ~ permission_to_change_schedule = true
    "Sure, that's fine by me. Head to the office."
    -> access_denied_gym_teacher_opts
+ [Leave] ->->

=== observe_gym_teacher ===
~ GymTeacherState += GymTeacherObserved
Coach Stewart has a shaggy blonde mullet, wears a loose-fitting tank top over a grey sports bra and track pants, and has short trimmed nails. The only jewelery she wears is a thumb ring.
->->

=== dream_of_gym_teacher ===
You have a filthy dream about {GYM_TEACHER}.
(How did that happen?)
->->

=== gym_teacher_hints ===
Bro, she's clearly a lesbian.
->->
