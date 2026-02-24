/*

    Stepsister: Heather
    Looks like Jade Jones: shaggy black hair, average build, large tits, 34C, shaved
    Outfit: TBD, black with pink polkadots underwear and bra.
    Likes earnest, sweet
    Dislikes serious

       Weekdays   Weekends
    ------------------------
    1: ---      - Bedroom
    2: ---      - BraStore
    L: ---      - DressStore
    3: ---      - ShoeStore
    4: ---      - Bedroom
    A: Bathroom - Bathroom
    N: Bedroom  - Bedroom

*/
CONST SIS = "Heather"
CONST SIS_TITLE = "your stepsister"
LIST SisState = (SisObserved), SawSisNaked, SisMasturbate, SisHandjob, SisBlowjob, SisSex
LIST SisFacts = SisIsLesbian, SisIsBi, SisFantasies, SisSawYourPorn, SisCaughtYouPeeking, (SisIsInterested)
VAR SisInPlay = true
VAR SisMood = Hostile
VAR SisBaseMood = Hostile
VAR SisCum = ()
LIST SisItems = SisPanties, SisDiary, SisVibrator

/*

    Talk to Stepsister
    - If you ask to talk at the mall, she says she's busy and to talk to her at home later

*/
=== talk_to_stepsister ===
~ last_girl = Stepsister

Approach {SIS}.

- (opts)
* {FriendState == FriendQuest and BraSizes !? Stepsister}"What's your bra size?"
    "34C, bro."
+ {SisState == SisSex and SisMood >= Aroused and newToday(-> stepsister_sex)}
    [“Wanna fool around?”]
    -> stepsister_sex ->
+ {not seenVeryRecently(-> look_at_stepsister)}
    [Check her out]
    -> look_at_stepsister ->
+ [Leave conversation]
    ->->
- -> opts

/*

    Stepsister Wants To Talk
    After seeing your porn preferences, she enters your room without knocking. You can choose to kick her out, or play along.
    - event: After borrowing laptop, tells you she saw stepsister porn in your browser history. Asks if you’re into that "I’m not your little sister. We’re the same age and not related."

*/
=== stepsister_wants_to_talk ===
~ last_girl = Stepsister
~ removePerson(Stepsister)
~ BedroomPeople += (Stepsister)

{SIS} opens your door without knocking. She says "we need to talk about your porn preferences, bro."

- (opts)
+ ["Get out!"]
    "Whatever." {SIS} shrugs and closes the door.
    ~ removePerson(Stepsister)
    ~ SisBedroomPeople += (Stepsister)
    ->->
+ ["What do you want?"]
    -> stepsister_flirt ->->
- -> opts

/*

    Stepsister Catches You Jerking Off
    She enters without knocking, catches you in the act, and sees you like stepsister porn. You can choose to kick her out, or play along.

*/
=== stepsister_catches_you_jerking_off ===
~ last_girl = Stepsister
~ removePerson(Stepsister)
~ BedroomPeople += (Stepsister)

{SIS} opens your door without knocking. Her eyes open wide at the sight of you jerking off.

- (opts)
+ ["Get out!"]
    "Your loss." {SIS} shrugs and closes the door.
    ~ removePerson(Stepsister)
    ~ SisBedroomPeople += (Stepsister)
    ->->
+ ["What do you want?"]
    -> stepsister_flirt ->->
- -> opts

/*

    Flirt with Stepsister
    She teases you, asks leading questions, is generally obnoxious. 
    Ask questions about what girls like
        (if SisIsLesbian) If you saw her porn or fooling around with her friend, you can ask about her preferences
        (if SisFantasies) If you've read her diary, you can mention her sex fantasies.
        (if SisSawYourPorn) If she saw your porn history, she'll mention knowing you like stepsis porn.
        (if SisCaughtYouPeeking) If she caught you creeping, you can talk about it more
        (if SisIsInterested) If you know she's into you, you can ask to fool around
            -> SisSex

*/
=== stepsister_flirt ===
- (flirt_opts)
+ [“Wanna fool around?”]
    -> stepsister_sex ->
