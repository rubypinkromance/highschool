/*
- Queen: Victoria
- LIS Victoria: Short blonde pixie cut, Skinny, small chest, shaved, nice clothes, shaved
? intel: find her secret photos showing bdsm interest
? recon: observe her belittling, see it arouses her
? convo: submit (easy) or assert yourself (hard)
    - likes serious (submissive)
    - dislikes sarcasm
* (easy) Follow to mall, submissive, teases you, makes you carry stuff, follow her to lingerie store, finally lets you eat her out while the twins give you a ruined orgasm footjob
* (hard) Follow to mall, but assert yourself, pull her into family bathroom, make twins strip her, spank her, fuck her ass, demeaning her the whole time, call her a cumslut
- 1: Photography - Shoe Store
- 2: Study Hall  - Dress Store
- L: Cafeteria   - Food Court
- 3: Theater     - Dress Store
- 4: Gym         - Bra Store
- A: Mall        - Bra Store
*/
CONST QUEEN = "Victoria"
CONST QUEEN_TITLE = "the queen bee"
LIST QueenState = QueenObserved

=== talk_to_queen ===
Approach {QUEEN}.
- (opts)
    * "What's your bra size?"
        "34B."
    + [Leave her alone] ->->
- -> opts

=== observe_queen ===
~ QueenState += QueenObserved
Coming soon.
->->
