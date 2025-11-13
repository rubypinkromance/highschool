LIST Students = Actor, Athlete, Believer, Cheerleader, Gossip, Nerd, Jock, Nympho, Photographer, Queen, Rebel, Scientist, Stepsister, SisFriend, Twin1, Twin2, Twins
LIST Staff = HealthTeacher, Nurse, Secretary
LIST CharacterAttributes = Name, Title, State, ObservedState, Mood, BaseMood, TalkFunction, ObserveFunction
LIST CharacterMoods = Hostile, Neutral, Friendly, Aroused, Desperate

/*
Try to avoid multiple characters whose names start with the same letter.

- Alice    - Stepsister
- B
- Claire   - Nympho
- Dana     - Actor
- Emily?
- Felicia  - Nerd
- Grace    - Scientist (Asian)
- H?
- Isabel?
- Jill     - Photographer
- Kate     - Believer
- Lindsey  - Athlete
- Misha    - Twin (Indian)
- Nisha    - Twin (Indian)
- Olivia?
- Paige?
- Quinn?
- Rosario  - Cheerleader (Puerto Rican)
- Sofia    - Stepsister's Friend (Latina)
- Tina?
- Victoria - Queen
- Whitney  - Gossip
- Zia      - Rebel
*/

/*
- Character Information Database.
- This looks super long and verbose, not to mention repetitive, but it lets us keep all the actual character data in that character's include file, so this file is just for logic.
*/
=== function characterData(who, what)
{ who:
- Actor:
    { what:
        - Name: ~ return ACTOR
        - Title: ~ return ACTOR_TITLE
        - State: ~ return ActorState
        - ObservedState: ~ return ActorObserved
        - Mood: ~ return ActorMood
        - BaseMood: ~ return ActorBaseMood
        - TalkFunction: ~ return -> talk_to_actor
        - ObserveFunction: ~ return -> observe_actor
    }
- Athlete:
    { what:
        - Name: ~ return ATHLETE
        - Title: ~ return ATHLETE_TITLE
        - State: ~ return AthleteState
        - ObservedState: ~ return AthleteObserved
        - Mood: ~ return AthleteMood
        - BaseMood: ~ return AthleteBaseMood
        - TalkFunction: ~ return -> talk_to_athlete
        - ObserveFunction: ~ return -> observe_athlete
    }
- Believer:
    { what:
        - Name: ~ return BELIEVER
        - Title: ~ return BELIEVER_TITLE
        - State: ~ return BelieverState
        - ObservedState: ~ return BelieverObserved
        - Mood: ~ return BelieverMood
        - BaseMood: ~ return BelieverBaseMood
        - TalkFunction: ~ return -> talk_to_believer
        - ObserveFunction: ~ return -> observe_believer
    }
- Cheerleader:
    { what:
        - Name: ~ return CHEERLEADER
        - Title: ~ return CHEERLEADER_TITLE
        - State: ~ return CheerleaderState
        - ObservedState: ~ return CheerleaderObserved
        - Mood: ~ return CheerleaderMood
        - BaseMood: ~ return CheerleaderBaseMood
        - TalkFunction: ~ return -> talk_to_cheerleader
        - ObserveFunction: ~ return -> observe_cheerleader
    }
- Gossip:
    { what:
        - Name: ~ return GOSSIP
        - Title: ~ return GOSSIP_TITLE
        - State: ~ return GossipState
        - ObservedState: ~ return GossipObserved
        - Mood: ~ return GossipMood
        - BaseMood: ~ return GossipBaseMood
        - TalkFunction: ~ return -> talk_to_gossip
        - ObserveFunction: ~ return -> observe_gossip
    }
- Nerd:
    { what:
        - Name: ~ return NERD
        - Title: ~ return NERD_TITLE
        - State: ~ return NerdState
        - ObservedState: ~ return NerdObserved
        - Mood: ~ return NerdMood
        - BaseMood: ~ return NerdBaseMood
        - TalkFunction: ~ return -> talk_to_nerd
        - ObserveFunction: ~ return -> observe_nerd
    }
- Jock:
    { what:
        - Name: ~ return JOCK
        - Title: ~ return JOCK_TITLE
        - State: ~ return JockState
        - ObservedState: ~ return JockObserved
        - Mood: ~ return JockMood
        - BaseMood: ~ return JockBaseMood
        - TalkFunction: ~ return -> talk_to_jock
        - ObserveFunction: ~ return -> observe_jock
    }
- Nympho:
    { what:
        - Name: ~ return NYMPHO
        - Title: ~ return NYMPHO_TITLE
        - State: ~ return NymphoState
        - ObservedState: ~ return NymphoObserved
        - Mood: ~ return NymphoMood
        - BaseMood: ~ return NymphoBaseMood
        - TalkFunction: ~ return -> talk_to_nympho
        - ObserveFunction: ~ return -> observe_nympho
    }
- Photographer:
    { what:
        - Name: ~ return PHOTOGRAPHER
        - Title: ~ return PHOTOGRAPHER_TITLE
        - State: ~ return PhotographerState
        - ObservedState: ~ return PhotographerObserved
        - Mood: ~ return PhotographerMood
        - BaseMood: ~ return PhotographerBaseMood
        - TalkFunction: ~ return -> talk_to_photographer
        - ObserveFunction: ~ return -> observe_photographer
    }
- Queen:
    { what:
        - Name: ~ return QUEEN
        - Title: ~ return QUEEN_TITLE
        - State: ~ return QueenState
        - ObservedState: ~ return QueenObserved
        - Mood: ~ return QueenMood
        - BaseMood: ~ return QueenBaseMood
        - TalkFunction: ~ return -> talk_to_queen
        - ObserveFunction: ~ return -> observe_queen
    }
- Rebel:
    { what:
        - Name: ~ return REBEL
        - Title: ~ return REBEL_TITLE
        - State: ~ return RebelState
        - ObservedState: ~ return RebelObserved
        - Mood: ~ return RebelMood
        - BaseMood: ~ return RebelBaseMood
        - TalkFunction: ~ return -> talk_to_rebel
        - ObserveFunction: ~ return -> observe_rebel
    }
- Scientist:
    { what:
        - Name: ~ return SCIENTIST
        - Title: ~ return SCIENTIST_TITLE
        - State: ~ return ScientistState
        - ObservedState: ~ return ScientistObserved
        - Mood: ~ return ScientistMood
        - BaseMood: ~ return ScientistBaseMood
        - TalkFunction: ~ return -> talk_to_scientist
        - ObserveFunction: ~ return -> observe_scientist
    }
- Stepsister:
    { what:
        - Name: ~ return SIS
        - Title: ~ return SIS_TITLE
        - State: ~ return SisState
        - ObservedState: ~ return SisObserved
        - Mood: ~ return SisMood
        - BaseMood: ~ return SisBaseMood
        - TalkFunction: ~ return -> talk_to_stepsister
        - ObserveFunction: ~ return -> observe_stepsister
    }
- SisFriend:
    { what:
        - Name: ~ return SIS_FRIEND
        - Title: ~ return SIS_FRIEND_TITLE
        - State: ~ return SisFriendState
        - ObservedState: ~ return SisFriendObserved
        - Mood: ~ return SisFriendMood
        - BaseMood: ~ return SisFriendBaseMood
        - TalkFunction: ~ return -> talk_to_stepsister_friend
        - ObserveFunction: ~ return -> observe_stepsister_friend
    }
- Twin1:
    { what:
        - Name: ~ return TWIN1
        - Title: ~ return TWIN1_TITLE
        - State: ~ return TwinsState
        - ObservedState: ~ return TwinsObserved
        - Mood: ~ return TwinsMood
        - BaseMood: ~ return TwinsBaseMood
        - TalkFunction: ~ return -> talk_to_twin1
        - ObserveFunction: ~ return -> observe_twins
    }
- Twin2:
    { what:
        - Name: ~ return TWIN2
        - Title: ~ return TWIN2_TITLE
        - State: ~ return TwinsState
        - ObservedState: ~ return TwinsObserved
        - Mood: ~ return TwinsMood
        - BaseMood: ~ return TwinsBaseMood
        - TalkFunction: ~ return -> talk_to_twin2
        - ObserveFunction: ~ return -> observe_twins
    }
- Twins:
    { what:
        - Name: ~ return TWINS
        - Title: ~ return TWINS_TITLE
        - State: ~ return TwinsState
        - ObservedState: ~ return TwinsObserved
        - Mood: ~ return TwinsMood
        - BaseMood: ~ return TwinsBaseMood
        - TalkFunction: ~ return -> talk_to_twins
        - ObserveFunction: ~ return -> observe_twins
    }
- Nurse:
    { what:
        - Name: ~ return NURSE
        - Title: ~ return NURSE_TITLE
        - State: ~ return NurseState
        - ObservedState: ~ return NurseObserved
        - Mood: ~ return NurseMood
        - BaseMood: ~ return NurseBaseMood
        - TalkFunction: ~ return -> talk_to_nurse
        - ObserveFunction: ~ return -> observe_nurse
    }
- Secretary:
    { what:
        - Name: ~ return SECRETARY
        - Title: ~ return SECRETARY_TITLE
        - State: ~ return SecretaryState
        - ObservedState: ~ return SecretaryObserved
        - Mood: ~ return SecretaryMood
        - BaseMood: ~ return SecretaryBaseMood
        - TalkFunction: ~ return -> talk_to_secretary
        - ObserveFunction: ~ return -> observe_secretary
    }
- HealthTeacher:
    { what:
        - Name: ~ return HEALTH_TEACHER
        - Title: ~ return HEALTH_TEACHER_TITLE
        - State: ~ return HealthTeacherState
        - ObservedState: ~ return HealthTeacherObserved
        - Mood: ~ return HealthTeacherMood
        - BaseMood: ~ return HealthTeacherBaseMood
        - TalkFunction: ~ return -> talk_to_health_teacher
        - ObserveFunction: ~ return -> observe_health_teacher
    }
}

