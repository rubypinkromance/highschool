/*
 * The Athletics Field
 *
 * 1. ---
 * 2. Athlete
 * 3. ---
 * 4. Cheerleader
*/
=== field ===
CONST FIELD = "athletic field"
~ here = FIELD
You are in the {FIELD}.

- (opts)
+ {now == lunch} [Approach {ATHLETE}]
    -> talk_to_athlete ->

* {now == afterschool and cheerleaderState == intel} [Observe {CHEERLEADER} and {JOCK}]
    -> observe_cheerleader ->
+ {now == afterschool and cheerleaderState < revenge} [Approach {CHEERLEADER}]
    -> talk_to_cheerleader ->

+ [Sit on the {BLEACHERS}]
    -> bleachers
+ [Go {UNDER_BLEACHERS}]
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
CONST BLEACHERS = "bleachers"
~ here = BLEACHERS
You are in the {BLEACHERS}.

The bleachers overlooking the athletic field

- (bleachers_opts)
+ {now == lunch} [Approach {PHOTOGRAPHER}]
    -> talk_to_photographer ->
+ {now == afterschool} [Approach {GOSSIP}]
    -> talk_to_gossip ->
+ [Leave the {BLEACHERS}]
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
CONST UNDER_BLEACHERS = "under the bleachers"
~ here = UNDER_BLEACHERS
You are {UNDER_BLEACHERS}.

- (under_opts)
+ {now == lunch} [Approach {REBEL}]
    -> talk_to_rebel ->
+ {now == afterschool and cheerleaderState >= revenge} [Approach {CHEERLEADER}]
    -> talk_to_cheerleader ->
+ [Leave the bleachers]
    -> field
- -> under_opts
