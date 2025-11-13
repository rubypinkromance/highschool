/*
- Photographer: Jill
- Jill Cunningham: long straight brunette hair, average build, medium tits, 34B, trimmed
- Outfit: overalls, white cami, pink bra, white panties
? intel: stays late in darkroom every night, once confessed her secret fantasy is meeting a stranger in the darkroom
? recon: favorite photographer does nudes
? convo: suggest a nude photoshood
    - likes sweet, flirty
    - dislikes sarcasm
* BJ in darkroom
* sex after nude photoshoot
* Unavailable on weekends
- 1: Theater     - Dress Store
- 2: Science     - Bleachers
- L: Bleachers   - Bleachers
- 3: Gym         - Bleachers
- 4: Photography - Shoe Store
- A: Photography - ---
*/
CONST PHOTOGRAPHER = "Jill"
CONST PHOTOGRAPHER_TITLE = "the photographer"
LIST PhotographerState = PhotographerObserved
VAR PhotographerMood = Neutral
VAR PhotographerBaseMood = Neutral

=== talk_to_photographer ===
~ last_girl = Photographer

Approach {PHOTOGRAPHER}.

- (opts)
* "What's your bra size?"
    "34B."
+ [Leave her alone] ->->
- -> opts

=== observe_photographer ===
~ last_girl = Photographer
~ PhotographerState += PhotographerObserved
Coming soon.
->->

=== dream_of_photographer ===
You have a filthy dream about {PHOTOGRAPHER}.
->->