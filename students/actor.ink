/*
- Actor: Dana
- Dana Howl: short pink hair in bangs, average build, medium tits, 36A, shaved
- Outfit: Black tank top, push-up bra, black lace thong
? intel: recently switched schools, heard because old school wouldn't let her use the right bathroom
? recon: tired of having to talk about trans stuff all the time
? convo: don't ask about trans stuff, just flirt
    - likes sweet, flirty
    - dislikes sarcasm
* Make out, blowjob backstage
* Sixty-nine if you're down to suck her cock too
- 1: Health     - BookStore
- 2: Study Hall - Bleachers/FoodCourt
- L: Cafeteria  - Bleachers/ShoeStore
- 3: Science    - Bleachers/BookStore
- 4: Theater    - MovieTheater
- A: Theater    - MovieTheater
*/
CONST ACTOR = "Dana"
CONST ACTOR_TITLE = "the theater kid"
LIST ActorState = ActorObserved, ActorBraSize
VAR ActorMood = Neutral
VAR ActorBaseMood = Neutral

=== talk_to_actor ===
~ last_girl = Actor

Approach {ACTOR}.

- (opts)
* {ActorState !? ActorObserved} [Observe] -> observe_actor ->
+ {ActorState ? ActorObserved} [Confirm]
    "You've been observed.
* {ActorState !? ActorBraSize}"What's your bra size?"
    ~ ActorState += ActorBraSize
    "36A."
+ {ActorState ? ActorBraSize}"You wear a 36A, right?"
    "Correct."
+ [Leave her alone] ->->
- -> opts

=== observe_actor ===
~ last_girl = Actor
~ ActorState += ActorObserved
Coming soon.
->->

=== dream_of_actor ===
You have a filthy dream about {ACTOR}.
->->