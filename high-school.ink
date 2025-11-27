# title: Senior Project
# author: Ruby Pink
# theme: dark

// Story Beats
INCLUDE 0-beats/intro.ink

// Students
INCLUDE 1-students/actor.ink
INCLUDE 1-students/athlete.ink
INCLUDE 1-students/believer.ink
INCLUDE 1-students/cheerleader.ink
INCLUDE 1-students/friend.ink
INCLUDE 1-students/jock.ink
INCLUDE 1-students/nerd.ink
INCLUDE 1-students/nympho.ink
INCLUDE 1-students/photographer.ink
INCLUDE 1-students/queen.ink
INCLUDE 1-students/rebel.ink
INCLUDE 1-students/scientist.ink
INCLUDE 1-students/stepsister.ink
INCLUDE 1-students/stepsister-friend.ink
INCLUDE 1-students/twins.ink

// Staff
INCLUDE 2-staff/gym-teacher.ink
INCLUDE 2-staff/health-teacher.ink
INCLUDE 2-staff/photo-teacher.ink
INCLUDE 2-staff/science-teacher.ink
INCLUDE 2-staff/study-hall-teacher.ink
INCLUDE 2-staff/theater-teacher.ink
INCLUDE 2-staff/nurse.ink
INCLUDE 2-staff/secretary.ink

// Locations
INCLUDE 3-locations/cafeteria.ink
INCLUDE 3-locations/church.ink
INCLUDE 3-locations/clinic.ink
INCLUDE 3-locations/field.ink
INCLUDE 3-locations/gym.ink
INCLUDE 3-locations/health-class.ink
INCLUDE 3-locations/house.ink
INCLUDE 3-locations/lab.ink
INCLUDE 3-locations/library.ink
INCLUDE 3-locations/lounge.ink
INCLUDE 3-locations/mall.ink
INCLUDE 3-locations/office.ink
INCLUDE 3-locations/photo-class.ink
INCLUDE 3-locations/school.ink
INCLUDE 3-locations/study-hall.ink
INCLUDE 3-locations/theater.ink

// Helpers
INCLUDE 4-helpers/player.ink
INCLUDE 4-helpers/character-db.ink
INCLUDE 4-helpers/characters.ink
INCLUDE 4-helpers/locations.ink
INCLUDE 4-helpers/time.ink
INCLUDE 4-helpers/score.ink
INCLUDE 4-helpers/functions.ink
INCLUDE 4-helpers/capitalise.ink

// Variables
CONST DEBUG = true
~ clearLocations()
~ characterScheduler()

// Start with the introduction
{ DEBUG:
    -> field
- else:
    -> intro
}