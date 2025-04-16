/*
 * The Athletics Field
 *
 * 1. ---
 * 2. Athlete
 * 3. ---
 * 4. Cheerleader
*/
=== field ===
~ current_location = -> field
The athletic field

- (opts)
+ {now == lunch} [Approach {ATHLETE}]
    -> talk_to_athlete ->
+ {now == afterschool and cheerleaderState < revenge} [Approach {CHEERLEADER}]
    -> talk_to_cheerleader ->
+ [Sit on the bleachers]
    -> bleachers
+ [Go under the bleachers]
    -> under_bleachers
+ [Go back inside]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * Bleachers
 *
 * 1. ---
 * 2. Photographer (walking around)
 * 3. ---
 * 4. Gossip
 */
= bleachers
~ current_location = -> bleachers
The bleachers overlooking the athletic field

- (bleachers_opts)
+ {now == lunch} [Approach {PHOTOGRAPHER}]
    -> talk_to_photographer ->
+ {now == afterschool} [Approach {GOSSIP}]
    -> talk_to_gossip ->
+ [Leave the bleachers]
    -> field
- -> bleachers_opts

/*
 * =============================================
 * Under Bleachers
 *
 * 1. ---
 * 2. Rebel (smoking)
 * 3. ---
 * 4. empty
 *
 * - Sex with Cheerleader
 */
= under_bleachers
~ current_location = -> under_bleachers
Under the bleachers

- (under_opts)
+ {now == lunch} [Approach {REBEL}]
    -> talk_to_rebel ->
* {now == afterschool and cheerleaderState == revenge} [Approach {CHEERLEADER}]
    -> cheerleader_revenge ->
* {now == afterschool and cheerleaderState == reward} [Approach {CHEERLEADER}]
    -> cheerleader_reward ->
+ {now == afterschool and cheerleaderState == repeat} [Approach {CHEERLEADER}]
    -> cheerleader_reward_repeat ->
+ [Leave the bleachers]
    -> field
- -> under_opts
