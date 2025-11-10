/*
 * The Study Hall
 *
 * 1. Believer, Cheerleader
 * 2. Actor, Queen
 * L. ---
 * 3. Athlete, Scientist
 * 4. Gossip, Nerd, Rebel
 * A. Rebel
 *
 * - Sex with Rebel once unsupervised
 */
=== study_hall ===
CONST STUDY_HALL = "study hall"
VAR StudyHallPeople = ()
VAR study_hall_supervised = true
~ here = STUDY_HALL

You are in the {STUDY_HALL}.

Looking around, you can see {listRoomPeople(StudyHallPeople)}.

- (opts)
<- talkToAllCharacters(StudyHallPeople, -> study_hall.opts)

* {now == Period1 and cheerleaderState == intel} [Observe {CHEERLEADER} and {JOCK}]
    -> observe_cheerleader ->

+ [Leave the {STUDY_HALL}]
    -> pass_time -> hallway
- -> opts
