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
TODO: write description, conversational choices
Approach {CHEERLEADER}.
- (opts)
    + [Check her out]
        -> look_at_cheerleader ->
    * {cheerleaderState == recon} [Suggest revenge]
        -> suggest_cheerleader_revenge ->
    * {cheerleaderState == revenge and current_location == UNDER_BLEACHERS} [Help her get revenge]
        -> cheerleader_revenge ->
    * {cheerleaderState == followup and current_location != UNDER_BLEACHERS} [Follow up]
        -> cheerleader_request ->
    * {cheerleaderState == has_stuff} [Deliver her stuff]
        -> deliver_cheerleader_stuff ->
    * {cheerleaderState == reward and current_location == UNDER_BLEACHERS} [Get your reward]
        -> cheerleader_reward ->
    + {cheerleaderState == repeat and current_location == UNDER_BLEACHERS} [Hook up]
        -> cheerleader_reward_repeat ->
    + {cheerleaderState == complete and TURNS_SINCE(-> cheerleader_sex) > 1} [Flirt]
        -> cheerleader_replay ->
    * "What's your bra size?"
        "36D."
    + [Leave her alone]
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
"Your boyfriend sucks."
"Yeah he does. Meet me under the bleachers after school"
->->

/* After offering to help her get revenge, you meet her under the bleachers, and she takes photos of you cumming on her tits to upset her boyfriend. */
=== cheerleader_revenge ===
~ cheerleaderState = followup
~ cheerleaderScore++
TODO: write cheerleader revenge encounter
Michelle wastes no time pulling out your cock and shoving it between her tits. A few eager pumps later, you shoot your load all over her chest. She eagerly snaps a few photos and sends them to Lance.
"That'll teach him," she smirks. "Thanks for your help."
"Anytime," you grin, leaving her to her revenge.
You should probably follow up with her tomorrow to see how it worked.
->->

/* After the titjob, she tells you they broke up, and asks you to get her things from his shared locker. */
=== cheerleader_request ===
~ cheerleaderState = quest
TODO: write cheerleader followup convo
"How'd your revenge go with Lance?"
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
"I got your stuff from the locker."
"Thanks for helping me out." She rummages through the items in the bag. {cum_in_cheerleader_panties: She picks up the panties you jerked off with. They look sticky, and there's a noticable cum stain. She frowns, and your heart skips a beat. "Ew, did {JOCK} jerk off with these? He's such a creep, I should have broken up with him sooner."} Turning her attention back to you, she bites her lip and says "{current_location == UNDER_BLEACHERS:Come here, let me|Meet me under the bleachers again after school, so I can} show you how grateful I am."
->->

/* After offering to reward you, you meet her under the bleachers again, and have sex. */
=== cheerleader_reward ===
~ cheerleaderState = complete
~ cheerleaderScore++
TODO: write cheerleader reward encounter intro
"Let me show you how grateful I am."
-> cheerleader_sex ->
->->

/* After having sex, you ask if she wants to do it again. */
=== cheerleader_replay ===
~ cheerleaderState = repeat
TODO: write cheerleader repeat convo
"Fancy a repeat?"
"Fuck yeah{current_location == UNDER_BLEACHERS:.|, meet me behind the bleachers again after school.}"
->->

/* After asking to have sex again, you meet her under the bleachers again. */
=== cheerleader_reward_repeat ===
~ cheerleaderState = complete
TODO: write cheerleader repeat encounter intro
"Let's do it again."
-> cheerleader_sex ->
->->

/* You fuck the cheerleader (broken out for replay) */
=== cheerleader_sex ===
TODO: write cheerleader sex encounter
Michelle pulls you into a passionate kiss, and moments later, she's dropped her panties and braced herself as you enter her from behind. She bites her lip to keep from crying out as you fuck her deep, blowing your load inside.
You pull up your pants, give her a kiss, and turn away.
->->
