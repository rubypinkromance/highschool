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
CONST STUDY_HALL = "study hall"
~ current_location = STUDY_HALL
You are in the {STUDY_HALL}.

- (opts)
* {now == morning and cheerleaderState == intel} [Observe {CHEERLEADER}]
    -> observe_cheerleader ->
+ {now == morning} [Approach {BELIEVER}]
    -> talk_to_believer ->
+ {now == morning} [Approach {CHEERLEADER}]
    -> talk_to_cheerleader ->
+ {now == morning} [Approach {NYMPHO}]
    -> talk_to_nympho ->

+ {now == afternoon} [Approach {GOSSIP}]
    -> talk_to_gossip ->
+ {now == afternoon} [Approach {NERD}]
    -> talk_to_nerd ->
+ {now == afternoon or now == afterschool} [Approach {REBEL}]
    -> talk_to_rebel ->

+ [Leave the {STUDY_HALL}]
    -> pass_time -> hallway
- -> opts
