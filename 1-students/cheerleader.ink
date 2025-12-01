/*
    Cheerleader: Rosario
    Looks like Rosario Dawson: Puerto Rican, long wavy black hair, curvy build, huge tits, 36D(34DD), landing strip, 40-30-40
    Outfit: cheerleader outfit, black sports bra, black boyshort panties
    Likes flirty
    Dislikes sweet

       Weekdays     Saturday    Sunday
    --------------------------------------
    1: Study Hall - Bleachers / BraStore
    2: Health     - Field     / FoodCourt
    L: Cafeteria  - Field     / BraStore
    3: Gym        - Field     / ShoeStore
    4: Theater    - Bleachers / DressStore
    A: Bleachers  - Bleachers / ShoeStore
*/
CONST CHEERLEADER = "Rosario"
CONST CHEERLEADER_TITLE = "the cheerleader"
LIST CheerleaderState = CheerleaderObserved, CheerleaderRevenge, CheerleaderTitjob, CheerleaderQuest, CheerleaderReward, CheerleaderSex
VAR CheerleaderInPlay = true
VAR CheerleaderMood = Neutral
VAR CheerleaderBaseMood = Neutral
VAR CheerleaderCum = ()
VAR cheerleader_wearing_panties = true
VAR cheerleader_kneeling = false
VAR cheerleader_ready_to_cum = false
LIST CheerleaderItems = CheerleaderPanties

/*

    Talk to Cheerleader
    
*/
=== talk_to_cheerleader ===
{ cheerleader_is_cheering():
    {CHEERLEADER} is busy cheering for the football game, and can’t talk right now.
    ->->
}
~ last_girl = Cheerleader

// We adjust her reactions based on her mood and state (but not your confidence)
You {here == StudyHall:pass a note to|approach} {CHEERLEADER}
{
- CheerleaderMood == Hostile:
    “What the fuck do you want?” she snarls.
- CheerleaderState < CheerleaderObserved and observe_cheerleader < 2:
    <>, but her boyfriend {JOCK} laughs when he sees you{here != StudyHall: coming} and tells you to fuck off. ->->
- CheerleaderState < CheerleaderObserved and observe_cheerleader >= 2:
    <>, who regards you warily. The two of you have gone to school together for years, but you’ve never actually spoken to her like this. She isn’t sure what to expect. “What do you want?”{here == StudyHall: she writes back.}
- CheerleaderState == CheerleaderObserved or (CheerleaderState == CheerleaderRevenge and here != UnderBleachers):
    <>. She glances up at you briefly, but returns her attention to {JOCK}, who seems oblivious to the daggers she’s shooting at him.
- CheerleaderState == CheerleaderRevenge and here == UnderBleachers:
    <>, who looks up at you impatiently.
- CheerleaderState == CheerleaderTitjob:
    <>, who is{CheerleaderMood >= Friendly: cheerfully} ignoring {JOCK}. She{CheerleaderMood >= Friendly: grins| looks} at you. “What’s up?”{here == StudyHall: she writes back.}
- CheerleaderState == CheerleaderQuest:
    { has_black_eye:
        <>, who looks at your black eye with alarm. “Oh shit, did {JOCK} do that?”{here == StudyHall: she writes back.}
    - else:
        <>, who looks at you hopefully. “Did you get my stuff back from {JOCK}’s locker?”{here == StudyHall: she writes back.}
    }
- CheerleaderState == CheerleaderReward and here == UnderBleachers:
    <>, who{CheerleaderMood < Aroused: smiles at you| looks at you with hunger in her eyes}.
- CheerleaderState >= CheerleaderReward:
    <>, who {CheerleaderMood >= Aroused:winks|smiles} at you. “What’s up?”{here == StudyHall: she writes back.}
- else:
    <>. // this shouldn’t happen, but just to be safe.
}

