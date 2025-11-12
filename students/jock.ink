/*
- Jock: Lance
- 1: Study Hall - Bleachers
- 2: Health     - Field
- L: Cafeteria  - Field
- 3: Gym        - Field
- 4: Theater    - Bleachers
- A: Field      - ---
*/
CONST JOCK = "Lance"
CONST JOCK_TITLE = "the meathead jock"
LIST JockState = (JockObserved)
VAR JockMood = Hostile
VAR JockBaseMood = Hostile

=== talk_to_jock ===
Approach {JOCK}.
- (opts)
* "What's your bra size?"
    "What the fuck did you just say to me?"
+ [Leave him alone] ->->
- -> opts

=== observe_jock ===
~ JockState += JockObserved
->->
