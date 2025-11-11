/*
- Photographer: Jill
- Jill Cunningham: long wavy brunette hair, Cute, low-cut babydoll top, low-cut jeans, trimmed
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
Approach {PHOTOGRAPHER}.
- (opts)
    * "What's your bra size?"
        "36C."
    + [Leave her alone] ->->
- -> opts

=== observe_photographer ===
~ PhotographerState += PhotographerObserved
Coming soon.
->->
