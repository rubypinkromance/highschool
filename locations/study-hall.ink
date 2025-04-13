/*
 * The Study Hall
 *
 * 1. Believer, Cheerleader
 * 2. ---
 * 3. Rebel, Gossip, Nerd
 * 4. Rebel
 *
 * - Sex with Rebel once unsupervised
 */
=== study_hall ===
Welcome to study hall

- (opts)
+ {now == morning} [Talk to {BELIEVER}] -> talk_to_believer ->
+ {now == morning} [Talk to {CHEERLEADER}] -> talk_to_cheerleader ->
+ {now == afternoon} [Talk to {GOSSIP}] -> talk_to_gossip ->
+ {now == afternoon} [Talk to {NERD}] -> talk_to_nerd ->
+ {now == afternoon or now == afterschool} [Talk to {REBEL}] -> talk_to_rebel ->
+ [Leave the study hall] -> pass_time -> hallway
- -> opts
