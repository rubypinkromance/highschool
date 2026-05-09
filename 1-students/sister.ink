/*

    Sister: Heather
    Looks like Jade Jones: shaggy black hair, average build, large tits, 34C, shaved
    Outfit: TBD, black with pink polkadots underwear and bra.
    Likes earnest, sweet
    Dislikes serious
    
    Sis goes to all girl school with friend


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
LIST SisFacts = SisMightBeQueer, SisMightBeIntoYou, SisIsBi, ReadSisDiary, SawSisPorn, SisSawYourPorn, SisCaughtYouPeeking, SisIsInterested, SisRejected
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
+ { SisBedroomItems ? Laptop }"I need my laptop back."
    "That's fine, I'm done with it."
    ~ move(Laptop, SisBedroomItems, BedroomItems)
+ {SisState == SisSex and SisMood >= Aroused and newToday(-> sister_sex) and SisFacts !? SisRejected}
    [“Wanna fool around?”]
    -> sister_sex ->
+ {not seenVeryRecently(-> look_at_sister) and SisFacts !? SisRejected}
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
    + + [(Don't show me stepsister content)]
        ~ SisFacts += SisRejected
    + + [(Stepsister content is fine)]
    - -
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
    + + [(Don't show me stepsister content)]
        ~ SisFacts += SisRejected
    + + [(Stepsister content is fine)]
    - -
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
TODO add room snooping, vibrator, dildo, lube, strap-on
=== explore_sister_room ===
You look around at all the girly stuff.
- (explore_sis_bedroom_opts)
+ {not read_sister_diary} [Read her diary]
    -> read_sister_diary ->
+ {read_sister_diary} [Read another diary entry]
    -> sister_diary_entries ->
+ { SisBedroomItems ? SisPanties and not use_sister_panties } [Take her panties]
    ~ move(SisPanties, SisBedroomItems, Inventory)
    You quickly grab the panties and shove them into your pocket.
+ { Inventory ? SisPanties and use_sister_panties } [Put {SIS}'s panties back in the laundry basket]
    ~ move(SisPanties, Inventory, SisBedroomItems)
    Sheepishly, you return the panties to her laundry basket, burying them beneath some other clothes. You pray she won't notice they're covered in your cum.
+ [Leave {SIS_BEDROOM}]
    -> pass_time -> bedroom
- -> explore_sis_bedroom_opts

/*

    Read Sister's Diary
    Sis has a diary revealing her fantasies about you and exploring bisexuality with her best friend.

*/
TODO add diary entries
=== read_sister_diary ===
~ last_girl = Sister
~ SisFacts += ReadSisDiary
You flip through her diary, expecting to find what you imagine a typical teenage girl writes about: friend drama, makeup, boys, whatever. Instead you're shocked to find an explicit description of a wet dream.
"…taller than me, wearing a leather jacket and tight jeans. She pushed me against the wall and silenced my protests with a demanding kiss."
+ {SisFacts !? SisMightBeQueer}[She?] Wait, <em>she</em>? Is {SIS} a lesbian? You keep reading, fascinated.
    ~ SisFacts += SisMightBeQueer
    -> sister_diary_entries
+ [Keep reading]
    -> sister_diary_entries
+ [Stop reading]
    You quickly close the diary. It's none of your business what her fantasies are.
    ->->

=== sister_diary_entries
{cycle:
- -> diary_lesbian ->
- -> diary_friend_sex ->
- -> diary_bedshare ->
- -> diary_sleepwalker ->
- -> diary_threesome ->
}
->->

= diary_lesbian
"She pushed me against the wall and silenced my protests with a demanding kiss. I found myself melting against her body as her tongue flirted with mine. She slipped a hand under my shirt, and I felt the heat of her palm against my stomach, sliding down past the waistband of my sleep shorts."
"I squirmed and pawed at her chest, overwhelmed by a confusing mixture of desire and shame. Her fingers moved slowly but insistenly, lower and lower, until they found my slit. I shivered with need, and she did not wait for permission before one nimble digit curled effortlessly inside me."
+ [Keep reading]
+ [Stop reading] ->->
-
"I broke the kiss, gasping for breath, and desperately pulled her shirt up to expose a soft pink bralette, a surprisingly feminine contrast to her masculine frame. I pulled the cup to one side and wrapped my lips around her firm nipple, flicking my tongue against it in time with the motion of her finger inside me. She moaned quietly and rewarded me with another finger."
"As always, I woke up before the dream finished. My heart was pounding and my panties were soaked. As I finished myself off, I had to bite my pillow to keep from moaning so loud {PLAYER} could hear."
->->

