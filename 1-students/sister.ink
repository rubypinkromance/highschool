/*

    Sister: Heather
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

    Talk to Sister
    - If you ask to talk at the mall, she says she's busy and to talk to her at home later

*/
TODO write dialog
=== talk_to_sister ===
~ last_girl = Sister

Approach {SIS}.

- (opts)
* {FriendState == FriendQuest and BraSizes !? Sister}"What's your bra size?"
    "34C, bro."
+ {SisState == SisSex and SisMood >= Aroused and newToday(-> sister_sex)}
    [“Wanna fool around?”]
    -> sister_sex ->
+ {not seenVeryRecently(-> look_at_sister)}
    [Check her out]
    -> look_at_sister ->
+ [Leave conversation]
    ->->
- -> opts

/*

    Sister Wants To Talk
    After seeing your porn preferences, she enters your room without knocking. You can choose to kick her out, or play along.
    - event: After borrowing laptop, tells you she saw stepsister porn in your browser history. Asks if you’re into that "I’m not your little sister. We’re the same age and not related."

*/
TODO write dialog
=== sister_wants_to_talk ===
~ last_girl = Sister
~ removePerson(Sister)
~ BedroomPeople += (Sister)

{SIS} opens your door without knocking. She says "we need to talk about your porn preferences, bro."

- (opts)
+ ["Get out!"]
    "Whatever." {SIS} shrugs and closes the door.
    ~ removePerson(Sister)
    ~ SisBedroomPeople += (Sister)
    ->->
+ ["What do you want?"]
    -> sister_flirt ->->
- -> opts

/*

    Sister Catches You Jerking Off
    She enters without knocking, catches you in the act, and sees you like stepsister porn. You can choose to kick her out, or play along.

*/
TODO write dialog
=== sister_catches_you_jerking_off ===
~ last_girl = Sister
~ removePerson(Sister)
~ BedroomPeople += (Sister)

{SIS} opens your door without knocking. Her eyes open wide at the sight of you jerking off.

- (opts)
+ ["Get out!"]
    "Your loss." {SIS} shrugs and closes the door.
    ~ removePerson(Sister)
    ~ SisBedroomPeople += (Sister)
    ->->
+ ["What do you want?"]
    -> sister_flirt ->->
- -> opts

/*

    Flirt with Sister
    She teases you, asks leading questions, is generally obnoxious.
    Ask questions about what girls like
        (if SisIsLesbian) If you saw her porn or fooling around with her friend, you can ask about her preferences
        (if SisFantasies) If you've read her diary, you can mention her sex fantasies.
        (if SisSawYourPorn) If she saw your porn history, she'll mention knowing you like stepsis porn.
        (if SisCaughtYouPeeking) If she caught you creeping, you can talk about it more
        (if SisIsInterested) If you know she's into you, you can ask to fool around
            -> SisSex

*/
TODO write dialog
=== sister_flirt ===
~ last_girl = Sister
- (flirt_opts)
+ [“Wanna fool around?”]
    -> sister_sex ->
+ [Leave conversation]
    ~ removePerson(Sister)
    ~ SisBedroomPeople += (Sister)
    ->->
- -> flirt_opts

/*

    Look at Sister

*/
=== look_at_sister ===
~ last_girl = Sister
{ SisCum:
- Anal:
    {SIS} sighs happily, completely relaxed as your cum leaks from her asshole.
- Creampie:
    {SIS} is squirming and giggling, with a hand clamped between her legs to catch your cum.
- Mouth:
    {SIS} is topless and grinning as she licks the last of your cum from her lips.
- Facial:
    {SIS} grins at you as she wipes your cum from her cheek and licks it off her finger.
- Tits:
    {SIS} is laughing as she runs her fingers through your cum, splattered across her chest.
- else:
    You and {SIS} are the same age, but she’s shorter than you, with pale skin and wavy black hair that falls around her shoulders when it’s not pulled back in a ponytail.
    { sis_is_home():
        <> She’s wearing skimpy pajamas: baggy blue sleep shorts and a black tank top that does nothing to conceal her perky nipples poking through the thin fabric. Her top is loose enough that whenever she moves, you catch a glimpse of bare breast through the arm holes. She must be aware of how distracting it is for you.
    - else:
        <> She’s wearing torn black jeans, a black t-shirt with a band logo, and a green army jacket. Her shirt is low-cut enough to reveal and good amount of cleavage and a peek of her hot-pink bra.
    }
}
->->

