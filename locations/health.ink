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
Welcome to health class

- (opts)
+ {now == morning} [Talk to {REBEL}] -> talk_to_rebel ->
+ {now == morning} [Talk to {ACTOR}] -> talk_to_actor ->
+ {now == afternoon} [Talk to {ATHLETE}] -> talk_to_athlete ->
+ {now == afternoon} [Talk to {TWIN1}] -> talk_to_twin1 ->
+ {now != lunch} [Talk to {TEACHER}] -> talk_to_teacher ->
+ [Leave the health classroom] -> pass_time -> hallway
- -> opts