= diary_friend_sex
"I had <em>another</em> wet dream about {SIS_FRIEND}. If this keeps up, I'm going to start blushing every time she's around. I should tell her, but I'm worried how she'll react."
A different handwriting in the margin reads, "You silly lovely girl, you had nothing to worry about. I'm glad you told me to read this. Now I'm going to quit writing and kiss you."
+ [Keep reading]
+ [Stop reading] ->->
-
"She was spending the night like normal, and we went to bed. But in the middle of the night, I woke up because she was moving and murmuring something. She lay on her back, clearly still asleep, although one hand was down her shorts and the other was squeezing her tits. I leaned close, holding my ear to her lips so I could understand what she was saying."
"'{SIS},' she gasped, 'I need you.' I sat up in surprise, and watched as she squirmed and breathed my name over and over. I couldn't believe I was watching my best friend masturbate while dreaming of me. It didn't take long before I started squirming a bit, too. 'Please,' she begged, 'touch me, kiss me!'"
+ [Keep reading]
+ [Stop reading] ->->
-
"You know how dream logic is. I didn't stop to think if this was a good idea, or if I was taking advantage of her. I just kissed her. She moaned as I sucked on her bottom lip and kissed down her neck. I was so turned on, all I could think of was kissing every part of her body. I pushed up her shirt and licked circles around her nipples until she was gasping, then I kissed down to her hips."
"She gasped as I slid her shorts off and spread her thighs, allowing me to see the two fingers she had buried deep in her pussy. I pulled them out and eagerly licked up the cream that coated them before going to the source. Her lips parted for me and her taste filled my mouth. I sucked and kissed and licked until her body stiffed under me and she screamed loud enough to wake me from my dream."
"When I was done, I was so wet I had to take a shower before I could go to school."
->->

= diary_bedshare
"Well, this was a new one. I had a dream about {PLAYER}. I've never really thought about him like that. I guess technically we're only stepsiblings, but it feels so wrong to admit that ever since I can't help but wonder what it would be like…"
"In the dream, we had guests visiting. Some aunt or other. It wasn't clear, except that they needed my room, so Mom said I had to share a bed with {PLAYER}. I was annoyed, but didn't really question it. When it was time for bed, we decided we both had to sleep naked, because it was so hot in his room. I remember lying down and realizing how small his bed was. Even lying on our sides, like we were spooning, he was still pressed up against my back. His skin was so hot, and it wasn't long before I felt his erection against my butt."
+ [Keep reading]
+ [Stop reading] ->->
-
"I tried to sleep. I tried to ignore him. But every few seconds, he would move a little, and his dick would rub against me. I found myself becoming incredibly aroused, but I didn't want him to know. I squeezed my thighs together, feeling my lips were already puffy and slick. Then he threw his arm over me, cupping my breast with his hand."
"I never thought he was trying to take advantage of the situation. I was so afraid he would feel how hard my nipple was under his palm. I found myself squirming every time he moved, pushing my ass back against him. He never responded like he was aware that anything was happening, which just left me even more worked up. Somehow, his cock slipped between my thighs."
+ [Keep reading]
+ [Stop reading] ->->
-
"I was utterly lost by this point. His dick was so hard, throbbing between my legs, pressing against my lips. I started rocking my hips, rubbing along the length of him, until his shaft was slippery with my wetness. How could he not be aware of how desperate I was? Perhaps unconciously, he squeezed my breast, the pressure on my nipple sending shivers down my spine."
"I couldn't handle it anymore. As slowly as I could, I slid my hips forward, moving down the length of him until he was pressing against my opening. My heart was pounding and I bit my lip to keep from moaning as I very, very carefully rocked back, impaling myself on him. My insides clenched around his shaft and…"
"I woke up confused and desperate. If he had been there, I would have jumped him without thinking about it. Instead, I took my dildo in the shower, stuck it to the wall, and fucked myself from behind."
->->

