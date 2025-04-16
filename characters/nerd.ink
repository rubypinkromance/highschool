/*
- Nerd: Jenn
    - Felicia Day, skinny, wavy red hair, graphic tee, baggy jeans, puffy nipples, trimmed bush, black bra, light blue thong
    ? intel: kicked out of her last D&D group for being too horny
    ? recon: read her RPG planning notes
    ? convo: interested in D&D, want her to teach you
        - likes flirty, sarcasm
        - dislikes serious
    * Watches you jerk off after RPG characters flirt, fool around, nearly caught by librarian during lunch
    * Sex after RPG characters fuck after school
    - 1: Science
    - 2: Library
    - 3: Study Hall
    - 4: Library
*/
CONST NERD = "Jenn"

=== talk_to_nerd ===
Approach {NERD}.
- (opts)
    * "What's your bra size?"
        "32B."
    + [Leave her alone] ->->
- -> opts
