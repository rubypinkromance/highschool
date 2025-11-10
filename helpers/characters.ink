LIST Characters = Actor, Athlete, Believer, Cheerleader, Gossip, Nerd, Jock, Nympho, Photographer, Queen, Rebel, Scientist, Stepsister, Twin1, Twin2, Twins, Nurse, Secretary, Teacher
LIST CharacterAttributes = Name, Title, TalkFunction

// Trying to avoid multiple characters whose names start with the same letter.
//
// Alice - The Stepsister
// Bailey - Twin 2
// Claire - The Nympho
// Dana - The Actor
// Emily?
// Felicia - The Nerd
// Grace - The Scientist
// Hailey - Twin 1
// Isabel?
// Jill - The Photographer
// Kate - The Believer
// Lindsey - The Athlete
// Michelle - The Cheerleader
// Nina?
// Olivia?
// Paige?
// Quinn?
// Rachel?
// Steph?
// Tina?
// Victoria - The Queen
// Whitney - The Gossip
// Zia - The Rebel

// Database of character information
=== function characterData(who, what)
{ who:
- Actor:
    ~ return getCharacterData(what, ACTOR, ACTOR_TITLE, -> talk_to_actor)
- Athlete:
    ~ return getCharacterData(what, ATHLETE, ATHLETE_TITLE, -> talk_to_athlete)
- Believer:
    ~ return getCharacterData(what, BELIEVER, BELIEVER_TITLE, -> talk_to_believer)
- Cheerleader:
    ~ return getCharacterData(what, CHEERLEADER, CHEERLEADER_TITLE, -> talk_to_cheerleader)
- Gossip:
    ~ return getCharacterData(what, GOSSIP, GOSSIP_TITLE, -> talk_to_gossip)
- Nerd:
    ~ return getCharacterData(what, NERD, NERD_TITLE, -> talk_to_nerd)
- Jock:
    ~ return getCharacterData(what, JOCK, JOCK_TITLE, -> talk_to_jock)
- Nympho:
    ~ return getCharacterData(what, NYMPHO, NYMPHO_TITLE, -> talk_to_nympho)
- Photographer:
    ~ return getCharacterData(what, PHOTOGRAPHER, PHOTOGRAPHER_TITLE, -> talk_to_photographer)
- Queen:
    ~ return getCharacterData(what, QUEEN, QUEEN_TITLE, -> talk_to_queen)
- Rebel:
    ~ return getCharacterData(what, REBEL, REBEL_TITLE, -> talk_to_rebel)
- Scientist:
    ~ return getCharacterData(what, SCIENTIST, SCIENTIST_TITLE, -> talk_to_scientist)
- Stepsister:
    ~ return getCharacterData(what, STEPSISTER, STEPSISTER_TITLE, -> talk_to_stepsister)
- Twin1:
    ~ return getCharacterData(what, TWIN1, TWIN1_TITLE, -> talk_to_twin1)
- Twin2:
    ~ return getCharacterData(what, TWIN2, TWIN2_TITLE, -> talk_to_twin2)
- Twins:
    ~ return getCharacterData(what, TWINS, TWINS_TITLE, -> talk_to_twins)
- Nurse:
    ~ return getCharacterData(what, NURSE, NURSE_TITLE, -> talk_to_nurse)
- Secretary:
    ~ return getCharacterData(what, SECRETARY, SECRETARY_TITLE, -> talk_to_secretary)
- Teacher:
    ~ return getCharacterData(what, TEACHER, TEACHER_TITLE, -> talk_to_teacher)
- else: [ Error: no data associated with {who}.]
}

// Returns a single piece of data about a character
=== function getCharacterData(what, name, title, talk_function)
{ what:
- Name: ~ return name
- Title: ~ return title
- TalkFunction: ~ return talk_function
}

=== function listRoomPeople(characters)
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins)
}
~ return listPrint(characters, -> nameAndTitle)

=== function nameAndTitle(who)
~ temp name = characterData(who, Name)
~ temp title = characterData(who, Title)
~ return "{name}{title: {title}}"

