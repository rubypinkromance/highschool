/*
- Teacher: Sara Talltrees
- Looks like Sara Tomko from Resident Alien: black hair, curvy, chestnut skin, small breasts (padded bra), big hips, jeans
- Flirty
? intel: has tattoos, pierced tongue
? recon: watch closely, has pierced nipples
? convo: Ask about tattoos, flashes a little skin, ask about piercings, tells you nipples are pierced, clit is pierced, tongue is pierced. Good for blowjobs. Gets turned on, pulls you into supply closet, lets you see, touch, finger, lick her clit, pushes you out when bell rings but tells you to come back after school.
    - likes flirty
    - dislikes sarcasm
* Distract to steal office supplies
* Finger her in the supply closet
* Fuck her in the supply closet after school

- Secretary is like babysitter character, likes to flirt, will agree to coach you in flirting if you agree not to fall in love with her
- Secretary coaching increases confidence
*/
CONST SECRETARY = "Ms. Talltrees"
CONST SECRETARY_TITLE = "the office assistant"
LIST SecretaryState = (SecretaryObserved)
VAR SecretaryInPlay = false
VAR SecretaryMood = Friendly
VAR SecretaryBaseMood = Friendly

=== talk_to_secretary ===
~ last_girl = Secretary

Approach {SECRETARY}.

- (opts)
    * {SecretaryMood > Friendly}"What's your bra size?"
        "34B."
    + "I want to change my schedule."
        {
        - date <= 7:
            ~ temp date_reply = "Since it's the first week of school, you can change your schedule without permission. "
            -> office.change_schedule(date_reply) ->
        - permission_to_change_schedule:
            ~ temp permission_reply = "I see you have permission from a teacher. "
            -> office.change_schedule(permission_reply) ->
            ~ permission_to_change_schedule = false
        - else:
            "I'm sorry, students are only allowed to change their schedule for the first week. You'll need permission from a teacher to do so now."
        }
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

=== secretary_hints ===
Try observing {SECRETARY}.
->->
