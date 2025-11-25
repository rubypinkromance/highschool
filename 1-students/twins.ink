/*
- Twins: Hailey & Bailey
- Alison Brie: long wavy brunette hair, curvy build, huge tits, 34D, shaved
- Outfit: Navy shirt, white bra with blue flowers, matching panties
? intel: the twins share everything. I mean, everything.
? recon: learn to tell them apart
? convo: flirt with each individually
    - likes flirty
    - dislikes serious
* Make out on stairwell after flirting with both, challenge you to tell them apart
* Threesome on roof if identify correctly
- 1: Photography/Gym     - ShoeStore
- 2: Health/Theater      - DressStore
- L: Cafeteria           - FoodCourt
- 3: Theater/Photography - DressStore
- 4: Gym/Health          - BraStore
- A: Mall                - BraStore

- Twins agree to show you their birthmarks but won’t do more until you can tell them apart “is there any difference?” “There is, but you can’t see it when we’re dressed so it won’t help you
*/
CONST TWINS = "Hailey & Bailey"
CONST TWINS_TITLE = "the twins"
VAR TWIN1 = "Hailey"
VAR TWIN2 = "Hailey"
VAR TWIN1_TITLE = "(or is that Bailey?)"
VAR TWIN2_TITLE = "(or is that Bailey?)"
LIST TwinsState =TwinsObserved
VAR TwinsInPlay = true
VAR TwinsMood = Neutral
VAR TwinsBaseMood = Neutral
VAR can_identify_twins = false

=== function identify_twins() ===
~ can_identify_twins = true
~ TWIN1 = "Hailey"
~ TWIN2 = "Bailey"
~ TWIN1_TITLE = "the twin"
~ TWIN2_TITLE = "the twin"

=== talk_to_twin1 ===
~ last_girl = Twins

Approach {TWIN1}.

- (opts)
* {TwinsMood > Friendly}"What's your bra size?"
    "34D."
* {DEBUG}"Which one are you?"
    ~ identify_twins()
    "Hailey."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave her alone] ->->
- -> opts

=== talk_to_twin2 ===
~ last_girl = Twins

Approach {TWIN2}.

- (opts)
* {TwinsMood > Friendly}"What's your bra size?"
    "34D."
* {DEBUG}"Which one are you?"
    ~ identify_twins()
    "Bailey."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave her alone] ->->
- -> opts

=== talk_to_twins ===
~ last_girl = Twins

Approach {TWINS}.

- (opts)
* {TwinsMood > Friendly}"What's your bra size?"
    "34D."
* {DEBUG}"How can I tell you apart?"
    ~ identify_twins()
    "She's Hailey, and I'm Bailey."
+ "Hello."
    "Sorry, we don't have any dialog yet."
* [Leave them alone] ->->
- -> opts

=== observe_twins ===
~ last_girl = Twins
~ TwinsState += TwinsObserved
Coming soon.
->->

=== dream_of_twins ===
You have a filthy dream about {TWINS}.
->->

=== twins_hints ===
Try observing {TWINS}.
->->
