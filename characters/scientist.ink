/*
- Scientist: Grace
    - Jessica Henwick: Long black hair, ponytail, glasses. Short, skiny, small poky tits, large dark nipples, landing strip.
    ? intel: stays late every night working on a secret project
    ? recon: research secret ingredient
    ? convo: working on improved adderall, volunteer to test
        - likes serious
        - dislikes flirty, sweet
    * Handjob after uncontrolled erection leaves unable to focus
    * Uncontrollable Sex after invited back to try refined aphrodesiac (why are you slobbing my bean)
    - 1: Gym
    - 2: Photography
    - L: Library
    - 3: Study Hall
    - 4: Lab
    - A: Lab
*/
CONST SCIENTIST = "Grace"
CONST SCIENTIST_TITLE = "the scientist"

=== talk_to_scientist ===
Approach {SCIENTIST}.
- (opts)
    * "What's your bra size?"
        "34A."
    + [Leave her alone] ->->
- -> opts
