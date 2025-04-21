// Helpers
INCLUDE helpers/time.ink

// Story Beats
INCLUDE beats/intro.ink

// Locations
INCLUDE locations/cafeteria.ink
INCLUDE locations/church.ink
INCLUDE locations/clinic.ink
INCLUDE locations/field.ink
INCLUDE locations/gym.ink
INCLUDE locations/health.ink
INCLUDE locations/house.ink
INCLUDE locations/library.ink
INCLUDE locations/lounge.ink
INCLUDE locations/mall.ink
INCLUDE locations/office.ink
INCLUDE locations/photography.ink
INCLUDE locations/school.ink
INCLUDE locations/science.ink
INCLUDE locations/study-hall.ink
INCLUDE locations/theater.ink

// Characters
INCLUDE characters/actor.ink
INCLUDE characters/athlete.ink
INCLUDE characters/believer.ink
INCLUDE characters/cheerleader.ink
INCLUDE characters/gossip.ink
INCLUDE characters/nerd.ink
INCLUDE characters/npcs.ink
INCLUDE characters/nympho.ink
INCLUDE characters/photographer.ink
INCLUDE characters/queen.ink
INCLUDE characters/rebel.ink
INCLUDE characters/scientist.ink
INCLUDE characters/stepsister.ink
INCLUDE characters/twins.ink
INCLUDE characters/nurse.ink
INCLUDE characters/secretary.ink
INCLUDE characters/teacher.ink

// Variables
CONST DEBUG = true
VAR here = INTRO

TODO: Add total score

// Start with the introduction
{ DEBUG:
    -> hallway
- else:
    -> intro
}