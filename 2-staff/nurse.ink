/*
- Teacher: Nina Honeydew
- Looks like Eva Green: black hair, big lips, huge tits, big puffy nipples, full bush.
- Nurse has dialog for ouch my balls and fighting
? intel: Sweet, but easy to manipulate, sends girls home early for cramps
? recon:
? convo:
    - likes sweet
    - dislikes sarcasm
* Convince to leave to steal meds
* HJ after taking viagra, unable to cum
* Fuck after catching her watching you masturbate
* Nurse can be convinced to get you off if you get hard. Escalating arousal but if you push too hard she leaves
*/
CONST NURSE = "Ms. Honeydew"
CONST NURSE_TITLE = "the nurse"
LIST NurseState = (NurseObserved)
VAR NurseInPlay = false
VAR NurseMood = Neutral
VAR NurseBaseMood = Neutral

=== talk_to_nurse ===
~ last_girl = Nurse

Approach {NURSE}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "36D."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
- -> opts

=== observe_nurse ===
~ last_girl = Nurse
~ NurseState = NurseObserved
Coming soon.
->->

=== look_at_nurse ===
With nothing else to distract you as she does paperwork, you find your eyes landing on {NURSE}, who turns out to be surprisingly hot. She has pale skin and long, wavy black hair pulled into a ponytail. Her nurse’s scrubs do little conceal that she has huge boobs. You wonder what her nipples look like, and how she would respond if you sucked on them.
Her lips are plump, and you wonder what it would be like to kiss them. Or rub them with the head of your cock. You imagine them parting, and her tongue flicking against the tip. You’re halfway lost in the fantasy of playing doctor with the hot nurse when she glances up at you and smiles. Cheeks burning, you quickly look away, praying she didn’t notice the way you were looking at her.
->->

=== nurse_treat_black_eye ===
{NURSE} sees your black eye and tuts with concern. “Oh, that looks like it hurts, hon. Do you want some ice for it?”
+ “I’m fine.”
    “Okay, well, let me know if you need anything.”
    ->->
+ “Yes, please.”
    She has you sit on the chair by her desk holding a ice pack wrapped in a towel against your face.
    + + [Wait]
    + + [Check out {NURSE}] -> look_at_nurse ->
    - -
After about fifteen minutes, she take the ice pack and examines your eye.
“Oh good, that swelling came right down. You’ll have a bruise for about a week, but you should be able to go back to class now.”
->->

=== nurse_treat_balls ===
“Oh you poor dear,” {NURSE} frets when you limp in the door. She quickly gets you laid down on a small bed in the {EXAM_AREA}, pulling the curtain shut for privacy. You can hear her talking to {REBEL}, who explains what happened.
She returns a moment later with an ice pack wrapped in a towel and a few asprin. “Now, you just lay here and let the ice do the work, hon. After that swelling comes down some, we’ll have a look.” She leaves again, closing the curtain behind her.
+ + [Wait]
+ + [Breathe]
    Time passes as you focus on breathing through the pain.
+ + [Worry]
    Your brain spins up worst-case scenarios. You imagine the horrified expression on her face as she examines your poor testicles. “I didn’t even know they <em>could</em> explode,” she exclaims.
- -
After a bit, {NURSE} returns and takes the ice pack. Despite everything, you do feel better. Enough to feel awkward when she asks you to take your pants and underwear off.
She turns away to wash her hands in the sink as you sheepishly scoot your jeans and boxers down around your ankles. Even with the curtain drawn, you feel very exposed lying there. Anyone could open the curtain, and then all anyone would remember about you was the time you had your dick out in the {CLINIC}.
{NURSE} turns around, snapping latex gloves on. To your great relief, she behaves as if there were nothing unusual about you lying there with no pants on. Gently, she examines your scrotum, lifting and lightly prodding.
“How’s that feel? Still a bit tender?”
+ + “It’s fine.”
+ + “A bit.”
+ + “That tickles.”
    She chuckles. “Sorry, hon. I'll be done soon.”
- -
The examination seems to drag, until you realize with dawning horror that your body is having a involuntary reaction. She’s leaned over for a better look, and her face is so close that you can feel her warm breath on your balls. You shiver, and try not to look at her lips, and imagine them on your skin. Your cock twitches, pulsing with your heart beat. You pray she doesn't notice it beginning to swell to life.
Suddenly, she touches it, moving it to the side! Just part of the exam, you tell yourself, but you still let out an involuntary squeak.
“Oh no,” she gasps, sitting up. “Did I hurt you? I was just thinking everything looks well, but if that hurt, maybe you need to go to…” She trails off as she sees how quickly your shaft growing. Your cheeks are burning with humiliation, but your cock is throbbing and straining upward, desperate to be touched.
“I see,” she says flatly, and gets to her feet and slips through the curtain. “I’ll be right back.”
+ + [Wait]
+ + [Make a break for it]
    You’d rather die than stick around waiting for her to return. Awkwardly, you start trying to pull your pants up.
+ + [Quickly rub one out]
    You consider leaving, but walking out with an erection this obvious would cause other problems. There’s only one solution you can think of. You’ll need to quickly jerk off, then you can go back to class and pretend this never happened. But before you can start, <>
- -
{NURSE} suddenly slips back through the curtain.
TO BE CONTINUED
TODO: finish scene
->->

=== dream_of_nurse ===
You have a filthy dream about {NURSE}.
->->

=== nurse_hints ===
Try observing {NURSE}.
->->
