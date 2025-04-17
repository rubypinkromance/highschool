/*
 * The Health Classroom
 *
 * 1. Teacher, Rebel, Actor
 * 2. Teacher
 * 3. Teacher, Athlete, Twin 1
 * 4. Teacher
 *
 * - Sex with Teacher
 */
=== health ===
CONST HEALTH = "health classroom"
~ current_location = HEALTH
You are in the {HEALTH}.

- (opts)
+ {now == morning} [Approach {REBEL}]
    -> talk_to_rebel ->
+ {now == morning} [Approach {ACTOR}]
    -> talk_to_actor ->

+ {now == afternoon} [Approach {ATHLETE}]
    -> talk_to_athlete ->
+ {now == afternoon} [Approach {TWIN1}]
    -> talk_to_twin1 ->

+ {now != lunch} [Approach {TEACHER}]
    -> talk_to_teacher ->

+ [Leave the {HEALTH}]
    -> pass_time -> hallway
- -> opts
