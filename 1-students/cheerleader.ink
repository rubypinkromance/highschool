/*
    Cheerleader: Rosario
    Looks like Rosario Dawson: Puerto Rican, long wavy black hair, curvy build, huge tits, 34DD, landing strip, 38-26-36
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
LIST CheerleaderState = CheerleaderObserved, CheerleaderRevenge, CheerleaderTitjob, (CheerleaderQuest), CheerleaderReward, CheerleaderSex
VAR CheerleaderInPlay = true
VAR CheerleaderMood = Neutral
VAR CheerleaderBaseMood = Neutral
VAR CheerleaderCum = ()
LIST CheerleaderItems = CheerleaderPanties, CheerleaderStuff

TODO handle score
TODO: what triggers jock fight 2? You trying to steal my girl bro? Think you got the stuff to hook up with my bitch? Think again. Knees you in the nuts, Rebel intervenes. She likes you more, doesn’t like bullies. Takes you to nurse, who ices your balls then you get hard while she examines them.

/*

    Talk to Cheerleader
    
*/
=== talk_to_cheerleader ===
~ last_girl = Cheerleader

TODO adjust based on mood
// We adjust her reactions based on her mood and state (but not your confidence)
You approach {CHEERLEADER}
{
- CheerleaderState < CheerleaderObserved and observe_cheerleader < 2:
    <>, but {JOCK} laughs when he sees you coming and tells you to fuck off.
- CheerleaderState < CheerleaderObserved and observe_cheerleader >= 2:
    <>, who regards you warily. The two of you have gone to school together for years, but you've never actually spoken to her like this. She isn't sure what to expect. "What do you want?"
- CheerleaderState == CheerleaderObserved or (CheerleaderState == CheerleaderRevenge and here != UnderBleachers):
    <>. She glances up at you briefly, but returns her attention to {JOCK}, who seems oblivious to the daggers she's shooting at him.
- CheerleaderState == CheerleaderRevenge and here == UnderBleachers:
    <>, who is tapping her foot impatiently.
- CheerleaderState == CheerleaderTitjob:
    <>, who is cheerfully ignoring {JOCK}. She grins at you. "What's up?"
- CheerleaderState == CheerleaderQuest:
    <>, who looks at you hopefully. "Did you get my stuff back from {JOCK}'s locker?"
- CheerleaderState == CheerleaderReward and here == UnderBleachers:
    <>, who looks at you with hunger in her eyes.
- CheerleaderState >= CheerleaderReward:
    <>, who smiles at you. "What's up?"
- else:
    <>. // this shouldn't happen, but just to be safe.
}

TODO adjust based on confidence
// We adjust your options based on your confidence and her state (but not her mood)
- (cheerleader_opts)
* {CheerleaderMood > Friendly}"What's your bra size?"
    "34DD."
* {CheerleaderState < CheerleaderObserved}
    ["Want to go out with me?"]
    -> ask_cheerleader_out ->
* {CheerleaderState == CheerleaderObserved}
    ["Your boyfriend's a jerk."]
    -> suggest_cheerleader_revenge ->
* {CheerleaderState == CheerleaderRevenge and here == UnderBleachers}
    ["Ready to make {JOCK} jealous?"]
    -> cheerleader_titjob ->
* {CheerleaderState == CheerleaderTitjob and here != UnderBleachers}
    ["How'd {JOCK} react?"]
    -> cheerleader_quest ->
* {Inventory ? CheerleaderStuff}
    ["I got your things."]
    -> deliver_cheerleader_stuff ->
* {CheerleaderState == CheerleaderReward and here == UnderBleachers}
    [Kiss her]
    You pull her into a kiss.
    -> cheerleader_sex ->
+ {CheerleaderState == CheerleaderSex and newToday(-> cheerleader_sex)}
    ["What are you doing{isWeekday() and now != AfterSchool: later| right now}?"]
    -> cheerleader_repeat ->
+ [Check her out]
    -> look_at_cheerleader ->
+ [Walk away]
    ->->
- -> cheerleader_opts

/*

    Look at Cheerleader

*/
=== look_at_cheerleader ===
Puerto Rican, long wavy black hair, curvy build, huge tits, 34DD, landing strip, 38-26-36, cheerleader outfit, black sports bra, black boyshort panties

It has been {TURNS_SINCE(-> cheerleader_titjob)} turns since {CHEERLEADER} gave you a titjob.

It has been {TURNS_SINCE(-> cheerleader_sex)} turns since you fucked {CHEERLEADER}.

