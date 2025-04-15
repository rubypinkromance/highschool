/*
 * The Photography Classroom
 *
 * 1. Twin 1, Queen
 * 2. ---
 * 3. Photographer, Believer
 * 4. Photographer
 */
=== photography ===
~ current_location = -> photography
Welcome to photography class

- (opts)
+ {now == morning} [Talk to {TWIN1}]
    -> talk_to_twin1 ->
+ {now == morning} [Talk to {QUEEN}]
    -> talk_to_queen ->

+ {now == afternoon} [Talk to {BELIEVER}]
    -> talk_to_believer ->
+ {now == afternoon or now == afterschool} [Talk to {PHOTOGRAPHER}]
    -> talk_to_photographer ->

+ [Go to the darkroom]
    -> darkroom
+ [Leave the photography classroom]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * The Darkroom
 *
 * - Sex with Photographer
 */
= darkroom
~ current_location = -> darkroom
It's very dark in here!
+ [Leave the darkroom] -> photography
