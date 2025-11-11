LIST Students = Actor, Athlete, Believer, Cheerleader, Gossip, Nerd, Jock, Nympho, Photographer, Queen, Rebel, Scientist, Stepsister, Twin1, Twin2, Twins
LIST Staff = HealthTeacher, Nurse, Secretary
LIST CharacterAttributes = Name, Title, State, ObservedState, Mood, BaseMood, TalkFunction, ObserveFunction
LIST CharacterMoods = Hostile, Neutral, Friendly, Aroused, Desperate

/*
Try to avoid multiple characters whose names start with the same letter.

- Alice - Stepsister, blonde, shaved
- Bailey - Twin, bleached, curvy, shaved
- Claire - Nympho, bleached, pierced nipples, shaved
- Dana - Actor, trans, died pink, shaved
- Emily?
- Felicia - Nerd, redhead, trimmed
- Grace - Scientist, asian, small tits, shaved
- Hailey - Twin, bleached, curvy, shaved
- Isabel?
- Jill - Photographer, brunette, trimmed
- Kate - Believer, brunette, big tits, bush
- Lindsey - Athlete, sporty, blonde, shaved
- Michelle - Cheerleader, black, big tits, strip
- Nina?
- Olivia?
- Paige?
- Quinn?
- Rachel?
- Steph?
- Tina?
- Victoria - Queen, blonde, small tits, shaved
- Whitney - Gossip, brunette, average, trimmed
- Zia - Rebel, brunette, curvy, bush
*/

// Database of character information
=== function characterData(who, what)
{ who:
- Actor:
    ~ return fetchCharacterData(what, ACTOR, ACTOR_TITLE, ActorState, ActorObserved, ActorMood, ActorBaseMood, -> talk_to_actor, -> observe_actor)
- Athlete:
    ~ return fetchCharacterData(what, ATHLETE, ATHLETE_TITLE, AthleteState, AthleteObserved, AthleteMood, AthleteBaseMood, -> talk_to_athlete, -> observe_athlete)
- Believer:
    ~ return fetchCharacterData(what, BELIEVER, BELIEVER_TITLE, BelieverState, BelieverObserved, BelieverMood, BelieverBaseMood, -> talk_to_believer, -> observe_believer)
- Cheerleader:
    ~ return fetchCharacterData(what, CHEERLEADER, CHEERLEADER_TITLE, CheerleaderState, CheerleaderObserved, CheerleaderMood, CheerleaderBaseMood, -> talk_to_cheerleader, -> observe_cheerleader)
- Gossip:
    ~ return fetchCharacterData(what, GOSSIP, GOSSIP_TITLE, GossipState, GossipObserved, GossipMood, GossipBaseMood, -> talk_to_gossip, -> observe_gossip)
- Nerd:
    ~ return fetchCharacterData(what, NERD, NERD_TITLE, NerdState, NerdObserved, NerdMood, NerdBaseMood, -> talk_to_nerd, -> observe_nerd)
- Jock:
    ~ return fetchCharacterData(what, JOCK, JOCK_TITLE, JockState, JockObserved, JockMood, JockBaseMood, -> talk_to_jock, -> observe_jock)
- Nympho:
    ~ return fetchCharacterData(what, NYMPHO, NYMPHO_TITLE, NymphoState, NymphoObserved, NymphoMood, NymphoBaseMood, -> talk_to_nympho, -> observe_nympho)
- Photographer:
    ~ return fetchCharacterData(what, PHOTOGRAPHER, PHOTOGRAPHER_TITLE, PhotographerState, PhotographerObserved, PhotographerMood, PhotographerBaseMood, -> talk_to_photographer, -> observe_photographer)
- Queen:
    ~ return fetchCharacterData(what, QUEEN, QUEEN_TITLE, QueenState, QueenObserved, QueenMood, QueenBaseMood, -> talk_to_queen, -> observe_queen)
- Rebel:
    ~ return fetchCharacterData(what, REBEL, REBEL_TITLE, RebelState, RebelObserved, RebelMood, RebelBaseMood, -> talk_to_rebel, -> observe_rebel)
- Scientist:
    ~ return fetchCharacterData(what, SCIENTIST, SCIENTIST_TITLE, ScientistState, ScientistObserved, ScientistMood, ScientistBaseMood, -> talk_to_scientist, -> observe_scientist)
- Stepsister:
    ~ return fetchCharacterData(what, SIS, SIS_TITLE, SisState, SisObserved, SisMood, SisBaseMood, -> talk_to_stepsister, -> observe_stepsister)
- Twin1:
    ~ return fetchCharacterData(what, TWIN1, TWIN1_TITLE, TwinsState, TwinsObserved, TwinsMood, TwinsBaseMood, -> talk_to_twin1, -> observe_twins)
- Twin2:
    ~ return fetchCharacterData(what, TWIN2, TWIN2_TITLE, TwinsState, TwinsObserved, TwinsMood, TwinsBaseMood, -> talk_to_twin2, -> observe_twins)
- Twins:
    ~ return fetchCharacterData(what, TWINS, TWINS_TITLE, TwinsState, TwinsObserved, TwinsMood, TwinsBaseMood, -> talk_to_twins, -> observe_twins)
- Nurse:
    ~ return fetchCharacterData(what, NURSE, NURSE_TITLE, NurseState, NurseObserved, NurseMood, NurseBaseMood, -> talk_to_nurse, -> observe_nurse)
- Secretary:
    ~ return fetchCharacterData(what, SECRETARY, SECRETARY_TITLE, SecretaryState, SecretaryObserved, SecretaryMood, SecretaryBaseMood, -> talk_to_secretary, -> observe_secretary)
- HealthTeacher:
    ~ return fetchCharacterData(what, HEALTH_TEACHER, HEALTH_TEACHER_TITLE, HealthTeacherState, HealthTeacherObserved, HealthTeacherMood, HealthTeacherBaseMood, -> talk_to_health_teacher, -> observe_health_teacher)
}

