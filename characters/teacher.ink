/*
- Teacher: Allison Cummings
    - Short, likes to wear skirts, wants to be bent over desk and fucked hard
    ? intel: divorced her husband last year, works late every night
    ? recon: note to talk to doctor about new meds making her aroused
    ? convo: tease and turn her on during sex ed tutoring, she gets flustered and ends tutoring early
        - likes flirty
        - dislikes sarcasm
    * Flirt after failing sex ed and coming in after school for some tutoring
    * Hide under desk, finger, oral, during class
    * fuck after school
    - 1-4: Health Class
*/
CONST TEACHER = "Ms. Cummings"
VAR flirted_with_teacher = false

=== talk_to_teacher ===
Talk to {TEACHER}.
- (opts)
    * "What's your bra size?"
        "36C."
    + [Leave her alone] ->->
- -> opts
