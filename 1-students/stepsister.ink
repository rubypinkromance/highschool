/*
- Stepsister: Heather
- Looks like Jade Jones: shaggy black hair, averge build, large tits, 34C, shaved
- Outfit: TBD, black with pink polkadots underwear and bra.
? intel: read diary confessing sexual fantasies
? recon: spy on her masturbating in shower
? convo: confess you watch stepsister porn
    - likes flirty
    - dislikes serious
* Masturbate together while she showers (have to be quiet!)
* Sex in her room that night
- 1: ---      - Bedroom
- 2: ---      - BraStore
- L: ---      - DressStore
- 3: ---      - ShoeStore
- 4: ---      - Bedroom
- A: Bathroom - Bathroom
- N: Bedroom  - Bedroom

- Sis goes to all girl school with friend
- Diary entry about having to pretend to be upset about a school with no boys, but she's secretly into girls.
- Peep in shower, jerk off in panties, read diary, ask for viagra help.
- I’m not your little sister. We’re the same age and not related.
- Forced to share a bed?
- Sis has a diary revealing her fantasies about you and exploring bisexuality with her best friend. New entries appear every few days.
- If you fuck Sis & Friend, you unlock a threesome
- Can’t snoop sis room if she’s there
- Sis laptop is broken. Mom and Dad won’t replace it. She borrows yours. After, tells you she saw stepsister porn in your browser history. Asks if you’re into that
- One Saturday you go to get your laptop back and walk in on Sis and Friend having sex
- Sis friend goes to Catholic school wears uniform. She shows up one night wearing her little sisters uniform. The skirt is very short
- Sis and friend do a fashion show for you, wanting a guys opinion. Giggling from closet
- Sis in towel. Was that you in the bathroom just now? Were you watching me get off? Did you jerk off too?
- Sis friend catches you peeping in the shower. Stays to help. Once peeped on you, fantasized you were cumming on her
*/
CONST SIS = "Heather"
CONST SIS_TITLE = "your stepsister"
LIST SisState = (SisObserved), SisIsLesbian, SisIsBi, SisSex
VAR SisInPlay = true
VAR SisMood = Friendly
VAR SisBaseMood = Friendly
VAR SisCum = ()
LIST SisItems = SisPanties, SisDiary

=== talk_to_stepsister ===
~ last_girl = Stepsister

Approach {SIS}.

- (opts)
* {confidence >= Confident}"What's your bra size?"
    "34C, bro."
+ {DEBUG}"Wanna fuck?"
    "Sure, why not?"
    -> stepsister_sex ->->
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
- -> opts

=== observe_stepsister ===
~ last_girl = Stepsister
~ SisState = SisObserved
Coming soon.
->->

=== look_at_stepsister ===
Look at {SIS}.
- (opts)
+ [Check her out]
    She's smoking hot, man.
+ [Get closer]
    Fucking hell, she's hawt
+ [Touch yourself]
    You start wanking to the sight of your stepsister.
+ [Fuck her] -> stepsister_sex ->->
+ [Turn away] ->->
- -> opts

=== stepsister_sex ===
{ stepsister_sex == 1:
    ~ Score += sisSex
    ~ improveConfidence()
    ~ SisBaseMood = Aroused
}
~ SisState = SisSex
~ cum_today = true
This is it, you're finally going to fuck {SIS}.
- (stepsister_sex_opts)
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
- -> stepsister_sex_opts

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

/* After finding a pair of her panties, you jerk off with them. */
=== stepsister_panties ===
~ last_girl = Stepsister
~ cum_today = true
~ Score += cheerleaderPanties
Unable to resist the urge, you wrap {SIS}'s lacy panties around your cock. Quickly, it swells to life, the fabric deliciously stimulating. You thrust and strain into the panties, imagining her putting them on. The head of your cock slips into the gusset, which is enough to push you over the edge, and you blow your load imagining her putting the wet panties on, feeling your cum on her lips.
Afterwards, you feel sheepish, and do your best to clean up the mess.
->->

=== dream_of_stepsister ===
You have a filthy dream about {SIS}.
->->

=== stepsister_hints ===
Try observing {SIS}.
->->