// We adjust your options based on your confidence and her state (but not her mood)
- (cheerleader_opts)
* {confidence < Confident and can_ask_cheerleader_bra_size()}
    [“What’s your bra size?” (not confident enough) # CLASS: disabled]
    You’re not yet confident enough to ask such a personal question.
* {confidence < Confident and CheerleaderState < CheerleaderObserved}
    [“Want to go out with me?” (not confident enough) # CLASS: disabled]
    You don’t have the confidence yet to risk rejection.
+ {confidence >= Confident and can_ask_cheerleader_bra_size()}
    [“What’s your bra size?”]
    -> ask_cheerleader_bra_size ->
* {confidence >= Confident and CheerleaderState < CheerleaderObserved}
    [“Want to go out with me?”]
    -> ask_cheerleader_out ->
* {CheerleaderState == CheerleaderObserved}
    [“Your boyfriend’s a jerk.”]
    -> suggest_cheerleader_revenge ->
* {CheerleaderState == CheerleaderRevenge and here == UnderBleachers}
    [“Ready to make {JOCK} jealous?”]
    -> cheerleader_titjob ->
* {CheerleaderState == CheerleaderTitjob and here != UnderBleachers}
    [“How’d {JOCK} react?”]
    -> cheerleader_quest ->
* {Inventory ? CheerleaderPanties}
    [“Yeah, but I got your things.”]
    -> deliver_cheerleader_stuff ->
+ {CheerleaderState == CheerleaderReward and here == UnderBleachers}
    [Kiss her]
    You pull her into a kiss.
    TODO: kissing is too intimate
    -> cheerleader_sex ->
+ {CheerleaderState == CheerleaderSex and CheerleaderMood >= Aroused and newToday(-> cheerleader_sex) and not cheerleader_sex.upset_aftercare}
    [“What are you doing{isMall() or cheerleader_dtf(): right now| later}?”]
    -> cheerleader_repeat ->
+ {not seenVeryRecently(-> look_at_cheerleader)}
    [Check her out]
    -> look_at_cheerleader ->
+ [Leave conversation]
    ->->
- -> cheerleader_opts

/*

    Look at Cheerleader

*/
=== look_at_cheerleader ===
{CHEERLEADER} is one of the most attractive girls at school, and she knows it. Her Puerto Rican heritage gave her luscious brown skin, long wavy black hair, a curvy build, and large tits. {BraSizes ? Cheerleader: 36D, you remember.}
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
    TODO: only wear cheerleader outfit on game day
    { isSchool():
        She’s wearing sneakers and a yellow and white cheerleader outfit, exposing a bare midriff.
    - else:
        She’s wearing a low-cut pink top over a flowy floral print skirt with sandals. You notice the yellow straps of her bra, and wonder if her panties match. The weather isn’t quite warm enough for the outfit, which does little to conceal that her nipples are stiff.
    }
}
->->

/*

    Ask Cheerleader for Her Bra Size
    You’re conducting a survey.

*/
=== ask_cheerleader_bra_size ===
“What’s your bra size?”
{
- CheerleaderMood == Hostile:
    “Fuck off, creep!”
- CheerleaderMood == Neutral:
    “That’s a weird question to ask a girl you barely know, dude.”
    “Oh, sorry, I’m not trying to be a creep. I’m{confidence == Confident:, uh,|} conducting a survey for class.”
    “That sounds fake. I don’t believe you, and I’m not gonna tell you.”
- CheerleaderMood == Friendly:
    ~ BraSizes += (Cheerleader)
    “Wow, someone’s feeling bold!” she laughs. “Why do you want to know?”
    “I’m{confidence == Confident:, uh,|} conducting a survey for class.”
    “Alright. I wear a 36D.”
    “Sweet, thanks.” You write it down.
- CheerleaderMood >= Aroused:
    ~ BraSizes += (Cheerleader)
    “36D. But, if you wanna know for sure?” She licks her lips.
    -> cheerleader_invite() ->
}
{checkBraScore()}
->->

/*

    Cheerleader Invites You Under the Bleachers
    Shared between ask_cheerleader_bra_size, suggest_cheerleader_revenge, deliver_cheerleader_stuff, and cheerleader_repeat
    - oldState == CheerleaderObserved (just invited to titfuck)
    - oldState == CheerleaderQuest (just invited to fuck)
    - oldState == CheerleaderSex (just invited to repeat fuck)

*/
=== cheerleader_invite() ===
// Update state while saving old one for comparisons
~ temp oldState = CheerleaderState
{ CheerleaderState < CheerleaderRevenge:
    ~ CheerleaderState = CheerleaderRevenge
- else:
    ~ CheerleaderState = CheerleaderReward
}
{
- cheerleader_dtf(): // we know it’s after school on a weekday, so let’s go fuck under the bleachers
    <> “Come with me.{oldState == CheerleaderQuest: I want to show you how grateful I am.}”
    { oldState == CheerleaderObserved:
        “I’m right behind you.”
        Holy shit! You can’t believe that worked. Your heart pounds as you imagine what’s in store.
    }
    + [Follow her {UNDER_BLEACHERS}]
        ~ here = UnderBleachers
        ~ removePerson(Cheerleader)
        ~ UnderBleachersPeople += (Cheerleader)
        { oldState == CheerleaderObserved:
            You follow her {UNDER_BLEACHERS}.
            -> cheerleader_titjob -> field.under_bleachers
        - else:
            You follow her {UNDER_BLEACHERS}, where she pulls you into a kiss.
            TODO: kissing is too intimate
            -> cheerleader_sex -> field.under_bleachers
        }
- isMall(): // we know we’re at the mall, so let’s go fuck in a dressing room.
    <> “Come with me.{oldState == CheerleaderQuest: I want to show you how grateful I am.}”
    { oldState == CheerleaderObserved:
        “I’m right behind you.”
        Holy shit! You can’t believe that worked. Your heart pounds as you imagine what’s in store.
    }
    + [Follow her to the {DRESSING_ROOM}]
        ~ here = DressingRoom
        ~ removePerson(Cheerleader)
        ~ DressingRoomPeople += (Cheerleader)
        { oldState == CheerleaderObserved:
            You follow her to the {DRESSING_ROOM}.
            -> cheerleader_titjob -> mall.dressing_room
        - else:
            You follow her to the {DRESSING_ROOM}, where she pulls you into a kiss.
            TODO: kissing is too intimate
            -> cheerleader_sex -> mall.dressing_room
        }
- else: // we’re at school, but it’s not the right time, so we’ll meet later
    <> “Meet me {UNDER_BLEACHERS} in the {FIELD}{cheerleader_titjob: again} after school{oldState == CheerleaderQuest:, so I can show you how grateful I am}.”
    “See you there,” you reply.
    { oldState == CheerleaderObserved:
        Holy shit! You can’t believe that worked. Your heart pounds as you imagine what’s in store.
    }
}
->->

/*

    0. Ask Cheerleader Out
    This isn’t going to go well.

*/
=== ask_cheerleader_out ===
{confidence > Confident:Feeling supremely confident|Summoning all your courage}, you ask her out. “Hey, {confidence < Flirty:uh, }do you want to go out with me sometime{confidence < Flirty:, like on a date}?”
She looks {CheerleaderMood < Friendly:you up and down|up} and {CheerleaderMood < Friendly:scoffs. “Uh, no?|smiles sadly. “Sorry,} I’ve got a boyfriend.”
You feel foolish. Of course the hot cheerleader has a boyfriend.
->->

/*

    1. Observe Cheerleader
    a: see jock and cheerleader are a power couple, always together
    b: see jock flirting, cheerleader is upset
    c: see them fighting, jock says don’t be a bitch about this and moves away. This is your chance!

*/
=== observe_cheerleader ===
~ last_girl = Cheerleader
TODO: add location hints to observation
{ observe_cheerleader:
- 1:
    -> look_at_cheerleader ->
    She and {JOCK} are a power couple. They have the same class schedule. Even outside of school, they’re always together, either at football practice or the mall. They seem inseparable, which is not great for you, since there’s no way for you to approach {CHEERLEADER} without {JOCK} seeing. Maybe if you observe her somewhere else, you can learn more?
- 2: {CHEERLEADER} looks upset, and it’s not hard to see why. {JOCK} is shamelessly hitting on another girl. He’s flexing and showing off, and she’s laughing and touching his arm. {CHEERLEADER} is glaring at him, but he’s too distracted to notice. Maybe they’re not as inseparable as it seemed? Now that he’s distracted, you think you could probably talk to her without him noticing. Still, you’re not sure what you would even say to her. Maybe you should keep observing her instead?
- 3: Oh shit, things have come to a head between {CHEERLEADER} and {JOCK}. She confronted him about hitting on the other girl, and he just laughed and said, “Don’t be a bitch about this.” Her eyes flashed red, and she walked away from him. For a second, it looked like he might go after her, but instead he shrugged and made a joke to one of his friends about it being “that time of the month.”
    An idea forms in your head. Maybe she’s mad enough at him to fool around with you to make him jealous? Seems worth a shot. Time to work up the nerve to talk to her.
    ~ CheerleaderState = CheerleaderObserved
}
->->

/*

    2. Suggest Revenge to Cheerleader
    After observing she’s upset, you suggest a way for her to get back at her boyfriend.
    Mood: Neutral

*/
=== suggest_cheerleader_revenge ===
“You know, your boyfriend’s a real jerk.”
She scowls at you and starts to protest, then looks back at {JOCK} and frowns. “I guess he is.”
* “It’s not right, the way he’s treating you.”
    “Excuse me?”
    “I wouldn’t blame you if you wanted to make him feel the same way you feel. Maybe I could help you with that.”
* “If you were my girl, I’d treat you better.”
    “Excuse me?”
    “Just saying. Hitting on other girls in front of you like this? Guy doesn’t deserve you.”
* “I wouldn’t blame you if you wanted to get back at him.”
    “Excuse me?”
    “Just saying, if you wanted to make him jealous, I’d be happy to help.”
* “Wanna go somewhere and make him jealous?”
-
She seems startled by your uncharacteristic boldness, but after a moment, she nods. “You know what? Yeah. Fuck it.” Shooting one final glare at {JOCK}, she turns to you.
-> cheerleader_invite() ->->

/*

    3. Cheerleader Titjob
    After offering to help her get revenge, she takes photos of you cumming on her tits to make Jock jealous.
    Mood: Starts at Neutral, ends at Friendly (unless you cum in her mouth)

*/
=== cheerleader_titjob ===
~ CheerleaderState = CheerleaderTitjob
~ Score += cheerleaderTitjob
~ cum_today = true
“Are you ready to make {JOCK} jealous?”
TODO: move what she says to first paragraph
{CHEERLEADER} wastes no time with pleasantries. As soon as you arrive, she takes off her top and bra. You gawk at the sight of her bare breasts. “Hurry up,” she says, dropping to her knees in front of you. “Whip your dick out before someone finds us under here.”
Quickly, you unzip your jeans. You’re surprised by how motivated she is. Maybe she’s just nervous about getting caught, but you think it’s more than that. Behind the take-charge attitude, you think she’s just as nervous as you are. Heart pounding, and with no idea what’s going to happen next, you lower your boxers.
She wraps her hand around your cock and starts rubbing. She knows what she’s doing, and you quickly stiffen in her hand, until she’s stroking the full length of your shaft. “Don’t get too excited,” she warns, “I’m not gonna suck you off. You can put it between my tits and blow your load on my chest. That’ll be enough for me to take some pics to show {JOCK} what he’s missing.”
* [Nod gratefully]
    You nod gratefully, still struggling to believe your luck.
* “Great idea[.”],” you mumble, struggling to focus on anything other than her hand around your cock.
* “That’ll do for now[.”],” you reply {confidence >= Confident: confidently|with false confidence}.
    She frowns at your attitude, but keeps stroking your cock.
-
Her boobs look incredible. She has large dark nipples, already stiffening from the breeze. Your cock throbs with anticipation, imagining what it will feel like nestled between them.
Sensing your excitement, she grins confidently, spits on her hand, and pulls you to her chest. She squeezes her soft breasts around your throbbing cock, warm and welcoming. Slick with saliva, you push forward, sliding easily between her tits.
You both look down as the head of your cock emerges from her cleavage, glistening wetly. She inhales and squeezes her tits together, increasing the pressure as you begin to thrust. It feels great, and from the look in her eyes, she knows it.
“You like the way my tits feel around your cock?” she teases.
* “They’re awesome[!”],” you moan
* “You’re amazing[!”],” you groan
* “Oh my god[!”],” you groan
-
<>, eagerly fucking her cleavage. “This feels so fucking good.”
“You got hard really fast. Are you gonna cum for me?”
“Fuck yeah,” you gasp, realizing how quickly the pressure is building.
“That’s right,” she purrs, “because you know how lucky you are, to get to fuck my titties. Now, come on, cover me in your hot spunk. Do it!”
* (cum_on_chest)[Cum on her chest]
    ~ CheerleaderCum = Tits
    ~ improveMood(CheerleaderMood)
    ~ improveBaseMood(CheerleaderBaseMood)
    Her encouragement pushes you over the edge, and with one final thrust forward, the head of your cock juts up, twitching as thick ropes of white cream splatter her chest. She squeaks in surprise as the first shot hits her chin, but the rest fall across her heaving breasts. You moan as she helps squeeze the last drops out.
* (cum_on_face)[Cum on her face]
    ~ CheerleaderCum = Facial
    ~ improveMood(CheerleaderMood)
    ~ improveBaseMood(CheerleaderBaseMood)
    Her encouragement pushes you over the edge, and after one final thrust, you pull back and point your cock directly at her face. She squeaks in surprise as thick ropes of white cream splatter her cheeks, chin, and lips.
    “Come on, man,” she sputters, “I said cum on my tits, not my face.” But as your cum drips onto her chest, she shrugs. “I guess this still works.”
* (cum_in_mouth)[Cum in her mouth]
    ~ CheerleaderCum = Mouth
    Her encouragement pushes you over the edge, and after one final thrust, you shove your cock between her lips. She squeals in protest as it twitches repeatedly, flooding her mouth with your spunk. You groan and try to go deeper, but she pushes you away.
    “Fuck!” She sticks out her tongue, letting your cum drool onto her chest. “What the hell? I said cum on my tits!”
    “Sorry,” you shrug, “I guess I got a bit carried away.”
    “Well, lucky for you, this still works.”
-
Staggering back, you try to catch your breath as you watch her snap a bunch of selfies of her cum-splattered chest, all carefully cropped not to show her face.
“That’ll teach him,” she smirks. “Thanks for your help. You can go now.”
“Anytime,” you grin, zipping your pants and wondering how {JOCK} will react.
->->

/*

    4. Cheerleader Request
    After the titjob, she tells you they broke up, and asks you to get her things from his locker.
    Mood: Friendly (unless you came in her mouth)

*/
=== cheerleader_quest ===
~ CheerleaderState = CheerleaderQuest
~ JockState = JockDenial
“How’d {JOCK} react to the pictures we took?”
“Oh, he was a total ass about it. Said some awful shit. I dumped his ass. Speaking of, do you think you could do me a favor? Some of my stuff is in his locker, and I don’t want to deal with him right now. Could you get it for me?”
* “Sure, what’s the combination?”
* “What kind of stuff?”
    “Like, a bag and a jacket? Maybe some lipstick? Just grab anything that looks girly.”
    “Okay,” you nod, hoping this isn’t a big mistake. “What the locker combination?”
* “I dunno, he sounds pretty angry.[”] I don’t wanna get caught in the middle here.”
    “Please? You’d be doing me a big favor. I’d be really grateful.”
    “Fine,” you agree, hoping this isn’t a big mistake. “What the locker combination?”
-
“He set it to my measurements: 40-30-40.”
“That’s easy to remember, at least. I’ll come find you once I have your stuff.”
->->

/*

    5. Cheerleader’s Locker
    After she asks for your help, you recover her things from her ex’s locker, and have a fight with Jock

*/
=== cheerleader_locker ===
~ move(CheerleaderPanties, CheerleaderItems, Inventory)
Hoping {JOCK} doesn’t see, you quickly enter the combination and open his locker. Inside you find a cheerleading camp tote bag. You grab the things that are obviously {CHEERLEADER}’s including some lipstick, a girl’s jacket, and a pair of silky panties, and put them all in the tote bag.
* [Close the locker] -> jock_fight_1

/*

    Optional: Jerk Off with Cheerleader’s Panties
    After finding a pair of her panties in her ex’s locker, you jerk off with them.

*/
=== cheerleader_panties ===
~ last_girl = Cheerleader
~ cum_today = true
~ Score += cheerleaderPanties
Unable to resist the temptation, you wrap {CHEERLEADER}’s silky panties around your hard cock. You thrust and strain into the panties, savoring the delicious stimulation of the fabric. The head of your cock slips into the gusset, which is enough to push you over the edge, and you blow your load imagining her putting the wet panties on, feeling your hot cum on her lips.
Afterward, you feel awkward, and do your best to wipe up the mess before returning her panties to the tote bag.
->->

/*

    6. Deliver Cheerleader’s Stuff
    After returning her things from her ex’s locker, she sees your black eye, and says to meet her later for a reward.
    Mood: Starts at Friendly, ends at Aroused (or if you came in her mouth, starts at Friendly, ends at Aroused)

*/
=== deliver_cheerleader_stuff ===
~ last_girl = Cheerleader
~ move(CheerleaderPanties, Inventory, CheerleaderItems)
~ improveMood(CheerleaderMood)
~ improveBaseMood(CheerleaderBaseMood)
“Yeah. After I got your things from his locker, he jumped me.”
You pass her the bag, but she ignores it for a moment.
“I’m so sorry,” she winces, staring at the bruise around your eye. “I never thought he would react like this.”
* “It’s fine[.”],” you shrug, trying to play it cool. “He got in trouble, and I got your stuff. It all worked out.”
    “Well even so,” she smiles gratefully,
* “He said you guys never broke up.”
    “What? Ugh, he’s delusional, I could not have been more clear. Don’t worry, I’ll make sure he understands we’re done.” She smiles gratefully.
* “Do you think he knows it was me?”
    “I doubt it,” she considers. “You weren’t actually in the pics or anything. He probably just saw you in his locker and got mad.” she smiles gratefully, 
-
<> “Thanks for getting my stuff. I’m sorry you had to deal with that.”
She quickly rummages through the items in the bag, nodding at what you brought her. {cheerleader_panties: Then she picks up the panties you jerked off with. They look sticky, and there’s a noticeable cum stain. She frowns, and your heart skips a beat. “Ew, did {JOCK} jerk off with these? He’s such a creep, I should have broken up with him sooner.”|<>}
Turning her attention back to you, she bites her lip and {here == StudyHall:writes|says}
-> cheerleader_invite() ->->

/*

    7. Cheerleader Sex!
    After offering to reward you, you meet her under the bleachers again, and have sex.
    Mood: Starts at Aroused (or Friendly if you came in her mouth), base mood ends at Aroused (if not there already)
    If you take the time to make her cum, you can get her to Desperate, where she’ll do anything


*/
=== cheerleader_sex ===
{ CheerleaderMood:
- Desperate:
    <> She leans in with surprising urgency. You wrap your arms around her waist, pulling her closer. She squirms and grabs your ass as your hands move to her breasts. Her tongue pushes into your mouth as you shove her against the wall. Her hand is between your legs, grinding against your rapidly hardening cock. She almost seems to want you more than you want her.
- Aroused:
    <> She leans into you with surprising urgency. You wrap your arms around her waist, pulling her closer. She grabs your ass as your hands move to her breasts. Her tongue flicks against yours as you push her against the wall. She reaches between your legs, grinding her palm against your rapidly hardening cock. You’re astonished at how she seems to want you just as desperately as you want her.
- else:
    <> She leans in as you wrap your arms around her waist, pulling her closer. You slip your tongue between her lips and squeeze her breasts as you press her against the wall.
}
{ cheerleader_sex == 1:
    ~ Score += cheerleaderSex
    ~ improveConfidence()
    ~ JockState = JockFight
    ~ improveMoodTo(CheerleaderBaseMood, Aroused)
}
~ CheerleaderState = CheerleaderSex
After a minute, she pushes you away so she can remove her top and bra. Her tits are just as stunning as you remember. “I want {cheerleader_sex == 1:to show you how grateful I am|you},” she purrs. “Tell me what you need.”
- (cheerleader_sex_opts)
+ {newToday(-> cheerleader_sex.suck_tits)}
    “Will you let me suck on your tits?”
    -> suck_tits ->
+ {newToday(-> cheerleader_sex.finger)}
    “How can I make you feel good?”
    -> finger ->
+ {newToday(-> cheerleader_sex.eat_pussy) and CheerleaderMood >= Aroused}
    “Can I taste your pussy?”
    -> eat_pussy ->
+ {newToday(-> cheerleader_sex.titjob) and newToday(-> cheerleader_sex.blowjob)}
    “I want to fuck your tits again.”
    -> titjob ->
+ {newToday(-> cheerleader_sex.blowjob) and newToday(-> cheerleader_sex.titjob_to_blowjob) and newToday(-> cheerleader_sex.anal)}
    “Will you to go down me?”
    -> blowjob ->
+ {newToday(-> cheerleader_sex.pussy) and CheerleaderMood >= Aroused}
    “I need to fuck you.”
    -> pussy ->
+ {didToday(-> cheerleader_sex.pussy) and newToday(-> cheerleader_sex.anal) and CheerleaderMood == Desperate and cheerleader_sex > 1}
    “I’m gonna fuck your ass now.”
    -> anal ->
+ {cheerleader_ready_to_cum}
    [“Want me to cum on your tits again?”]
    -> climax_tits ->->
+ {cheerleader_ready_to_cum}
    [“I want to cum on your face this time.”]    
    -> climax_facial ->->
+ {cheerleader_ready_to_cum and newToday(-> cheerleader_sex.anal)}
    [“Can I cum in your mouth?”]
    -> climax_mouth ->->
+ {cheerleader_ready_to_cum and didToday(-> cheerleader_sex.pussy) and newToday(-> cheerleader_sex.anal)}
    [“I’m about to cum inside you!”]    
    -> climax_creampie ->->
+ {cheerleader_ready_to_cum and didToday(-> cheerleader_sex.anal)}
    [“I’m gonna cum in your ass!”]
    -> climax_anal ->->
- -> cheerleader_sex_opts

= suck_tits
“Of course,” she purrs{cheerleader_kneeling: as she gets to her feet}.
TODO: kissing is too intimate
{ CheerleaderMood:
- Desperate:
    She moans as you lower your head to pull a large nipple into your mouth. You flick your tongue against the erect nub, and she squirms, squeezing her thighs together. When you switch to the other side, she tangles her fingers in your hair, pushing your face into the soft flesh.
    “Harder,” she breathes, and you pull more of her breast into your mouth, swirling your tongue in tight, fast circles. “Bite it,” she begs, and when you trap her nipple between your teeth, she shudders with pleasure. After a few minutes, she pulls you up by the hair into a kiss, her hard nipples pressing against your chest.
- Aroused:
    She sighs approvingly as you lower your head to pull a large nipple into your mouth. You swirl your tongue around her areola, feeling it pucker and tighten. When you switch to the other side, she tangles her fingers in your hair, holding you against her soft flesh.
    “You can suck harder,” she whispers, and you pull more of her breast into your mouth, flicking your tongue in lazy circles. She starts to squirm a bit, squeezing her thighs together as you move back and forth, lavishing attention on her chest. After a few minutes, she pulls you up into a kiss, her hard nipples pressing against your chest.
- else:
    She bites her lip as you lower your head to pull a large nipple into your mouth. You swirl your tongue around her areola, feeling it pucker and harden. When you switch to the other side, she tangles her fingers in your hair, and pulls you back a little.
    “Not so rough,” she murmurs. Taking her lead, you slow down, swirling your tongue in lazy circles. As you move back and forth, paying attention to what she likes, you sense her begin to relax. After a few minutes, she pulls you up into a kiss, her hard nipples pressing against your chest.
}
~ cheerleader_kneeling = false
~ improveMood(CheerleaderMood)
->->

= finger
{ CheerleaderMood:
- Desperate:
“Give me your fingers,” she pants, thrusting your hand under her skirt. Desperately, she tugs her underwear to one side, and presses your fingers into her soft flesh. She’s dripping wet, and your fingers are quickly coated in her juices. She leans against the wall, pulling you into a kiss as you explore her folds. Before long, she’s rolling her hips to grind against your hand.
TODO: kissing is too intimate
“Go inside,” she begs. “Use two fingers.” You slip your middle fingers between her lips, and press upward, effortlessly burying them deep inside. Pressing your palm against her clit, you start fucking her. “Yes, just like that.” You fuck her eagerly, until she stifles a squeak and her wetness is dripping from your knuckles.
- Aroused:
“Like this,” she whispers, guiding your hand under her skirt. You feel her pull her underwear to one side, then press your fingers into her soft flesh. You’re surprised to discover she’s already wet. Holding her hand over yours, she shows you how to touch her. Before long, your fingers are slick with her juices.
“Now go inside,” she murmurs. You slip your middle fingertip between her lips and press upward. She exhales as you slip into her tight heat. When you’ve buried yourself fully, she rocks her hips, encouraging you to move with her. “Curl your finger,” she breathes, “like you’re telling someone to come closer.” You follow her lead, and it feels like her insides are squeezing you rhythmically.
- else:
“Give me your hand,” she whispers, guiding you under her skirt. You feel her pull her underwear to one side, then press your fingers into her soft flesh. Holding her hand over yours, she shows you how to touch her. When you part her lips and find the wetness hiding inside, she exhales with satisfaction and leans back against the wall.
“That’s it. Get your finger wet,” she instructs, “and slowly go inside.” You ease your fingertip between her lips and gently press upward. She tenses and exhales as you work your middle finger into her tight heat. When you’ve buried yourself fully, she begins rocking her hips, encouraging you to move with her.
“Good, good,” she murmurs. “Now start curling your finger like you’re telling someone to come closer.” You follow her lead, and it feels like her insides are squeezing you rhythmically.
}
+ [Faster]
    You move your fingers faster and faster.
+ [Harder]
    You thrust your fingers into her urgently.
+ [Deeper]
    You push further, trying to reach deeper inside.
-
Soon, she’s digging her fingernails into your shoulder as her body tenses.
{ CheerleaderMood:
- Desperate:
“Now,” she gasps, “rub my clit!” You pull out and switch your focus to rubbing tight, fast circles around her sensitive bud. Almost immediately, she shudders, and you feel a gush of warm fluid wash over your fingers. She buries her face in your shoulder to stifle a scream.
After a long minute, she shivers and pushes you away, looking at you with lust-clouded eyes, and gasping for breath.
- Aroused:
“I’m close,” she gasps, “rub my clit.” You pull out and drag your finger over her sensitive bud. She shivers and breathes the word “circles.” Tracing slowly around her clit, you watch her, matching your pace to her breathing, which is gradually getting faster. Suddenly, she buries her face in your shoulder to stifle a moan.
After a long minute, she shivers and pushes you away, still breathing heavily.
“You’re good at that,” she whispers.
- else:
“That’s really good,” she gasps. “You might make me cum if you rub my clit.” She shivers as you slip your finger out and jumps when you drag it over her sensitive bud. “Careful,” she hisses. “Don’t rub it directly, make little circles.” You do as she says and watch as her breathing starts to quicken. Her legs tense, and she’s got her eyes closed, focused on your efforts to give her an orgasm. Suddenly, she pushes your hand away, burying her face in your shoulder to stifle a moan.
After a long minute, she raises her head, still breathing heavily.
“You’re not bad at that,” she whispers.
}
~ cheerleader_kneeling = false
~ improveMood(CheerleaderMood)
->->

= eat_pussy
“Oh fuck, yes,” she pants,{cheerleader_kneeling: getting to her feet and} leaning back against the wall. You watch as she hitches her skirt up around her waist{cheerleader_wearing_panties:, slips off her underwear,} and spreads her legs. Getting to your knees, you savor the sight of her pussy, already dripping with need. She has a neatly trimmed landing strip that guides your eyes downward. Her lips are darker than her brown skin, almost black, but as you spread them with your fingers, you see the secret pink inside. She watches with wide eyes as you lean in closer to inhale the scent of her arousal.
When you finally run your tongue the length of her slit, she has to bite her knuckle to keep from making any noise. You trace her folds with your tongue, exploring every part of her. She jumps when you tease around her clit, and gasps when you plunge your tongue between her lips. The taste of her cream coats your tongue, until her flavor is the only thing you’re aware of.
You lick and kiss and suck until she’s gasping for breath, with her fingers tangled in your hair. She bucks her hips, grinding against your face, as you push deeper inside. You grab her ass and swivel your head, teasing her clit with your nose while lapping the juices from her pussy with abandon.
+ [Suck on her clit]
Her breathing is getting faster and shallower when you shift position to close your lips around her clit. The sensitive little bud is swollen and stiff. You flick your tongue in tight, controlled circles, getting closer each time, until you’re licking it directly. She squeaks in surprise, and you feel a sudden gush of warm fluid wash over your chin.
+ [Slip your thumb into her pussy]
Her breathing is getting faster and shallower when you move your hand to slip a thumb into her pussy. She squeaks in surprise, then pushes down against you, desperate for more. The two of you fall into a rhythm, her back against the wall, rocking in place, riding your face. You feel her insides clenching around the intruding thickness of your thumb, and a sudden gush of warm fluid floods your mouth and drips from your chin.
+ [Slip a finger into her ass]
Her breathing is getting faster and shallower when you shift your hand to allow the tip of your pinky finger to rest against her back door. She squeaks in surprise but doesn’t pull away as you slowly push inward. Her wetness has coated everything, and your finger slips easily inside, up to the second knuckle.
The two of you fall into a rhythm, her back against the wall, rocking in place, riding your face. Her insides clench around your intruding finger, and a sudden gush of warm fluid floods your mouth and drips from your chin.
-
She pushes you away, clamps a hand between her legs and squeezes her thighs together. You watch as she pants for breath, rocking in place as the climax rolls through her body. You can still taste her on your tongue, and your cock throbs in your pants, desperate for attention.
~ cheerleader_kneeling = false
~ cheerleader_wearing_panties = false
~ improveMood(CheerleaderMood)
->->

= titjob
“You want more, huh?” she grins. “I’m not surprised.” She {cheerleader_kneeling:squeezes her tits|drops to her knees} as you unzip your jeans and get your cock out, already swelling to life. She spits on her hand and starts vigorously massaging you until she’s stroking up and down the full length of your shaft. {cheerleader_titjob.cum_in_mouth:“But this time, don’t cum in my mouth without asking first.”}
You watch eagerly as she nestles your throbbing erection between her tits, then squeezes them around you. You moan and rock your hips forward, thrusting into her cleavage, until the tip protrudes, then pulling back into the soft warmth. She grins at the sight as you start moving, your cock peeking out and disappearing like a shy rabbit peeking out of its burrow.
~ cheerleader_kneeling = true
~ cheerleader_ready_to_cum = true
{CheerleaderMood >= Aroused and newToday(-> cheerleader_sex.anal): -> titjob_to_blowjob}
->->

= titjob_to_blowjob
This time, she surprises you by moaning softly with each thrust. She keeps licking her lips and looking up and you, and then back down at your cock. “Do you want to try something?” she whispers, with hunger in her eyes.
+ [Say yes]
+ [Not now] ->->
-
You nod, and she lowers her head, pursing her lips as you thrust upward to meet them. The sight of her trying to kiss your cock as it emerges from her tits makes your heart pound. On the next thrust, she bobs down further to meet you. This time, the head of your cock just barely slips between her lips. You feel her tongue flick against the tip.
You keep going, the head of your cock emerging from the soft embrace of her tits to slip into the warm heat of her mouth. With each thrust, she encourages you to go further, until she finally releases her breasts entirely, and pulls you fully into her mouth.
-> fully_in_mouth

= blowjob
“I’d be happy to,” she purrs, {cheerleader_kneeling:squeezing her tits|dropping to her knees} as you unzip your jeans. Your cock is already swelling to life when you pull it out, and she licks her lips at the sight. {cheerleader_titjob.cum_in_mouth:“But this time, don’t cum in my mouth without asking first.”}
She wraps her hand around your shaft, stroking as she kisses and licks all over. You find the sight of your cock growing in her hand unbearably erotic, and gasp as she finally pulls you fully into her mouth.
- (fully_in_mouth)
You can’t believe {CHEERLEADER} is giving you a blowjob! The heat of her mouth feels incredible. She swirls her tongue along the ridge of your head and squeezes her hand around the base of your shaft.You groan as she bobs her head up and down, pulling you deeper, then sucking hard as she rocks back.
TODO: options sound too aggressive
+ [Hold her head]
You put your hand on top of her head, running your fingers through her hair. Wrapping your hand around the back of her head, you encourage her to go a little deeper. {CheerleaderMood >= Aroused: She moans happily and follows your guidance, until your cock is bumping the back of her throat.|She swats your hand away, but continues bobbing her head, taking you a bit deeper each time, until your cock is bumping the back of her throat.} 
+ [Push deeper]
The feeling is incredible, but you want more. Without meaning to, you find yourself rocking forward to meet her each time, trying to push deeper. {CheerleaderMood >= Aroused: She moans and angles her head to allow you to slip further. You feel a moment of pressure as you bump the back of her mouth and then slip into her throat. She tenses, and struggles not to gag, but holds you in her throat for a long moment before finally backing away.|She digs her fingernails into your thigh as a warning, and you slow down, letting her set the pace. She manages to take you a little deeper each time, until your cock is bumping the back of her throat.}
+ [Fuck her mouth]
The feeling is incredible, but you want more. You start rocking forward to meet her each time, increasing the pace until you’re thrusting desperately into her mouth. {CheerleaderMood >= Aroused: She moans and reaches around to cup your ass, pulling you forward and encouraging you to fuck her mouth. Her eyes water as she looks up at you, trying not to gag.|She protests wordlessly around your shaft, digging her fingernails into your thigh until you slow down and let her set the pace. Soon, she’s got her hands on your ass, pulling you into her mouth repeatedly.}
-
You feel a familiar swelling sensation deep inside, and know your climax is rapidly approaching. She seems to sense it, and redoubles her efforts. {CheerleaderMood >= Aroused: To your surprise, she suddenly reaches under her skirt, and you realize she’s rubbing her clit while sucking you off. The feeling of her moaning around your cock while she masturbates is almost enough to set you off.}
~ cheerleader_kneeling = true
~ cheerleader_ready_to_cum = true
~ improveMood(CheerleaderMood)
->->

= pussy
TODO: kissing is too intimate
She{cheerleader_kneeling: stands up,} pulls you into a brief, intense kiss, then turns to face the wall. You watch as she hitches her skirt above her waist{cheerleader_wearing_panties:, slips off her underwear,} and spreads her legs for you. Your heartbeat pounds in your ears as you realize that {CHEERLEADER} wants this as much as you do. Your cock throbs and twitches as you let your pants slip around your knees and step into position behind her.
You rub the head of your cock between her wet lips as she looks back at you in anticipation. You both exhale as your cock pushes in, her insides squeezing tight around you as you enter. When you finally are fully inside, the sensation is nearly overwhelming. Her pussy is hot and soft and tight and wet. She closes her eyes and rests her head on the wall for a moment as you both get used to the sensation.
Slowly, you pull out and push back in. She clamps a hand over her mouth to keep from making noise as you begin to slowly fuck her from behind. You have your hands on her hips, pulling her back to meet you on every thrust. What started slow and gentle quickly increases in intensity, until she’s gasping every time your cock pushes back inside.
TODO options sound too aggressive
+ [Grab her tits]
    ~ improveMood(CheerleaderMood)
    Without slowing down, you reach forward to grab her breasts. They’re swaying with each thrust, and when you grip them firmly, she moans and pushes back against you. Trapping her nipples between your fingers, you squeeze them in time with your fucking.
+ [Fuck her harder]
    ~ improveMood(CheerleaderMood)
    You can’t believe how good her pussy feels. You dig your fingers into her hips until she squeals and fuck her harder and faster. She’s grunting and pushing back against you with every thrust, and the wet slapping sound seems to echo in the small space.
+ [Pull her hair]
    Without thinking about it, you reach forward and grab her hair in a fist, pulling back with each thrust. {CheerleaderMood == Desperate: She gasps and arches her back as you tug on her hair like a handle, fucking her roughly.|She gasps and swats your hand until you let go.}
+ [Slap her ass]
    With every thrust, her big ass jiggles, and you can’t resist giving her a little slap. {CheerleaderMood == Desperate: When she doesn’t protest, you slap her a little harder. This time, she squeaks in surprise, and pushes back against you.|She squeaks in protest and glares over her shoulder at you.}
-
You feel your cock swelling and her pussy clenching around you. She bites her lip to keep from crying out as you thrust deeper, feeling your climax approaching.
~ cheerleader_kneeling = false
~ cheerleader_wearing_panties = false
~ cheerleader_ready_to_cum = true
->->

= anal
“Wait, I’m not ready,” she gasps{cheerleader_kneeling:, standing up and facing the wall}. “Use a finger first.”
Wasting no time, you rub your finger between her lips, coat it in her juices, then push the tip against her tightly puckered hole.
“Slowly!” she squeals. “Ease it in.”
+ [Gently slip your finger in]
+ [Shove your finger in]
    You’re too excited to take it slow, and shove your finger roughly into her asshole. She squeals and jumps away from you, holding her ass.
    -> upset_aftercare
-
You slow down, allowing your finger to slip inside bit by bit. Soon, she’s moaning with each thrust, pushing back against you with your cock in her pussy and your finger in her ass.
“Oh fuck,” she groans. “That feels really good.”
“Are you ready?” you ask, breathless with anticipation.
“I think so,” she says, hesitantly. “Go really, really slow.”
She shudders as you pull out your finger and rest the tip of your cock against her ass.
+ [Slow and easy]
+ [Hard and fast]
    You can’t bear to wait any longer, and thrust hard. For a brief moment, you feel the tight heat of her ass around your cock head, then she squeals in pain and jumps away from you, holding her ass.
    -> upset_aftercare
-
You push forward, pressing the head against her. She breathes slowly, trying to relax as her opening slowly parts around you. It’s incredibly tight, and the first couple tries, you actually pop out, but on the third try, your head suddenly slips inside.
“Stop!” she gasps. “Just stop for a minute.”
You keep a reassuring grip on her hips, feeling your heartbeat throb in the tight grip of her ass. You’re desperate to push further, but you wait.
“Okay,” she finally breathes. “Try going deeper, still nice and slow.”
+ [Ease your cock deeper]
+ [Bury your cock in her ass]
    In one rough thrust, you bury your cock deep in her ass. For a brief moment, you feel the tight heat of her ass envelop you, then she squeals in pain and jumps away from you, holding her ass.
    -> upset_aftercare
-
You watch in awe as your cock, slick with her juices, slowly slides into her ass. Once the head was in, everything was easier. She’s panting, and your cock is throbbing in the heat of her rear. Finally, you come to rest with your hips pressed against her butt, the entire length of your shaft buried inside.
“Please, {CHEERLEADER}, can I start moving?” you ask through gritted teeth, straining with the effort to hold back.
“Fuck me,” she moans.
+ [Fuck her slow]
    Slowly, you slide out and then push back in. She groans every time you pull out, and gasps every time you go deeper. Gradually, as she starts sounding more into it, you increase the pace, until she’s biting her knuckle to keep from making too much noise and pushing back to meet you on every thrust.
+ [Fuck her hard]
    Unable to wait any longer, you pull out and slam your cock roughly into her ass again. She clamps a hand over her mouth as you start vigorously fucking her ass, pushing back to meet you on every thrust.
+ [Fuck her deep]
    Slowly, you ease out and then push back deep into her ass. She gasps and rocks back to meet you. Quickly you fall into a rhythm, each stroke ending deep inside, until she has a hand clamped over her mouth to keep from making noise, and is pushing back to meet you on every thrust.
-
You feel your cock swelling and her ass squeezing around you. She has one hand between her legs, rubbing tight circles around her clit. She bites her lip to keep from crying out as you thrust deeper, feeling your climax approaching.
~ cheerleader_kneeling = false
~ cheerleader_wearing_panties = false
~ cheerleader_ready_to_cum = true
->->

= climax_denied_opts
+ [Cum on her tits] -> cum_on_tits
+ [Cum on her face] -> cum_on_face
+ [Cum in her mouth] -> cum_in_mouth

= climax_tits
“Want me to cum on your tits again?” you groan as you reach your limit.
“Yeah!” {CHEERLEADER}{not cheerleader_kneeling: drops to her knees and} squeezes her tits together for you. {CheerleaderMood == Desperate: She’s gasping for breath and seems desperate for your cum.} “Cum all over me, {PLAYER}.”
- (cum_on_tits)
You stroke your cock{pussy:, slick with her juices,} and aim it at her chest. The pulsing sensation grows behind your balls until your cock starts twitching. Thick white ropes of cum shoot out with surprising force, the first hitting her chin, and the rest falling across her tits. {CheerleaderMood == Desperate: She moans happily, massaging your cum into her skin and licking her fingers clean.|She sighs happily, squeezing her nipples as your cum drips off her tits.}
~ cum_today = true
~ CheerleaderCum = Tits
+ [Catch your breath] -> aftercare

= climax_facial
“I want to cum on your face this time,” you groan as you reach your limit.
{ CheerleaderMood == Desperate:
    “Yes!” {CHEERLEADER}{not cheerleader_kneeling: drops to her knees and} looks up at you. She’s gasping for breath and seems desperate for your cum. “Cum for me, {PLAYER}.”
- else:
    “Not my face,” {CHEERLEADER} whispers as she {not cheerleader_kneeling: drops to her knees and} squeezes her tits together for you. “Shoot your load on my tits, {PLAYER}.”
    -> climax_denied_opts
}
- (cum_on_face)
{CheerleaderMood < Desperate: Ignoring her protests, y|Y}ou aim your cock at her face while you stroke yourself to completion. Quickly, the pulsing sensation grows until your cock twitches and thick white ropes of cum shoot out. The first splatters across her nose and eye, and the rest fall across her cheek and lips. {CheerleaderMood == Desperate:She moans happily, licking your cum from her lips.|She sputters in annoyance and wipes your cum away from her eye.}
~ cum_today = true
~ CheerleaderCum = Facial
{ CheerleaderMood < Desperate:
    + [Catch your breath] -> upset_aftercare
- else:
    + [Catch your breath] -> aftercare
}

= climax_mouth
“Can I cum in your mouth?”
{ CheerleaderMood == Desperate:
    “Yes!” {CHEERLEADER}{not cheerleader_kneeling: drops to her knees and} opens wide for you. She’s gasping for breath and seems desperate for your cum. “Cum for me, {PLAYER}.”
- else:
    “Not my mouth,” {CHEERLEADER} whispers as she {not cheerleader_kneeling: drops to her knees and} squeezes her tits together for you. “Shoot your load on my tits, {PLAYER}.”
    -> climax_denied_opts
}
- (cum_in_mouth)
{CheerleaderMood == Desperate:
    You feed her your cock, and she wraps her lips around the head. You feel her tongue swirling and your cock starts twitching, pumping your thick cum into the heat of her mouth. She moans happily, bobbing her head and swallowing it all. When you finally stagger away, one last spurt frosts her lips.
- else:
    Ignoring her protests, you shove your already twitching cock between her lips. The heat of her mouth pushes you over the edge, and your first spurt hits the back of her throat. She chokes and pulls away sputtering, the following shots landing on her lips and chin.
}
~ cum_today = true
~ CheerleaderCum = Mouth
{ CheerleaderMood < Desperate:
    + [Catch your breath] -> upset_aftercare
- else:
    + [Catch your breath] -> aftercare
}

= climax_creampie
“I’m about to cum inside you!” you groan.
{ CheerleaderMood == Desperate:
    “Oh yes!” {CHEERLEADER} begs, gasping for breath and pushing back against you. “Cum for me, {PLAYER}.”
- else:
    “No, don’t!” {CHEERLEADER} whispers as she {not cheerleader_kneeling: drops to her knees and} squeezes her tits together for you. “Shoot your load on my tits, {PLAYER}.”
    -> climax_denied_opts
}
- (cum_in_pussy)
Feeling the familiar pulsing deep inside, you thrust your cock deep inside. She moans as you grip her hips, holding her firmly against you as your cock starts twitching, pumping your cum into her pussy. The two of you rock together, moving in sync, as each throb of your cock causes her to clench around you. At last, satiated, you stagger back, one last spurt coating her pussy lips.
~ cum_today = true
~ CheerleaderCum = Creampie
+ [Catch your breath] -> aftercare

= climax_anal
“I’m gonna cum in your ass!” you groan.
{CHEERLEADER} moans desperately. She can only press back against you, begging wordlessly for your cum.
Feeling the pressure build, you thrust your cock deep inside. She gasps as you grip her hips, holding her firmly against you as your cock starts twitching, pumping your cum into her ass. The two of you rock together, moving in sync with each throb of your cock. At last, satiated, you stagger back, one last spurt landing between her cheeks.
~ cum_today = true
~ CheerleaderCum = Anal
+ [Catch your breath] -> aftercare

= upset_aftercare
“What the fuck, {PLAYER}?” She glares at you. “I told you to {seenVeryRecently(-> anal):go slow|cum on my chest}!”
“Sorry,” you shrug casually as you pull up your pants. “I couldn’t resist
{
- seenVeryRecently(-> cum_in_mouth):
    <> cumming in your mouth{cheerleader_titjob.cum_in_mouth: again}.”
- seenVeryRecently(-> cum_on_face):
    <> seeing my cum on your face{cheerleader_titjob.cum_on_face: again}.”
- else:
    <>.”
}
“Man, I thought you were different, but that was a real dick move.” She shakes her head. “{CheerleaderCum ? Mouth or CheerleaderCum ? Facial:Now I have to clean this up. }You should get out of here before someone notices us.”
You scored with {CHEERLEADER}, but even through a post-orgasmic haze, you can tell you fucked up any chance you had to hook up with her in the future.
~ CheerleaderMood = Hostile
~ CheerleaderBaseMood = Neutral
TODO: exit the area
{ isMall():
    + [Leave] -> mall.dressing_room
- else:
    + [Leave] -> field.under_bleachers
}

= aftercare
“Holy shit,” you murmur, gasping for breath, “that was incredible.”
{ cheerleader_sex == 1:
    “I’m glad,” she grins. “Let me know if you want to do it again sometime.”
- else:
    “Anytime,” she grins.
}
You pull up your pants and watch as she starts wiping up your cum.
“Go on,” she whispers. “I need to clean up. You should get out of here before someone notices us.”
TODO exit the area
{ isMall():
    + [Leave] -> mall.dressing_room
- else:
    + [Leave] -> field.under_bleachers
}

/*

    8. Cheerleader Repeat Performance
    After you’ve had sex the first time, you can ask her for a repeat performance.

*/
=== cheerleader_repeat ===
“What are you doing{isMall() or cheerleader_dtf(): right now| later}?”
“You{isMall() or cheerleader_dtf():,|, hopefully,}” she grins.
-> cheerleader_invite() ->->

/*

    Cheerleader Dreams

*/
=== dream_of_cheerleader ===
You have {dream_of_cheerleader > 1:another|a} filthy dream about {CHEERLEADER}. <>
{ shuffle:
- You have your cock nestled between her tits, and she’s begging you to finish, to blow your load all over her. She wants it. She wants you to cum so badly. You can feel your climax approaching, and you point her cock at her face
- You are sitting in the back seat of a car, and her hand is in your pants, firmly rubbing your throbbing cock. She’s topless and urging you to suck on her nipples. You gasp and groan as she strokes you with increasing urgency
- You have joined the cheerleading squad, and she’s practicing an implausible acrobatic move where you throw her in the air and catch her on your face. She lands with her thighs wrapped around your head, your nose pressed into her panties. She squirms as you struggle for breath, grinding against you, until she throws back her head, moaning in pleasure
- You’re taking a test that you haven’t studied for, and to make matters worse, there weren’t enough chairs for everyone, so the teacher told {CHEERLEADER} to sit in your lap. It’s difficult to concentrate because she’s squirming against your erection, moaning filthy nonsense in your ear. You finally abandon the test, grabbing her hips to grind her against you
- You’ve somehow arrived at school without noticing that you’re completely naked. You run desperately through the halls, trying and failing to cover your impossibly hard erection. {CHEERLEADER} suddenly comes through a door, and you collide, falling to the ground between her legs. Her tits have popped out of her top and your cock is slipping between her impossibly wet lips
- It’s halftime at the football game, and all the other cheerleaders are giggling and laughing as you take your place on the field, kneeling behind {CHEERLEADER}, who’s on her hands and knees. You flip her skirt up, revealing her bare pussy, and as the whistle blows, you push inside her, thrusting urgently as the opposing team runs to tackle you
}
<>{isDayWeekend(tomorrow()):, but before you can cum you wake up tangled in your sheets.|, when she opens her mouth and starts making a strange noise that you eventually recognize as your alarm.}
->->

/*

    Cheerleader Hints

*/
=== cheerleader_hints ===
{ CheerleaderState:
- CheerleaderObserved:
    Seems like {CHEERLEADER} is mad at {JOCK} for hitting on other girls. You could offer to help make him jealous?
- CheerleaderRevenge:
    You suggested to {CHEERLEADER} that you could help her make {JOCK} jealous. She said to meet her {UNDER_BLEACHERS} after school.
- CheerleaderTitjob:
    You came all over {CHEERLEADER}’s tits, and she sent the photos to {JOCK} to make him jealous. Try asking her how it went.
- CheerleaderQuest:
    { Inventory !? CheerleaderPanties:
        {CHEERLEADER} dumped {JOCK} because he said some horrible things after seeing the photos of someone else’s cum on her tits. Now she wants you to get her things from {JOCK}’s locker.
    - else:
        You retrieved {CHEERLEADER}’s things from her locker. Now you should give them back to her.
    }
- CheerleaderReward:
    You returned {CHEERLEADER} things from {JOCK}’s locker. Now she wants to reward you {UNDER_BLEACHERS} after school.
- CheerleaderSex:
    You’ve completed {CHEERLEADER}’s story{not cheerleader_sex.upset_aftercare:, but you can ask her for a repeat performance any time}.
- else:
    {observe_cheerleader:Keep|Try} observing {CHEERLEADER}.
}
->->

/*

    Clean up any cum on Cheerleader
    Run this whenever leaving the bleachers or dressing room if the Cheerleader is there.

*/
=== cheerleader_cleanup ===
~ CheerleaderCum = ()
~ cheerleader_wearing_panties = true
~ cheerleader_kneeling = false
~ cheerleader_ready_to_cum = false
->->

/*

    Check if Cheerleader can fuck right now (only after school on weekdays)
    After I wrote this, I updated things so she can fuck at the mall, too, but I don’t want to update all the logic in cheerleader_invite, which was kind of a pain to test, with all the possible combinations.

*/
=== function cheerleader_dtf()
~ return (isWeekday() && now == AfterSchool) or (today == Saturday)

/*

    Check if Cheerleader is busy cheering at a football game.

*/
=== function cheerleader_is_cheering()
~ return today == Saturday and (now == Period2 or now == Lunch or now == Period3)

/*

    Check if it’s appropriate to ask Cheerleader her bra size
    Only if you have the quest, don’t already know the answer, haven’t asked recently, and you didn’t just fuck her.

*/
=== function can_ask_cheerleader_bra_size()
~ return FriendState == FriendQuest and BraSizes !? Cheerleader and not seenVeryRecently(-> ask_cheerleader_bra_size) and not seenVeryRecently(-> cheerleader_titjob) and not seenVeryRecently(-> cheerleader_sex)
