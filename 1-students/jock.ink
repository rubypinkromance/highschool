/*
- Jock: Lance
- 1: Study Hall - Bleachers / FoodCourt
- 2: Health     - Field     / FoodCourt
- L: Cafeteria  - Field     / FoodCourt
- 3: Gym        - Field     / FoodCourt
- 4: Theater    - Bleachers / FoodCourt
- A: Field      - Bleachers / FoodCourt
*/
CONST JOCK = "Lance"
CONST JOCK_TITLE = "the meathead jock"
LIST JockState = (JockObserved)
VAR JockInPlay = false
VAR JockMood = Hostile
VAR JockBaseMood = Hostile

=== talk_to_jock ===
Approach {JOCK}.
- (opts)
* "Hey, what's up?"
    "Fuck off, loser."
+ [Leave]
    ->->
- -> opts

=== observe_jock ===
~ JockState += JockObserved
->->

=== dream_of_jock ===
You have a confusing dream about {JOCK}.
(How did that happen?)
->->

=== jock_hints ===
I wouldn't recommend it.
->->
