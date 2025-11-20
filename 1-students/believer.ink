/*
- Believer: Kate
- LIS Kate: long brunette pony, average build, medium tits, 32C(34B), full bush
- Outfit: cardigan, white cami, grey skirt, white lace bra, white lace panties
- Has detention for disrupting class by arguing with Health Teacher
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
- A: Study Hall  - Church

- Church is actually something like scientology, and she’s very down to fuck if you’re willing to join and jump through hoops to level up. Exam 1 tracks stress, kiss lowers stress. Exam 2 tracks pleasure, handjob lowers stress. Exam 3 is fucking in special room
- Church meter is a butt plug
- After a while, female founder of religion comes to see this virile young man Believer found. Threesome. Kate, suck my nipples. Kate sit on his face and kiss me
- Likes nice clothes
*/
CONST BELIEVER = "Kate"
CONST BELIEVER_TITLE = "the religious girl"
LIST BelieverState = (BelieverInPlay), BelieverObserved
VAR BelieverMood = Neutral
VAR BelieverBaseMood = Neutral

=== talk_to_believer ===
~ last_girl = Believer

Approach {BELIEVER}.

- (opts)
* "What's your bra size?"
    "That's between me and Jesus."
+ [Leave her alone] ->->
- -> opts

=== observe_believer ===
~ last_girl = Believer
~ BelieverState += BelieverObserved
Coming soon.
->->

=== dream_of_believer ===
You have a filthy dream about {BELIEVER}.
->->

=== believer_hints ===
Try observing {BELIEVER}.
->->