// Generate a list of options to talk to anyone in the room
=== talkToAllCharacters(characters, -> return_to)
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins)
}
- (top)
~ temp who = pop(characters)
{ who:
    <- talkToCharacter(who, return_to)
    -> top
}

// Generate an option to talk to a person
=== talkToCharacter(who, -> return_to)
~ temp name = characterData(who, Name)
~ temp target = characterData(who, TalkFunction)
+ [Talk to {name}] -> target ->
-> return_to

// Determine who is where, when
=== function characterScheduler()
{now:
- Period1:
    ~ GymPeople += (Athlete, Scientist, Twin2)
    ~ HealthPeople += (Actor, Gossip)
    ~ PhotographyPeople += (Queen, Twin1)
    ~ SciencePeople += (Nerd, Rebel)
    ~ StudyHallPeople += (Believer, Cheerleader, Jock)
    ~ TheaterPeople += (Photographer, Nympho)
- Period2:
    ~ GymPeople += (Believer, Rebel)
    ~ HealthPeople += (Cheerleader, Jock, Nerd, Twin1)
    ~ PhotographyPeople += (Nympho, Scientist)
    ~ SciencePeople += (Athlete, Photographer)
    ~ StudyHallPeople += (Actor, Queen)
    ~ TheaterPeople += (Gossip, Twin2)
- Lunch:
    ~ HealthPeople -= (Teacher)
    ~ CafeteriaPeople += (Actor, Believer, Cheerleader, Jock, Gossip, Nympho, Queen, Twin1, Twin2)
    ~ LoungePeople = (Teacher)
    ~ LibraryPeople += (Nerd, Scientist)
    ~ FieldPeople += (Athlete)
    ~ BleachersPeople += (Photographer)
    ~ UnderBleachersPeople += (Rebel)
- Period3:
    ~ GymPeople += (Cheerleader, Jock, Photographer)
    ~ HealthPeople += (Believer, Nympho)
    ~ PhotographyPeople += (Rebel, Twin2)
    ~ SciencePeople += (Actor, Gossip)
    ~ StudyHallPeople += (Athlete, Scientist)
    ~ TheaterPeople += (Nerd, Queen, Twin1)
- Period4:
    ~ GymPeople += (Queen, Twin1)
    ~ HealthPeople += (Athlete, Twin2)
    ~ PhotographyPeople += (Believer, Photographer)
    ~ SciencePeople += (Nympho, Scientist)
    ~ StudyHallPeople += (Gossip, Nerd, Rebel)
    ~ TheaterPeople += (Actor, Cheerleader, Jock)
- AfterSchool:
    ~ GymPeople += (Athlete)
    ~ PhotographyPeople += (Photographer)
    ~ SciencePeople += (Scientist)
    ~ StudyHallPeople += (Rebel)
    ~ TheaterPeople += (Actor)
    ~ CafeteriaPeople += (Nympho)
    ~ LibraryPeople += (Nerd)
    ~ FieldPeople += (Cheerleader, Jock)
    ~ BleachersPeople += (Gossip)
    ~ BathroomPeople += (Stepsister)
    ~ ChurchPeople += (Believer)
    ~ MallPeople += (Queen, Twin1, Twin2)
}

// This function empties all the room.
// Run it before characterScheduler()
=== function clearLocations()
~ CafeteriaPeople = ()
~ StoragePeople = ()
~ ChurchPeople = ()
~ ClinicPeople = (Nurse)
~ ExamAreaPeople = ()
~ FieldPeople = ()
~ BleachersPeople = ()
~ UnderBleachersPeople = ()
~ GymPeople = ()
~ LockerRoomPeople = ()
~ HealthPeople = (Teacher)
~ BedroomPeople = ()
~ BathroomPeople = ()
~ LibraryPeople = ()
~ LoungePeople = ()
~ MallPeople = ()
~ OfficePeople = (Secretary)
~ SupplyClosetPeople = ()
~ PhotographyPeople = ()
~ DarkroomPeople = ()
~ StairwellPeople = ()
~ RoofPeople = ()
~ SciencePeople = ()
~ StudyHallPeople = ()
~ TheaterPeople = ()
~ BackstagePeople = ()

