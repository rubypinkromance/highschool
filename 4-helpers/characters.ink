LIST Staff = (GymTeacher), (HealthTeacher), (PhotoTeacher), (ScienceTeacher), (StudyHallTeacher), (TheaterTeacher), (Nurse), (Secretary)
// Assign yourself a value higher than the count of the staff list to ensure that teachers are sorted to the front of any mixed people list.
LIST Students = You = 20, (Actor), (Athlete), (Believer), (Cheerleader), (Friend), (Nerd), (Jock), (Nympho), (Photographer), (Queen), (Rebel), (Scientist), (Stepsister), (SisFriend), (Twin1), (Twin2), Twins
LIST CharacterAttributes = Name, Title, State, PlayState, ObservedState, Mood, BaseMood, Confidence, TalkFunction, ObserveFunction, DreamFunction, HintFunction
LIST CharacterMoods = Hostile, Neutral, Friendly, Aroused, Desperate
LIST CharacterCum = Facial, Mouth, Tits, Creampie, Anal

VAR last_girl = Cheerleader

/*
    Return a comma-separated list of people.
*/
=== function listRoomPeople(characters)
{ not characters:
    ~ return "" // if no one is here, say nothing
}
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins) // if both twins are here, list them together
}
~ return listReturn(characters, -> getNameAndTitle, "")

/*
    Print a comma-separated list of people as a full sentence.
*/
=== function lookForRoomPeople(characters)
{ LIST_COUNT(characters) > 0:
    Looking around, you see {listRoomPeople(characters)}.
}

/*
    Combine a character's name with their title.
    e.g., "Nandor the Relentless".
*/
=== function getNameAndTitle(who)
~ temp name = characterData(who, Name)
~ temp title = characterData(who, Title)
{ (Friend, Stepsister) ? who:
    ~ return "{title:{title} }{name}" // special case for "your" titles
}
~ return "{name}{title: {title}}"

/*
    Generate a list of options to talk or observe anyone in the room.
    This list will be nested if there's more than two people.
*/
=== character_opts(characters, -> return_to) ===
~ temp charactersCopy = characters
~ temp unobserved = ()
- (top)
~ temp who = pop(charactersCopy)
{ who:
    ~ temp state = characterData(who, State)
    ~ temp observed = characterData(who, ObservedState)
    TODO confirm Jock and Cheerleader still disappear
    { state < observed:
        ~ unobserved += who
    }
    -> top
}
{ LIST_COUNT(characters) > 2:
    + [Talk to someone]
        Who do you want to talk to?
        <- talk_all_characters(characters, return_to)
        -> DONE
- else:
    <- talk_all_characters(characters, return_to)
}
{ LIST_COUNT(unobserved) > 0:
    + [Observation mode]
        Who do you want to observe?
        <- observe_all_characters(characters, return_to)
        -> DONE
}

/*
    Generate a list of options to talk to anyone in the room.
*/
=== talk_all_characters(characters, -> return_to) ===
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins) // if both twins are here, list them together
}
- (top)
~ temp who = pop(characters)
{ who:
    <- talk_character(who, return_to)
    -> top
}

/*
    Generate a list of options to observe anyone in the room.
*/
=== observe_all_characters(characters, -> return_to) ===
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins) // if both twins are here, list them together
}
- (top)
~ temp who = pop(characters)
{ who:
    <- observe_character(who, return_to)
    -> top
}

/*
    Generate a list of options to receive hints about any character in play.
*/
=== hint_all_characters(characters, -> return_to) ===
{ characters ? (Twin1, Twin2):
    ~ characters -= (Twin1, Twin2)
    ~ characters += (Twins) // if both twins are here, list them together
}
- (top)
~ temp who = pop(characters)
{ who:
    <- hint_character(who, return_to)
    -> top
}

/*
    Generate an option to talk to a person.
*/
=== talk_character(who, -> return_to) ===
~ temp name = characterData(who, Name)
~ temp target = characterData(who, TalkFunction)
~ temp in_play = characterData(who, PlayState)
+ {in_play} [Talk to {name}] -> target ->
-> return_to

/*
    Generate an option to observe a person if they're not already observed.
*/
=== observe_character(who, -> return_to) ===
~ temp name = characterData(who, Name)
~ temp state = characterData(who, State)
~ temp observed = characterData(who, ObservedState)
~ temp target = characterData(who, ObserveFunction)
+ {state < observed} [Observe {name}] -> target ->
-> return_to

