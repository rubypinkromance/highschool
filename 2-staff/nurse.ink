/*
- Teacher: Nina Honeydew
- Eva Green: black hair, big lips, huge tits, big puffy nipples, full bush.
- Nurse has dialog for ouch my balls and fighting
? intel: Sweet, but easy to manipulate, sends girls home early for cramps
? recon:
? convo:
    - likes sweet
    - dislikes sarcasm
* Convince to leave to steal meds
* HJ after taking viagra, unable to cum
* Fuck after catching her watching you masturbate
* Nurse can be convinced to get you off if you get hard. Escalating arousal but if you push too hard she leaves
*/
CONST NURSE = "Ms. Honeydew"
CONST NURSE_TITLE = "the nurse"
LIST NurseState = NurseInPlay, (NurseObserved)
VAR NurseMood = Neutral
VAR NurseBaseMood = Neutral

=== talk_to_nurse ===
~ last_girl = Nurse

Approach {NURSE}.

- (opts)
    * {NurseMood == Aroused}"What's your bra size?"
        "36D."
    + "Hello."
        "Sorry, I don't have any dialog yet."
    + [Leave her alone] ->->
- -> opts

=== observe_nurse ===
~ last_girl = Nurse
~ NurseState += NurseObserved
Coming soon.
->->

=== dream_of_nurse ===
You have a filthy dream about {NURSE}.
->->

=== nurse_hints ===
Try observing {NURSE}.
->->
