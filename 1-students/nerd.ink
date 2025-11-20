/*
- Nerd: Felicia
- Felicia Day: shoulder-length wavy red hair, slight build, small tits, puffy nipples, 32B(34A), trimmed
- Outfit: Grey t-shirt, "rogues do it from behind", jeans, white thong, pink bralette
? intel: kicked out of her last D&D group for being too horny
? recon: read her RPG planning notes
? convo: interested in D&D, want her to teach you
    - likes flirty, sarcasm
    - dislikes serious
* Watches you jerk off after RPG characters flirt, fool around, nearly caught by librarian during Lunch
* Sex after RPG characters fuck after school
* Unavailabe on weekend
- 1: Science    - MovieTheater
- 2: Health     - MovieTheater
- L: Library    - MovieTheater
- 3: Theater    - MovieTheater
- 4: Study Hall - BookStore
- A: Cafeteria  - ShoeStore
- Afterschool: playing Magic with other nerds in the cafeteria

- nerd observation 1 reveals she plays magic after school in the cafeteria. Observation 2 reveals no one wants to play D&D with her. Observation 3(?) reveals they don’t like how sexually charged her adventures are.
*/
CONST NERD = "Felicia"
CONST NERD_TITLE = "the cute nerd"
LIST NerdState = (NerdInPlay), NerdObserved
VAR NerdMood = Neutral
VAR NerdBaseMood = Neutral

=== talk_to_nerd ===
~ last_girl = Nerd

Approach {NERD}.

- (opts)
* "What's your bra size?"
    "32B."
+ [Leave her alone] ->->
- -> opts

=== observe_nerd ===
~ last_girl = Nerd
~ NerdState += NerdObserved
Coming soon.
->->

=== dream_of_nerd ===
You have a filthy dream about {NERD}.
->->

=== nerd_hints ===
Try observing {NERD}.
->->
