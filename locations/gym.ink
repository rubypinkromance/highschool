/*
 * The Gym
 *
 * 1. Athlete, Scientist
 * 2. ---
 * 3. Twin 2, Queen
 * 4. Athlete
 */
=== gym ===
The gymnasium

- (opts)
+ {now == morning or now == afterschool} [Talk to {ATHLETE}] -> talk_to_athlete ->
+ {now == morning} [Talk to {SCIENTIST}] -> talk_to_scientist ->
+ {now == afternoon} [Talk to {TWIN2}] -> talk_to_twin2 ->
+ {now == afternoon} [Talk to {QUEEN}] -> talk_to_queen ->
+ [Go to the locker room] -> locker_room
+ [Leave the gym] -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * Locker Rooms
 *
 * - Sex with Athlete
 */
= locker_room
The girl's locker room
+ [Leave the locker room] -> gym
