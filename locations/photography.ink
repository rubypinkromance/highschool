/*
 * The Photography Classroom
 *
 * 1. Twin 1, Queen
 * 2. ---
 * 3. Photographer, Believer
 * 4. Photographer
 */
=== photography ===
CONST PHOTOGRAPHY = "photography classroom"
~ here = PHOTOGRAPHY
You are in the {PHOTOGRAPHY}.

- (opts)
+ {now == morning} [Approach {TWIN1}]
    -> talk_to_twin1 ->
+ {now == morning} [Approach {QUEEN}]
    -> talk_to_queen ->

+ {now == afternoon} [Approach {BELIEVER}]
    -> talk_to_believer ->
+ {now == afternoon or now == afterschool} [Approach {PHOTOGRAPHER}]
    -> talk_to_photographer ->

+ [Go to the {DARKROOM}]
    -> darkroom
+ [Leave the {PHOTOGRAPHY}]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * The Darkroom
 *
 * - Sex with Photographer
 */
= darkroom
CONST DARKROOM = "darkroom"
~ here = DARKROOM
You are in the {DARKROOM}.

It's very dark in here!
+ [Leave the {DARKROOM}] -> photography
