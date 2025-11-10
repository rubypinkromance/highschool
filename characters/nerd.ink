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
    - 1: Science
    - 2: Health
    - L: Library
    - 3: Theater
    - 4: Study Hall
    - A: Library
*/
CONST NERD = "Felicia"
CONST NERD_TITLE = "the cute nerd"

=== talk_to_nerd ===
Approach {NERD}.
- (opts)
    * "What's your bra size?"
        "32B."
    + [Leave her alone] ->->
- -> opts