/*
- Return a comma-separated list of people.
*/
=== function listRoomPeople(characters)
{ not characters:
    ~ return "" // if no one is here, say nothing
}
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins) // if both twins are here, list them together
}
~ listPrint(characters, -> nameAndTitle)

/*
- Return a comma-separated list of people as a full sentence.
*/
=== function listRoomPeopleSentence(characters)
{ LIST_COUNT(characters) > 0:
    Looking around, you see {listRoomPeople(characters)}.
}

/*
- Combine a character's name with their title.
- eg, "Nandor the Relentless".
*/
=== function nameAndTitle(who)
~ temp name = characterData(who, Name)
~ temp title = characterData(who, Title)
{ (Gossip, Stepsister) ? who:
    ~ return "{title:{title} }{name}" // special case for "your" titles
}
~ return "{name}{title: {title}}"

/*
- Generate a list of options to talk or observe anyone in the room.
- This list will be nested if there's more than two people.
*/
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
{ LIST_COUNT(unobserved) > 0:
    + [Observe someone]
        Who do you want to observe?
        <- observeAllCharacters(characters, return_to)
        -> DONE
}

/*
- Generate a list of options to talk to anyone in the room.
*/
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

/*
- Generate a list of options to observe anyone in the room.
*/
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

/*
- Generate an option to talk to a person.
*/
=== talkToCharacter(who, -> return_to)
~ temp name = characterData(who, Name)
~ temp target = characterData(who, TalkFunction)
+ [Talk to {name}] -> target ->
-> return_to

