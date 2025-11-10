/*
- Photographer: Jill
    - Adele Exarchapoulos: long wavy brunette hair, Cute, low-cut babydoll top, low-cut jeans.
    ? intel: stays late in darkroom every night, once confessed her secret fantasy is meeting a stranger in the darkroom
    ? recon: favorite photographer does nudes
    ? convo: suggest a nude photoshood
        - likes sweet, flirty
        - dislikes sarcasm
    * BJ in darkroom
    * sex after nude photoshoot
    - 1: Theater
    - 2: Science
    - L: Bleachers
    - 3: Gym
    - 4: Photography
    - A: Photography
*/
CONST PHOTOGRAPHER = "Jill"
CONST PHOTOGRAPHER_TITLE = "the photographer"

=== talk_to_photographer ===
Approach {PHOTOGRAPHER}.
- (opts)
    * "What's your bra size?"
        "36C."
    + [Leave her alone] ->->
- -> opts
