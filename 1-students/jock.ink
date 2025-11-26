/*
    Jock: Lance

       Weekdays     Saturday    Sunday
    --------------------------------------
    1: Study Hall - Bleachers / BraStore
    2: Health     - Field     / FoodCourt
    L: Cafeteria  - Field     / BraStore
    3: Gym        - Field     / ShoeStore
    4: Theater    - Bleachers / DressStore
    A: Field      - Bleachers / ShoeStore
*/
CONST JOCK = "Lance"
CONST JOCK_TITLE = "the meathead jock"
LIST JockState = (JockObserved), JockDenial, JockFight, JockDumped
VAR JockInPlay = false
VAR JockMood = Hostile
VAR JockBaseMood = Hostile

/*

    Talk to Jock

*/
=== talk_to_jock ===
Approach {JOCK}.
- (opts)
* "Hey, what's up?"
    "Fuck off, loser."
+ [Leave]
    ->->
- -> opts

/*

    Observe Jock

*/
=== observe_jock ===
~ JockState = JockObserved
->->

/*

    Jock Fight 1
    Jock fights you when he finds you taking Cheerleader's things from his locker.
    Whathat are you doing in my locker asshole. We’re not broken up, that’s just a misunderstanding. Face punch, teacher intervenes, gives lance detention, sends you to nurse.

*/
TODO write fight scene 1
=== jock_fight_1 ===
~ has_black_eye = 7
{JOCK} punches you in the face.
-> clinic.exam_area

/*

    Jock Fight 2
    Jock fights you after finding out you fucked Cheerleader.
    You trying to steal my girl bro? Think you got the stuff to hook up with my bitch? Think again. Knees you in the nuts, Rebel intervenes. She likes you more, doesn’t like bullies. Takes you to nurse, who ices your balls then you get hard while she examines them.

*/
TODO write fight scene 2
=== jock_fight_2 ===
~ JockState = JockDumped
~ ow_my_balls = true
The crowd in the hallway parts as {JOCK} and two of his large teammates shoulder people out of the way. He's barreling straight for you, with murder in his eyes.
Lance kicks your ass.
-> clinic.exam_area

/*

    Jock Dreams

*/
=== dream_of_jock ===
You have a confusing dream about {JOCK}.
(How did that happen?)
->->

/*

    Jock Hints

*/
=== jock_hints ===
I wouldn't recommend it.
->->
