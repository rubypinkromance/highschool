/*
 * The Athletics Field
 *
 * 1. ---
 * 2. Athlete
 * 3. ---
 * 4. Cheerleader
*/
=== field ===
The athletic field

- (opts)
+ {now == lunch} [Talk to {ATHLETE}]
    -> talk_to_athlete ->
+ {now == afterschool and cheerleaderState < revenge} [Talk to {CHEERLEADER}]
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
The bleachers overlooking the athletic field

- (bleachers_opts)
+ {now == lunch} [Talk to {PHOTOGRAPHER}]
    -> talk_to_photographer ->
+ {now == afterschool} [Talk to {GOSSIP}]
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
Under the bleachers

- (under_opts)
+ {now == lunch} [Talk to {REBEL}]
    -> talk_to_rebel ->
* {now == afterschool and cheerleaderState == revenge} [Talk to {CHEERLEADER}]
    -> cheerleader_revenge ->
* {now == afterschool and cheerleaderState == reward} [Talk to {CHEERLEADER}]
    -> cheerleader_reward ->
+ {now == afterschool and cheerleaderState == repeat} [Talk to {CHEERLEADER}]
    -> cheerleader_reward_repeat ->
+ [Leave the bleachers]
    -> field
- -> under_opts
