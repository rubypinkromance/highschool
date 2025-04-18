/*
 * The Hallway
 *
 * transit hub, remaining days countdown
 */
=== hallway ===
CONST HALLWAY = "hallway"
~ here = HALLWAY
You are in the {HALLWAY}.

// Classrooms (closed at lunch)
{ now != lunch and now != evening:
+ [Go to the {GYM}] -> gym
+ [Go to the {HEALTH}] -> health
+ [Go to the {PHOTOGRAPHY}] -> photography
+ [Go to the {SCIENCE}] -> science
+ [Go to the {STUDY_HALL}] -> study_hall
+ [Go to the {THEATER}] -> theater
}

// Lunch Only
{ now == lunch:
+ {flirted_with_teacher} [Go to the {HEALTH}] -> health
}

// Lunch and After School
{ now == lunch or now == afterschool:
+ [Go to the {CAFETERIA}] -> cafeteria
+ [Go to the {FIELD}] -> field
+ [Go to the {LIBRARY}] -> library
+ {has_lounge_invite} [Go to the {LOUNGE}] -> lounge
+ {has_stairwell_invite} [Go to the {STAIRWELL}] -> stairwell
+ {has_roof_invite} [Go to the {ROOF}] -> roof
* {cheerleaderState == quest} [Go to {JOCK} & {CHEERLEADER}'s Locker]
    -> cheerleader_locker -> hallway
}

// School Day Only
{ now < afterschool:
+ [Go to the {OFFICE}] -> office
}

// After School Only
{ now == afterschool:
+ {has_office_invite} [Go to the {OFFICE}] -> office
+ [Go to the {MALL}] -> mall
+ [Go to the {CHURCH}] -> church
}

// After School and Evening
{ now == afterschool or now == evening:
+ [Go home] -> bedroom
}

/*
 * =============================================
 * The Stairwell
 *
 * - Makeout with twins
 */
= stairwell
VAR has_stairwell_invite = false
CONST STAIRWELL = "stairwell"
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
VAR has_roof_invite = false
CONST ROOF = "roof"
~ here = ROOF
You are on the {ROOF}.

+ [Leave the {ROOF}] -> hallway
