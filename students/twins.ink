/*
- Twins: Hailey & Bailey
- Elle Fanning: medium bleached blonde hair, short, curves, low-cut fitted shirts, skirts, cleavage, leggings, shaved pussy
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
CONST TWINS = "Hailey & Bailey"
CONST TWINS_TITLE = "the twins"
VAR TWIN1 = "Hailey"
VAR TWIN2 = "Hailey"
VAR TWIN1_TITLE = "(or is that Bailey?)"
VAR TWIN2_TITLE = "(or is that Bailey?)"
LIST TwinsState = TwinsObserved
VAR can_identify_twins = false

=== function identify_twins() ===
~ can_identify_twins = true
~ TWIN1 = "Hailey"
~ TWIN2 = "Bailey"
~ TWIN1_TITLE = "the twin"
~ TWIN2_TITLE = "the twin"

=== talk_to_twins ===
Approach {TWINS}.
- (opts)
    * "How can I tell you apart?"
        ~ identify_twins()
        "She's Hailey, and I'm Bailey."
    * [Leave them alone] ->->
- -> opts

=== talk_to_twin1 ===
Approach {TWIN1}.
- (opts)
    * "What's your bra size?"
        "36C."
    * "Which one are you?"
        ~ identify_twins()
        "Hailey."
    + [Leave her alone] ->->
- -> opts

=== talk_to_twin2 ===
Approach {TWIN2}.
- (opts)
    * "What's your bra size?"
        "36C."
    * "Which one are you?"
        ~ identify_twins()
        "Bailey."
    + [Leave her alone] ->->
- -> opts

=== observe_twins ===
~ TwinsState += TwinsObserved
Coming soon.
->->
