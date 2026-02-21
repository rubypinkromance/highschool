/*

    Stepsister’s Friend: Sofia
    Looks like Hazel Heart: Latina, medium-length wavy black hair, average build, large tits, 32D(34C), full bush
    Outfit: pink dress, no bra, no panties

       Weekdays     Saturday    Sunday
    -------------------------------------
    1: ---      - ---        - SisBedroom
    2: ---      - BraStore   - BraStore
    L: ---      - DressStore - DressStore
    3: ---      - ShoeStore  - ShoeStore
    4: ---      - SisBedroom - ---
    A: ---      - SisBedroom - ---
    N: ---      - SisBedroom - ---


? intel: 
? recon: 
? convo: 
    - likes 
    - dislikes 
* Story beats

- Sis has a best friend, who is very into you. She climbs into bed with you one night.
- Sis friend goes to Catholic school wears uniform. She shows up one night wearing her little sisters uniform. The skirt is very short
- Sis and friend do a fashion show for you, wanting a guys opinion. Giggling from closet
- Sis friend catches you peeping in the shower. Stays to help. Once peeped on you, fantasized you were cumming on her
- If you fuck Sis & Friend, you unlock a threesome
*/
CONST SIS_FRIEND = "Sofia"
CONST SIS_FRIEND_TITLE = "her friend"
LIST SisFriendState = (SisFriendObserved), SisFriendIsLesbian, SisFriendIsBi
VAR SisFriendInPlay = true
VAR SisFriendMood = Friendly
VAR SisFriendBaseMood = Friendly

=== talk_to_stepsister_friend ===
~ last_girl = SisFriend

Approach {SIS_FRIEND}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "32D."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave conversation]
    ->->
- -> opts

=== observe_stepsister_friend ===
~ last_girl = SisFriend
~ SisFriendState = SisFriendObserved
Coming soon.
->->

=== dream_of_stepsister_friend ===
You have a filthy dream about {SIS_FRIEND}.
->->

=== stepsister_friend_hints ===
Try observing {SIS_FRIEND}.
->->
