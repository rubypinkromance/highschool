/*
 * The Gym
 *
 * 1. Athlete, Scientist, Twin 2, You
 * 2. Believer, Rebel
 * L. ---
 * 3. Cheerleader, Photographer
 * 4. Queen, Twin 1
 * A. Athlete
 */
=== gym ===
CONST GYM = "gymnasium"
VAR GymPeople = ()
~ here = GYM

You are in the {GYM}.

Looking around, you can see {listRoomPeople(GymPeople)}.

- (opts)
<- talkToAllCharacters(GymPeople, -> gym.opts)

+ [Go to the {LOCKER_ROOM}]
    -> locker_room
+ [Leave the {GYM}]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * Locker Rooms
 *
 * - Sex with Athlete
 */
= locker_room
CONST LOCKER_ROOM = "girl’s locker room"
VAR LockerRoomPeople = ()
~ here = LOCKER_ROOM

You are in the {LOCKER_ROOM}.

+ [Leave the {LOCKER_ROOM}] -> gym