/*
    Generate an option to receive a hint about a person if they're in play.
*/
=== hint_character(who, -> return_to) ===
~ temp state = characterData(who, State)
~ temp in_play = characterData(who, PlayState)
~ temp target = characterData(who, HintFunction)
+ {in_play} [{getNameAndTitle(who)}] -> target ->
-> return_to

/*
    Improve a character's mood.
*/
=== function improveMood(ref mood)
{ mood != Desperate:
    ~ mood++
}

/*
    Worsen a character's mood.
*/
=== function worsenMood(ref mood)
{ mood != Hostile:
    ~ mood--
}

/*
    Return a given student's class schedule.
*/
=== function printSchedule(who)
{ who:
- Actor: {ACTOR}: 1. Health, 2. Study Hall, 3. Science, 4. Theater
- Athlete: {ATHLETE}: 1. Gym, 2. Science, 3. Study Hall, 4. Health
- Believer: {BELIEVER}: 1. Study Hall, 2. Gym, 3. Health, 4. Photography
- Cheerleader: {CHEERLEADER}: 1. Study Hall, 2. Health, 3. Gym, 4. Theater
- Friend: {FRIEND}: 1. Health, 2. Theater, 3. Science, 4. Study Hall
- Nerd: {NERD}: 1. Science, 2. Health, 3. Theater, 4. Study Hall
- Nympho: {NYMPHO}: 1. Theater, 2. Photography, 3. Health, 4. Science
- Photographer: {PHOTOGRAPHER}: 1. Theater, 2. Science, 3. Gym, 4. Photography
- Queen: {QUEEN}: 1. Photography, 2. Study Hall, 3. Theater, 4. Gym
- Rebel: {REBEL}: 1. Science, 2. Gym, 3. Photography, 4. Study Hall
- Scientist: {SCIENTIST}: 1. Gym, 2. Photography, 3. Study Hall, 4. Science
- Twins: Interestingly, it seems even the school’s staff has trouble telling the twins apart. They have two schedules, both simply labeled “{TWINS}”:
    1. Photography, 2. Health, 3. Theater, 4. Gym
    1. Gym, 2. Theater, 3. Photography, 4. Health
- You: 1. {schedule_period_1}, 2. {schedule_period_2}, 3. {schedule_period_3}, 4. {schedule_period_4}
}

