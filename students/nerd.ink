/*
- Nerd: Felicia
- Felicia Day, skinny, wavy red hair, graphic tee, baggy jeans, puffy nipples, trimmed bush, black bra, light blue thong
? intel: kicked out of her last D&D group for being too horny
? recon: read her RPG planning notes
? convo: interested in D&D, want her to teach you
    - likes flirty, sarcasm
    - dislikes serious
* Watches you jerk off after RPG characters flirt, fool around, nearly caught by librarian during Lunch
* Sex after RPG characters fuck after school
* Unavailabe on weekend
- 1: Science    - Movie Theater
- 2: Health     - Movie Theater
- L: Library    - Food Court
- 3: Theater    - Book Store
- 4: Study Hall - Book Store
- A: Library    - Shoe Store
*/
CONST NERD = "Felicia"
CONST NERD_TITLE = "the cute nerd"
LIST NerdState = NerdObserved

=== talk_to_nerd ===
Approach {NERD}.
- (opts)
    * "What's your bra size?"
        "32B."
    + [Leave her alone] ->->
- -> opts

=== observe_nerd ===
~ NerdState += NerdObserved
Coming soon.
->->
