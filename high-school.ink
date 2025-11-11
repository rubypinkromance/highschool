// Story Beats
INCLUDE beats/intro.ink

// Helpers
INCLUDE helpers/characters.ink
INCLUDE helpers/score.ink
INCLUDE helpers/time.ink
INCLUDE helpers/functions.ink

// Locations
INCLUDE locations/cafeteria.ink
INCLUDE locations/church.ink
INCLUDE locations/clinic.ink
INCLUDE locations/field.ink
INCLUDE locations/gym.ink
INCLUDE locations/health-class.ink
INCLUDE locations/house.ink
INCLUDE locations/lab.ink
INCLUDE locations/library.ink
INCLUDE locations/lounge.ink
INCLUDE locations/mall.ink
INCLUDE locations/office.ink
INCLUDE locations/photo-class.ink
INCLUDE locations/school.ink
INCLUDE locations/study-hall.ink
INCLUDE locations/theater.ink

// Students
INCLUDE students/actor.ink
INCLUDE students/athlete.ink
INCLUDE students/believer.ink
INCLUDE students/cheerleader.ink
INCLUDE students/gossip.ink
INCLUDE students/jock.ink
INCLUDE students/nerd.ink
INCLUDE students/nympho.ink
INCLUDE students/photographer.ink
INCLUDE students/queen.ink
INCLUDE students/rebel.ink
INCLUDE students/scientist.ink
INCLUDE students/stepsister.ink
INCLUDE students/twins.ink

// Staff
INCLUDE staff/health-teacher.ink
INCLUDE staff/nurse.ink
INCLUDE staff/secretary.ink

// Variables
CONST DEBUG = true
VAR here = INTRO
VAR Inventory = ()
~ clearLocations()
~ characterScheduler()

// Start with the introduction
{ DEBUG:
    -> hallway
- else:
    -> intro
}