/*
- Teacher: Sara Talltrees
- Flirty
- Sara Tomko: black hair, curvy, chestnut skin, small breasts (padded bra), big hips, jeans
? intel: has tattoos, pierced tongue
? recon: watch closely, has pierced nipples
? convo: Ask about tattoos, flashes a little skin, ask about piercings, tells you nipples are pierced, clit is pierced, tongue is pierced. Good for blowjobs. Gets turned on, pulls you into supply closet, lets you see, touch, finger, lick her clit, pushes you out when bell rings but tells you to come back after school.
    - likes flirty
    - dislikes sarcasm
* Distract to steal office supplies
* Finger her in the supply closet
* Fuck her in the supply closet after school
*/
CONST SECRETARY = "Ms. Talltrees"
CONST SECRETARY_TITLE = "the office assistant"
LIST SecretaryState = (SecretaryObserved)
VAR SecretaryMood = Friendly
VAR SecretaryBaseMood = Friendly

=== talk_to_secretary ===
~ last_girl = Secretary

Approach {SECRETARY}.

- (opts)
    * "What's your bra size?"
        "34B."
    + [Leave her alone] ->->
- -> opts

=== observe_secretary ===
~ last_girl = Secretary
~ SecretaryState += SecretaryObserved
Coming soon.
->->

=== dream_of_secretary ===
You have a filthy dream about {SECRETARY}.
->->