{
- CheerleaderCum ? Anal:
    Your cum is dripping from her ass.
- CheerleaderCum ? Creampie:
    Your cum is dripping from her pussy.
- CheerleaderCum ? Mouth:
    { CheerleaderMood > Friendly:
        She's licking your cum from her lips.
    - else:
        She's spitting out your cum.
    }
- CheerleaderCum ? Facial:
    Your cum is dripping off her face onto her chest.
- CheerleaderCum ? Tits:
    Your cum is splattered across her tits.
}
->->

/*

    0. Ask Cheerleader Out
    This isn't going to go well.

*/
=== ask_cheerleader_out ===
TODO adjust based on your confidence level and her mood
Summoning all your courage, you ask her out. "Hey, uh, do you want to go out with me sometime, like on a date?"
She looks you up and down and scoffs. "Uh, no? I've got a boyfriend."
You feel foolish. Of course the hot cheerleader has a boyfriend.
->->

/*

    1. Observe Cheerleader
    - observe 1: see jock flirting
    - observe 2: see cheerleader is upset
    - observe 3: see them fighting, jock says don’t be a bitch about this and moves away. This is your chance!

*/
=== observe_cheerleader ===
~ last_girl = Cheerleader
~ CheerleaderState = CheerleaderObserved
You keep an eye on {CHEERLEADER} and {JOCK}, looking for any clue of what they might be fighting about. It doesn't take long for you to notice that {JOCK} is shamelessly flirting with another girl. He's flexing and showing off, and she's laughing and touching his arm. {CHEERLEADER} is glaring at him, but he's too distracted to notice.
An idea forms in your head. Maybe she's mad enough at him to fool around with you to make him jealous.
->->

/*

    2. Suggest Revenge to Cheerleader
    After observing she's upset, you suggest a way for her to get back at her boyfriend.

*/
=== suggest_cheerleader_revenge ===
~ CheerleaderState = CheerleaderRevenge
"You know, your boyfriend's a real jerk."
She scowls at you, starts to protest, then looks back at {JOCK} and frowns. "I guess he is."
* "It's not right, the way he's treating you."
    "Excuse me?"
    "I wouldn't blame you if you wanted to find some way to make him feel the way you feel. Maybe I could help you with that."
* "If you were my girl, I'd treat you better."
    "Excuse me?"
    "Just saying. Hitting on other girls in front of you like this? Guy doesn't deserve you."
* "I wouldn't blame you if you wanted to get back at him."
    "Excuse me?"
    "Just saying, if you wanted to make him jealous, I'd be happy to help."
* "Wanna go somewhere and make him jealous?"
-
She seems startled by your uncharacteristic boldness, but after a moment, she nods. "You know what? Yeah. Meet me under the bleachers{now != AfterSchool: after school}."
"Cool. {now == AfterSchool:I'm right behind you|See you there}."
Holy shit! You can't believe that worked. Your heart pounds as you imagine what's in store.
{now == AfterSchool:
*  [Follow her under the bleachers] -> field.under_bleachers
- else:
    ->->
}

/*

    3. Cheerleader Titjob
    After offering to help her get revenge, she takes photos of you cumming on her tits to make Jock jealous.

*/
=== cheerleader_titjob ===
~ CheerleaderState = CheerleaderTitjob
~ Score += cheerleaderTitjob
"Are you ready to make {JOCK} jealous?"
{CHEERLEADER} wastes no time with pleasantries. As soon as you arrive, she whips off the top of her cheerleading uniform and drops to her knees in front of you. "Hurry up and pull your dick out before someone finds us under here."
Quickly, you unbutton your jeans. You're a bit surprised by how motivated she is. Maybe she's just nervous about getting caught, but you think it's more than that. Under the take-charge attitude, you think she's just as nervous as you are. Heart pounding, and with no idea what's going to happen next, you pull down the front of your boxers.
She wraps her hand around your cock and immediately starts squeezing. She knows what she's doing, and you quickly stiffen in her hand, until she's stroking the full length of your shaft. "Don't get too excited," she warns you, "I'm not gonna suck you off. You can put it between my tits and blow your load on my chest. That'll be enough for me to take some pics to show {JOCK} what he's missing."
* [Nod gratefully]
    You nod gratefully, still struggling to believe your luck.
* "Great idea."
* "Works for me."
* "That'll do for now."
    She frowns at your attitude, but keeps stroking your cock.
