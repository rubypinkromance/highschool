/*

    The Gym
    Random activities in gym class: wrestling, dodgeball, etc

*/
=== gym ===
CONST GYM = "gymnasium"
CONST GYM_CLASS_NAME = "gym class"
VAR GymPeople = ()
~ here = Gym
-> access_restrictions ->

TODO description
You are in the {GYM}.

{listRoomPeopleSentence(GymPeople)}

- (gym_opts)
<- talkAndObserveAllCharacters(GymPeople, -> gym_opts)

+ [Go to the {LOCKER_ROOM}] -> locker_room
+ [Leave the {GYM}] -> pass_time -> hallway
- -> gym_opts

= access_restrictions
{ isClassTime() and now != hasClass(Gym):
    -> access_denied_gym_teacher -> hallway
- else:
    ->->
}

/*

    Locker Rooms

*/
= locker_room
CONST LOCKER_ROOM = "girl’s locker room"
VAR LockerRoomPeople = ()
~ here = LockerRoom

You are in the {LOCKER_ROOM}.

+ [Leave the {LOCKER_ROOM}] -> gym
