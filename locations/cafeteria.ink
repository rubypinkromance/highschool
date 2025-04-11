/*
 * The Cafeteria
 *
 * 1. ---
 * 2. Gossip, Queen, Twins, Cheerleader, Believer, Actor
 * 3. ---
 * 4. ---
 */
=== cafeteria ===
The cafeteria

- (opts)
+ {now == lunch} [Talk to {GOSSIP}] -> talk_to_gossip ->
+ {now == lunch} [Talk to {QUEEN}] -> talk_to_queen ->
+ {now == lunch} [Talk to {TWIN1}] -> talk_to_twin1 ->
+ {now == lunch} [Talk to {TWIN2}] -> talk_to_twin2 ->
+ {now == lunch} [Talk to {CHEERLEADER}] -> talk_to_cheerleader ->
+ {now == lunch} [Talk to {BELIEVER}] -> talk_to_believer ->
+ {now == lunch} [Talk to {ACTOR}] -> talk_to_actor ->
+ [Leave the cafeteria] -> pass_time -> hallway
- -> opts