= diary_sleepwalker
"Another dream about {PLAYER}. Maybe… No. But it's affecting things. The other day I left the bathroom after taking a shower, and he was standing outside, waiting his turn. I wondered if he'd heard me moaning through the door. Part of me hoped he did."
"Anyway, the dream was kinda funny. I was on the phone with {SIS_FRIEND} when {PLAYER} came into my room without knocking. He was just wearing boxers, and I could clearly see that he was hard. 'OMG, {SIS_FRIEND},' I squealed, '{PLAYER} just came in here with a fucking hard-on!'"
+ [Keep reading]
+ [Stop reading] ->->
-
"'Shut up,' she laughed. 'What are you gonna do?'"
"'I can't do anything,' I giggled, 'because he's sleepwalking. You know you can't wake up a sleepwalker. Oh, he's climbing on the bed and pulling his cock out!'"
"'Well, you'd better suck him off before he wakes up,' she teased."
+ [Keep reading]
+ [Stop reading] ->->
-
"I didn't hesitate at all. It seemed obvious this was just what you have to do to help a sleepwalker with a boner. I rolled onto my stomach and wrapped my lips around his head. He groaned and started pushing into my mouth."
"With every thrust, I became more turned on by the situation. He kept growing longer and longer, until he was sliding down my throat. I moaned as he fucked my mouth faster and harder. I was lying on my hand, pressing on my clit, as I felt him start to cum."
"I woke up and had to rub one out while sucking on my fingers, imagining it was {PLAYER}'s cock."
->->

= diary_threesome
"Okay, my dreams are definitely going to get me in trouble one of these days. Last night I dreamed that {SIS_FRIEND} and {PLAYER} fucked me together."
"There was no background or reason for it. It was just happening. We were all in my my bed, naked and rolling around together. {PLAYER} was kissing {SIS_FRIEND} while I sucked on her tits. Then she was kissing me while {PLAYER} fingered her. She sat on his face while I sucked his cock. We moved together easily, languidly, drifting from position to position."
+ [Keep reading]
+ [Stop reading] ->->
-
"But the part of the dream that has stuck with me, the part I can't stop thinking about at odd moments, the part that distracts me in class… Oh my god, I'm getting flushed just thinking about it now."
"I was sandwiched between the two of them. {SIS_FRIEND} was lying on her back, and I was on top of her. She was wearing an enormous black strap-on, and I was slowly easing myself onto it. {PLAYER} was behind me, hands on my hips, encouraging me. His cock was inside {SIS_FRIEND}, but I knew where he wanted to go, as soon as I took the full length of {SIS_FRIEND}'s girlcock."
+ [Keep reading]
+ [Stop reading] ->->
-
"Sure enough, no sooner had I settled my thighs against her hips, gasping at the girth of the dildo spreading me open, I felt {PLAYER} positioning himself at my back door. Because it was a dream, there was no pain, no need to relax or go slow. He just slipped inside."
"I moaned and rocked back, taking them both as deep as I could. I felt incredible. They were filling me up. My insides seemed to ripple and clench and squeeze around them. I could feel every inch of them in me. And then they started moving. Slowly at first, and then with increasing urgency."
+ [Keep reading]
+ [Stop reading] ->->
-
"All the slow, languid, gentle lovemaking from earlier in the dream was gone. What we did now was animalistic. I felt claimed. {SIS_FRIEND} bit my lip and pinched my nipples, hard. {PLAYER} snarled in my ear, digging his fingers in my hip and fucking me like a beast from behind. They alternated thrusts, and all I could do was moan and cry and cum over and over around their relentless cocks."
"I woke up straddling my pillow, grinding and drooling. I didn't hesitate, reaching around from behind and pushing a finger deep in my ass, fucking myself to another orgasm. I had to wash all my sheets and the pillow."
->->

/*

    Retrieve Laptop from Sister
    If you take your laptop back while she's not in the room, you can discover her porn history.

*/
=== retrieve_laptop_from_sister ===
~ move(Laptop, SisBedroomItems, BedroomItems)
You pick up your laptop, brushing your finger across the trackpad. The screensaver turns off and you're surprised to see the browser open to an adult site. {SIS} must have been using your laptop to watch porn!
+ [Close the browser]
    You quickly close the browser. It's none of your business what porn she likes.
+ [Look at her history]
    ~ SisFacts += SisMightBeQueer
    ~ SisFacts += SawSisPorn
    You quickly skim through her watch history, and are surprised to find it's mostly girl-on-girl videos. The only videos with guys are threesomes with two girls and a guy. Is {SIS} a lesbian? Maybe she's just curious? You suddenly wonder just how close she and her friend {SIS_FRIEND} really are.
- ->->

