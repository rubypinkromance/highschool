/*
    Try to avoid multiple characters whose names start with the same letter.

- Amy?
- Beth?
- Claire   - Nympho
- Dana     - Actor
- Emily?
- Felicia  - Nerd
- Grace    - Scientist (Asian)
- Heather  - Stepsister
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
- Whitney  - Friend
- Zia      - Rebel
*/

/*
    Character Information Database.
    This looks super long and verbose, not to mention repetitive, but it lets us keep all the actual character data in that character's include file, so this file is just for logic.
*/
=== function characterData(who, what)
{ who:
- Actor:
    { what:
        - Name: ~ return ACTOR
        - Title: ~ return ACTOR_TITLE
        - State: ~ return ActorState
        - PlayState: ~ return ActorInPlay
        - ObservedState: ~ return ActorObserved
        - Mood: ~ return ActorMood
        - BaseMood: ~ return ActorBaseMood
        - TalkFunction: ~ return -> talk_to_actor
        - ObserveFunction: ~ return -> observe_actor
        - DreamFunction: ~ return -> dream_of_actor
        - HintFunction: ~ return -> actor_hints
    }
- Athlete:
    { what:
        - Name: ~ return ATHLETE
        - Title: ~ return ATHLETE_TITLE
        - State: ~ return AthleteState
        - PlayState: ~ return AthleteInPlay
        - ObservedState: ~ return AthleteObserved
        - Mood: ~ return AthleteMood
        - BaseMood: ~ return AthleteBaseMood
        - TalkFunction: ~ return -> talk_to_athlete
        - ObserveFunction: ~ return -> observe_athlete
        - DreamFunction: ~ return -> dream_of_athlete
        - HintFunction: ~ return -> athlete_hints
    }
- Believer:
    { what:
        - Name: ~ return BELIEVER
        - Title: ~ return BELIEVER_TITLE
        - State: ~ return BelieverState
        - PlayState: ~ return BelieverInPlay
        - ObservedState: ~ return BelieverObserved
        - Mood: ~ return BelieverMood
        - BaseMood: ~ return BelieverBaseMood
        - TalkFunction: ~ return -> talk_to_believer
        - ObserveFunction: ~ return -> observe_believer
        - DreamFunction: ~ return -> dream_of_believer
        - HintFunction: ~ return -> believer_hints
    }
- Cheerleader:
    { what:
        - Name: ~ return CHEERLEADER
        - Title: ~ return CHEERLEADER_TITLE
        - State: ~ return CheerleaderState
        - PlayState: ~ return CheerleaderInPlay
        - ObservedState: ~ return CheerleaderObserved
        - Mood: ~ return CheerleaderMood
        - BaseMood: ~ return CheerleaderBaseMood
        - TalkFunction: ~ return -> talk_to_cheerleader
        - ObserveFunction: ~ return -> observe_cheerleader
        - DreamFunction: ~ return -> dream_of_cheerleader
        - HintFunction: ~ return -> cheerleader_hints
    }
- Friend:
    { what:
        - Name: ~ return FRIEND
        - Title: ~ return FRIEND_TITLE
        - State: ~ return FriendState
        - PlayState: ~ return FriendInPlay
        - ObservedState: ~ return FriendObserved
        - Mood: ~ return FriendMood
        - BaseMood: ~ return FriendBaseMood
        - TalkFunction: ~ return -> talk_to_friend
        - ObserveFunction: ~ return -> observe_friend
        - DreamFunction: ~ return -> dream_of_friend
        - HintFunction: ~ return -> friend_hints
    }
- Nerd:
    { what:
        - Name: ~ return NERD
        - Title: ~ return NERD_TITLE
        - State: ~ return NerdState
        - PlayState: ~ return NerdInPlay
        - ObservedState: ~ return NerdObserved
        - Mood: ~ return NerdMood
        - BaseMood: ~ return NerdBaseMood
        - TalkFunction: ~ return -> talk_to_nerd
        - ObserveFunction: ~ return -> observe_nerd
        - DreamFunction: ~ return -> dream_of_nerd
        - HintFunction: ~ return -> nerd_hints
    }
- Jock:
    { what:
        - Name: ~ return JOCK
        - Title: ~ return JOCK_TITLE
        - State: ~ return JockState
        - PlayState: ~ return JockInPlay
        - ObservedState: ~ return JockObserved
        - Mood: ~ return JockMood
        - BaseMood: ~ return JockBaseMood
        - TalkFunction: ~ return -> talk_to_jock
        - ObserveFunction: ~ return -> observe_jock
        - DreamFunction: ~ return -> dream_of_jock
        - HintFunction: ~ return -> jock_hints
    }
- Nympho:
    { what:
        - Name: ~ return NYMPHO
        - Title: ~ return NYMPHO_TITLE
        - State: ~ return NymphoState
        - PlayState: ~ return NymphoInPlay
        - ObservedState: ~ return NymphoObserved
        - Mood: ~ return NymphoMood
        - BaseMood: ~ return NymphoBaseMood
        - TalkFunction: ~ return -> talk_to_nympho
        - ObserveFunction: ~ return -> observe_nympho
        - DreamFunction: ~ return -> dream_of_nympho
        - HintFunction: ~ return -> nympho_hints
    }
- Photographer:
    { what:
        - Name: ~ return PHOTOGRAPHER
        - Title: ~ return PHOTOGRAPHER_TITLE
        - State: ~ return PhotographerState
        - PlayState: ~ return PhotographerInPlay
        - ObservedState: ~ return PhotographerObserved
        - Mood: ~ return PhotographerMood
        - BaseMood: ~ return PhotographerBaseMood
        - TalkFunction: ~ return -> talk_to_photographer
        - ObserveFunction: ~ return -> observe_photographer
        - DreamFunction: ~ return -> dream_of_photographer
        - HintFunction: ~ return -> photographer_hints
    }
- Queen:
    { what:
        - Name: ~ return QUEEN
        - Title: ~ return QUEEN_TITLE
        - State: ~ return QueenState
        - PlayState: ~ return QueenInPlay
        - ObservedState: ~ return QueenObserved
        - Mood: ~ return QueenMood
        - BaseMood: ~ return QueenBaseMood
        - TalkFunction: ~ return -> talk_to_queen
        - ObserveFunction: ~ return -> observe_queen
        - DreamFunction: ~ return -> dream_of_queen
        - HintFunction: ~ return -> queen_hints
    }
- Rebel:
    { what:
        - Name: ~ return REBEL
        - Title: ~ return REBEL_TITLE
        - State: ~ return RebelState
        - PlayState: ~ return RebelInPlay
        - ObservedState: ~ return RebelObserved
        - Mood: ~ return RebelMood
        - BaseMood: ~ return RebelBaseMood
        - TalkFunction: ~ return -> talk_to_rebel
        - ObserveFunction: ~ return -> observe_rebel
        - DreamFunction: ~ return -> dream_of_rebel
        - HintFunction: ~ return -> rebel_hints
    }
- Scientist:
    { what:
        - Name: ~ return SCIENTIST
        - Title: ~ return SCIENTIST_TITLE
        - State: ~ return ScientistState
        - PlayState: ~ return ScientistInPlay
        - ObservedState: ~ return ScientistObserved
        - Mood: ~ return ScientistMood
        - BaseMood: ~ return ScientistBaseMood
        - TalkFunction: ~ return -> talk_to_scientist
        - ObserveFunction: ~ return -> observe_scientist
        - DreamFunction: ~ return -> dream_of_scientist
        - HintFunction: ~ return -> scientist_hints
    }
- Stepsister:
    { what:
        - Name: ~ return SIS
        - Title: ~ return SIS_TITLE
        - State: ~ return SisState
        - PlayState: ~ return SisInPlay
        - ObservedState: ~ return SisObserved
        - Mood: ~ return SisMood
        - BaseMood: ~ return SisBaseMood
        - TalkFunction: ~ return -> talk_to_stepsister
        - ObserveFunction: ~ return -> observe_stepsister
        - DreamFunction: ~ return -> dream_of_stepsister
        - HintFunction: ~ return -> stepsister_hints
    }
- SisFriend:
    { what:
        - Name: ~ return SIS_FRIEND
        - Title: ~ return SIS_FRIEND_TITLE
        - State: ~ return SisFriendState
        - PlayState: ~ return SisFriendInPlay
        - ObservedState: ~ return SisFriendObserved
        - Mood: ~ return SisFriendMood
        - BaseMood: ~ return SisFriendBaseMood
        - TalkFunction: ~ return -> talk_to_stepsister_friend
        - ObserveFunction: ~ return -> observe_stepsister_friend
        - DreamFunction: ~ return -> dream_of_stepsister_friend
        - HintFunction: ~ return -> stepsister_friend_hints
    }
- Twin1:
    { what:
        - Name: ~ return TWIN1
        - Title: ~ return TWIN1_TITLE
        - State: ~ return TwinsState
        - PlayState: ~ return TwinsInPlay
        - ObservedState: ~ return TwinsObserved
        - Mood: ~ return TwinsMood
        - BaseMood: ~ return TwinsBaseMood
        - TalkFunction: ~ return -> talk_to_twin1
        - ObserveFunction: ~ return -> observe_twins
        - DreamFunction: ~ return -> dream_of_twins
        - HintFunction: ~ return -> twins_hints
    }
- Twin2:
    { what:
        - Name: ~ return TWIN2
        - Title: ~ return TWIN2_TITLE
        - State: ~ return TwinsState
        - PlayState: ~ return TwinsInPlay
        - ObservedState: ~ return TwinsObserved
        - Mood: ~ return TwinsMood
        - BaseMood: ~ return TwinsBaseMood
        - TalkFunction: ~ return -> talk_to_twin2
        - ObserveFunction: ~ return -> observe_twins
        - DreamFunction: ~ return -> dream_of_twins
        - HintFunction: ~ return -> twins_hints
    }
- Twins:
    { what:
        - Name: ~ return TWINS
        - Title: ~ return TWINS_TITLE
        - State: ~ return TwinsState
        - PlayState: ~ return TwinsInPlay
        - ObservedState: ~ return TwinsObserved
        - Mood: ~ return TwinsMood
        - BaseMood: ~ return TwinsBaseMood
        - TalkFunction: ~ return -> talk_to_twins
        - ObserveFunction: ~ return -> observe_twins
        - DreamFunction: ~ return -> dream_of_twins
        - HintFunction: ~ return -> twins_hints
    }
- Nurse:
    { what:
        - Name: ~ return NURSE
        - Title: ~ return NURSE_TITLE
        - State: ~ return NurseState
        - PlayState: ~ return NurseInPlay
        - ObservedState: ~ return NurseObserved
        - Mood: ~ return NurseMood
        - BaseMood: ~ return NurseBaseMood
        - TalkFunction: ~ return -> talk_to_nurse
        - ObserveFunction: ~ return -> observe_nurse
        - DreamFunction: ~ return -> dream_of_nurse
        - HintFunction: ~ return -> nurse_hints
    }
- Secretary:
    { what:
        - Name: ~ return SECRETARY
        - Title: ~ return SECRETARY_TITLE
        - State: ~ return SecretaryState
        - PlayState: ~ return SecretaryInPlay
        - ObservedState: ~ return SecretaryObserved
        - Mood: ~ return SecretaryMood
        - BaseMood: ~ return SecretaryBaseMood
        - TalkFunction: ~ return -> talk_to_secretary
        - ObserveFunction: ~ return -> observe_secretary
        - DreamFunction: ~ return -> dream_of_secretary
        - HintFunction: ~ return -> secretary_hints
    }
- GymTeacher:
    { what:
        - Name: ~ return GYM_TEACHER
        - Title: ~ return GYM_TEACHER_TITLE
        - State: ~ return GymTeacherState
        - PlayState: ~ return GymTeacherInPlay
        - ObservedState: ~ return GymTeacherObserved
        - Mood: ~ return GymTeacherMood
        - BaseMood: ~ return GymTeacherBaseMood
        - TalkFunction: ~ return -> talk_to_gym_teacher
        - ObserveFunction: ~ return -> observe_gym_teacher
        - DreamFunction: ~ return -> dream_of_gym_teacher
        - HintFunction: ~ return -> gym_teacher_hints
    }
- HealthTeacher:
    { what:
        - Name: ~ return HEALTH_TEACHER
        - Title: ~ return HEALTH_TEACHER_TITLE
        - State: ~ return HealthTeacherState
        - PlayState: ~ return HealthTeacherInPlay
        - ObservedState: ~ return HealthTeacherObserved
        - Mood: ~ return HealthTeacherMood
        - BaseMood: ~ return HealthTeacherBaseMood
        - TalkFunction: ~ return -> talk_to_health_teacher
        - ObserveFunction: ~ return -> observe_health_teacher
        - DreamFunction: ~ return -> dream_of_health_teacher
        - HintFunction: ~ return -> health_teacher_hints
    }
- PhotoTeacher:
    { what:
        - Name: ~ return PHOTO_TEACHER
        - Title: ~ return PHOTO_TEACHER_TITLE
        - State: ~ return PhotoTeacherState
        - PlayState: ~ return PhotoTeacherInPlay
        - ObservedState: ~ return PhotoTeacherObserved
        - Mood: ~ return PhotoTeacherMood
        - BaseMood: ~ return PhotoTeacherBaseMood
        - TalkFunction: ~ return -> talk_to_photo_teacher
        - ObserveFunction: ~ return -> observe_photo_teacher
        - DreamFunction: ~ return -> dream_of_photo_teacher
        - HintFunction: ~ return -> photo_teacher_hints
    }
- ScienceTeacher:
    { what:
        - Name: ~ return SCIENCE_TEACHER
        - Title: ~ return SCIENCE_TEACHER_TITLE
        - State: ~ return ScienceTeacherState
        - PlayState: ~ return ScienceTeacherInPlay
        - ObservedState: ~ return ScienceTeacherObserved
        - Mood: ~ return ScienceTeacherMood
        - BaseMood: ~ return ScienceTeacherBaseMood
        - TalkFunction: ~ return -> talk_to_science_teacher
        - ObserveFunction: ~ return -> observe_science_teacher
        - DreamFunction: ~ return -> dream_of_science_teacher
        - HintFunction: ~ return -> science_teacher_hints
    }
- StudyHallTeacher:
    { what:
        - Name: ~ return STUDY_HALL_TEACHER
        - Title: ~ return STUDY_HALL_TEACHER_TITLE
        - State: ~ return StudyHallTeacherState
        - PlayState: ~ return StudyHallTeacherInPlay
        - ObservedState: ~ return StudyHallTeacherObserved
        - Mood: ~ return StudyHallTeacherMood
        - BaseMood: ~ return StudyHallTeacherBaseMood
        - TalkFunction: ~ return -> talk_to_study_hall_teacher
        - ObserveFunction: ~ return -> observe_study_hall_teacher
        - DreamFunction: ~ return -> dream_of_study_hall_teacher
        - HintFunction: ~ return -> study_hall_teacher_hints
    }
- TheaterTeacher:
    { what:
        - Name: ~ return THEATER_TEACHER
        - Title: ~ return THEATER_TEACHER_TITLE
        - State: ~ return TheaterTeacherState
        - PlayState: ~ return TheaterTeacherInPlay
        - ObservedState: ~ return TheaterTeacherObserved
        - Mood: ~ return TheaterTeacherMood
        - BaseMood: ~ return TheaterTeacherBaseMood
        - TalkFunction: ~ return -> talk_to_theater_teacher
        - ObserveFunction: ~ return -> observe_theater_teacher
        - DreamFunction: ~ return -> dream_of_theater_teacher
        - HintFunction: ~ return -> theater_teacher_hints
    }
}
