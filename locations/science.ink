/*
 * The Science Lab
 *
 * 1. Nerd, Rebel
 * 2. Athlete, Photographer
 * L. ---
 * 3. Actor, Gossip
 * 4. Nympho, Scientist
 * A. Scientist
 *
 * - Sex with Scientist
 */
=== science ===
CONST SCIENCE = "science classroom"
VAR SciencePeople = ()
~ here = SCIENCE

You are in the {SCIENCE}.

Looking around, you can see {listRoomPeople(SciencePeople)}.

- (opts)
<- talkToAllCharacters(SciencePeople, -> science.opts)

+ [Leave the {SCIENCE}]
    -> pass_time -> hallway
- -> opts
