/*
- Scientist: Grace
- Looks like Jessica Henwick from Iron Fist: Asian, long black ponytail, skinny build, tiny tits, large dark nipples, sensitive, 30B(34AA), landing strip
- Outfit: glasses, lab coat (in lab), TBD
? intel: stays late every night working on a secret project
? recon: research secret ingredient
? convo: working on improved adderall, volunteer to test
    - likes serious
    - dislikes flirty, sweet
* Handjob after uncontrolled erection leaves unable to focus
* Uncontrollable Sex after invited back to try refined aphrodesiac (why are you slobbing my bean)
- 1: Gym         - BookStore
- 2: Photography - BookStore
- L: Library     - BookStore
- 3: Study Hall  - BookStore
- 4: Lab         - FoodCourt
- A: Lab         - BookStore

- Scientist works at book shop
*/
CONST SCIENTIST = "Grace"
CONST SCIENTIST_TITLE = "the scientist"
LIST ScientistState = ScientistObserved
VAR ScientistInPlay = true
VAR ScientistMood = Neutral
VAR ScientistBaseMood = Neutral

=== talk_to_scientist ===
~ last_girl = Scientist

Approach {SCIENTIST}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "30B."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
- -> opts

=== observe_scientist ===
~ last_girl = Scientist
~ ScientistState += ScientistObserved
Coming soon.
->->

=== dream_of_scientist ===
You have a filthy dream about {SCIENTIST}.
->->

=== scientist_hints ===
Try observing {SCIENTIST}.
->->
