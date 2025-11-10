/*
- Believer: Kate
    - LIS Kate: big tits, dark hair ponytail, sweater, button-up, long skirt, plain underwear, cross
    ? intel: goes to confess every day after school
    ? recon: evesdrop on confession about fantasies
    ? convo: struggling not to spill seed
        - likes earnest
        - dislikes sarcasm, flirty
    * BJ after easy religious check
    * Anal after hard religious check
    - 1: Study Hall
    - 2: Gym
    - L: Cafeteria
    - 3: Health
    - 4: Photography
    - A: Church
*/
CONST BELIEVER = "Kate"
CONST BELIEVER_TITLE = "the religious girl"

=== talk_to_believer ===
Approach {BELIEVER}.
- (opts)
    * "What's your bra size?"
        "That's between me and Jesus." // 36DD
    + [Leave her alone] ->->
- -> opts