/*
- Generate an option to observe a person if they're not already observed.
*/
=== observeCharacter(who, -> return_to)
~ temp name = characterData(who, Name)
~ temp state = characterData(who, State)
~ temp observed = characterData(who, ObservedState)
~ temp target = characterData(who, ObserveFunction)
+ {state !? observed} [Observe {name}] -> target ->
-> return_to

/*
- Improve a character's mood.
*/
=== function improveMood(ref mood)
{ mood != Desperate:
    ~ mood++
}

/*
- Worsen a character's mood.
*/
=== function worsenMood(ref mood)
{ mood != Hostile:
    ~ mood--
}

/*
- Return a given student's class schedule.
*/
=== function reportSchedule(who)
{ who:
- Actor: {ACTOR}: 1. Health, 2. Study Hall, 3. Science, 4. Theater
- Athlete: {ATHLETE}: 1. Gym, 2. Science, 3. Study Hall, 4. Health
- Believer: {BELIEVER}: 1. Study Hall, 2. Gym, 3. Health, 4. Photography
- Cheerleader: {CHEERLEADER}: 1. Study Hall, 2. Health, 3. Gym, 4. Theater
- Gossip: {GOSSIP}: 1. Health, 2. Theater, 3. Science, 4. Study Hall
- Nerd: {NERD}: 1. Science, 2. Health, 3. Theater, 4. Study Hall
- Nympho: {NYMPHO}: 1. Theater, 2. Photography, 3. Health, 4. Science
- Photographer: {PHOTOGRAPHER}: 1. Theater, 2. Science, 3. Gym, 4. Photography
- Queen: {QUEEN}: 1. Photography, 2. Study Hall, 3. Theater, 4. Gym
- Rebel: {REBEL}: 1. Science, 2. Gym, 3. Photography, 4. Study Hall
- Scientist: {SCIENTIST}: 1. Gym, 2. Photography, 3. Study Hall, 4. Science
- Twins: Interestingly, it seems even the school’s staff has trouble telling the twins apart. They have two schedules, both simply labeled “{TWINS}”:
    1. Photography, 2. Health, 3. Theater, 4. Gym
    1. Gym, 2. Theater, 3. Photography, 4. Health
}

