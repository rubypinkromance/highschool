/*
- Rebel: Zia
- Alix Traeger: Brunette hair, undercut. Short, curvy, big hips, big tits, lots of cleavage, black clothes, shirt hangs off shoulder, black bra, black thong, black, torn-up jeans.
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
CONST REBEL_TITLE = "the rebel girl"
LIST RebelState = RebelObserved

=== talk_to_rebel ===
Approach {REBEL}.
- (opts)
    * "What's your bra size?"
        "36D."
    + [Leave her alone] ->->
- -> opts

=== observe_rebel ===
~ RebelState += RebelObserved
Coming soon.
->->
