/*
- Stepsister: Claire
    - Alison Pill: straight blonde hair, medium boobs, small pokey nipples, shaved, black with pink polkadots underwear and bra.
    ? intel: read diary confessing sexual fantasies
    ? recon: spy on her masturbating in shower
    ? convo: confess you watch stepsister porn
        - likes flirty
        - dislikes serious
    * Masturbate together while she showers (have to be quiet!)
    * Sex in her room that night
    - 1-3: Unavailable
    - 4: Bathroom
*/
CONST STEPSISTER = "Claire"

=== talk_to_stepsister ===
Talk to {STEPSISTER}.
- (opts)
    + "What's your bra size?"
        "36C, bro."
    + "Wanna fuck?"
        "Sure, why not?" -> fuck_stepsister ->->
    + [Leave her alone] ->->
- -> opts

=== look_at_stepsister ===
Look at {STEPSISTER}.
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

This is it, you're finally going to fuck {STEPSISTER}.

- (opts)
    + "Suck my cock"
        She swallows your shaft eagerly.
    + [Pinch nipples]
        You pinch her nipples, making her squirm
    + [Bend her over]
        You bend her over and fuck her desperately from behind, until she moans as you pump your load into her tight pussy.
    + [Walk away] ->->
- -> opts
