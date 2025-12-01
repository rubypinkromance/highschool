/*
    Teacher: Nina Honeydew
    Looks like Eva Green: black hair, big lips, huge tits, big puffy nipples, full bush.
    Sweet, but easy to manipulate, sends girls home early for cramps
    Likes sweet
    Dslikes sarcasm
    Nurse can be convinced to get you off if you get hard during an exam. Escalating arousal but if you push too hard she leaves
    Escalating handjob > blowjob, cum on tits, cum on face, cum in mouth, matching stepmom porn series.
*/
CONST NURSE = "Nurse Honeydew"
CONST NURSE_TITLE = ""
LIST NurseState = (NurseObserved)
VAR NurseInPlay = false
VAR NurseMood = Neutral
VAR NurseBaseMood = Neutral

/*

    Talk to Nurse

*/
=== talk_to_nurse ===
~ last_girl = Nurse

Approach {NURSE}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "36D."
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave conversation]
    ->->
- -> opts

/*

    Observe Nurse

*/
=== observe_nurse ===
~ last_girl = Nurse
~ NurseState = NurseObserved
With nothing else to distract you as she does paperwork, you find your eyes landing on {NURSE}, who turns out to be surprisingly hot. She has pale skin and long, wavy black hair pulled into a ponytail. Her nurse’s scrubs do little conceal that she has huge boobs. You wonder what her nipples look like, and how she would respond if you sucked on them.
Her lips are plump, and you wonder what it would be like to kiss them. Or rub them with the head of your cock. You imagine them parting, and her tongue flicking against the tip. You’re halfway lost in the fantasy of playing doctor with the hot nurse when she glances up at you and smiles. Cheeks burning, you quickly look away, praying she didn’t notice the way you were looking at her.
->->

/*

    Nurse Treats Your Black Eye

*/
=== nurse_treat_black_eye ===
“Oh, that looks like it hurts,” {NURSE} tuts with concern. She has you sit on the chair by her desk holding a ice pack wrapped in a towel against your face.
    + + [Wait]
    + + [Check out {NURSE}] -> observe_nurse ->
    - -
After about fifteen minutes, she take the ice pack and examines your eye.
“Oh good, that swelling came right down. You’ll have a bruise for about a week, but you should be able to go back to class now.”
->->

/*

    Dream About Nurse

*/
=== dream_of_nurse ===
You have {dream_of_cheerleader > 1:another|a} filthy dream about {NURSE}. <>
{ shuffle:
- You have your face buried between her huge tits. They are impossibly soft and warm. She giggles as you nuzzle deeper into her cleavage, and takes your cock in her hand. Your moans are muffled by her breasts as she expertly strokes your shaft.
- You are laying naked on a table as she examines you under a bright light. Her inspection is embarrassingly thorough, and you are worried how she will react when she notices your painfully erect cock. To your surprise, she wraps a warm hand around the base of your shaft, and pulls you into the heat of her mouth. Without saying a word, she begins sucking your cock impossibly deep, taking notes as if this is just part of the exam.
- She is typing on her computer, and somehow you are thrusting your cock between her huge tits. She looks up at you with a distracted smile on her face, as if this sort of thing happens all the time.
}
<>{isDayWeekend(tomorrow()): Before you can cum, you wake up tangled in your sheets.| Before you can cum, the school bell rings, louder and louder, the sound distorting until it becomes the beeping of your alarm clock.}
->->

/*

    Nurse Hints

*/
=== nurse_hints ===
Try observing {NURSE}.
->->
