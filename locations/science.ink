/*
 * The Science Lab
 *
 * 1. Gossip, Nerd
 * 2. ---
 * 3. Scientist, Nympho
 * 4. Scientist
 *
 * - Sex with Scientist
 */
=== science ===
~ current_location = -> science
Welcome to science class

- (opts)
+ {now == morning} [Approach {GOSSIP}]
    -> talk_to_gossip ->
+ {now == morning} [Approach {NERD}]
    -> talk_to_nerd ->

+ {now == afternoon} [Approach {NYMPHO}]
    -> talk_to_nympho ->
+ {now == afternoon or now == afterschool} [Approach {SCIENTIST}]
    -> talk_to_scientist ->

+ [Leave the science classroom]
    -> pass_time -> hallway
- -> opts
