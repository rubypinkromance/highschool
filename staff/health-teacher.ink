/*
- Teacher: Jessica Day
- Teacher based on Jess from new girl. Bubbly, enthusiastic, open to drop in students, until she comes in hungover one day and puts on a video. If observed, can hang back after class to talk and flirt. Will fuck in classroom during lunch and after school, might get interrupted and have to hide under desk
- Zoe Deschanel: Short, likes to wear skirts, wants to be bent over desk and fucked hard
? intel: divorced her husband last year, works late every night
? recon: note to talk to doctor about new meds making her aroused
? convo: tease and turn her on during sex ed tutoring, she gets flustered and ends tutoring early
    - likes flirty
    - dislikes sarcasm
* Flirt after failing sex ed and coming in after school for some tutoring
* Hide under desk, finger, oral, during class
* fuck after school
*/
CONST HEALTH_TEACHER = "Ms. Day"
CONST HEALTH_TEACHER_TITLE = "the health teacher"
LIST HealthTeacherState = (HealthTeacherObserved)
VAR flirted_with_teacher = false
VAR HealthTeacherMood = Neutral
VAR HealthTeacherBaseMood = Neutral

=== talk_to_health_teacher ===
Approach {HEALTH_TEACHER}.
- (opts)
    * "What's your bra size?"
        "36C."
    + [Leave her alone] ->->
- -> opts

// After her behavior changes, remove HealthTeacherObserved
=== observe_health_teacher ===
~ HealthTeacherState += HealthTeacherObserved
Coming soon.
->->
