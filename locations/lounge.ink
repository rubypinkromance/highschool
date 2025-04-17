/*
 * The Teacher's Lounge
 *
 * 1. ---
 * 2. Teacher
 * 3. ---
 * 4. empty
 *
 * - Sex with Gossip
 */
=== lounge ===
VAR has_lounge_invite = false
CONST LOUNGE = "teacher’s lounge"
~ current_location = LOUNGE
You are in the {LOUNGE}.

- (opts)
+ {now == lunch} [Approach {TEACHER}]
    -> talk_to_teacher ->
+ [Leave the {LOUNGE}]
    -> pass_time -> hallway
- -> opts
