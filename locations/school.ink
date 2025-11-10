/*
 * The Hallway
 *
 * transit hub, remaining days countdown
 */
=== hallway ===
CONST HALLWAY = "hallway"
~ here = HALLWAY

You are in the {HALLWAY}. <>

~ announceTime()

Looking around, you can see {listRoomPeople(LIST_ALL(Characters))}.

+ [Go to a classroom]
+ + [Go to the {GYM}] -> gym
+ + [Go to the {HEALTH}] -> health
+ + [Go to the {PHOTOGRAPHY}] -> photography
+ + [Go to the {SCIENCE}] -> science
+ + [Go to the {STUDY_HALL}] -> study_hall
+ + [Go to the {THEATER}] -> theater
+ + [Cancel] -> hallway

+ [Go to common areas]
+ + [Go to the {CAFETERIA}] -> cafeteria
+ + [Go to the {FIELD}] -> field
+ + [Go to the {LIBRARY}] -> library
+ + [Go to the {OFFICE}] -> office
+ + [Go to the {LOUNGE}] -> lounge
+ + [Go to the {CLINIC}] -> clinic
+ + [Cancel] -> hallway

+ [Go to {LOCKER}] -> your_locker
+ {cheerleaderState == quest} [Go to {JOCK} & {CHEERLEADER}'s Locker]
    -> cheerleader_locker -> hallway
+ {has_stairwell_invite} [Go to the {STAIRWELL}] -> stairwell
+ {has_roof_invite} [Go to the {ROOF}] -> roof

+ [Leave school]
+ + [Go home] -> bedroom
+ + [Go to the {MALL}] -> mall
+ + [Go to the {CHURCH}] -> church
+ + [Cancel] -> hallway


/*
 * =============================================
 * Your Locker
 *
 * - ?
 */
= your_locker
CONST LOCKER = "your locker"
~ here = LOCKER

You are at {LOCKER}.

- (locker_opts)
+ [Check score]
    Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
    You { listPrint(Score, -> scoreDetails)}.
    -> locker_opts
+ [Leave {LOCKER}] -> hallway

/*
 * =============================================
 * The Stairwell
 *
 * - Makeout with twins
 */
= stairwell
CONST STAIRWELL = "stairwell"
VAR StairwellPeople = ()
VAR has_stairwell_invite = false
~ here = STAIRWELL

You are in the {STAIRWELL}.

+ [Leave the {STAIRWELL}] -> hallway

/*
 * =============================================
 * The Roof
 *
 * - Sex with twins
 */
= roof
CONST ROOF = "roof"
VAR RoofPeople = ()
VAR has_roof_invite = false
~ here = ROOF

You are on the {ROOF}.

+ [Leave the {ROOF}] -> hallway
