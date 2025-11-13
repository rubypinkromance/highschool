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
*/
CONST REBEL = "Zia"
CONST REBEL_TITLE = "the punk"
LIST RebelState = RebelObserved
VAR RebelMood = Hostile
VAR RebelBaseMood = Hostile

=== talk_to_rebel ===
Approach {REBEL}.
- (opts)
* "What's your bra size?"
    "34B."
+ [Leave her alone] ->->
- -> opts

=== observe_rebel ===
~ RebelState += RebelObserved
Coming soon.
->->
