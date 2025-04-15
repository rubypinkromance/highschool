/*
 * The Cafeteria
 *
 * 1. ---
 * 2. Gossip, Queen, Twins, Cheerleader, Believer, Actor, Nympho
 * 3. ---
 * 4. Chess Club, Nympho
 */
=== cafeteria ===
~ current_location = -> cafeteria
The cafeteria

- (opts)
* {now == lunch and cheerleaderState == intel} [Observe {CHEERLEADER}]
    -> observe_cheerleader ->
+ {now == lunch} [Talk to {GOSSIP}]
    -> talk_to_gossip ->
+ {now == lunch} [Talk to {QUEEN}]
    -> talk_to_queen ->
+ {now == lunch} [Talk to {TWIN1}]
    -> talk_to_twin1 ->
+ {now == lunch} [Talk to {TWIN2}]
    -> talk_to_twin2 ->
+ {now == lunch} [Talk to {CHEERLEADER}]
    -> talk_to_cheerleader ->
+ {now == lunch} [Talk to {BELIEVER}]
    -> talk_to_believer ->
+ {now == lunch} [Talk to {ACTOR}]
    -> talk_to_actor ->
+ {now == lunch or now == afterschool} [Talk to {NYMPHO}]
    -> talk_to_nympho ->
+ [Leave the cafeteria]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * The Storage Closet
 *
 * - Sex with Nympho
 */
= storage
~ current_location = -> storage
Shelves hold supplies for the chess club and other after-school activities.
+ [Leave the storage closet] -> cafeteria