// Returns a single piece of data about a character
=== function fetchCharacterData(what, name, title, state, observed_state, mood, base_mood, talk_function, observe_function)
{ what:
- Name: ~ return name
- Title: ~ return title
- State: ~ return state
- Mood: ~ return mood
- BaseMood: ~ return base_mood
- ObservedState: ~ return observed_state
- TalkFunction: ~ return talk_function
- ObserveFunction: ~ return observe_function
}

// Return a formatted list of people as a sentence.
=== function listRoomPeople(characters)
{ not characters:
    ~ return "" // if no one is here, say nothing
}
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins) // if both twins are here, list them together
}
~ listPrint(characters, -> nameAndTitle)

=== function listRoomPeopleSentence(characters)
{ LIST_COUNT(characters) > 0:
    Looking around, you see {listRoomPeople(characters)}.
}

// Combine a character's name with their title, eg, "Nandor the Relentless"
=== function nameAndTitle(who)
~ temp name = characterData(who, Name)
~ temp title = characterData(who, Title)
~ return "{name}{title: {title}}"

// Generate a list of options to talk or observe anyone in the room.
// This list will be nested if there's more than two people.
=== talkAndObserveAllCharacters(characters, -> return_to)
~ temp charactersCopy = characters
~ temp unobserved = ()
- (top)
~ temp who = pop(charactersCopy)
{ who:
    ~ temp state = characterData(who, State)
    ~ temp observed = characterData(who, ObservedState)
    { state !? observed:
        ~ unobserved += who
    }
    -> top
}
{ LIST_COUNT(characters) > 2:
    + [Talk to someone]
        Who do you want to talk to?
        <- talkToAllCharacters(characters, return_to)
        -> DONE
- else:
    <- talkToAllCharacters(characters, return_to)
}
{ LIST_COUNT(unobserved) > 2:
    + [Observe someone]
        Who do you want to observe?
        <- observeAllCharacters(characters, return_to)
        -> DONE
- else:
    <- observeAllCharacters(characters, return_to)
}

// Generate a list of options to talk to anyone in the room
=== talkToAllCharacters(characters, -> return_to)
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins) // if both twins are here, list them together
}
- (top)
~ temp who = pop(characters)
{ who:
    <- talkToCharacter(who, return_to)
    -> top
}

// Generate a list of options to observe anyone in the room
=== observeAllCharacters(characters, -> return_to)
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins) // if both twins are here, list them together
}
- (top)
~ temp who = pop(characters)
{ who:
    <- observeCharacter(who, return_to)
    -> top
}

// Generate an option to talk to a person
=== talkToCharacter(who, -> return_to)
~ temp name = characterData(who, Name)
~ temp target = characterData(who, TalkFunction)
+ [Talk to {name}] -> target ->
-> return_to

