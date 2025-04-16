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
VAR can_identify_twins = false
VAR TWIN1 = "one of the twins"
VAR TWIN2 = "one of the twins"

=== function identify_twins() ===
~ can_identify_twins = true
~ TWIN1 = "Hailey"
~ TWIN2 = "Bailey"


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