/*

    Jerk Off with Sister’s Panties
    After finding a pair of her panties, you jerk off with them.

*/
=== use_sister_panties ===
~ last_girl = Sister
~ cum_today = true
~ Score += sisPanties
Heart pounding, you lift her panties to your face and take a deep breath. The scent of her pussy fills your nostrils, immediately flooding your body with lust. Urgently, you free your cock, squeezing it with one hand while holding her underwear against your nose with the other. It's not long until you are painfully erect, throbbing and twitching with need.
+ [Wrap them around your shaft]
-
Instinctively, you wrap her panties around your erection. The lace teases and stimulates as it brushes against the rim of your head. You start stroking, allowing the unfamiliar texture to caress the length of your shaft. The knowledge that what you're doing is wrong lends the moment a powerful intensity. Your cock throbs in your grip and you pump harder, faster, increasing the stimulation. A wet spot appears as some of your precum soaks through the fabric.
+ [Imagine her putting on cum-soaked panties]
-
The head of your cock strains against the gusset as you imagine her putting them on after you finish. The confusion on her face as your hot cum meets her sensitive skin. You picture her reaching down, dipping a finger into the cream and frowning as she inspects it. The surprise as she realizes what it is giving way to desire as she licks her finger clean. Her nipples instantly harden and she gasps, shoving a hand between her legs to desperately rub your spunk between her lips.
+ [Cum!]
-
The image takes you over the finish line and your thick white cum spurts again and again into her panties. You reluctantly unwrap them when the stimulation becomes overwhelming. The black lace fabric is a complete mess, smeared with a shocking amount of cum. You do your best to wipe it all up with a tissue, but it's hopeless. You make a note to hide them under some other clothes when you return them to her laundry basket. Maybe you'll get lucky and she won't notice.
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
~ SisFacts += SawSisNaked
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
=== dream_of_sister ===
You have {dream_of_cheerleader > 1:another|a} filthy dream about {SIS}. <>
{ shuffle:
- You sneak into the bathroom while she showers. She's unaware of your presence, with her back to the room as she rubs her clit under the spray of hot water. You quickly strip off your clothes and slip into the shower as quietly as you can. Your cock is alarmingly hard, swollen red and twitching. She squeals in surprise as you grab her by the hips and bury yourself in her dripping pussy with one thrust. She doesn't stop rubbing her clit as you start roughly fucking her from behind
- You feel your blanket lift as she climbs into your bed behind you. She mumbles something about being scared, and presses her body against your back. You are surprised to find that you're both naked, and her skin is burning hot against yours. Her stiff nipples press into your back as her hand closes around your erection. You roll onto your back and she moves to straddle you, until your cock is throbbing inside her tight pussy. She moans and starts rocking, squeezing her tits
- The two of you are sitting in the darkened living room watching a movie. She keeps nodding off, and eventually lays her head in your lap. It's not long until her proximity has you rock hard. You try to resist, but your cock seems to have a mind of its own, slipping out of your shorts to bob in front of her face. You groan as she opens her mouth to yawn, allowing you to push into the heat of her mouth. She makes a sleepy surprised sound and closes her lips around you. Is she still asleep? You can't tell and don't care, as you start rocking your hips to push deeper. She moans around you
- She and {SIS_FRIEND} and you are all naked and rubbing against each other. Their bodies writhe against yours. They kiss each other desperately, then both lower their heads to your cock. You can't tell whose mouth is whose, but as soon as you're hard, {SIS_FRIEND} moves {SIS} to sit on top of you, guiding your cock into the heat of your stepsister's pussy. {SIS_FRIEND} swings her leg to straddle your face, and you bury your tongue in her cunt as she starts kissing {SIS}. The three of you move as one
- The two of you are in the back seat of the family car on a long boring family trip. Your parents are talking in the front seat and paying no attention as {SIS} snuggles closer to you under a blanket. Her hand is in your lap, firmly rubbing and squeezing your cock through your shorts. She squirms and tries not to make a sound as you squeeze her nipples through her top. When you push your shorts down around your ankles, she doesn't hesitate, pulling the blanket over her head as she leans over to take your cock in her mouth. Soon, you're biting your lip as she sucks you deeper
}
<>{isDayWeekend(tomorrow()):, but just as you're about to cum, {SIS} pulls away, crying "We shouldn't be doing this!"|, when the noise of your alarm rudely shatters the dream.}
->->

/*

    Sister Hints

*/
=== sister_hints ===
{
- SisFacts ? SisIsInterested:
    You already know {SIS}'s into you! Just go talk to her.
- SisFacts ? ReadSisDiary:
    Try talking to {SIS} about the fantasies you read in her diary.
- SisFacts ? SawSisPorn:
    Try talking to {SIS} about the porn she watched on your laptop.
- else:
    Wait for {SIS} to borrow your laptop, or snoop around in her room, or peep on her in the shower.
}
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
    This function runs every morning, and has a 25% chance that she took your laptop.

*/
=== function sis_stole_laptop()
{ BedroomItems ? Laptop and chance(25):
    ~ move(Laptop, BedroomItems, SisBedroomItems)
    ~ SisFacts += SisSawYourPorn
}
