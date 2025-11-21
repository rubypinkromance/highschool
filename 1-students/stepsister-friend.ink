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
- 2: --- - BraStore
- L: --- - DressStore
- 3: --- - ShoeStore
- 4: --- - Bedroom
- A: --- - Bedroom
- N: --- - Bedroom

- Sis has a best friend, who is very into you. She climbs into bed with you one night.
*/
CONST SIS_FRIEND = "Sofia"
CONST SIS_FRIEND_TITLE = "her friend"
LIST SisFriendState = SisFriendInPlay, SisFriendObserved, SisFriendIsLesbian, SisFriendIsBi
VAR SisFriendMood = Aroused
VAR SisFriendBaseMood = Aroused

=== talk_to_stepsister_friend ===
~ last_girl = SisFriend

Approach {SIS_FRIEND}.

- (opts)
* {SisFriendMood == Aroused}"What's your bra size?"
    "32D."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave her alone] ->->
- -> opts

=== observe_stepsister_friend ===
~ last_girl = SisFriend
~ SisFriendState += SisFriendObserved
Coming soon.
->->

=== dream_of_stepsister_friend ===
You have a filthy dream about {SIS_FRIEND}.
->->

=== stepsister_friend_hints ===
Try observing {SIS_FRIEND}.
->->
