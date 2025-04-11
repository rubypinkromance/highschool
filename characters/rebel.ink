/*
- Rebel: Debbie
    ? intel: arrested for public indecency (rumors vary)
    ? recon: snapping topless pics under bleachers
    ? convo: ask about arrest, express approval
        - likes sarcasm
        - dislikes serious, sweet
    * Fool around in detention (escalate from flash to masturbation)
    * Sex in detention once unsupervised
    - 1: Health
    - 2: Bleachers
    - 3: Study Hall
    - 4: Detention
*/
CONST REBEL = "Debbie"

=== talk_to_rebel ===
Talk to {REBEL}.
- (opts)
    * "What's your bra size?"
        "36C."
    + [Leave her alone] ->->
- -> opts
