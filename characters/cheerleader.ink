/*
- Cheerleader: Michelle
    - Kayley Cuoco: bleached blonde ponytail, cheerleader uniform, sports bra, big tits, big nipples, 34-25-36
        - likes flirty
        - dislikes sweet
    ? intel: heard her and Jock have been fighting
    ? recon: observe Jock flirting with another girl
    a. talk: suggest revenge
    b. meet for titjob + pics to make Jock jealous
    c. talk: she asks you to get her stuff from Jock's locker
    d. get her stuff from Jock's locker
    f. talk: she offers a reward
    g. meet for sex
    h. optional repeat sex
    - 1: Study Hall
    - 2: Cafeteria
    - 3: Theater
    - 4: Field
*/
CONST CHEERLEADER = "Michelle"
LIST cheerleaderState = intel, recon, revenge, followup, quest, has_stuff, reward, repeat, complete
VAR cheerleaderScore = 0

=== talk_to_cheerleader ===
You approach Michelle
{ cheerleaderState <= intel:<>, who regards you warily. The two of you have gone to school together for years, but you've never actually spoken to her like this. She isn't sure what to expect. "What do you want?"}
{ cheerleaderState == recon or (cheerleaderState == revenge and here != UNDER_BLEACHERS):<>. She glances up at you briefly, but returns her attention to {JOCK}, who seems oblivious to the daggers she's shooting at him.}
{ cheerleaderState == revenge and here == UNDER_BLEACHERS:<>, who is tapping her foot impatiently.}
{ cheerleaderState == followup:<>, who is cheerfully ignoring {JOCK}. She grins at you. "What's up?"}
{ cheerleaderState == quest or cheerleaderState == has_stuff:<>, who looks at you hopefully. "Did you get my stuff back from {JOCK}'s locker?"}
{ cheerleaderState == reward or cheerleaderState == repeat:<>, who is waiting for you with hunger in her eyes.}
{ cheerleaderState == complete:<>, who smiles at you. "What's up?"}
- (opts)
    * {cheerleaderState < recon}
        ["Want to go out with me?"]
        -> cheerleader_rejection ->
    * {cheerleaderState == recon}
        ["Your boyfriend's a jerk."]
        -> suggest_cheerleader_revenge ->
    * {cheerleaderState == revenge and here == UNDER_BLEACHERS}
        ["Ready to make {JOCK} jealous?"]
        -> cheerleader_titjob ->
    * {cheerleaderState == followup and here != UNDER_BLEACHERS}
        ["How'd {JOCK} react?"]
        -> cheerleader_request ->
    * {cheerleaderState == has_stuff}
        ["I got your things."]
        -> deliver_cheerleader_stuff ->
    * {cheerleaderState == reward and here == UNDER_BLEACHERS}
        [Kiss her]
        -> cheerleader_reward ->
    // Wait a few turns before asking for a repeat
    + {cheerleaderState == complete and TURNS_SINCE(-> cheerleader_sex) > 3}
        ["What are you doing{now != afterschool: later| right now}?"]
        -> cheerleader_replay ->
    + {cheerleaderState == repeat and here == UNDER_BLEACHERS}
        [Kiss her]
        -> cheerleader_reward_repeat ->
    + [Check her out]
        -> look_at_cheerleader ->
    + [Walk away]
        ->->
- -> opts

=== look_at_cheerleader ===
TODO: write cheerleader descriptions
Big tits, cheerleader outfit.

It has been {TURNS_SINCE(-> cheerleader_titjob)} turns since Michelle gave you a titjob.

It has been {TURNS_SINCE(-> cheerleader_sex)} turns since you fucked Michelle.

{cheerleader_titjob and TURNS_SINCE(-> cheerleader_titjob) < 10 and here == UNDER_BLEACHERS:
    Michelle's tits are covered in cum.
}

{cheerleader_sex and TURNS_SINCE(-> cheerleader_sex) < 10 and here == UNDER_BLEACHERS:
    Your cum is dripping from her pussy.
}
->->

/* If you ask her out before her quest line, she shoots you down. */
=== cheerleader_rejection ===
Summoning all your courage, you ask her out. "Hey, uh, do you want to go out with me sometime, like on a date?"
She looks you up and down and scoffs. "Uh, no? I've got a boyfriend."
You feel foolish. Of course the hot cheerleader has a boyfriend.
->->

/* After getting intel from Gossip that she's fighting with her boyfriend, you observe she's upset because he's flirting with other girls. */
=== observe_cheerleader ===
~ cheerleaderState = recon
You keep an eye on Michelle and {JOCK}, looking for any clue of what they might be fighting about. It doesn't take long for you to notice that {JOCK} is shamelessly flirting with another girl. He's flexing and showing off, and she's laughing and touching his arm. Michelle is glaring at him, but he's too distracted to notice.
An idea forms in your head. Maybe she's mad enough at him to fool around with you to make him jealous.
->->

/* After observing she's upset, you suggest a way for her to get back at her boyfriend. */
=== suggest_cheerleader_revenge ===
~ cheerleaderState = revenge
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
She seems startled by your uncharacteristic boldness, but after a moment, she nods. "You know what? Yeah. Meet me under the bleachers{now != afterschool: after school}."
"Cool. {now == afterschool:I'm right behind you|See you there}."
Holy shit! You can't believe that worked. Your heart pounds as you imagine what's in store.
{now == afterschool:
*  [Follow her under the bleachers]
    -> field.under_bleachers
- else:
    ->->
}

/* After offering to help her get revenge, she takes photos of you cumming on her tits. */
=== cheerleader_titjob ===
~ cheerleaderState = followup
~ cheerleaderScore++
"Are you ready to make {JOCK} jealous?"
Michelle wastes no time with pleasantries. As soon as you arrive, she whips off the top of her cheerleading uniform and drops to her knees in front of you. "Hurry up and pull your dick out before someone finds us under here."
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
    Her encouragement pushes you over the edge, and with one final thrust forward, the head of your cock juts up, twitching as thick ropes of white cream splatter her chest. She squeaks in surprise as the first shot hits her chin, but the rest fall across her heaving breasts. You moan as she helps squeeze the last drops out, then extracts your cock from her bra.
* [Cum on her face]
    Her encouragement pushes you over the edge, and after one final thrust, you pull your cock out of her bra and point it directly at her face. She squeaks in surprise as thick ropes of white cream splatter across her cheeks, chin, and lips.
    "Fucking hell, dude," she sputters, "I meant cum on my chest, not my face." She shrugs as your cum drips onto her chest. "But I guess this still works."
* [Cum in her mouth]
    Her encouragement pushes you over the edge, and after one final thrust, you pull your cock out of her bra and shove it between her lips. She squeaks in protest as your cock twitches repeatedly, flooding her mouth with your spunk. You groan and try to go deeper, but she pushes you away.
    "Fuck!" She sticks out her tongue, letting your cum drool onto her chest. "What the hell, dude, I said cum on my chest!"
    "Sorry," you pant, "I guess I got a bit carried away."
    "Well, lucky for you, this still works."
-
Staggering back, you try to catch your breath as you watch her snap a bunch of selfies of her cum-splattered chest, all carefully cropped not to show her face.
"That'll teach him," she smirks. "Thanks for your help. You can go now."
"Anytime," you grin, buttoning your pants and wondering how {JOCK} will react.
->->

/* After the titjob, she tells you they broke up, and asks you to get her things from his locker. */
=== cheerleader_request ===
~ cheerleaderState = quest
TODO: write cheerleader followup convo
"How'd {JOCK} react to the pictures we took?"
"Oh he was a total bitch about it. Said some awful shit. I dumped his ass. Say, do you think you could do me a favor? Some of my stuff is in his locker, and I don't want to deal with him. Could you get it for me?"
"Sure, what's the combination?"
"He set it to my measurements: 34-25-36."
->->

/* After she asks for your help, you recover her things from her ex's locker. */
=== cheerleader_locker ===
~ cheerleaderState = has_stuff
TODO: write cheerleader locker search
You enter the combination for the locker, and it opens. Inside you find a cheerleading camp tote bag. You grab the things that are obviously Michelle's including some lipstick, a girl's jacket, and some panties.
* [Close the locker] ->->

/* After finding a pair of her panties in her ex's locker, you jerk off with them. */
=== cheerleader_panties ===
TODO: write cheerleader panties encounter
Unable to resist the urge, you wrap Michelle's silky panties around your cock. Quickly, it swells to life, the fabric deliciously stimulating. You thrust and strain into the panties, imagining her putting them on. The head of your cock slips into the gusset, which is enough to push you over the edge, and you blow your load imagining her putting the wet panties on, feeling your cum on her lips.
Afterwards, you feel sheepish, and do your best to wipe up the mess, before returning her panties to the tote bag.
->->

/* After recovering her things from her ex's locker, she says to meet her later for a reward. */
=== deliver_cheerleader_stuff ===
~ cheerleaderState = reward
TODO: write cheerleader stuff convo
"I got your things from the locker."
"Thanks for helping me out." She rummages through the items in the bag. {cheerleader_panties: She picks up the panties you jerked off with. They look sticky, and there's a noticable cum stain. She frowns, and your heart skips a beat. "Ew, did {JOCK} jerk off with these? He's such a creep, I should have broken up with him sooner."} Turning her attention back to you, she bites her lip and says "{here == UNDER_BLEACHERS:Come here, let me|Meet me under the bleachers again after school, so I can} show you how grateful I am."
->->

/* After offering to reward you, you meet her under the bleachers again, and have sex. */
=== cheerleader_reward ===
~ cheerleaderState = complete
~ cheerleaderScore++
TODO: write cheerleader reward encounter intro
You kiss her.
"I'm glad you came. Let me show you how grateful I am for all your help."
-> cheerleader_sex ->
->->

/* You fuck the cheerleader (broken out for replay) */
=== cheerleader_sex ===
TODO: write cheerleader sex encounter
Michelle passionately kisses you, and moments later, she's dropped her panties and braced herself as you enter her from behind. She bites her lip to keep from crying out as you fuck her deep, blowing your load inside.
You pull up your pants, give her a kiss, and turn away.
->->

/* After having sex, you ask if she wants to do it again. */
=== cheerleader_replay ===
~ cheerleaderState = repeat
TODO: write cheerleader repeat convo
"What are you doing{now != afterschool: later|right now}?"
"You, hopefully. {here != UNDER_BLEACHERS: Meet me behind the bleachers again after school.}"
->->

/* After asking to have sex again, you meet her under the bleachers again. */
=== cheerleader_reward_repeat ===
~ cheerleaderState = complete
TODO: write cheerleader repeat encounter intro
You kiss her.
"I'm glad you came. I need you inside me again."
-> cheerleader_sex ->
->->