+ [Leave conversation]
    ~ removePerson(Stepsister)
    ~ SisBedroomPeople += (Stepsister)
    ->->
- -> flirt_opts

/*

    Look at Stepsister
    At home: She's wearing a skimpy outfit chosen to fluster you

*/
TODO conditional description, based on awake, location, arousal, and cum
=== look_at_stepsister ===
{SIS} is one of the most attractive girls at school, and she knows it. Her Puerto Rican heritage gave her luscious brown skin, long wavy black hair, a curvy build, and large tits. {BraSizes ? Stepsister: 34C, you remember.}
{ CheerleaderCum:
- Anal:
    She’s topless, glistening with sweat, with one hand clamped over her pussy as your cum drips from her ass.
- Creampie:
    She’s topless, glistening with sweat, and your cum is dripping down her still-shaking thighs.
- Mouth:
    { CheerleaderMood >= Aroused:
        She’s topless and enthusiastically licking your cum from her lips.
    - else:
        She’s topless, sputtering and spitting your cum on the ground.
    }
- Facial:
    Your cum is dripping off her face onto her bare chest. She’s trying to wipe some of it away from her eye.
- Tits:
    Your cum is splattered across her bare chest. { CheerleaderMood >= Aroused: She’s idly tracing her fingers through it and rubbing it into her nipples. }
- else:
    { today == Saturday:
        <> She’s wearing sneakers and a yellow and white cheerleader outfit, exposing a bare midriff.
    - else:
        <> She’s wearing sneakers, a flowy floral print skirt, and a yellow, loose-fitting, off-the-shoulder crop-top over a bright pink bra. You wonder if her panties match.
    }
}
->->

/*

    Describe Stepsister on the Bed

*/
TODO make these more unique
TODO hostile doesn't mean hostile
TODO describe sister based on whether you knocks, whether friend is here, arousal level, laptop, etc
TODO If she has your laptop, you catch her watching porn (if alone), or eating her friend out while porn plays (if friend is over)

=== sis_on_the_bed(RoomPeople, knock) ===
{
- RoomPeople ? (Stepsister, SisFriend):
    {SIS} and her friend {SIS_FRIEND} are
    {
    - SisMood == Hostile:
        <> glaring at you.
    - SisMood == Aroused:
        <> sitting on the bed, looking at you seductively.
    - SisMood == Desperate:
        <> making out on the bed.
    - else:
        <> lounging on the bed.
    }
- RoomPeople ? Stepsister:
    {SIS} is
    {
    - SisMood == Hostile:
        <> glaring at you.
    - SisMood == Aroused:
        <> sitting on the bed, squeezing her legs together and looking flushed.
    - SisMood == Desperate:
        <> squirming on the bed, beckoning you to come closer.
    - else:
        <> lounging on the bed.
    }
- RoomPeople ? SisFriend:
    {SIS}’s friend {SIS_FRIEND} is
    {
    - SisFriendMood == Hostile:
        <> glaring at you.
    - SisFriendMood == Friendly:
        <> sitting on the bed, smiling at you.
    - SisFriendMood == Aroused:
        <> sitting on the bed, licking her lips and winking at you.
    - SisFriendMood == Desperate:
        <> squeezing her tits, urging you to come closer.
    - SisFriendMood:
        <> lounging on the bed.
    }
- LIST_COUNT(RoomPeople) > 0:
    {lookForRoomPeople(RoomPeople)}
}
->->

/*

    Explore Stepsister’s Room
    Find diary with sex fantasies about you, vibrator, and sexy panties.
        + SisFantasies

*/
TODO add room snooping
=== explore_stepsister_room ===
You look around at all the girly stuff.
- (explore_sis_bedroom_opts)
+ [Read her diary]
    -> read_stepsister_diary ->
+ { SisBedroomItems ? SisPanties and not bedroom.cum_in_sis_panties } [Take her panties]
    ~ move(SisPanties, SisBedroomItems, Inventory)
