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
*/
CONST NURSE = "Ms. Honeydew"
CONST NURSE_TITLE = "the nurse"
LIST NurseState = NurseObserved

=== talk_to_nurse ===
Approach {NURSE}.
- (opts)
    * "What's your bra size?"
        "36D."
    + [Leave her alone] ->->
- -> opts

=== observe_nurse ===
~ NurseState += NurseObserved
Coming soon.
->->
