/*
 * The Theater
 *
 * 1. Twin 2, Photographer
 * 2. ---
 * 3. Actor, Cheerleader
 * 4. Actor
 */
=== theater ===
Welcome to theater class

- (opts)
+ {now == morning} [Talk to {TWIN1}]
    -> talk_to_twin1 ->
+ {now == morning} [Talk to {PHOTOGRAPHER}]
    -> talk_to_photographer ->

* {now == afternoon and cheerleaderState == intel } [Observe {CHEERLEADER}]
    -> observe_cheerleader ->
+ {now == afternoon} [Talk to {CHEERLEADER}]
    -> talk_to_cheerleader ->
+ {now == afternoon or now == afterschool} [Talk to {ACTOR}]
    -> talk_to_actor ->

+ [Go backstage]
    -> backstage
+ [Leave the theater]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * The Backstage
 *
 * - Sex with actor
 */
= backstage
Backstage at the theater
+ [Leave the backstage] -> theater
