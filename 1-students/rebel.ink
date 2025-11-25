/*
- Rebel: Zia
- Looks like Chloe Bennet from Agents of SHIELD: medium length wavy brunette hair, average build, medium tits, 34B, trimmed
- Outfit: Dark eye makeup, leather jacket, loose dark green shirt, hangs off one shoulder, ripped black jeans, black strappy bra, black panties
? intel: arrested for public indecency (rumors vary)
? recon: snapping topless pics under bleachers
? convo: ask about arrest, express approval
    - likes sarcasm
    - dislikes serious, sweet
* Fool around in detention (escalate from flash to masturbation)
* Sex in detention once unsupervised
- 1: Science     - MovieTheater
- 2: Gym         - MovieTheater
- L: Bleachers   - BraStore
- 3: Photography - FoodCourt
- 4: Study Hall  - MovieTheater
- A: Study Hall  - MovieTheater

- Detention teacher observation shows he’s a smoker. Offer to watch the class while he takes smoke break. Only ten minutes, limited time
- When fucking in detention, Rebel threatens Believer not to snitch (but Believer is secretly into it)
- Rebels mood improves when she sees you in detention or fight or do something bad.
- Rebel won’t let you talk shit about believer. At least she stands for something. Most people in this school are sheep following all the rules
- Rebel smokes weed under bleaches, likes if you join her. Cough less over time, increases confidence 
- Dislikes Preppy clothes
- Rebel gets bored talking if you’re too timid. Rewards bold behavior. Agrees to show you her tits if you get teacher to leave
*/
CONST REBEL = "Zia"
CONST REBEL_TITLE = "the punk"
LIST RebelState = RebelObserved
VAR RebelInPlay = true
VAR RebelMood = Hostile
VAR RebelBaseMood = Hostile

=== talk_to_rebel ===
~ last_girl = Rebel

Approach {REBEL}.

- (opts)
* {RebelMood > Friendly}"What's your bra size?"
    "34B."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
- -> opts

=== observe_rebel ===
~ last_girl = Rebel
~ RebelState += RebelObserved
Coming soon.
->->

=== dream_of_rebel ===
You have a filthy dream about {REBEL}.
->->

=== rebel_hints ===
Try observing {REBEL}.
->->