+ { Inventory ? SisPanties and bedroom.cum_in_sis_panties } [Put {SIS}'s panties in the laundry basket]
    ~ move(SisPanties, Inventory, SisBedroomItems)
+ [Stop exploring]
    -> pass_time -> bedroom
- -> explore_sis_bedroom_opts

/*

    Read Stepsister's Diary
    Sis has a diary revealing her fantasies about you and exploring bisexuality with her best friend. New entries appear every few days.
    Sis goes to all girl school with friend
    Diary entry about having to pretend to be upset about a school with no boys, but she's secretly into girls.
    Forced to share a bed
    Sleepwalker

*/
TODO add diary entries
=== read_stepsister_diary ===
Full of filthy fantasies!
->->

/*

    Jerk Off with Stepsister’s Panties
    After finding a pair of her panties, you jerk off with them.

*/
TODO write panty jerkoff scene
=== stepsister_panties ===
~ last_girl = Stepsister
~ cum_today = true
~ Score += sisPanties
Unable to resist the urge, you wrap {SIS}'s lacy panties around your cock. Quickly, it swells to life, the fabric deliciously stimulating. You thrust and strain into the panties, imagining her putting them on. The head of your cock slips into the gusset, which is enough to push you over the edge, and you blow your load imagining her putting the wet panties on, feeling your cum on her lips.
Afterwards, you feel sheepish, and do your best to clean up the mess.
->->

/*

    Peep on Stepsister in the Shower
    SisShowerPeep
        + SawSisNaked
        Increasingly risky behavior to jerk off while she's in the shower
        a. spy on her masturbating in shower using the shower head -> SisShowerPeep
        b. If caught -> SisShowerSex

*/
TODO add interactive scene
=== peep_stepsister_shower ===
You peep on your stepsister in the shower.
-> pass_time -> bedroom

/*

    Stepsister Sex
    SisSex -> Arousal++
        Hostile: see each other naked, get interrupted (+SawSisNaked)
        Neutral: masturbate together, no touch, cum in your hand (+SisMasturbate)
        Friendly: touch breast, suck nipple, finger, handjob, cum in her hand (+SisHandjob)
        Aroused: oral and blowjob, cum in mouth, on face, or tits (+SisBlowjob)
        Desperate: let's fuck (don't cum inside me), cum inside or on bush (+SisSex)
        Repeat: You can fuck her ass

*/
TODO write the sex scene
TODO pass time after cumming
=== stepsister_sex ===
{ stepsister_sex == 1:
    ~ Score += sisSex
    ~ improveConfidence()
    ~ SisBaseMood = Aroused
}
~ SisState = SisSex
~ cum_today = true
This is it, you're finally going to fuck {SIS}.
- (stepsister_sex_opts)
+ {newToday(-> suck_tits)}
    “I want to suck on your tits.”
    -> suck_tits ->
+ {newToday(-> finger)}
    “I want to finger you.”
    -> finger ->
+ {newToday(-> eat_pussy) and SisMood >= Aroused}
    “I want to go down on you.”
    -> eat_pussy ->
+ {newToday(-> titjob)}
    “I want to fuck your titties.”
    -> titjob ->
+ {newToday(-> blowjob)}
    “I want you to go down me.”
    -> blowjob ->
+ {newToday(-> pussy) and SisMood >= Aroused}
    “I want to fuck you.”
    -> pussy ->
+ {newToday(-> anal) and SisMood == Desperate}
    “I want to fuck your ass.”
    -> anal ->
+ {titjob}
    “I want to cum on your tits.”
    -> cum_tits ->->
+ {titjob or blowjob}
    “I want to cum on your face.”
    -> cum_facial ->->
+ {blowjob}
    “I want to cum in your mouth.”
    -> cum_mouth ->->
+ {pussy}
    “I want to cum inside you.”
    -> cum_creampie ->->
+ {anal}
    “I want to cum in your ass.”
    -> cum_anal ->->
- -> stepsister_sex_opts

= suck_tits
~ improveMood(SisMood)
You pinch her nipples, making her squirm
->->

= finger
~ improveMood(SisMood)
You push two fingers into her dripping pussy
->->

= eat_pussy
~ improveMood(SisMood)
You lift her skirt and bury your tongue in her pussy
->->

= titjob
~ improveMood(SisMood)
She squeezes her tits around your cock
->->

= blowjob
~ improveMood(SisMood)
She swallows your shaft eagerly.
->->

= pussy
~ improveMood(SisMood)
You bend her over and fuck her desperately from behind
->->

= anal
You ease your cock into her ass
->->

= cum_tits
~ SisCum = Tits
You shoot your load on her tits
->->

= cum_facial
~ SisCum = Facial
You shoot your load on her face
->->

= cum_mouth
~ SisCum = Mouth
You cum in her hungry mouth
->->

= cum_creampie
~ SisCum = Creampie
You shove your cock into her dripping cunt and pump her full of cream.
->->

= cum_anal
~ SisCum = Anal
she moans as you pump your load into her tight ass.
->->

/*

    Stepsister Sex (Shower)
    If she catches you peeping, Were you watching me get off? Did you jerk off too?
    SisShowerSex -> Arousal++
        Hostile: She gets out to confront you, makes you show her yours (+SawSisNaked)
        Neutral: She lets you jerk off in shower, no touch, cum on her thigh (+SisMasturbate)
        Friendly: She lets you get behind her, grope, finger, handjob, rub cock between cheeks, cum on back (+SisHandjob)
        Aroused: She asks you to eat her, gives bj, cum in mouth or on face or tits (+SisBlowjob)
        Desperate: She braces on wall, you fuck from behind, cum inside or on asshole (+SisSex)
        Repeat: You can fuck her ass

*/
TODO write the sex scene
TODO pass time after cumming
=== stepsister_sex_shower ===
{ stepsister_sex_shower == 1:
    ~ Score += sisSex
    ~ improveConfidence()
    ~ SisBaseMood = Aroused
}
~ SisState = SisSex
~ cum_today = true
This is it, you're finally going to fuck {SIS}.
- (stepsister_sex_shower_opts)
+ [Touch yourself]
    You start wanking to the sight of your stepsister.
+ [Turn away] ->->
- -> stepsister_sex_shower_opts

/*

    Stepsister Dreams

*/
TODO add wet dreams
=== dream_of_stepsister ===
You have a filthy dream about {SIS}.
->->

/*

    Stepsister Hints

*/
TODO add hints
=== stepsister_hints ===
Try observing {SIS}.
->->

/*

    Observe Stepsister

*/
=== observe_stepsister ===
~ last_girl = Stepsister
~ SisState = SisObserved
You live together. You have observed her plenty.
->->

/*

    Retrieve Laptop from Stepsister
    If you take your laptop back while she's not in the room, you can discover her porn history.

*/
=== retrieve_laptop_from_stepsister ===
~ move(Laptop, SisBedroomItems, BedroomItems)
You pick up your laptop, brushing your finger across the trackpad. The screensaver turns off and you're surprised to see the browser open to a porn site.
+ [Close the browser]
    You quickly close the browser. It's none of your business what porn she likes.
+ [Look at her history]
    You quickly skim through her watch history, and are surprised to find it's mostly girl-on-girl videos. Not everything. She also seems to enjoy threesomes with two girls and a guy. Could {SIS} be a lesbian? Maybe she's just curious?
    ~ SisFacts += SisIsLesbian
- ->->


/*

    Check if your Stepsister is home

*/
=== function sis_is_home()
{
- SisBedroomPeople ? Stepsister or BathroomPeople ? Stepsister:
    ~ return true
- else:
    ~ return false
}

/*

    Did Stepsister Steal Your Laptop?
    This function runs every morning, and has a 25% chance that Heather took your laptop.

*/
=== function sis_stole_laptop()
{ BedroomItems ? Laptop and chance(25):
    ~ move(Laptop, BedroomItems, SisBedroomItems)
    ~ SisFacts += SisSawYourPorn
}