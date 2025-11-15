/*
- Rebel: Zia
- Chloe Bennet: medium length wavy brunette hair, average build, medium tits, 34B, trimmed
- Outfit: Dark eye makeup, leather jacket, loose dark green shirt, hangs off one shoulder, ripped black jeans, black strappy bra, black panties
? intel: arrested for public indecency (rumors vary)
? recon: snapping topless pics under bleachers
? convo: ask about arrest, express approval
    - likes sarcasm
    - dislikes serious, sweet
* Fool around in detention (escalate from flash to masturbation)
* Sex in detention once unsupervised
- 1: Science     - Movie Theater
- 2: Gym         - Movie Theater
- L: Bleachers   - Food Court
- 3: Photography - Movie Theater
- 4: Study Hall  - Movie Theater
- A: Study Hall  - ---

- Detention teacher observation shows he’s a smoker. Offer to watch the class while he takes smoke break. Only ten minutes, limited time
- When fucking in detention, Rebel threatens Believer not to snitch (but Believer is secretly into it)
- Rebels mood improves when she sees you in detention or fight or do something bad.
- Rebel won’t let you talk shit about believer. At least she stands for something. Most people in this school are sheep following all the rules

*/
CONST REBEL = "Zia"
CONST REBEL_TITLE = "the punk"
LIST RebelState = RebelObserved
VAR RebelMood = Hostile
VAR RebelBaseMood = Hostile

=== talk_to_rebel ===
~ last_girl = Rebel

Approach {REBEL}.

- (opts)
* "What's your bra size?"
    "34B."
+ [Leave her alone] ->->
- -> opts

=== observe_rebel ===
~ last_girl = Rebel
~ RebelState += RebelObserved
Coming soon.
->->

=== dream_of_rebel ===
You have a filthy dream about {REBEL}.
->->