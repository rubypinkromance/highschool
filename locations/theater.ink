/*
 * The Theater
 *
 * 1. Twin 2, Photographer
 * 2. ---
 * 3. Actor, Cheerleader
 * 4. Actor
 */
=== theater ===
CONST THEATER = "theater"
~ current_location = THEATER
You are in the {THEATER}.

- (opts)
+ {now == morning} [Approach {TWIN1}]
    -> talk_to_twin1 ->
+ {now == morning} [Approach {PHOTOGRAPHER}]
    -> talk_to_photographer ->

* {now == afternoon and cheerleaderState == intel } [Observe {CHEERLEADER}]
    -> observe_cheerleader ->
+ {now == afternoon} [Approach {CHEERLEADER}]
    -> talk_to_cheerleader ->
+ {now == afternoon or now == afterschool} [Approach {ACTOR}]
    -> talk_to_actor ->

+ [Go {BACKSTAGE}]
    -> backstage
+ [Leave the {THEATER}]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * The Backstage
 *
 * - Sex with actor
 */
= backstage
CONST BACKSTAGE = "backstage"
~ current_location = BACKSTAGE
You are {BACKSTAGE}.

+ [Leave {BACKSTAGE}] -> theater
