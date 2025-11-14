LIST Locations = Intro, Cafeteria, StorageCloset, Church, Clinic, ExamArea, Field, Bleachers, UnderBleachers, Gym, LockerRoom, HealthClass, Lab, Library, Lounge, Office, SupplyCloset, PhotoClass, Darkroom, Hallway, Locker, Stairwell, Roof, StudyHall, Theater, Backstage, Mall, BraStore, BookStore, DressStore, FoodCourt, MovieTheater, ShoeStore, Bedroom, Bathroom, SisBedroom
VAR HomeLocations = (Bedroom, Bathroom, SisBedroom)
VAR MallLocations = (BraStore, BookStore, DressStore, FoodCourt, MovieTheater, ShoeStore)

VAR here = Intro

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
