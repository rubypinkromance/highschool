/*
- Twins: Hailey & Bailey
    - Kara, short bobbed hair, one with blue streak, one with green streak. Matching cat-eye glasses. Short, curves, low-cut fitted shirts, cleavage, leggings
    ? intel: the twins share everything. I mean, everything.
    ? recon: learn to tell them apart
    ? convo: flirt with each individually
        - likes flirty
        - dislikes serious
    * Make out on stairwell after flirting with both, challenge you to tell them apart
    * Threesome on roof if identify correctly
    - 1: Photography/Theater
    - 2: Cafeteria
    - 3: Health/Gym
    - 4: Mall
*/
CONST TWIN1 = "Hailey"
CONST TWIN2 = "Bailey"

=== talk_to_twin1 ===
Talk to {TWIN1}.
- (opts)
    * "What's your bra size?"
        "36C."
    + [Leave her alone] ->->
- -> opts

=== talk_to_twin2 ===
Talk to {TWIN2}.
- (opts)
    * "What's your bra size?"
        "36C."
    + [Leave her alone] ->->
- -> opts