-
Even contained in a sports bra, her large boobs look incredible. Stiff nipples poke through the fabric, which plunges down to reveal some inviting-looking cleavage.
Sensing your excitement, she grins confidently, spits on her hand, and in one swift movement, slips your erection under the bra band. Her soft breasts nestle around your throbbing cock, warm and welcoming. Slick with saliva, you push forward, slipping easily between her tits.
You both look down as the head of your cock emerges from her cleavage, glistening wetly. She inhales and squeezes her breasts together, increasing the pressure as you begin to thrust. It feels great, and from the look in her eyes, she knows it.
"You like the way my tits feel around your cock?" she teases.
* "They're awesome[!"]," you moan
* "You're amazing[!"]," you groan
* "Oh my god[!"]," you groan
-
<>, eagerly fucking her cleavage. "This feels so fucking good."
"You got hard really fast. Are you gonna cum for me?"
"Fuck yeah," you gasp, realizing how quickly the pressure is building.
"Yeah, you are," she purrs. "Because you know how lucky you are, to get to fuck my titties and cum all over me. Now, come on, cover me in your hot spunk. Do it!"
* [Cum on her chest]
    ~ CheerleaderCum += Tits
    ~ improveMood(CheerleaderMood)
    ~ improveMood(CheerleaderBaseMood)
    Her encouragement pushes you over the edge, and with one final thrust forward, the head of your cock juts up, twitching as thick ropes of white cream splatter her chest. She squeaks in surprise as the first shot hits her chin, but the rest fall across her heaving breasts. You moan as she helps squeeze the last drops out, then extracts your cock from her bra.
* [Cum on her face]
    ~ CheerleaderCum += Facial
    ~ improveMood(CheerleaderMood)
    ~ improveMood(CheerleaderBaseMood)
    Her encouragement pushes you over the edge, and after one final thrust, you pull your cock out of her bra and point it directly at her face. She squeaks in surprise as thick ropes of white cream splatter across her cheeks, chin, and lips.
    "Come on, man," she sputters, "I meant cum on my chest, not my face." She shrugs as your cum drips onto her chest. "But I guess this still works."
* [Cum in her mouth]
    ~ CheerleaderCum += Mouth
    Her encouragement pushes you over the edge, and after one final thrust, you pull your cock out of her bra and shove it between her lips. She squeaks in protest as your cock twitches repeatedly, flooding her mouth with your spunk. You groan and try to go deeper, but she pushes you away.
    "Fuck!" She sticks out her tongue, letting your cum drool onto her chest. "What the hell, dude, I said cum on my chest!"
    "Sorry," you pant, "I guess I got a bit carried away."
    "Well, lucky for you, this still works."
-
Staggering back, you try to catch your breath as you watch her snap a bunch of selfies of her cum-splattered chest, all carefully cropped not to show her face.
"That'll teach him," she smirks. "Thanks for your help. You can go now."
"Anytime," you grin, buttoning your pants and wondering how {JOCK} will react.
->->

/*

    4. Cheerleader Request
    After the titjob, she tells you they broke up, and asks you to get her things from his locker.

*/
=== cheerleader_quest ===
~ CheerleaderState = CheerleaderQuest
"How'd {JOCK} react to the pictures we took?"
"Oh he was a total bitch about it. Said some awful shit. I dumped his ass. Say, do you think you could do me a favor? Some of my stuff is in his locker, and I don't want to deal with him. Could you get it for me?"
"Sure, what's the combination?"
"He set it to my measurements: 38-26-36."
->->

/*

    5. Cheerleader's Locker
    After she asks for your help, you recover her things from her ex's locker, and have a fight with Jock
    - Jock fight 1: what are you doing in my locker asshole. We’re not broken up, that’s just a misunderstanding. Face punch, teacher intervenes, gives lance detention, sends you to nurse.
    - has_black_eye = 7
*/
=== cheerleader_locker ===
~ Inventory += CheerleaderPanties
~ Inventory += CheerleaderStuff
You enter the combination for the locker, and it opens. Inside you find a cheerleading camp tote bag. You grab the things that are obviously {CHEERLEADER}'s including some lipstick, a girl's jacket, and some panties.
* [Close the locker] ->->

/*

    Optional: Jerk Off with Cheerleader's Panties
    After finding a pair of her panties in her ex's locker, you jerk off with them.

*/
=== cheerleader_panties ===
~ last_girl = Cheerleader
~ cum_today = true
~ Score += cheerleaderPanties
Unable to resist the urge, you wrap {CHEERLEADER}'s silky panties around your cock. Quickly, it swells to life, the fabric deliciously stimulating. You thrust and strain into the panties, imagining her putting them on. The head of your cock slips into the gusset, which is enough to push you over the edge, and you blow your load imagining her putting the wet panties on, feeling your cum on her lips.
Afterwards, you feel sheepish, and do your best to wipe up the mess, before returning her panties to the tote bag.
->->