// Generate an option to observe a person if they're not already observed
=== observeCharacter(who, -> return_to)
~ temp name = characterData(who, Name)
~ temp state = characterData(who, State)
~ temp observed = characterData(who, ObservedState)
~ temp target = characterData(who, ObserveFunction)
+ {state !? observed} [Observe {name}] -> target ->
-> return_to

=== function improveMood(ref mood)
{ mood != Desperate:
    ~ mood++
}

=== function worseMood(ref mood)
{ mood != Hostile:
    ~ mood--
}

// Determine who is where, when
=== function characterScheduler()
{isWeekday():
{now:
- Period1:
    ~ GymPeople += (Athlete, Scientist, Twin2)
    ~ HealthClassPeople += (HealthTeacher, Actor, Gossip)
    ~ PhotoClassPeople += (Queen, Twin1)
    ~ LabPeople += (Nerd, Rebel)
    ~ StudyHallPeople += (Believer, Cheerleader, Jock)
    ~ TheaterPeople += (Photographer, Nympho)
    ~ OfficePeople += (Secretary)
    ~ ClinicPeople += (Nurse)
- Period2:
    ~ GymPeople += (Believer, Rebel)
    ~ HealthClassPeople += (HealthTeacher, Cheerleader, Jock, Nerd, Twin1)
    ~ PhotoClassPeople += (Nympho, Scientist)
    ~ LabPeople += (Athlete, Photographer)
    ~ StudyHallPeople += (Actor, Queen)
    ~ TheaterPeople += (Gossip, Twin2)
    ~ OfficePeople += (Secretary)
    ~ ClinicPeople += (Nurse)
- Lunch:
    ~ CafeteriaPeople += (Actor, Believer, Cheerleader, Jock, Gossip, Nympho, Queen, Twin1, Twin2)
    ~ LoungePeople = (HealthTeacher, Secretary, Nurse)
    ~ LibraryPeople += (Nerd, Scientist)
    ~ FieldPeople += (Athlete)
    ~ BleachersPeople += (Photographer)
    ~ UnderBleachersPeople += (Rebel)
- Period3:
    ~ GymPeople += (Cheerleader, Jock, Photographer)
    ~ HealthClassPeople += (HealthTeacher, Believer, Nympho)
    ~ PhotoClassPeople += (Rebel, Twin2)
    ~ LabPeople += (Actor, Gossip)
    ~ StudyHallPeople += (Athlete, Scientist)
    ~ TheaterPeople += (Nerd, Queen, Twin1)
    ~ OfficePeople += (Secretary)
    ~ ClinicPeople += (Nurse)
- Period4:
    ~ GymPeople += (Queen, Twin1)
    ~ HealthClassPeople += (HealthTeacher, Athlete, Twin2)
    ~ PhotoClassPeople += (Believer, Photographer)
    ~ LabPeople += (Nympho, Scientist)
    ~ StudyHallPeople += (Gossip, Nerd, Rebel)
    ~ TheaterPeople += (Actor, Cheerleader, Jock)
    ~ OfficePeople += (Secretary)
    ~ ClinicPeople += (Nurse)
- AfterSchool:
    ~ GymPeople += (Athlete)
    ~ HealthClassPeople += (HealthTeacher)
    ~ PhotoClassPeople += (Photographer)
    ~ LabPeople += (Scientist)
    ~ StudyHallPeople += (Rebel)
    ~ TheaterPeople += (Actor)
    ~ CafeteriaPeople += (Nympho)
    ~ LibraryPeople += (Nerd)
    ~ FieldPeople += (Jock)
    ~ BleachersPeople += (Cheerleader, Gossip)
    ~ OfficePeople += (Secretary)
    ~ ChurchPeople += (Believer)
    ~ BraStorePeople += (Queen, Twin1, Twin2)
    ~ BathroomPeople += (Stepsister)
    ~ ClinicPeople += (Nurse)
- Night:
    ~ SisBedroomPeople += (Stepsister)
}
- else:
{now:
- Period1:
    ~ FieldPeople += (Athlete)
    ~ BleachersPeople += (Cheerleader, Jock)
    ~ ChurchPeople += (Believer)
    ~ DressStorePeople += (Gossip, Photographer)
    ~ ShoeStorePeople += (Queen, Twin1, Twin2)
    ~ BraStorePeople += (Nympho)
    ~ BookStorePeople += (Scientist)
    ~ MovieTheaterPeople += (Nerd, Rebel)
    ~ SisBedroomPeople += (Stepsister)
- Period2:
    ~ FieldPeople += (Cheerleader, Jock)
    ~ BleachersPeople += (Actor, Athlete, Photographer)
    ~ ChurchPeople += (Believer)
    ~ DressStorePeople += (Queen, Twin1, Twin2)
    ~ ShoeStorePeople += (Gossip, Nympho)
    ~ BraStorePeople += (Stepsister)
    ~ BookStorePeople += (Scientist)
    ~ MovieTheaterPeople += (Nerd, Rebel)
- Lunch:
    ~ FieldPeople += (Cheerleader, Jock)
    ~ BleachersPeople += (Actor, Athlete, Photographer)
    ~ ChurchPeople += (Believer)
    ~ FoodCourtPeople += (Gossip, Nerd, Nympho, Queen, Twin1, Twin2, Rebel, Scientist, Stepsister)
- Period3:
    ~ FieldPeople += (Cheerleader, Jock)
    ~ BleachersPeople += (Actor, Athlete, Photographer)
    ~ ChurchPeople += (Believer)
    ~ DressStorePeople += (Queen, Twin1, Twin2)
    ~ ShoeStorePeople += (Stepsister)
    ~ BraStorePeople += (Gossip)
    ~ BookStorePeople += (Nerd, Scientist)
    ~ MovieTheaterPeople += (Nympho, Rebel)
- Period4:
    ~ FieldPeople += (Athlete)
    ~ BleachersPeople += (Cheerleader, Jock)
    ~ ChurchPeople += (Believer)
    ~ DressStorePeople += (Gossip)
    ~ ShoeStorePeople += (Photographer)
    ~ BraStorePeople += (Queen, Twin1, Twin2)
    ~ BookStorePeople += (Nerd, Scientist)
    ~ MovieTheaterPeople += (Nympho, Rebel)
    ~ SisBedroomPeople += (Stepsister)
- AfterSchool:
    ~ FieldPeople += (Athlete)
    ~ ChurchPeople += (Believer)
    ~ DressStorePeople += (Gossip, Nympho)
    ~ ShoeStorePeople += (Nerd)
    ~ BraStorePeople += (Queen, Twin1, Twin2)
    ~ BookStorePeople += (Scientist)
    ~ BathroomPeople += (Stepsister)
- Night:
    ~ SisBedroomPeople += (Stepsister)
}
}

