/*
- Actor: Dana
    - Dana Howl, Cute hippy skirt, push-up bra, fitted top, long hair, shaved pubes
    ? intel: recently switched schools, heard because old school wouldn't let her use the right bathroom
    ? recon: tired of having to talk about trans stuff all the time
    ? convo: don't ask about trans stuff, just flirt
        - likes sweet, flirty
        - dislikes sarcasm
    * Make out, blowjob backstage
    * Sixty-nine if you're down to suck her cock too
    - 1: Health
    - 2: Study Hall
    - L: Cafeteria
    - 3: Science
    - 4: Theater
    - A: Theater
*/
CONST ACTOR = "Dana"
CONST ACTOR_TITLE = "the theater kid"

=== talk_to_actor ===
Approach {ACTOR}.
- (opts)
    * "What's your bra size?"
        "36B."
    + [Leave her alone] ->->
- -> opts
