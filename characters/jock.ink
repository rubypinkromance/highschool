/*
- Jock: Lance
    - 1: Study Hall
    - 2: Health
    - L: Cafeteria
    - 3: Gym
    - 4: Theater
    - A: Field
*/
CONST JOCK = "Lance"
CONST JOCK_TITLE = "the meathead jock"

=== talk_to_jock ===
Approach {JOCK}.
- (opts)
    * "What's your bra size?"
        "What the fuck did you just say to me?"
    + [Leave him alone] ->->
- -> opts
