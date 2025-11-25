/*
- Nerd: Felicia
- Looks like Felicia Day: shoulder-length wavy red hair, slight build, small tits, puffy nipples, 32B(34A), trimmed
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
- Nerd observation 1: You see her drawing a burly man embracing a thin redhead. She blushes and covers the drawing.
- Nerd D&D 1: Do you want to play Ragnar the Hulking Barbarian, who takes what he wants or Pip the skinny, hairless elf who solves problems with dexterity and ancient knowledge? Offer multiple options: reject quest, chase women; engage with quest, she is disappointed; choose female character, she says “it might be harder for me to get into …character with a female adventurer”
- Nerd D&D 2: Whenever she describes the barmaid, elven princess, etc, they’re all slender, pale, redheads. When she describes their nipples getting hard, she pinches her own. When she describes them taking off their cloak, she removes her hoodie, etc.
- Trap door surrounded by dead bodies with severed generals. Door has a drooling mouth licking its lips. Investigate to learn it’s a pleasure mimic, and the switch to unlock the door is deep inside its mouth, but that it’s jaws snap shut if it tastes cum. If playing a girl, it’s a pussy. Need to deepthroat her (or finger to climax)
- Sorceress is topless and will not submit unless dominated by barbarian or seduced by female. Elf is captured and sorceress is riding, draining, must use elven stamina to resist cumming 
- If you fail, she’ll let you try again with another character
*/
CONST NERD = "Felicia"
CONST NERD_TITLE = "the cute nerd"
LIST NerdState = NerdObserved
VAR NerdInPlay = true
VAR NerdMood = Neutral
VAR NerdBaseMood = Neutral

=== talk_to_nerd ===
~ last_girl = Nerd

Approach {NERD}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "32B."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
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
