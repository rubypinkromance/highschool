/*
- Actor: Emily
    ? intel: recently switched schools, heard because old school wouldn't let her use the right bathroom
    ? recon: tired of having to talk about trans stuff all the time
    ? convo: don't ask about trans stuff, just flirt
        - likes sweet, flirty
        - dislikes sarcasm
    * Make out, blowjob backstage
    * Sixty-nine if you're down to suck her cock too
    - 1: Health
    - 2: Cafeteria
    - 3: Theater
    - 4: Theater
*/
CONST ACTOR = "Emily"

=== talk_to_actor ===
Talk to {ACTOR}.
- (opts)
    * "What's your bra size?"
        "36C."
    + [Leave her alone] ->->
- -> opts
