/*
- Friend: Whitney
- Looks like Velma Dinkly: short brunette bob, average build, large tits, 34C, trimmed
- Outfit: Orange shirt, red skirt, black bra, black thong
- Gives details on schoolgirls (Nympho gives details on teachers)
? intel: She tells you to ask her if you need to know anything about other girls
? recon: wants to be a detective (favorite books, movies, references)
? convo: ask about her multiple times, she deflects, eventually asks why you're curious, say you're interested in being a detective.
    - likes serious
    - dislikes flirty
* quest: Why did Rebel have to transfer schools?
* quest: Is Scientist making meth in lab?
* quest: Who did X make out with at the party?
* quest: Why did X get the role instead of Y?
* quest: Is our team lead sleeping with theirs?
* quest: Does X have a tattoo on his dick?
* quest: Do theater kids have a weird sex ritual?
* quest: Is there a stash of porn in the A/V closet?
* quest: student council: find dirt on candidate.
* quest: (something in men's locker room)
* quest: Graffitti in men's room
* quest: steal hall pass from office
* quest: steal confiscated vapes from lounge
* quest: steal pills from nurse
* quest: gives you address to surveil on your way to school, turns out to be her house, observe her getting dressed. What color are my underwear? How long are my pubes? What's my favorite movie? If you get it right, she invites you to the teacher's lounge for a final lesson.
* Sex in empty teacher's lounge, she shows up in trenchcoat and lingerie
- 1: Health     - Dress Store
- 2: Theater    - Shoe Store
- L: Cafeteria  - Food Court
- 3: Science    - Bra Store
- 4: Study Hall - Dress Store
- A: Bleachers  - Dress Store

- Friend and Photographer are friends
- Makes fun of you for wearing nice or preppy clothes
- Friend knows when you try to put the moves on her, calls you out, but curious
- Final detective exam: She brings you home (Mom sees you, asks if you're staying for dinner, she says no, he's just stopping by to borrow some of my notes) Makes you wait in the hall, then says she's arranged some clues that she will ask you about, and pushes you into her room for two minutes. You have a list of things to examine, including panties on the floor (option to steal), then she pushes you into the closet, and quizzes you (she notices the panties in your pocket if you took them). If you get a good score, she says we have five minutes before my Mom gets suspicious, what do you think I want to do with that time. Options include finger her, suck on her nipples, blowjob, and make out.
*/
CONST FRIEND = "Whitney"
CONST FRIEND_TITLE = "your friend"
LIST FriendState = FriendObserved
VAR FriendInPlay = true
VAR FriendMood = Friendly
VAR FriendBaseMood = Friendly

=== talk_to_friend ===
~last_girl = Friend

Approach {FRIEND}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "34C."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
- -> opts

=== observe_friend ===
~ last_girl = Friend
~ FriendState += FriendObserved
Coming soon.
->->

=== dream_of_friend ===
You have a filthy dream about {FRIEND}.
->->

=== friend_hints ===
Try observing {FRIEND}.
->->