/*
- Determine who is where, when.
*/
=== function characterScheduler()
{isWeekday():
{ now:
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
    ~ CafeteriaPeople += (Nerd)
    ~ LibraryPeople += (Nympho)
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
{ now:
- Period1:
    ~ FieldPeople += (Athlete)
    ~ BleachersPeople += (Cheerleader, Jock)
    ~ ChurchPeople += (Believer)
    ~ DressStorePeople += (Gossip, Photographer)
    ~ ShoeStorePeople += (Queen, Twin1, Twin2)
    ~ BraStorePeople += (Nympho)
    ~ BookStorePeople += (Scientist)
    ~ MovieTheaterPeople += (Nerd, Rebel)
    ~ SisBedroomPeople += (Stepsister, SisFriend)
- Period2:
    ~ FieldPeople += (Cheerleader, Jock)
    ~ BleachersPeople += (Actor, Athlete, Photographer)
    ~ ChurchPeople += (Believer)
    ~ DressStorePeople += (Queen, Twin1, Twin2)
    ~ ShoeStorePeople += (Gossip, Nympho)
    ~ BraStorePeople += (Stepsister, SisFriend)
    ~ BookStorePeople += (Scientist)
    ~ MovieTheaterPeople += (Nerd, Rebel)
- Lunch:
    ~ FieldPeople += (Cheerleader, Jock)
    ~ BleachersPeople += (Actor, Athlete, Photographer)
    ~ ChurchPeople += (Believer)
    ~ FoodCourtPeople += (Gossip, Nerd, Nympho, Queen, Twin1, Twin2, Rebel, Scientist, Stepsister, SisFriend)
- Period3:
    ~ FieldPeople += (Cheerleader, Jock)
    ~ BleachersPeople += (Actor, Athlete, Photographer)
    ~ ChurchPeople += (Believer)
    ~ DressStorePeople += (Queen, Twin1, Twin2)
    ~ ShoeStorePeople += (Stepsister, SisFriend)
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
    ~ SisBedroomPeople += (Stepsister, SisFriend)
- AfterSchool:
    ~ FieldPeople += (Athlete)
    ~ ChurchPeople += (Believer)
    ~ DressStorePeople += (Gossip, Nympho)
    ~ ShoeStorePeople += (Nerd)
    ~ BraStorePeople += (Queen, Twin1, Twin2)
    ~ BookStorePeople += (Scientist)
    ~ BathroomPeople += (Stepsister)
    ~ SisBedroomPeople += (SisFriend)
- Night:
    ~ SisBedroomPeople += (Stepsister, SisFriend)
}
}

/*
- Remove all people from every room.
- Run it before characterScheduler().
*/
=== function clearLocations()
~ CafeteriaPeople = ()
    ~ StoragePeople = ()
~ ChurchPeople = ()
~ ClinicPeople = ()
    ~ ExamAreaPeople = ()
~ FieldPeople = ()
    ~ BleachersPeople = ()
    ~ UnderBleachersPeople = ()
~ GymPeople = ()
    ~ LockerRoomPeople = ()
~ HealthClassPeople = ()
~ LabPeople = ()
~ LibraryPeople = ()
~ LoungePeople = ()
~ OfficePeople = ()
    ~ SupplyClosetPeople = ()
~ PhotoClassPeople = ()
    ~ DarkroomPeople = ()
~ StudyHallPeople = ()
~ TheaterPeople = ()
    ~ BackstagePeople = ()
// Special school locations
~ StairwellPeople = ()
~ RoofPeople = ()
// Mall locations
~ BraStorePeople = ()
~ BookStorePeople = ()
~ DressStorePeople = ()
~ FoodCourtPeople = ()
~ MovieTheaterPeople = ()
~ ShoeStorePeople = ()
// House locations
~ BedroomPeople = ()
~ BathroomPeople = ()
~ SisBedroomPeople = ()

/*
- Reset all people to their base state.
- Run it at the start of each day.
*/
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
~ SisFriendMood = SisFriendBaseMood
~ TwinsMood = TwinsBaseMood
~ HealthTeacherMood = HealthTeacherBaseMood
~ NurseMood = NurseBaseMood
~ SecretaryMood = SecretaryBaseMood

