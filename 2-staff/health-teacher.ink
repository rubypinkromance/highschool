/*
- Teacher: Jessica Day
- Looks like Zooey Deschanel from New Girl: Short, likes to wear skirts, wants to be bent over desk and fucked hard
- Bubbly, enthusiastic, open to drop in students, until she comes in hungover one day and puts on a video. If observed, can hang back after class to talk and flirt. Will fuck in classroom during lunch and after school, might get interrupted and have to hide under desk
? intel: divorced her husband last year, works late every night
? recon: note to talk to doctor about new meds making her aroused
? convo: tease and turn her on during sex ed tutoring, she gets flustered and ends tutoring early
    - likes flirty
    - dislikes sarcasm
* Flirt after failing sex ed and coming in after school for some tutoring
* Hide under desk, finger, oral, during class
* fuck after school
- After her behavior changes, remove HealthTeacherObserved
*/
CONST HEALTH_TEACHER = "Ms. Day"
CONST HEALTH_TEACHER_TITLE = "the health teacher"
LIST HealthTeacherState = (HealthTeacherObserved)
VAR HealthTeacherInPlay = false
VAR flirted_with_teacher = false
VAR HealthTeacherMood = Neutral
VAR HealthTeacherBaseMood = Neutral

=== talk_to_health_teacher ===
~ last_girl = HealthTeacher

Approach {HEALTH_TEACHER}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "36C."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
- -> opts

=== access_denied_health_teacher ===
~ temp whenHasClass = hasClass(HealthClass)
{HEALTH_TEACHER} stops you as you try to enter.
{ whenHasClass:
- Nowhen:
    "{PLAYER}? I don't have you on my roster."
- else:
    "{PLAYER}? You're not in this class. Come back at {nameOfTimeWeekday(whenHasClass)}."
}
- (access_denied_health_teacher_opts)
+ {not permission_to_change_schedule} "Can I transfer to this {whenHasClass == Nowhen:class|period}?"
    ~ permission_to_change_schedule = true
    "Sure, that's fine by me. Head to the office."
    -> access_denied_health_teacher_opts
+ [Leave] ->->

=== observe_health_teacher ===
~ last_girl = HealthTeacher
~ HealthTeacherState += HealthTeacherObserved
Coming soon.
->->

=== dream_of_health_teacher ===
You have a filthy dream about {HEALTH_TEACHER}.
->->

=== health_teacher_hints ===
Try observing {HEALTH_TEACHER}.
->->