/*

    Describe Sister on the Bed

*/
TODO make these more unique
TODO hostile doesn't mean hostile
TODO describe sister based on whether you knocks, whether friend is here, arousal level, laptop, etc
TODO If she has your laptop, you catch her watching porn (if alone), or eating her friend out while porn plays (if friend is over)
=== sis_on_the_bed(RoomPeople, knock) ===
{
- RoomPeople ? (Sister, SisFriend):
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
- RoomPeople ? Sister:
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

    Explore Sister’s Room
    Find diary with sex fantasies about you, vibrator, and sexy panties.
        + SisFantasies

*/
TODO add room snooping
=== explore_sister_room ===
You look around at all the girly stuff.
- (explore_sis_bedroom_opts)
+ [Read her diary]
    -> read_sister_diary ->
+ { SisBedroomItems ? SisPanties and not use_sister_panties } [Take her panties]
    ~ move(SisPanties, SisBedroomItems, Inventory)
+ { Inventory ? SisPanties and use_sister_panties } [Put {SIS}'s panties in the laundry basket]
    ~ move(SisPanties, Inventory, SisBedroomItems)
+ [Leave {SIS_BEDROOM}]
    -> pass_time -> bedroom
- -> explore_sis_bedroom_opts

/*

    Read Sister's Diary
    Sis has a diary revealing her fantasies about you and exploring bisexuality with her best friend. New entries appear every few days.
    Sis goes to all girl school with friend
    Diary entry about having to pretend to be upset about a school with no boys, but she's secretly into girls.
    Forced to share a bed
    Sleepwalker

*/
TODO add diary entries
=== read_sister_diary ===
~ last_girl = Sister
Full of filthy fantasies!
->->

/*

    Jerk Off with Sister’s Panties
    After finding a pair of her panties, you jerk off with them.

*/
TODO write panty jerkoff scene
=== use_sister_panties ===
~ last_girl = Sister
~ cum_today = true
~ Score += sisPanties
Unable to resist the urge, you wrap {SIS}'s lacy panties around your cock. Quickly, it swells to life, the fabric deliciously stimulating. You thrust and strain into the panties, imagining her putting them on. The head of your cock slips into the gusset, which is enough to push you over the edge, and you blow your load imagining her putting the wet panties on, feeling your cum on her lips.
Afterwards, you feel sheepish, and do your best to clean up the mess.
->->

/*

    Peep on Sister in the Shower
    SisShowerPeep
        + SawSisNaked
        Increasingly risky behavior to jerk off while she's in the shower
        a. spy on her masturbating in shower using the shower head -> SisShowerPeep
        b. If caught -> SisShowerSex

*/
TODO add interactive scene
=== peep_sister_shower ===
~ last_girl = Sister
You peep on your stepsister in the shower.
-> pass_time -> bedroom

/*

    Sister Sex
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
=== sister_sex ===
{ sister_sex == 1:
    ~ Score += sisSex
    ~ improveConfidence()
    ~ SisBaseMood = Aroused
}
~ SisState = SisSex
~ cum_today = true
This is it, you're finally going to fuck {SIS}.
- (sister_sex_opts)
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
- -> sister_sex_opts

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

    Sister Sex (Shower)
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
=== sister_sex_shower ===
{ sister_sex_shower == 1:
    ~ Score += sisSex
    ~ improveConfidence()
    ~ SisBaseMood = Aroused
}
~ SisState = SisSex
~ cum_today = true
This is it, you're finally going to fuck {SIS}.
- (sister_sex_shower_opts)
+ [Touch yourself]
    You start wanking to the sight of your stepsister.
+ [Turn away] ->->
- -> sister_sex_shower_opts

/*

    Sister Dreams

*/
TODO add wet dreams
=== dream_of_sister ===
You have a filthy dream about {SIS}.
->->

/*

    Sister Hints

*/
=== sister_hints ===
Wait for {SIS} to borrow your laptop, or snoop around in her room, or peep on her in the shower.
->->

/*

    Observe Sister
    This standard knot is required, but will never be called.

*/
=== observe_sister ===
~ last_girl = Sister
~ SisState = SisObserved
You live together. You have observed her plenty.
->->

/*

    Retrieve Laptop from Sister
    If you take your laptop back while she's not in the room, you can discover her porn history.

*/
=== retrieve_laptop_from_sister ===
~ move(Laptop, SisBedroomItems, BedroomItems)
You pick up your laptop, brushing your finger across the trackpad. The screensaver turns off and you're surprised to see the browser open to a porn site.
+ [Close the browser]
    You quickly close the browser. It's none of your business what porn she likes.
+ [Look at her history]
    You quickly skim through her watch history, and are surprised to find it's mostly girl-on-girl videos. Not everything. She also seems to enjoy threesomes with two girls and a guy. Could {SIS} be a lesbian? Maybe she's just curious?
    ~ SisFacts += SisIsLesbian
- ->->


/*

    Check if your Sister is home

*/
=== function sis_is_home()
{
- SisBedroomPeople ? Sister or BathroomPeople ? Sister:
    ~ return true
- else:
    ~ return false
}

/*

    Did Sister Steal Your Laptop?
    This function runs every morning, and has a 25% chance that Heather took your laptop.

*/
=== function sis_stole_laptop()
{ BedroomItems ? Laptop and chance(25):
    ~ move(Laptop, BedroomItems, SisBedroomItems)
    ~ SisFacts += SisSawYourPorn
}
