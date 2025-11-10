/*
 * The Cafeteria
 *
 * 1. ---
 * 2. ---
 * L. Gossip, Queen, Twins, Cheerleader, Believer, Actor, Nympho
 * 3. ---
 * 4. ---
 * A. Chess Club, Nympho
 */
=== cafeteria ===
CONST CAFETERIA = "cafeteria"
VAR CafeteriaPeople = ()
~ here = CAFETERIA

You are in the {CAFETERIA}.

Looking around, you can see {listRoomPeople(CafeteriaPeople)}.

- (opts)
<- talkToAllCharacters(CafeteriaPeople, -> cafeteria.opts)

* {now == Lunch and cheerleaderState == intel} [Observe {CHEERLEADER} and {JOCK}]
    -> observe_cheerleader ->

+ [Leave the {CAFETERIA}]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * The Storage Closet
 *
 * - Sex with Nympho
 */
= storage
CONST STORAGE = "storage closet"
VAR StoragePeople = ()
~ here = STORAGE

You are in the {STORAGE}. Shelves hold supplies for the chess club and other after-school activities.

+ [Leave the {STORAGE}] -> cafeteria
