/*
- Stepsister: Alice
- Jade Jones: shaggy black hair, averge build, large tits, 34C, shaved
- Outfit: TBD, black with pink polkadots underwear and bra.
? intel: read diary confessing sexual fantasies
? recon: spy on her masturbating in shower
? convo: confess you watch stepsister porn
    - likes flirty
    - dislikes serious
* Masturbate together while she showers (have to be quiet!)
* Sex in her room that night
- 1: ---      - Bedroom
- 2: ---      - Bra tore
- L: ---      - DressStore
- 3: ---      - ShoeStore
- 4: ---      - Bedroom
- A: Bathroom - Bathroom
- N: Bedroom  - Bedroom

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
*/
CONST SIS = "Alice"
CONST SIS_TITLE = "your stepsister"
LIST SisState = (SisObserved), SisIsLesbian, SisIsBi
VAR SisMood = Friendly
VAR SisBaseMood = Friendly
LIST SisItems = SisPanties, SisDiary

=== talk_to_stepsister ===
~ last_girl = Stepsister

Approach {SIS}.

- (opts)
+ "What's your bra size?"
    "34C, bro."
+ "Wanna fuck?"
    "Sure, why not?"
    -> fuck_stepsister ->->
+ [Leave her alone] ->->
- -> opts

=== observe_stepsister ===
~ last_girl = Stepsister
~ SisState += SisObserved
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
+ [Fuck her] -> fuck_stepsister ->->
+ [Turn away] ->->
- -> opts

=== fuck_stepsister ===
This is it, you're finally going to fuck {SIS}.

- (opts)
+ "Suck my cock"
    She swallows your shaft eagerly.
+ [Pinch nipples]
    You pinch her nipples, making her squirm
+ [Bend her over]
    You bend her over and fuck her desperately from behind, until she moans as you pump your load into her tight pussy.
+ [Walk away] ->->
- -> opts

/* After finding a pair of her panties in her ex's locker, you jerk off with them. */
=== stepsister_panties ===
~ last_girl = Stepsister
~ cum_today = true
Unable to resist the urge, you wrap {SIS}'s silky panties around your cock. Quickly, it swells to life, the fabric deliciously stimulating. You thrust and strain into the panties, imagining her putting them on. The head of your cock slips into the gusset, which is enough to push you over the edge, and you blow your load imagining her putting the wet panties on, feeling your cum on her lips.
Afterwards, you feel sheepish, and do your best to wipe up the mess, before returning her panties to the tote bag.
->->

=== dream_of_stepsister ===
You have a filthy dream about {SIS}.
->->
