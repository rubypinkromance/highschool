/*
- Cheerleader: Michelle
    - Kayley Cuoco: bleached blonde ponytail, cheerleader uniform, sports bra, big tits, big nipples, 34-25-36
        - likes flirty
        - dislikes sweet
    ? intel: heard her and Jock have been fighting
    ? recon: observe Jock flirting with another girl
    a. convo: suggest revenge
    b. meet for titjob + pics to make Jock jealous
    c. convo: she broke up, asks you to get her stuff
    d. get her things from Jock's locker
    f. convo: she offers a reward
    g. meet for sex
    - 1: Study Hall
    - 2: Cafeteria
    - 3: Theater
    - 4: Field
*/
CONST CHEERLEADER = "Michelle"
LIST cheerleaderState = intel, recon, revenge, followup, quest, has_stuff, reward, repeat, complete
VAR cheerleaderScore = 0
VAR cum_in_cheerleader_panties = false

=== talk_to_cheerleader ===
You approach {CHEERLEADER}
{ cheerleaderState <= intel:<>, who regards you warily. The two of you have gone to school together for years, but you've never actually spoken to her like this. She isn't sure what to expect. "What do you want?"}
{ cheerleaderState == recon or (cheerleaderState == revenge and here != UNDER_BLEACHERS):<>. She glances up at you briefly, but returns her attention to {JOCK}, who seems oblivious to the daggers she's shooting at him.}
{ cheerleaderState == revenge and here == UNDER_BLEACHERS:<>, who is tapping her foot impatiently.}
{ cheerleaderState == followup:<>, who is cheerfully ignoring {JOCK}, who looks miserable. She grins at you. "What's up?"}
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
        -> cheerleader_revenge ->
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

{TURNS_SINCE(-> cheerleader_revenge) == 1:
    Michelle's tits are covered in cum.
}

{TURNS_SINCE(-> cheerleader_sex) == 1:
    Your cum is dripping from her pussy.
}
->->

/* If you ask her out before her quest line, she shoots you down. */
=== cheerleader_rejection ===
Summoning all your courage, you ask her out. "Hey, uh, do you want to go out with me sometime, like on a date?"
She looks you up and down and scoffs. "No thanks, I've got a boyfriend."
You feel foolish. Of course the hot cheerleader has a boyfriend.
->->

/* After getting intel from Gossip that Cheerleader is fighting with her boyfriend, you observe she's upset because he's flirting with other girls. */
=== observe_cheerleader ===
~ cheerleaderState = recon
TODO: write cheerleader observations
You keep an eye on Michelle and Lance, looking for any clue of what they might be fighting about. It doesn't take long for you to notice that Lance is shamelessly flirting with another girl. Michelle is shooting daggers at him, but he's too distracted to notice. An idea forms in your head. You should talk to Michelle
->->

/* After observing she's upset, you suggest a way for her to get back at her boyfriend, and she agrees. */
=== suggest_cheerleader_revenge ===
~ cheerleaderState = revenge
TODO: write cheerleader revenge convo
"You know, your boyfriend's kind of a jerk."
"Yeah he is. Meet me under the bleachers{now != afterschool: after school}."
{now == afterschool:
*  [Follow her under the bleachers]
    -> field.under_bleachers
- else:
    ->->
}

/* After offering to help her get revenge, you meet her under the bleachers, and she takes photos of you cumming on her tits to upset her boyfriend. */
=== cheerleader_revenge ===
~ cheerleaderState = followup
~ cheerleaderScore++
TODO: write cheerleader revenge encounter
"Are you ready to make {JOCK} jealous?"
Michelle wastes no time pulling out your cock and shoving it between her tits. A few eager pumps later, you shoot your load all over her chest. She eagerly snaps a few photos and sends them to Lance.
"That'll teach him," she smirks. "Thanks for your help."
"Anytime," you grin, leaving her to her revenge.
You should probably follow up with her tomorrow to see how it worked.
->->

/* After the titjob, she tells you they broke up, and asks you to get her things from his shared locker. */
=== cheerleader_request ===
~ cheerleaderState = quest
TODO: write cheerleader followup convo
"How'd {JOCK} react to the pictures we took?"
"Oh he was a total bitch about it. Said some awful shit. I dumped his ass. Say, do you think you could do me a favor? Some of my stuff is in his locker, and I don't want to deal with him. Could you get it for me?"
"Sure, what's the combination?"
"He set it to my measurements: 34-25-36."
->->

/* After she asks for your help, you recover her things from her ex-boyfriend's locker. */
=== cheerleader_locker ===
~ cheerleaderState = has_stuff
~ saw_weed = true
TODO: write cheerleader locker search
You enter the combination for the locker, and it opens. Inside you find a cheerleading camp tote bag. You grab the things that are obviously Michelle's including some lipstick, a girl's jacket, and some panties.
* [Close the locker] ->->

/* After recovering a pair of her panties from her ex-boyfriend's locker, you jerck off with them. */
=== jerk_off_with_cheerleader_panties ===
TODO: write cheerleader panties encounter
~ cum_in_cheerleader_panties = true
Unable to resist the urge, you wrap Michelle's silky panties around your cock. Quickly, it swells to life, the fabric deliciously stimulating. You thrust and strain into the panties, imagining her putting them on. The head of your cock slips into the gusset, which is enough to push you over the edge, and you blow your load imagining her putting the wet panties on, feeling your cum on her lips.
Afterwards, you feel sheepish, and do your best to wipe up the mess, before returning her panties to the tote bag.
->->

/* After recovering her things from her ex-boyfriend's locker, you bring them to her, and she says to meet her later for a reward. */
=== deliver_cheerleader_stuff ===
~ cheerleaderState = reward
TODO: write cheerleader stuff convo
"I got your things from the locker."
"Thanks for helping me out." She rummages through the items in the bag. {cum_in_cheerleader_panties: She picks up the panties you jerked off with. They look sticky, and there's a noticable cum stain. She frowns, and your heart skips a beat. "Ew, did {JOCK} jerk off with these? He's such a creep, I should have broken up with him sooner."} Turning her attention back to you, she bites her lip and says "{here == UNDER_BLEACHERS:Come here, let me|Meet me under the bleachers again after school, so I can} show you how grateful I am."
->->

/* After offering to reward you, you meet her under the bleachers again, and have sex. */
=== cheerleader_reward ===
~ cheerleaderState = complete
~ cheerleaderScore++
TODO: write cheerleader reward encounter intro
You kiss her.
"Let me show you how grateful I am for all your help."
-> cheerleader_sex ->
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
"I need you inside me."
-> cheerleader_sex ->
->->

/* You fuck the cheerleader (broken out for replay) */
=== cheerleader_sex ===
TODO: write cheerleader sex encounter
Michelle passionately kisses you, and moments later, she's dropped her panties and braced herself as you enter her from behind. She bites her lip to keep from crying out as you fuck her deep, blowing your load inside.
You pull up your pants, give her a kiss, and turn away.
->->
