/*
- The Hallway
- transit hub
*/
=== hallway ===
CONST HALLWAY = "hallway"
~ here = Hallway
-> access_restrictions ->
~ announceTime()

// Weekdays:
{ isWeekday():

You are in the {HALLWAY}.

+ [Go to a classroom]
+ + [Go to the {GYM}] -> gym
+ + [Go to the {HEALTH_CLASS}] -> health_class
+ + [Go to the {PHOTO_CLASS}] -> photo_class
+ + [Go to the {LAB}] -> lab
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
+ + {has_stairwell_invite} [Go to the {STAIRWELL}] -> stairwell
+ + {has_roof_invite} [Go to the {ROOF}] -> roof
+ + [Cancel] -> hallway

+ [Go to {LOCKER}] -> your_locker
+ {CheerleaderState == quest} [Go to {JOCK} & {CHEERLEADER}'s Locker]
    -> cheerleader_locker -> hallway

+ [Leave school]
+ + [Go home] -> bedroom
+ + [Go to the {MALL}] -> mall
+ + [Go to the {CHURCH}] -> church
+ + [Cancel] -> hallway

// Weekends:
- else:

The school is closed on weekends, but you can still access the {FIELD}.

+ + [Go to the {FIELD}] -> field
+ + [Go home] -> bedroom
+ + [Go to the {MALL}] -> mall
+ + [Go to the {CHURCH}] -> church
}

= access_restrictions
{
- now == Night:
    The school is closed. You head home.
    -> bedroom
}
->->


/*
- Your Locker
*/
= your_locker
CONST LOCKER = "your locker"
VAR LockerItems = ()
~ here = Locker

You are at {LOCKER}.

- (locker_opts)
* {Inventory ? Schedule} [Tape up the schedule]
    ~ Inventory -= Schedule
    ~ LockerItems += Schedule
    Triumphantly, you tape up the printout of the schedule for all the girls in school. This will make it much easier to find out what class a girl is in.
    -> locker_opts
+ {LockerItems ? Schedule} [Check the schedule]
    Whose schedule do you want to check?
    + + [{nameAndTitle(Actor)}] { reportSchedule(Actor) }
    + + [{nameAndTitle(Athlete)}] { reportSchedule(Athlete) }
    + + [{nameAndTitle(Believer)}] { reportSchedule(Believer) }
    + + [{nameAndTitle(Cheerleader)}] { reportSchedule(Cheerleader) }
    + + [{nameAndTitle(Gossip)}] { reportSchedule(Gossip) }
    + + [{nameAndTitle(Nerd)}] { reportSchedule(Nerd) }
    + + [{nameAndTitle(Nympho)}] { reportSchedule(Nympho) }
    + + [{nameAndTitle(Photographer)}] { reportSchedule(Photographer) }
    + + [{nameAndTitle(Queen)}] { reportSchedule(Queen) }
    + + [{nameAndTitle(Rebel)}] { reportSchedule(Rebel) }
    + + [{nameAndTitle(Scientist)}] { reportSchedule(Scientist) }
    + + [{nameAndTitle(Twins)}] { reportSchedule(Twins) }
    - - -> locker_opts
+ [Check your score]
    -> check_score -> locker_opts
+ [Leave {LOCKER}] -> hallway

/*
- The Stairwell
- Makeout with twins
*/
= stairwell
CONST STAIRWELL = "stairwell"
VAR StairwellPeople = ()
VAR has_stairwell_invite = false
~ here = Stairwell

You are in the {STAIRWELL}.

+ [Leave the {STAIRWELL}] -> hallway

/*
- The Roof
- Sex with twins
*/
= roof
CONST ROOF = "roof"
VAR RoofPeople = ()
VAR has_roof_invite = false
~ here = Roof

You are on the {ROOF}.

+ [Leave the {ROOF}] -> hallway
