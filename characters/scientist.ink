/*
- Scientist: Jill
    ? intel: stays late every night working on a secret project
    ? recon: research secret ingredient
    ? convo: working on improved adderall, volunteer to test
        - likes serious
        - dislikes flirty, sweet
    * Handjob after uncontrolled erection leaves unable to focus
    * Uncontrollable Sex after invited back to try refined aphrodesiac (why are you slobbing my bean)
    - 1: Gym
    - 2: Library
    - 3: Lab
    - 4: Lab
*/
CONST SCIENTIST = "Jill"

=== talk_to_scientist ===
Talk to {SCIENTIST}.
- (opts)
    * "What's your bra size?"
        "36C."
    + [Leave her alone] ->->
- -> opts
