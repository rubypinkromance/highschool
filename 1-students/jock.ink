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
LIST JockState = (JockObserved), JockDenial, JockDetention, JockFight, JockDumped
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

*/
=== jock_fight_1 ===
You close the locker and are greeted by the sight of {JOCK}’s snarling face. Before you have a chance to react, he punches you hard in the eye. You collapse to the ground, cursing.
“What the fuck are you doing in my locker, asshole?” he demands, standing over you with clenched fists.
+ “{CHEERLEADER} sent me.[”] She said you guys broke up, and asked me to get her stuff back.”
    -> not_broken_up
+ “Nothing!”[] you blurt, unsure if it’s a good idea to mention {CHEERLEADER}.
+ “Don’t hit me!”[] you plead, scrambling away from him.
-
He spots the bag of her stuff and rolls his eyes. “She sent you to get her stuff, huh?”
“She said you guys broke up,” you explain.
- (not_broken_up)
“We’re not broken up,” he sneers, “that was just a misunderstanding. I can’t believe she’s being such a bitch about this. Now, give me her shit back, so I can go explain things to her.”
+ [Give him the bag]
+ [Don’t give him the bag]
-
Before you can do anything, a woman’s voice cuts through the noise of the crowd.
“{JOCK}!” The onlookers quickly move out of {GYM_TEACHER}’s way. “Another fight, seriously?”
“No, no,” he blurts, unclenching his fists and glancing at you on the floor. “I was just—”
“Save it for the principal,” she sighs. “You can explain it to him before detention.”
“But I’ll miss practice!” he protests.
“You should have thought of that before. Now come with me to the office.” She looks down at you and frowns. “You’d better go see {NURSE} to get some ice on that shiner.”
{JOCK} shoots a dirty look at you as they walk away.
~ has_black_eye = 7
~ JockState = JockDetention
+ [Go to the {CLINIC}] -> clinic

/*

    Jock Fight 2
    Jock fights you after finding out you fucked Cheerleader.


*/
=== jock_fight_2 ===
The crowd in the hallway parts as {JOCK} and two of his large teammates shoulder people out of the way. He’s barreling straight for you, with murder in his eyes. You try to turn away, but another football player is standing directly behind you. He pushes you towards {JOCK}.
“Who the fuck do you think you are?” He punctuates the question with a punch to your stomach. You double over coughing, but one of the big guys holds you up. “You seriously think you can steal my girl?”
+ “I didn’t[ steal her!”]—” Before you can finish, he punches you in the gut again.
+ “She dumped you!”
    He responds to this logical point with another punch to the gut.
+ “Fuck you, {JOCK}[.”],” you snarl.
    {JOCK} looks surprised at your defiance. His goons all laugh as he responds with another punch to the gut.
-
“Look at you! Fuckin’ loser,” he spits. “You seriously think you got the balls to satisfy a fine bitch like that?” He doesn’t wait for you to respond. Instead, he drives his knee forcefully into your groin. The pain is blinding, and your legs wobble. The only reason you don’t collapse is the meatheat holding you up so {JOCK} can keep hitting you.
“You turned her against me,” he growls, delivering another blow to your crotch, “and I’m gonna make sure you never—”
“Hey {JOCK},” a girl’s voice comes from behind you. “Is it true you’ll be kicked off the team if you get detention one more time?”
A hush falls over the crowd as {getNameAndTitle(Rebel)} steps forward.
+ [Groan]
+ [Cough]
+ [Wheeze]
-
“The fuck do you know about it, cunt?” {JOCK} snarls.
Her eyes flash red at the insult. “Enough to know if I call a teacher over right now, you’d regret it.”
“Yo, she’s not wrong,” one of his teammates says quietly. “Think of the team.”
For a long moment, {JOCK} hesitates. “Whatever,” he finally grumbles. “{CHEERLEADER}’s a bitch. I’m done with her, and this loser won’t be able to do shit after the beating we just gave him. Let’s go.”
As soon as he turns to walk away, the big guy stops holding you up, and you fall to the ground. Your eyes are watering as the crowd disperses and you hold your painfully aching balls.
“Are you okay?” There’s a light touch on your shoulder as {REBEL} kneels next to you.
+ [“Yes.” (lie)]
    You reply with a wheeze and false bravado, “Yeah, I’m okay.”
    She seems unconvinced. <>
+ “No[.”],” you barely manage to wheeze.
+ “Thanks[.”],” you wheeze.
    “No problem. I hate bullies,” she replies. <>
-
“Let’s get you to the nurse.”
She pulls your arm over her shoulder and helps you to stand up and start limping down the hall.
~ JockState = JockDumped
~ ow_my_balls = true
+ [Go to the {CLINIC}] -> clinic

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
