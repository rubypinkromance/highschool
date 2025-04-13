/*
- Cheerleader: Michelle
    - Kayley Cuoco: bleached blonde ponytail, cheerleader uniform, sports bra, big tits, big nipples, 34-25-36
        - likes flirty
        - dislikes sweet
    ? intel: heard her and boyfriend have been fighting, not sure why
    ? recon: observe boyfriend flirting with another girl in study hall
    a. convo: suggest revenge
    b. meet for titjob
    c. convo: worked well, he was a dick, i broke up with him, can you get my things from his locker? Combo is my measurements.
    d. get her things, see bag of weed
    e. - go to office, report weed
       - talk to jock, threaten to report weed
       - fight jock (black eye, he breaks hand)
    f. convo: that was hot, meet me under bleachers
    g. meet for sex
    * titjob+facial pics to make jock jealous
    * Sex under bleachers after boyfriend dealt with
    - 1: Study Hall
    - 2: Cafeteria
    - 3: Theater
    - 4: Field
*/
CONST CHEERLEADER = "Michelle"
LIST cheerleaderState = intel, recon, revenge, quest, has_stuff, reward, complete
VAR cheerleaderScore = 0

=== talk_to_cheerleader ===
Talk to {CHEERLEADER}.
- (opts)
    * {cheerleaderState == recon} [Suggest revenge]
        -> suggest_cheerleader_revenge ->
    * {cheerleaderScore == 1} [Follow up]
        -> cheerleader_request ->
    * {cheerleaderState == has_stuff} [Deliver her stuff]
        -> deliver_cheerleader_stuff ->
    * "What's your bra size?"
        "36C."
    + [Leave her alone]
        ->->
- -> opts

=== observe_cheerleader ===
~ cheerleaderState = recon
You keep an eye on Michelle and Lance, looking for any clue of what they might be fighting about. It doesn't take long for you to notice that Lance is shamelessly flirting with another girl. Michelle is shooting daggers at him, but he's too distracted to notice. An idea forms in your head. You should talk to Michelle
->->

=== suggest_cheerleader_revenge ===
~ cheerleaderState = revenge
"Your boyfriend sucks."
"Yeah he does. Meet me under the bleachers after school"
->->

=== cheerleader_revenge ===
~ cheerleaderScore++
Michelle wastes no time pulling out your cock and shoving it between her tits. A few eager pumps later, you shoot your load all over her chest. She eagerly snaps a few photos and sends them to Lance.
"That'll teach him," she smirks. "Thanks for your help."
"Anytime," you grin, leaving her to her revenge.
You should probably follow up with her tomorrow to see how it worked.
->->

=== cheerleader_request ===
~ cheerleaderState = quest
"How'd your revenge go with Lance?"
"Oh he was a total bitch about it. Said some awful shit. I dumped his ass. Say, do you think you could do me a favor? Some of my stuff is in his locker, and I don't want to deal with him. Could you get it for me?"
"Sure, what's the combination?"
"He set it to my measurements: 34-25-36."
->->

=== cheerleader_locker ===
~ cheerleaderState = has_stuff
~ saw_weed = true
You enter the combination for the locker, and it opens. Inside you find a cheerleading camp tote bag. You grab the things that are obviously Michelle's including some lipstick, a girl's jacket, and some panties.
* [Close the locker] ->->

=== jerk_off_with_cheerleader_panties ===
Unable to resist the urge, you wrap Michelle's silky panties around your cock. Quickly, it swells to life, the fabric deliciously stimulating. You thrust and strain into the panties, imagining her putting them on. The head of your cock slips into the gusset, which is enough to push you over the edge, and you blow your load imagining her putting the wet panties on, feeling your cum on her lips.
Afterwards, you feel sheepish, and do your best to wipe up the mess, before returning her panties to the tote bag.
->->

=== deliver_cheerleader_stuff ===
~ cheerleaderState = reward
"I got your stuff from the locker."
"Thanks for helping me out. Meet me under the bleachers again so I can thank you properly."
->->

=== cheerleader_reward ===
~ cheerleaderState = complete
~ cheerleaderScore++
Michelle pulls you into a passionate kiss, and moments later, she's dropped her panties and braced herself as you enter her from behind. She bites her lip to keep from crying out as you fuck her deep, blowing your load inside.
You pull up your pants, give her a kiss, and turn away.
->->