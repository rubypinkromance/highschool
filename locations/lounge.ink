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
~ current_location = -> lounge
The teacher's lounge

- (opts)
+ {now == lunch} [Approach {TEACHER}]
    -> talk_to_teacher ->
+ [Leave the teacher's lounge]
    -> pass_time -> hallway
- -> opts
