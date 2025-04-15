/*
 * The Study Hall
 *
 * 1. Believer, Cheerleader, Nympho
 * 2. ---
 * 3. Rebel, Gossip, Nerd
 * 4. Rebel
 *
 * - Sex with Rebel once unsupervised
 */
=== study_hall ===
VAR study_hall_supervised = true
~ current_location = -> study_hall
Welcome to study hall

- (opts)
* {now == morning and cheerleaderState == intel} [Observe {CHEERLEADER}]
    -> observe_cheerleader ->
+ {now == morning} [Talk to {BELIEVER}]
    -> talk_to_believer ->
+ {now == morning} [Talk to {CHEERLEADER}]
    -> talk_to_cheerleader ->
+ {now == morning} [Talk to {NYMPHO}]
    -> talk_to_nympho ->

+ {now == afternoon} [Talk to {GOSSIP}]
    -> talk_to_gossip ->
+ {now == afternoon} [Talk to {NERD}]
    -> talk_to_nerd ->
+ {now == afternoon or now == afterschool} [Talk to {REBEL}]
    -> talk_to_rebel ->

+ [Leave the study hall]
    -> pass_time -> hallway
- -> opts
