/*
- Jock: Lance
*/
CONST JOCK = "Lance"
VAR saw_weed = false

=== talk_to_jock ===
Approach {JOCK}.
- (opts)
    * "Fight me, bro!"
        "Let's go then!"
    + [Leave him alone] ->->
- -> opts
