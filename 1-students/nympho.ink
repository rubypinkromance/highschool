/*
- Nympho: Claire
- Looks like Claire from Loudermilk: long wavy bleached blonde hair, skinny build, tiny tits, pierced nipples, 32A(34AA), shaved
- Outfit: choker, army jacket, black strappy tank top, padded black bra, jean skirt with frayed edge, red satin panties
- Gives details on teachers (gossip gives details on students)
? intel: Friend tells you she's a nympho
? recon: Come to chess club, watch her take a guy to the supply closet
? convo: Introduce yourself, she invites you in to talk and offer her services
    - likes flirty
    - dislikes sweet
* Sex in chess club supply closet
    * therapist wants her to take it slow
        * escalate every day
        * help me make it five days without fucking you and I'll tell you whatever you want to know.
        * gets more into it when you demean her
    1 cum on tits: jerk off on her, open shirt with bra, feel her up, pinch nipples
    2 cum on face: handjob, open shirt, licking, facial
    3 cum in mouth: blowjob, topless, gagging, drooling, spitting
    4 cum on back: hot dogging, shove me against the wall, grind against me, lift my skirt, cock under skirt, rub me through my panties, dry hump, grope, pulls damp panties tight
    5 cum in panties: fingering, topless, skirt off, demeaning, spit in my mouth, handjob, rubbing tip against her lips, pulls cock into panties
    6 cum on stomach: just the tip, nude, wet rubbing, pull out!
    7 creampie: doggy-style, pull hair
    8 anal creampie, slap ass, rough and deep
- 1: Theater     - BraStore
- 2: Photography - ShoeStore
- L: Cafeteria   - MovieTheater
- 3: Health      - MovieTheater
- 4: Science     - ShoeStore
- A: Library     - FoodCourt
- Afterschool: looking at porn in library

- Nympho observation. Other girls gossiping. Why are her nipples always hard? They’re peorced. Omg wouldn’t that hurt? I heard it feels good.
- Ask about piercings. She tells you she has a clit piercing too
- Two paths for nympho. Let her lead. Steady escalation as she proves to herself that she’s in control. Tell her what to do. Her resistance quickly crumbles as she slips into sub mode and lets you use her as she begs you for release
*/
CONST NYMPHO = "Claire"
CONST NYMPHO_TITLE = "the party girl"
LIST NymphoState = NymphoObserved
VAR NymphoInPlay = true
VAR NymphoMood = Aroused
VAR NymphoBaseMood = Aroused

=== talk_to_nympho ===
~ last_girl = Nympho

Approach {NYMPHO}.

- (opts)
* {NymphoMood > Friendly}"What's your bra size?"
    "32A."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave her alone] ->->
- -> opts

=== observe_nympho ===
~ last_girl = Nympho
~ NymphoState += NymphoObserved
Coming soon.
->->

=== dream_of_nympho ===
You have a filthy dream about {NYMPHO}.
->->

=== nympho_hints ===
Try observing {NYMPHO}.
->->
