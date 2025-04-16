/*
 * The Gym
 *
 * 1. Athlete, Scientist
 * 2. ---
 * 3. Twin 2, Queen
 * 4. Athlete
 */
=== gym ===
~ current_location = -> gym
The gymnasium

- (opts)
+ {now == morning or now == afterschool} [Approach {ATHLETE}]
    -> talk_to_athlete ->
+ {now == morning} [Approach {SCIENTIST}]
    -> talk_to_scientist ->

+ {now == afternoon} [Approach {TWIN2}]
    -> talk_to_twin2 ->
+ {now == afternoon} [Approach {QUEEN}]
    -> talk_to_queen ->

+ [Go to the locker room]
    -> locker_room
+ [Leave the gym]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * Locker Rooms
 *
 * - Sex with Athlete
 */
= locker_room
~ current_location = -> locker_room
The girl's locker room
+ [Leave the locker room] -> gym
