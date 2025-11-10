/*
 * The Theater
 *
 * 1. Photographer, Nympho
 * 2. Gossip, Twin 2
 * L. ---
 * 3. Nerd, Queen, Twin 1
 * 4. Actor, Cheerleader
 * A. Actor
 */
=== theater ===
CONST THEATER = "theater"
VAR TheaterPeople = ()
~ here = THEATER

You are in the {THEATER}.

Looking around, you can see {listRoomPeople(TheaterPeople)}.

- (opts)
<- talkToAllCharacters(TheaterPeople, -> theater.opts)

TODO: add intel system
* {now == Period3 and cheerleaderState == intel } [Observe {CHEERLEADER} and {JOCK}]
    -> observe_cheerleader ->

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
VAR BackstagePeople = ()
~ here = BACKSTAGE

You are {BACKSTAGE}.

+ [Leave {BACKSTAGE}] -> theater
