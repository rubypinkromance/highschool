/*
 * The Science Lab
 *
 * 1. Gossip, Nerd
 * 2. ---
 * 3. Scientist
 * 4. Scientist
 *
 * - Sex with Scientist
 */
=== science ===
Welcome to science class

- (opts)
+ {now == morning} [Talk to {GOSSIP}] -> talk_to_gossip ->
+ {now == morning} [Talk to {NERD}] -> talk_to_nerd ->
+ {now == afternoon or now == afterschool} [Talk to {SCIENTIST}] -> talk_to_scientist ->
+ [Leave the science classroom] -> pass_time -> hallway
- -> opts
