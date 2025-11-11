/*
- Actor: Dana
- Dana Howl, Cute hippy skirt, push-up bra, fitted top, short pink hair, shaved pubes
? intel: recently switched schools, heard because old school wouldn't let her use the right bathroom
? recon: tired of having to talk about trans stuff all the time
? convo: don't ask about trans stuff, just flirt
    - likes sweet, flirty
    - dislikes sarcasm
* Make out, blowjob backstage
* Sixty-nine if you're down to suck her cock too
- 1: Health     - ---
- 2: Study Hall - Bleachers
- L: Cafeteria  - Bleachers
- 3: Science    - Bleachers
- 4: Theater    - ---
- A: Theater    - ---
*/
CONST ACTOR = "Dana"
CONST ACTOR_TITLE = "the theater kid"
LIST ActorState = Unknown, ActorBraSize, ActorObserved

=== talk_to_actor ===
Approach {ACTOR}.
- (opts)
    * {ActorState !? ActorObserved} [Observe] -> observe_actor ->
    + {ActorState ? ActorObserved} [Confirm]
        "You've been observed.
    * {ActorState !? ActorBraSize}"What's your bra size?"
        ~ ActorState += ActorBraSize
        "36B."
    + {ActorState ? ActorBraSize}"You wear a 36B, right?"
        "Correct."
    + [Leave her alone] ->->
- -> opts

=== observe_actor ===
~ ActorState += ActorObserved
Coming soon.
->->
