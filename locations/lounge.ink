/*
 * The Teacher's Lounge
 *
 * 1. ---
 * 2. ---
 * L. Teacher
 * 3. ---
 * 4. ---
 * A. ---
 *
 * - Sex with Gossip
 */
=== lounge ===
CONST LOUNGE = "teacher’s lounge"
VAR LoungePeople = ()
~ here = LOUNGE

You are in the {LOUNGE}.

- (opts)
<- talkToAllCharacters(LoungePeople, -> lounge.opts)

+ [Leave the {LOUNGE}]
    -> pass_time -> hallway
- -> opts
