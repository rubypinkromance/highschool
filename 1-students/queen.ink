/*
- Queen: Victoria
- Looks like Victoria from Life is Strange: short blonde pixie cut, slight build, small tits, 34A, shaved
- Outfit: sweater, black blouse, grey skirt, tights, black mesh thong, black bra with pink lining
? intel: find her secret photos showing bdsm interest
? recon: observe her belittling, see it arouses her
? convo: submit (easy) or assert yourself (hard)
    - likes serious (submissive)
    - dislikes sarcasm
* (easy) Follow to mall, submissive, teases you, makes you carry stuff, follow her to lingerie store, finally lets you eat her out while the twins give you a ruined orgasm footjob
* (hard) Follow to mall, but assert yourself, pull her into family bathroom, make twins strip her, spank her, fuck her ass, demeaning her the whole time, call her a cumslut
- 1: Photography - ShoeStore
- 2: Study Hall  - DressStore
- L: Cafeteria   - FoodCourt
- 3: Theater     - DressStore
- 4: Gym         - BraStore
- A: BraStore    - BraStore

- Likes preppy clothes
- Can ask her to help you buy preppy clothes
- Peep on queen while changing. Need to distract twins
- Two paths with queen. Dom/Sub
*/
CONST QUEEN = "Victoria"
CONST QUEEN_TITLE = "the queen bee"
LIST QueenState = QueenObserved
VAR QueenInPlay = false
VAR QueenMood = Hostile
VAR QueenBaseMood = Hostile

=== talk_to_queen ===
~last_girl = Queen

Approach {QUEEN}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "34A."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave conversation]
    ->->
- -> opts

=== observe_queen ===
~last_girl = Queen
~ QueenState = QueenObserved
Coming soon.
->->

=== dream_of_queen ===
You have a filthy dream about {QUEEN}.
->->

=== queen_hints ===
Try observing {QUEEN}.
->->