/*

    6. Deliver Cheerleader's Stuff
    After returning her things from her ex's locker, she sees your black eye, and says to meet her later for a reward.
    - CheerleaderMood++ (unless you came in her mouth)

*/
=== deliver_cheerleader_stuff ===
~ last_girl = Cheerleader
~ CheerleaderState = CheerleaderReward
~ Inventory -= CheerleaderPanties
"I got your things from the locker."
"Thanks for helping me out." She rummages through the items in the bag. {cheerleader_panties: She picks up the panties you jerked off with. They look sticky, and there's a noticable cum stain. She frowns, and your heart skips a beat. "Ew, did {JOCK} jerk off with these? He's such a creep, I should have broken up with him sooner."} Turning her attention back to you, she bites her lip and says
{
- now == AfterSchool:
    <> "Come with me. I want to show you how grateful I am."
    + [Follow her {UNDER_BLEACHERS}]
        ~ here = UnderBleachers
        ~ BleachersPeople -= Cheerleader
        ~ UnderBleachersPeople += (Cheerleader)
        You follow her {UNDER_BLEACHERS}, where she pulls you into a kiss.
        -> cheerleader_sex -> field.under_bleachers
- else:
    <> "Meet me under the bleachers again after school, so I can show you how grateful I am."
}
->->

/*

    7. Cheerleader Sex!
    After offering to reward you, you meet her under the bleachers again, and have sex.


*/
=== cheerleader_sex ===
{ cheerleader_sex == 1:
    ~ Score += cheerleaderSex
    ~ confidence++
}
~ CheerleaderState = CheerleaderSex
~ CheerleaderCum += Creampie
"I'm glad you came. {cheerleader_sex == 1: Let me show you how grateful I am for all your help.|I need you inside me again.}"
{CHEERLEADER} passionately kisses you, and moments later, she's dropped her panties and braced herself as you enter her from behind. She bites her lip to keep from crying out as you fuck her deep, blowing your load inside.
+ [Pull up your pants] -> field.under_bleachers_opts

/*

    8. Ask Cheerleader for a Repeat Peformance
    After having sex once, you can ask her to do it again, re-running the sex scene.


*/
=== cheerleader_repeat ===
~ CheerleaderState = CheerleaderReward
"What are you doing{isWeekday() and now != AfterSchool: later| right now}?"
"You, hopefully.
{
- now == AfterSchool:
    <> "Come with me."
    + [Follow her {UNDER_BLEACHERS}]
        ~ here = UnderBleachers
        ~ BleachersPeople -= Cheerleader
        ~ UnderBleachersPeople += (Cheerleader)
        You follow her {UNDER_BLEACHERS}, where she pulls you into a kiss.
        -> cheerleader_sex -> field.under_bleachers
- else:
    <> "Meet me under the bleachers again after school."
}
->->

/*

    Cheerleader Dreams

*/
=== dream_of_cheerleader ===
You have {dream_of_cheerleader > 1:another|a} filthy dream about {CHEERLEADER}. <>
{ shuffle:
- You have your cock nestled between her tits, and she’s begging you to finish, to blow your load all over her. She wants it. She wants you to cum so badly. You can feel your climax approaching, and you point her cock at her face
- You are sitting in the back seat of a car, and her hand is in your pants, firmly rubbing your throbbing cock. She's topless and urging you to suck on her nipples. You gasp and groan as she strokes you with increasing urgency
- You have joined the cheerleading squad, and she's practicing an implausible acrobatic move where you throw her in the air and catch her on your face. She lands with her thighs wrapped around your head, your nose pressed into her panties. She squirms as you struggle for breath, grinding against you, until she throws back her head, moaning in pleasure
- You're taking a test that you haven't studied for, and to make matters worse, there weren't enough chairs for everyone, so the teacher told {CHEERLEADER} to sit in your lap. It's difficult to concentrate because she's squirming against your erection, moaning filthy nonsense in your ear. You finally abandon the test, grabbing her hips to grind her against you
- You've somehow arrived at school without noticing that you're completely naked. You run desperatly through the halls, trying and failing to cover your impossibly hard erection. {CHEERLEADER} suddenly comes through a door, and you collide, falling to the ground between her legs. Her tits have popped out of her top and your cock is slipping between her impossibly wet lips
- It's halftime at the football game, and all the other cheerleaders are giggling and laughing as you take your place on the field, kneeling behind {CHEERLEADER}, who's on her hands and knees. You flip her skirt up, revealing her bare pussy, and as the whistle blows, you push inside her, thrusting urgently as the opposing team runs to tackle you
}
<>{isDayWeekend(tomorrow()):, but before you can cum you wake up tangled in your sheets.|, when she opens her mouth and starts making a strange noise that you eventually recognize as your alarm.}
->->

/*

    Cheerleader Hints

*/
=== cheerleader_hints ===
TODO add hints
Try observing {CHEERLEADER}.
->->

/*

    Clean up any cum on Cheerleader

*/
=== cheerleader_cleanup ===
~ CheerleaderCum = ()
->->
