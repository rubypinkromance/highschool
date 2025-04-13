/*
- School hallway (transit hub, remaining days countdown)
*/
=== hallway ===
The hallway at school.

Right now, it's {now}.


// Lunch locations
+ { now == lunch } [Go to cafeteria] -> cafeteria
+ { now == lunch or now == afterschool } [Go to athletic field] -> field
+ { now == lunch or now == afterschool } [Go to library] -> library

// Classrooms are closed during lunch
+ { not (now == lunch) } [Go to gym] -> gym
+ { not (now == lunch) } [Go to study hall] -> study_hall
+ { not (now == lunch) } [Go to photography] -> photography
+ { not (now == lunch) } [Go to science] -> science
+ { not (now == lunch) } [Go to theater] -> theater

// Special classroom open during lunch
+ [Go to health] -> health

// To be restricted by future conditions
+ [Go to teacher's lounge] -> lounge
+ [Go to stairwell] -> stairwell
+ [Go to roof] -> roof

// After-school locations
+ { now == afterschool } [Go home] -> bedroom
+ { now == afterschool } [Go to the Mall] -> mall
+ { now == afterschool } [Go to Church] -> church

/*
> Stairwell
    * Makeout with twins
*/
= stairwell
The remote stairwell
+ [Go to hallway] -> hallway

/*
> Roof
    * Sex with twins
*/
= roof
The school's roof
+ [Go to hallway] -> hallway