/*
    Determine who is where, when.
*/
=== function characterScheduler()
{isWeekday():
{ now:
- Period1:
    ~ GymPeople += (GymTeacher, Athlete, Scientist, Twin2)
    ~ HealthClassPeople += (HealthTeacher, Actor, Friend)
    ~ PhotoClassPeople += (PhotoTeacher, Queen, Twin1)
    ~ LabPeople += (ScienceTeacher, Nerd, Rebel)
    ~ StudyHallPeople += (StudyHallTeacher, Believer, Cheerleader, Jock)
    ~ TheaterPeople += (TheaterTeacher, Photographer, Nympho)
    ~ OfficePeople += (Secretary)
    ~ ClinicPeople += (Nurse)
- Period2:
    ~ GymPeople += (GymTeacher, Believer, Rebel)
    ~ HealthClassPeople += (HealthTeacher, Cheerleader, Jock, Nerd, Twin1)
    ~ PhotoClassPeople += (PhotoTeacher, Nympho, Scientist)
    ~ LabPeople += (ScienceTeacher, Athlete, Photographer)
    ~ StudyHallPeople += (StudyHallTeacher, Actor, Queen)
    ~ TheaterPeople += (TheaterTeacher, Friend, Twin2)
    ~ OfficePeople += (Secretary)
    ~ ClinicPeople += (Nurse)
- Lunch:
    ~ CafeteriaPeople += (Actor, Believer, Cheerleader, Jock, Friend, Nympho, Queen, Twin1, Twin2)
    ~ LoungePeople = (GymTeacher, HealthTeacher, PhotoTeacher, ScienceTeacher, StudyHallTeacher, TheaterTeacher, Secretary, Nurse)
    ~ LibraryPeople += (Nerd, Scientist)
    ~ FieldPeople += (Athlete)
    ~ BleachersPeople += (Photographer)
    ~ UnderBleachersPeople += (Rebel)
- Period3:
    ~ GymPeople += (GymTeacher, Cheerleader, Jock, Photographer)
    ~ HealthClassPeople += (HealthTeacher, Believer, Nympho)
    ~ PhotoClassPeople += (PhotoTeacher, Rebel, Twin2)
    ~ LabPeople += (ScienceTeacher, Actor, Friend)
    ~ StudyHallPeople += (StudyHallTeacher, Athlete, Scientist)
    ~ TheaterPeople += (TheaterTeacher, Nerd, Queen, Twin1)
    ~ OfficePeople += (Secretary)
    ~ ClinicPeople += (Nurse)
- Period4:
    ~ GymPeople += (GymTeacher, Queen, Twin1)
    ~ HealthClassPeople += (HealthTeacher, Athlete, Twin2)
    ~ PhotoClassPeople += (PhotoTeacher, Believer, Photographer)
    ~ LabPeople += (ScienceTeacher, Nympho, Scientist)
    ~ StudyHallPeople += (StudyHallTeacher, Friend, Nerd, Rebel)
    ~ TheaterPeople += (TheaterTeacher, Actor, Cheerleader, Jock)
    ~ OfficePeople += (Secretary)
    ~ ClinicPeople += (Nurse)
- AfterSchool:
    ~ GymPeople += (Athlete)
    ~ HealthClassPeople += (HealthTeacher)
    ~ PhotoClassPeople += (Photographer)
    ~ LabPeople += (Scientist)
    ~ StudyHallPeople += (StudyHallTeacher, Rebel, Believer)
    ~ TheaterPeople += (Actor)
    ~ CafeteriaPeople += (Nerd)
    ~ LibraryPeople += (Nympho)
    ~ FieldPeople += (Jock)
    ~ BleachersPeople += (Cheerleader, Friend)
    ~ OfficePeople += (Secretary)
    ~ BraStorePeople += (Queen, Twin1, Twin2)
    ~ BathroomPeople += (Stepsister)
    ~ ClinicPeople += (Nurse)
    {
    - CheerleaderState == CheerleaderReward or CheerleaderState == CheerleaderRevenge:
        ~ BleachersPeople -= Cheerleader
        ~ UnderBleachersPeople += (Cheerleader)
    }
- Night:
    ~ SisBedroomPeople += (Stepsister)
}
- else:
{ now:
- Period1:
    ~ ChurchPeople += (Believer)
    ~ FieldPeople += (Athlete)
    ~ BraStorePeople += (Nympho)
    ~ DressStorePeople += (Friend, Photographer)
    ~ ShoeStorePeople += (Queen, Twin1, Twin2)
    ~ BookStorePeople += (Actor, Scientist)
    ~ MovieTheaterPeople += (Nerd, Rebel)
    ~ SisBedroomPeople += (Stepsister)
    {
    - today == Saturday:
        ~ BleachersPeople += (Cheerleader)
        { CheerleaderState < CheerleaderTitjob:
            ~ BleachersPeople += (Jock)
        }
    - today == Sunday:
        ~ SisBedroomPeople += (SisFriend)
        ~ BraStorePeople += (Cheerleader)
        { CheerleaderState < CheerleaderTitjob:
            ~ FoodCourtPeople += (Jock)
        }
    }
- Period2:
    ~ ChurchPeople += (Believer)
    ~ FoodCourtPeople += (Friend)
    ~ BraStorePeople += (Stepsister, SisFriend)
    ~ DressStorePeople += (Queen, Twin1, Twin2)
    ~ ShoeStorePeople += (Nympho)
    ~ BookStorePeople += (Scientist)
    ~ MovieTheaterPeople += (Nerd, Rebel)
    {
    - today == Saturday:
        ~ FieldPeople += (Cheerleader, Jock)
        ~ BleachersPeople += (Actor, Athlete, Photographer)
    - today == Sunday:
        ~ FieldPeople += (Athlete)
        ~ FoodCourtPeople += (Cheerleader, Actor)
        ~ BookStorePeople += (Photographer)
        { CheerleaderState < CheerleaderTitjob:
            ~ FoodCourtPeople += (Jock)
        }
    }
- Lunch:
    ~ ChurchPeople += (Believer)
    ~ FoodCourtPeople += (Queen, Twin1, Twin2)
    ~ BraStorePeople += (Rebel)
    ~ DressStorePeople += (Stepsister, SisFriend)
    ~ ShoeStorePeople += (Friend)
    ~ BookStorePeople += (Scientist)
    ~ MovieTheaterPeople += (Nerd, Nympho)
    {
    - today == Saturday:
        ~ FieldPeople += (Cheerleader, Jock)
        ~ BleachersPeople += (Actor, Athlete, Photographer)
    - today == Sunday:
        ~ FieldPeople += (Athlete)
        ~ FoodCourtPeople += (Photographer)
        ~ BraStorePeople += (Cheerleader)
        ~ ShoeStorePeople += (Actor)
        { CheerleaderState < CheerleaderTitjob:
            ~ FoodCourtPeople += (Jock)
        }
    }
- Period3:
    ~ ChurchPeople += (Believer)
    ~ FoodCourtPeople += (Rebel)
    ~ BraStorePeople += (Friend)
    ~ DressStorePeople += (Queen, Twin1, Twin2)
    ~ ShoeStorePeople += (Stepsister, SisFriend)
    ~ BookStorePeople += (Scientist)
    ~ MovieTheaterPeople += (Nerd, Nympho)
    {
    - today == Saturday:
        ~ FieldPeople += (Cheerleader, Jock)
        ~ BleachersPeople += (Actor, Athlete, Photographer)
    - today == Sunday:
        ~ FieldPeople += (Athlete)
        ~ BraStorePeople += (Photographer)
        ~ ShoeStorePeople += (Cheerleader)
        ~ BookStorePeople += (Actor)
        { CheerleaderState < CheerleaderTitjob:
            ~ FoodCourtPeople += (Jock)
        }
    }
- Period4:
    ~ ChurchPeople += (Believer)
    ~ FieldPeople += (Athlete)
    ~ FoodCourtPeople += (Scientist)
    ~ BraStorePeople += (Queen, Twin1, Twin2)
    ~ DressStorePeople += (Friend)
    ~ ShoeStorePeople += (Nympho, Photographer)
    ~ BookStorePeople += (Nerd)
    ~ MovieTheaterPeople += (Actor, Rebel)
    ~ SisBedroomPeople += (Stepsister)
    {
    - today == Saturday:
        ~ BleachersPeople += (Cheerleader)
        { CheerleaderState < CheerleaderTitjob:
            ~ BleachersPeople += (Jock)
        }
        ~ SisBedroomPeople += (SisFriend)
    - today == Sunday:
        ~ DressStorePeople += (Cheerleader)
        { CheerleaderState < CheerleaderTitjob:
            ~ FoodCourtPeople += (Jock)
        }
    }
- AfterSchool:
    ~ ChurchPeople += (Believer)
    ~ FieldPeople += (Athlete)
    ~ FoodCourtPeople += (Nympho)
    ~ BraStorePeople += (Queen, Twin1, Twin2)
    ~ DressStorePeople += (Friend)
    ~ ShoeStorePeople += (Nerd)
    ~ BookStorePeople += (Photographer, Scientist)
    ~ MovieTheaterPeople += (Actor, Rebel)
    ~ BathroomPeople += (Stepsister)
    {
    - today == Saturday:
        ~ BleachersPeople += (Cheerleader)
        { CheerleaderState < CheerleaderTitjob:
            ~ BleachersPeople += (Jock)
        }
        ~ SisBedroomPeople += (SisFriend)
    - today == Sunday:
        ~ ShoeStorePeople += (Cheerleader)
        { CheerleaderState < CheerleaderTitjob:
            ~ FoodCourtPeople += (Jock)
        }
    }
- Night:
    ~ SisBedroomPeople += (Stepsister)
    { today == Saturday:
        ~ SisBedroomPeople += (SisFriend)
    }
}
}

/*
    Reset all people to their base state.
    Run it at the start of each day.
*/
=== function resetMoods()
~ ActorMood = ActorBaseMood
~ AthleteMood = AthleteBaseMood
~ BelieverMood = BelieverBaseMood
~ CheerleaderMood = CheerleaderBaseMood
~ FriendMood = FriendBaseMood
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
~ GymTeacherMood = GymTeacherBaseMood
~ HealthTeacherMood = HealthTeacherBaseMood
~ PhotoTeacherMood = PhotoTeacherBaseMood
~ ScienceTeacherMood = ScienceTeacherBaseMood
~ StudyHallTeacherMood = StudyHallTeacherBaseMood
~ TheaterTeacherMood = TheaterTeacherBaseMood
~ NurseMood = NurseBaseMood
~ SecretaryMood = SecretaryBaseMood

