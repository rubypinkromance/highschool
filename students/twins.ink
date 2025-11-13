/*
- Twins: Nisha & Misha
- Kamala Kahn: Indian, long wavy black hair, curvy build, huge tits, 34D, shaved
- Outfit: Navy shirt, white bra with blue flowers, matching panties
? intel: the twins share everything. I mean, everything.
? recon: learn to tell them apart
? convo: flirt with each individually
    - likes flirty
    - dislikes serious
* Make out on stairwell after flirting with both, challenge you to tell them apart
* Threesome on roof if identify correctly
- 1: Photography/Gym     - Shoe Store
- 2: Health/Theater      - Dress Store
- L: Cafeteria           - Food Court
- 3: Theater/Photography - Dress Store
- 4: Gym/Health          - Bra Store
- A: Mall                - Bra Store
*/
CONST TWINS = "Nisha & Misha"
CONST TWINS_TITLE = "the twins"
VAR TWIN1 = "Nisha"
VAR TWIN2 = "Nisha"
VAR TWIN1_TITLE = "(or is that Misha?)"
VAR TWIN2_TITLE = "(or is that Misha?)"
LIST TwinsState = TwinsObserved
VAR TwinsMood = Neutral
VAR TwinsBaseMood = Neutral
VAR can_identify_twins = false

=== function identify_twins() ===
~ can_identify_twins = true
~ TWIN1 = "Nisha"
~ TWIN2 = "Misha"
~ TWIN1_TITLE = "the twin"
~ TWIN2_TITLE = "the twin"

=== talk_to_twin1 ===
Approach {TWIN1}.
- (opts)
* "What's your bra size?"
    "34D."
* "Which one are you?"
    ~ identify_twins()
    "Nisha."
+ [Leave her alone] ->->
- -> opts

=== talk_to_twin2 ===
Approach {TWIN2}.
- (opts)
* "What's your bra size?"
    "34D."
* "Which one are you?"
    ~ identify_twins()
    "Misha."
+ [Leave her alone] ->->
- -> opts

=== talk_to_twins ===
Approach {TWINS}.
- (opts)
* "How can I tell you apart?"
    ~ identify_twins()
    "She's Nisha, and I'm Misha."
* [Leave them alone] ->->
- -> opts

=== observe_twins ===
~ TwinsState += TwinsObserved
Coming soon.
->->
