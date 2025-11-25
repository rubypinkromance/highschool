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

You are in the {GYM}. Oversized banners hang from the rafters, celebrating past wins by the school's basketball and football teams.
{
- isClassTime():
    <> Sneakers squeak on the waxed floors, and {GYM_TEACHER} is shouting directions, trying to get the class into position for today's activity.
- else:
    <> The room is quiet now, and the sound of your footsteps echoes off the walls.
}

{lookForRoomPeople(GymPeople)}

- (gym_opts)
<- character_opts(GymPeople, -> gym_opts)

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
