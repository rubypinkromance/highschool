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
    - 1: Science
    - 2: Gym
    - L: Bleachers
    - 3: Photography
    - 4: Study Hall
    - A: Study Hall
*/
CONST REBEL = "Zia"
CONST REBEL_TITLE = "the rebel girl"

=== talk_to_rebel ===
Approach {REBEL}.
- (opts)
    * "What's your bra size?"
        "36D."
    + [Leave her alone] ->->
- -> opts
