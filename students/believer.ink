/*
- Believer: Kate
- LIS Kate: big tits, dark hair ponytail, sweater, button-up, long skirt, plain underwear, cross, full bush
? intel: goes to confess every day after school
? recon: evesdrop on confession about fantasies
? convo: struggling not to spill seed
    - likes earnest
    - dislikes sarcasm, flirty
* BJ after easy religious check
* Anal after hard religious check
- 1: Study Hall  - Church
- 2: Gym         - Church
- L: Cafeteria   - Church
- 3: Health      - Church
- 4: Photography - Church
- A: Church      - Church
*/
CONST BELIEVER = "Kate"
CONST BELIEVER_TITLE = "the religious girl"
LIST BelieverState = BelieverObserved
VAR BelieverMood = Neutral
VAR BelieverBaseMood = Neutral

=== talk_to_believer ===
Approach {BELIEVER}.
- (opts)
* "What's your bra size?"
    "That's between me and Jesus." // 36DD
+ [Leave her alone] ->->
- -> opts

=== observe_believer ===
~ BelieverState += BelieverObserved
Coming soon.
->->
