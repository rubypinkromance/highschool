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
LIST SisFacts = SisIsLesbian, SisIsBi, SisFantasies, SisSawYourPorn, (SisIsInterested)
VAR SisInPlay = true
VAR SisMood = Hostile
VAR SisBaseMood = Hostile
VAR SisCum = ()
LIST SisItems = SisPanties, SisDiary, SisVibrator

/*

    Talk to Stepsister
    Ask questions about what girls like
    - event: Sis in towel. Was that you in the bathroom just now? Were you watching me get off? Did you jerk off too?
    - event: Sis laptop is broken. Mom and Dad won’t replace it. She borrows yours.
    - event: After borrowing laptop, tells you she saw stepsister porn in your browser history. Asks if you’re into that "I’m not your little sister. We’re the same age and not related."
    - If you ask to talk at the mall, she says she's busy and to talk to her at home later
    SisFlirt
        First time: just flirting, no acting on it, but you learn she's kinda into you
            +SisIsInterested
        (if SisFantasies) If you've read her diary, you can mention her sex fantasies.
        (if SisSawYourPorn) If she saw your porn history, she'll mention knowing you like stepsis porn.
        (if SisIsInterested) If you know she's into you, you can ask to fool around
            -> SisSex
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

    Look at Stepsister
    At home: She's wearing a skimpy outfit chosen to fluster you

*/
TODO conditional description, based on awake, location, arousal, and cum
=== look_at_stepsister ===
Look at {SIS}.
- (opts)
+ [Check her out]
    She's smoking hot, man.
+ [Get closer]
    Fucking hell, she's hawt
+ [Touch yourself]
    You start wanking to the sight of your stepsister.
+ [Fuck her] -> stepsister_sex ->->
+ [Turn away] ->->
- -> opts

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