TODO: could these be done with loops instead of hard-coded commands?

// This function empties all the room.
// Run it before characterScheduler()
=== function clearLocations()
~ CafeteriaPeople = ()
~ StoragePeople = ()
~ ClinicPeople = ()
~ ExamAreaPeople = ()
~ FieldPeople = ()
~ BleachersPeople = ()
~ UnderBleachersPeople = ()
~ GymPeople = ()
~ LockerRoomPeople = ()
~ HealthClassPeople = ()
~ LibraryPeople = ()
~ LoungePeople = ()
~ OfficePeople = ()
~ SupplyClosetPeople = ()
~ PhotoClassPeople = ()
~ DarkroomPeople = ()
~ StairwellPeople = ()
~ RoofPeople = ()
~ LabPeople = ()
~ StudyHallPeople = ()
~ TheaterPeople = ()
~ BackstagePeople = ()
~ ChurchPeople = ()
~ FoodCourtPeople = ()
~ DressStorePeople = ()
~ ShoeStorePeople = ()
~ BraStorePeople = ()
~ BookStorePeople = ()
~ MovieTheaterPeople = ()
~ BathroomPeople = ()
~ SisBedroomPeople = ()
~ BedroomPeople = ()

// This function resets all characters to their base state.
// Run it at the start of each day.
=== function resetMoods()
~ ActorMood = ActorBaseMood
~ AthleteMood = AthleteBaseMood
~ BelieverMood = BelieverBaseMood
~ CheerleaderMood = CheerleaderBaseMood
~ GossipMood = GossipBaseMood
~ JockMood = JockBaseMood
~ NerdMood = NerdBaseMood
~ NymphoMood = NymphoBaseMood
~ PhotographerMood = PhotographerBaseMood
~ QueenMood = QueenBaseMood
~ RebelMood = RebelBaseMood
~ ScientistMood = ScientistBaseMood
~ SisMood = SisBaseMood
~ TwinsMood = TwinsBaseMood
~ HealthTeacherMood = HealthTeacherBaseMood
~ NurseMood = NurseBaseMood
~ SecretaryMood = SecretaryBaseMood

