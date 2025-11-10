/*
 * The Health Classroom
 *
 * 1. Teacher, Actor, Gossip
 * 2. Teacher, Cheerleader, Nerd, Twin 1, You
 * L. ---
 * 3. Teacher, Believer, Nympho
 * 4. Teacher, Athlete, Twin 2
 * A. Teacher
 *
 * - Sex with Teacher
 */
=== health ===
CONST HEALTH = "health classroom"
VAR HealthPeople = ()
~ here = HEALTH

You are in the {HEALTH}.

Looking around, you can see {listRoomPeople(HealthPeople)}.

- (opts)
<- talkToAllCharacters(HealthPeople, -> health.opts)

+ [Leave the {HEALTH}]
    -> pass_time -> hallway
- -> opts
