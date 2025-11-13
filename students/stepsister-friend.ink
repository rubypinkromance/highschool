/*
- Stepsister’s Friend: Sofia
- Hazel Heart: Latina, medium-length wavy black hair, average build, large tits, 32D(34C), full bush
- Outfit: pink dress, no bra, no panties
? intel: 
? recon: 
? convo: 
    - likes 
    - dislikes 
* Story beats
- 1: --- - Bedroom
- 2: --- - Bra Store
- L: --- - Food Court
- 3: --- - Shoe Store
- 4: --- - Bedroom
- A: --- - Bathroom
- N: --- - Bedroom
*/
CONST SIS_FRIEND = "Sofia"
CONST SIS_FRIEND_TITLE = "her friend"
LIST SisFriendState = SisFriendObserved
VAR SisFriendMood = Aroused
VAR SisFriendBaseMood = Aroused

=== talk_to_stepsister_friend ===
Approach {SIS_FRIEND}.
- (opts)
* "What's your bra size?"
    "32D."
+ [Leave her alone] ->->
- -> opts

=== observe_stepsister_friend ===
~ SisFriendState += SisFriendObserved
Coming soon.
->->
