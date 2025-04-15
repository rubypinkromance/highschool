/*
 * The Hallway
 *
 * transit hub, remaining days countdown
 */
=== hallway ===
~ current_location = -> hallway
The hallway at school.

// Classrooms (closed at lunch)
{ now != lunch and now != evening:
+ [Go to the gym] -> gym
+ [Go to the health classroom] -> health
+ [Go to the photography classroom] -> photography
+ [Go to the science lab] -> science
+ [Go to the study hall] -> study_hall
+ [Go to the theater] -> theater
}

// Lunch Only
{ now == lunch:
+ {flirted_with_teacher} [Go to the health classroom] -> health
}

// Lunch and After School
{ now == lunch or now == afterschool:
+ [Go to the cafeteria] -> cafeteria
+ [Go to the athletic field] -> field
+ [Go to the library] -> library
+ {has_lounge_invite} [Go to the teacher's lounge] -> lounge
+ {has_stairwell_invite} [Go to the stairwell] -> stairwell
+ {has_roof_invite} [Go to the roof] -> roof
* {cheerleaderState == quest} [Go to Lance & Michelle's Locker]
    -> cheerleader_locker -> hallway
}

// School Day Only
{ now < afterschool:
+ [Go to the office] -> office
}

// After School Only
{ now == afterschool:
+ {has_office_invite} [Go to the office] -> office
+ [Go to the mall] -> mall
+ [Go to the church] -> church
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
~ current_location = -> stairwell
The remote stairwell
+ [Leave the stairwell] -> hallway

/*
 * =============================================
 * The Roof
 *
 * - Sex with twins
 */
= roof
VAR has_roof_invite = false
~ current_location = -> roof
The school's roof
+ [Leave the roof] -> hallway
