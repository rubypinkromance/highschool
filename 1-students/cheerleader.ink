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
LIST CheerleaderState = CheerleaderObserved, CheerleaderRevenge, CheerleaderTitjob, CheerleaderQuest, (CheerleaderReward), CheerleaderSex
VAR CheerleaderInPlay = true
VAR CheerleaderMood = Aroused
VAR CheerleaderBaseMood = Neutral
VAR CheerleaderCum = ()
LIST CheerleaderItems = CheerleaderPanties

/*

    Talk to Cheerleader
    
*/
=== talk_to_cheerleader ===
~ last_girl = Cheerleader

// We adjust her reactions based on her mood and state (but not your confidence)
You approach {CHEERLEADER}
{
- CheerleaderState < CheerleaderObserved and observe_cheerleader < 2:
    <>, but {JOCK} laughs when he sees you coming and tells you to fuck off. ->->
- CheerleaderState < CheerleaderObserved and observe_cheerleader >= 2:
    <>, who regards you warily. The two of you have gone to school together for years, but you’ve never actually spoken to her like this. She isn’t sure what to expect. “What do you want?”
- CheerleaderState == CheerleaderObserved or (CheerleaderState == CheerleaderRevenge and here != UnderBleachers):
    <>. She glances up at you briefly, but returns her attention to {JOCK}, who seems oblivious to the daggers she’s shooting at him.
- CheerleaderState == CheerleaderRevenge and here == UnderBleachers:
    <>, who looks up at you impatiently.
- CheerleaderState == CheerleaderTitjob:
    <>, who is{CheerleaderMood >= Friendly: cheerfully} ignoring {JOCK}. She{CheerleaderMood >= Friendly: grins| looks} at you. “What’s up?”
- CheerleaderState == CheerleaderQuest:
    { has_black_eye:
        <>, who looks at your black eye with alarm. “Oh shit, did {JOCK} do that?”
    - else:
        <>, who looks at you hopefully. “Did you get my stuff back from {JOCK}’s locker?”
    }
- CheerleaderState == CheerleaderReward and here == UnderBleachers:
    <>, who{CheerleaderMood < Aroused: smiles at you| looks at you with hunger in her eyes}.
- CheerleaderState >= CheerleaderReward:
    <>, who smiles at you. “What’s up?”
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
    [“I got your things.”]
    -> deliver_cheerleader_stuff ->
+ {CheerleaderState == CheerleaderReward and here == UnderBleachers}
    [Kiss her]
    You pull her into a kiss.
    -> cheerleader_sex ->
+ {CheerleaderState == CheerleaderSex and newToday(-> cheerleader_sex)}
    [“What are you doing{isMall() or cheerleader_dtf(): right now| later}?”]
    -> cheerleader_repeat ->
+ [Check her out]
    -> look_at_cheerleader ->
+ [Leave]
    ->->
- -> cheerleader_opts

/*

    Look at Cheerleader

*/
=== look_at_cheerleader ===
{CHEERLEADER} is one of the most attractive girls at school, and she knows it. Her Puero Rican heritage gave her luscious brown skin, long wavy black hair, a curvy build, and large tits. {BraSizes ? Cheerleader: 36D, you remember.}
{ CheerleaderCum:
- Anal:
    She’s topless, panting with exertion, with one hand clamped over her pussy as your cum drips from her ass.
- Creampie:
    She’s topless, panting with exertion, and your cum is dripping down her still-shaking thighs.
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
    { isSchool():
        She’s wearing sneakers and a yellow and white cheerleader outfit, exposing a bare midriff. You can see a hint of her black sports bra, and know from seeing her cheer routines that she wears black briefs under the short skirt.
    - else:
        She’s wearing a low-cut pink top over a flowy floral print skirt with sandals. You notice the bright pink straps of her bra, and wonder if her panties match. The weather isn’t quite warm enough for the outfit, which does little to conceal that her nipples are stiff.
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
            -> cheerleader_sex -> mall.dressing_room
        }
- else: // we’re at school, but it’s not the right time, so we’ll meet later
    <> “Meet me under the bleachers{cheerleader_titjob: again} after school{oldState == CheerleaderQuest:, so I can show you how grateful I am}.”
    “See you there,” you nod.
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
She looks {CheerleaderMood < Friendly:you up and down|up} and {CheerleaderMood < Friendly:scoffs. “Uh, no?|smiles sadly. “Oh, no, sorry, but} I’ve got a boyfriend.”
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
{ observe_cheerleader:
- 1: The first thing you notice about {CHEERLEADER} is that she and {JOCK} are a power couple. They have the same class schedule. Even outside of school they’re always together, either at football practice or the mall. They seem inseparable, which is not great for you, since there’s no way for you to approach {CHEERLEADER} without {JOCK} seeing.
- 2: {CHEERLEADER} looks upset, and it’s not hard to see why. {JOCK} is shamelessly hitting on another girl. He’s flexing and showing off, and she’s laughing and touching his arm. {CHEERLEADER} is glaring at him, but he’s too distracted to notice. Maybe they’re not as inseparable as it seemed? Now that he’s distracted, you think you could probably talk to her without him noticing.
- 3: Oh shit, things have come to a head between {CHEERLEADER} and {JOCK}. She confronted him about hitting on the other girl, and he just laughed and said “Don’t be a bitch about this.” Her eyes flashed red and she walked away from him. For a second, it looked like he might go after her, but instead he shrugged and made a joke to one of his friends about it being that time of the month.
    An idea forms in your head. Maybe she’s mad enough at him to fool around with you to make him jealous? Seems worth a shot.
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
    “I wouldn’t blame you if you wanted to find some way to make him feel the way you feel. Maybe I could help you with that.”
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
{CHEERLEADER} wastes no time with pleasantries. As soon as you arrive, she takes off her top and bra. You gawk at the sight of her bare breasts. “Hurry up,” she says, dropping to her knees in front of you. “Whip your dick out before someone finds us under here.”
Quickly, you unbutton your jeans. You’re a bit surprised by how motivated she is. Maybe she’s just nervous about getting caught, but you think it’s more than that. Under the take-charge attitude, you think she’s just as nervous as you are. Heart pounding, and with no idea what’s going to happen next, you lower your boxers.
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
* [Cum on her chest]
    ~ CheerleaderCum = Tits
    ~ improveMood(CheerleaderMood)
    ~ improveMood(CheerleaderBaseMood)
    Her encouragement pushes you over the edge, and with one final thrust forward, the head of your cock juts up, twitching as thick ropes of white cream splatter her chest. She squeaks in surprise as the first shot hits her chin, but the rest fall across her heaving breasts. You moan as she helps squeeze the last drops out.
* [Cum on her face]
    ~ CheerleaderCum = Facial
    ~ improveMood(CheerleaderMood)
    ~ improveMood(CheerleaderBaseMood)
    Her encouragement pushes you over the edge, and after one final thrust, you pull back and point your cock directly at her face. She squeaks in surprise as thick ropes of white cream splatter her cheeks, chin, and lips.
    “Come on, man,” she sputters, “I said cum on my tits, not my face.” But as your cum drips onto her chest, she shrugs. “I guess this still works.”
* [Cum in her mouth]
    ~ CheerleaderCum = Mouth
    Her encouragement pushes you over the edge, and after one final thrust, you shove your cock between her lips. She squeals in protest as it twitches repeatedly, flooding her mouth with your spunk. You groan and try to go deeper, but she pushes you away.
    “Fuck!” She sticks out her tongue, letting your cum drool onto her chest. “What the hell? I said cum on my tits!”
    “Sorry,” you shrug, “I guess I got a bit carried away.”
    “Well, lucky for you, this still works.”
-
Staggering back, you try to catch your breath as you watch her snap a bunch of selfies of her cum-splattered chest, all carefully cropped not to show her face.
“That’ll teach him,” she smirks. “Thanks for your help. You can go now.”
“Anytime,” you grin, buttoning your pants and wondering how {JOCK} will react.
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
“Oh he was a total bitch about it. Said some awful shit. I dumped his ass. Speaking of, do you think you could do me a favor? Some of my stuff is in his locker, and I don’t want to deal with him right now. Could you get it for me?”
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
Moving quickly and hoping {JOCK} doesn’t see, you enter the combination for his locker, and it opens. Inside you find a cheerleading camp tote bag. You grab the things that are obviously {CHEERLEADER}’s including some lipstick, a girl’s jacket, and a pair of silky panties, and put them all in the tote bag.
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
Afterwards, you feel awkward, and do your best to wipe up the mess before returning her panties to the tote bag.
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
~ improveMood(CheerleaderBaseMood)
“Yeah. After I got your things from his locker, he jumped me.”
You hand her the bag, but she ignores it for a moment.
“I’m so sorry,” she winces, staring at the bruise around your eye. “I never thought he would react like this.”
* “It’s fine[.”],” you shrug, trying to play it cool. “He got in trouble, and I got your stuff. It all worked out.”
    “Well even so,” she smiles gratefully,
* “He said you guys never broke up.”
    “What? Ugh, he’s delusional, I could not have been more clear. Don’t worry, I’ll make sure he understands we’re done.” She smiles gratefully.
* “Do you think he knows it was me?”
    “I doubt it,” she considers. “You weren’t actually in the pics or anything. He probably just saw you in his locker and got mad. But more importantly,” she smiles gratefully, 
-
<> “I appreciate what you did.”
She quickly rummages through the items in the bag, nodding at what you brought her. {cheerleader_panties: Then she picks up the panties you jerked off with. They look sticky, and there’s a noticable cum stain. She frowns, and your heart skips a beat. “Ew, did {JOCK} jerk off with these? He’s such a creep, I should have broken up with him sooner.”|<>}
Turning her attention back to you, she bites her lip and says
-> cheerleader_invite() ->->

/*

    7. Cheerleader Sex!
    After offering to reward you, you meet her under the bleachers again, and have sex.
    Mood: Starts at Aroused (or Friendly if you came in her mouth), base mood ends at Aroused (if not there already)
    If you take the time to make her cum, you can get her to Desperate, where she’ll do anything


*/
=== cheerleader_sex ===
{ cheerleader_sex == 1:
    ~ Score += cheerleaderSex
    ~ improveConfidence()
    ~ JockState = JockFight
    ~ CheerleaderBaseMood = Aroused
}
~ CheerleaderState = CheerleaderSex
~ cum_today = true
<> She leans into you with surprising urgency. You wrap your arms around her waist, pulling her closer. She grabs your ass as your hands move to her breasts. Her tongue flicks against yours as you push her against the wall. She reaches between your legs, grinding her palm against your rapidly hardening cock. You’re astonished at how she seems to want you just as desperately as you want her.
After a minute, she pushes you away so she can remove her top and bra. Your breath catches at the sight of her stunning tits, the dark nipples already puckered with excitement. “I want {cheerleader_sex == 1:to show you how grateful I am|you},” she purrs. “Tell me what you need.”
- (cheerleader_sex_opts)
+ {newToday(-> finger)}
    “How can I make you feel good?”
    -> finger ->
+ {newToday(-> suck_tits)}
    “Let me suck on your tits.”
    -> suck_tits ->
+ {newToday(-> eat_pussy) and CheerleaderMood >= Aroused}
    “I want to taste your pussy.”
    -> eat_pussy ->
+ {newToday(-> titjob)}
    “I’m gonna fuck your tits again.”
    -> titjob ->
+ {newToday(-> blowjob) and newToday(-> anal)}
    “Will you to go down me?”
    -> blowjob ->
+ {newToday(-> pussy) and CheerleaderMood >= Aroused}
    “I need to fuck you.”
    -> pussy ->
+ {newToday(-> anal) and CheerleaderMood == Desperate}
    “I’m gonna fuck your ass now.”
    -> anal ->
+ {titjob}
    “Let me blow my load all over your tits!”
    -> cum_tits ->->
+ {titjob or blowjob}
    “I want to cum on your face.”
    -> cum_facial ->->
+ {blowjob and newToday(-> anal)}
    “Can I cum in your mouth?”
    -> cum_mouth ->->
+ {pussy}
    “I need to cum inside you.”
    -> cum_creampie ->->
+ {anal}
    “I’m gonna cum in your ass!”
    -> cum_anal ->->
- -> cheerleader_sex_opts

= suck_tits
~ improveMood(CheerleaderMood)
You suck on her tits
->->

= finger
~ improveMood(CheerleaderMood)
You push two fingers into her dripping pussy
->->

= eat_pussy
~ improveMood(CheerleaderMood)
You lift her skirt and bury your tongue in her pussy
->->

= titjob
She squeezes her tits around your cock
->->

= blowjob
~ improveMood(CheerleaderMood)
She wraps her lips around your cock
->->

= pussy
~ improveMood(CheerleaderMood)
moments later, she’s dropped her panties and braced herself as you enter her from behind.
She bites her lip to keep from crying out as you fuck her deep
->->

= anal
You ease your cock into her ass
->->

= cum_tits
~ CheerleaderCum = Tits
You shoot your load on her tits
->->

= cum_facial
~ CheerleaderCum = Facial
You shoot your load on her face
->->

= cum_mouth
~ CheerleaderCum = Mouth
You cum in her hungry mouth
->->

= cum_creampie
~ CheerleaderCum = Creampie
You cum deep in her pussy
blowing your load inside
->->

= cum_anal
~ CheerleaderCum = Anal
You cum deep in her ass
->->

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
- You’ve somehow arrived at school without noticing that you’re completely naked. You run desperatly through the halls, trying and failing to cover your impossibly hard erection. {CHEERLEADER} suddenly comes through a door, and you collide, falling to the ground between her legs. Her tits have popped out of her top and your cock is slipping between her impossibly wet lips
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
    You’ve completed {CHEERLEADER}’s story, but you can ask her for a repeat performance any time.
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
->->

/*

    Check if Cheerleader can fuck right now (only after school on weekdays)
    After I wrote this, I updated things so she can fuck at the mall, too, but I don't want to update all the logic in cheerleader_invite, which was kind of a pain to test, with all the possible combinations.

*/
=== function cheerleader_dtf()
~ return isWeekday() && now == AfterSchool

/*

    Check if it's appropriate to ask Cheerleader her bra size
    Only if you have the quest, don't already know the answer, haven't asked recently, and you didn't just fuck her.

*/
=== function can_ask_cheerleader_bra_size()
~ return FriendState == FriendQuest and BraSizes !? Cheerleader and not seenVeryRecently(-> ask_cheerleader_bra_size) and not seenVeryRecently(-> cheerleader_titjob) and not seenVeryRecently(-> cheerleader_sex)