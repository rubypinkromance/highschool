/*
- Photographer: Jill
- Looks like Jill from high school: long straight brunette hair, average build, medium tits, 34B, trimmed
- Outfit: overalls, white cami, pink bra, white panties
? intel: stays late in darkroom every night, once confessed her secret fantasy is meeting a stranger in the darkroom
? recon: favorite photographer does nudes
? convo: suggest a nude photoshood
    - likes sweet, flirty
    - dislikes sarcasm
* BJ in darkroom
* sex after nude photoshoot
* Unavailable on weekends
- 1: Theater     - DressStore
- 2: Science     - Bleachers / BookStore
- L: Bleachers   - Bleachers / FoodCourt
- 3: Gym         - Bleachers / BraStore
- 4: Photography - ShoeStore
- A: Photography - BookStore

- Likes nudity
- Photographer and Friend are friends
- Friend warned photo about you, but she’s kinda into it
*/
CONST PHOTOGRAPHER = "Jill"
CONST PHOTOGRAPHER_TITLE = "the photographer"
LIST PhotographerState = PhotographerObserved
VAR PhotographerInPlay = true
VAR PhotographerMood = Neutral
VAR PhotographerBaseMood = Neutral

=== talk_to_photographer ===
~ last_girl = Photographer

Approach {PHOTOGRAPHER}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "34B."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
- -> opts

=== observe_photographer ===
~ last_girl = Photographer
~ PhotographerState = PhotographerObserved
Coming soon.
->->

=== dream_of_photographer ===
You have a filthy dream about {PHOTOGRAPHER}.
->->

=== photographer_hints ===
Try observing {PHOTOGRAPHER}.
->->
