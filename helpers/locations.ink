LIST Locations = Nowhere, Cafeteria, StorageCloset, Church, Clinic, ExamArea, Field, Bleachers, UnderBleachers, Gym, LockerRoom, HealthClass, Lab, Library, Lounge, Office, SupplyCloset, PhotoClass, Darkroom, Hallway, Locker, Stairwell, Roof, StudyHall, Theater, Backstage, Mall, BraStore, BookStore, DressStore, FoodCourt, MovieTheater, ShoeStore, Bedroom, Bathroom, SisBedroom
LIST LocationAttributes = LocationName, LocationClassName, LocationPeople
VAR Classrooms = (Gym, HealthClass, Lab, PhotoClass, StudyHall, Theater)
VAR HomeLocations = (Bedroom, Bathroom, SisBedroom)
VAR MallLocations = (Mall, BraStore, BookStore, DressStore, FoodCourt, MovieTheater, ShoeStore)

VAR here = Nowhere

/*
- Location Information Database.
- This looks super long and verbose, not to mention repetitive, but it lets us keep all the actual location data in that location's include file, so this file is just for logic.
*/
=== function locationData(location, what)
{ location:
- Cafeteria:
    { what:
        - LocationName: ~ return CAFETERIA
        - LocationPeople: ~ return CafeteriaPeople
    }
- StorageCloset:
    { what:
        - LocationName: ~ return STORAGE_CLOSET
        - LocationPeople: ~ return StorageClosetPeople
    }
- Church:
    { what:
        - LocationName: ~ return CHURCH
        - LocationPeople: ~ return ChurchPeople
    }
- Clinic:
    { what:
        - LocationName: ~ return CLINIC
        - LocationPeople: ~ return ClinicPeople
    }
- ExamArea:
    { what:
        - LocationName: ~ return EXAM_AREA
        - LocationPeople: ~ return ExamAreaPeople
    }
- Field:
    { what:
        - LocationName: ~ return FIELD
        - LocationPeople: ~ return FieldPeople
    }
- Bleachers:
    { what:
        - LocationName: ~ return BLEACHERS
        - LocationPeople: ~ return BleachersPeople
    }
- UnderBleachers:
    { what:
        - LocationName: ~ return UNDER_BLEACHERS
        - LocationPeople: ~ return UnderBleachersPeople
    }
- Gym:
    { what:
        - LocationName: ~ return GYM
        - LocationClassName: ~ return GYM_CLASS_NAME
        - LocationPeople: ~ return GymPeople
    }
- LockerRoom:
    { what:
        - LocationName: ~ return LOCKER_ROOM
        - LocationPeople: ~ return LockerRoomPeople
    }
- HealthClass:
    { what:
        - LocationName: ~ return HEALTH_CLASS
        - LocationClassName: ~ return HEALTH_CLASS_NAME
        - LocationPeople: ~ return HealthClassPeople
    }
- Lab:
    { what:
        - LocationName: ~ return LAB
        - LocationClassName: ~ return LAB_CLASS_NAME
        - LocationPeople: ~ return LabPeople
    }
- Library:
    { what:
        - LocationName: ~ return LIBRARY
        - LocationPeople: ~ return LibraryPeople
    }
- Lounge:
    { what:
        - LocationName: ~ return LOUNGE
        - LocationPeople: ~ return LoungePeople
    }
- Office:
    { what:
        - LocationName: ~ return OFFICE
        - LocationPeople: ~ return OfficePeople
    }
- SupplyCloset:
    { what:
        - LocationName: ~ return SUPPLY_CLOSET
        - LocationPeople: ~ return SupplyClosetPeople
    }
- PhotoClass:
    { what:
        - LocationName: ~ return PHOTO_CLASS
        - LocationClassName: ~ return PHOTO_CLASS_NAME
        - LocationPeople: ~ return PhotoClassPeople
    }
- Darkroom:
    { what:
        - LocationName: ~ return DARKROOM
        - LocationPeople: ~ return DarkroomPeople
    }
- StudyHall:
    { what:
        - LocationName: ~ return STUDY_HALL
        - LocationClassName: ~ return STUDY_HALL_CLASS_NAME
        - LocationPeople: ~ return StudyHallPeople
    }
- Theater:
    { what:
        - LocationName: ~ return THEATER
        - LocationClassName: ~ return THEATER_CLASS_NAME
        - LocationPeople: ~ return TheaterPeople
    }
- Backstage:
    { what:
        - LocationName: ~ return BACKSTAGE
        - LocationPeople: ~ return BackstagePeople
    }
- Stairwell:
    { what:
        - LocationName: ~ return STAIRWELL
        - LocationPeople: ~ return StairwellPeople
    }
- Roof:
    { what:
        - LocationName: ~ return ROOF
        - LocationPeople: ~ return RoofPeople
    }
- BraStore:
    { what:
        - LocationName: ~ return BRA_STORE
        - LocationPeople: ~ return BraStorePeople
    }
- BookStore:
    { what:
        - LocationName: ~ return BOOK_STORE
        - LocationPeople: ~ return BookStorePeople
    }
- DressStore:
    { what:
        - LocationName: ~ return DRESS_STORE
        - LocationPeople: ~ return DressStorePeople
    }
- FoodCourt:
    { what:
        - LocationName: ~ return FOOD_COURT
        - LocationPeople: ~ return FoodCourtPeople
    }
- MovieTheater:
    { what:
        - LocationName: ~ return MOVIE_THEATER
        - LocationPeople: ~ return MovieTheaterPeople
    }
- ShoeStore:
    { what:
        - LocationName: ~ return SHOE_STORE
        - LocationPeople: ~ return ShoeStorePeople
    }
- Bedroom:
    { what:
        - LocationName: ~ return BEDROOM
        - LocationPeople: ~ return BedroomPeople
    }
- Bathroom:
    { what:
        - LocationName: ~ return BATHROOM
        - LocationPeople: ~ return BathroomPeople
    }
- SisBedroom:
    { what:
        - LocationName: ~ return SIS_BEDROOM
        - LocationPeople: ~ return SisBedroomPeople
    }
}

/*
- Check if we're currently at home.
*/
=== function isHome()
~ return HomeLocations ? here

/*
- Check if we're currently at the mall.
*/
=== function isMall()
~ return MallLocations ? here

/*
- Check if we're currently at school.
*/
=== function isSchool()
{ here == Church or isHome() or isMall():
    ~ return false
}
~ return true

/*
- Remove all people from every room.
- Run it before characterScheduler().
*/
=== function clearLocations()
~ CafeteriaPeople = ()
    ~ StorageClosetPeople = ()
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
