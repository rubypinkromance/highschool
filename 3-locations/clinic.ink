/*

    The Nurse's Office

*/
=== clinic ===
CONST CLINIC = "nurse’s office"
VAR ClinicPeople = ()
~ here = Clinic

You are in the {CLINIC}. The walls are covered with posters showing basic first aid techniques. There are a few seats in front of {NURSE}'s desk, and a floor-to-ceiling curtain is hung to provide a private exam area from the rest of the room.

- (clinic_opts)
<- character_opts(ClinicPeople, -> clinic_opts)

+ [Go to the {EXAM_AREA}] -> exam_area
+ [Leave the {CLINIC}] -> pass_time -> hallway
- -> clinic_opts

/*

    Behind the Exam Curtain

*/
= exam_area
CONST EXAM_AREA = "exam area"
VAR ExamAreaPeople = ()
~ here = ExamArea

You are in the {EXAM_AREA}. There is a small bed here.

TODO: write black eye encounter
TODO: write ow my balls encounter

+ [Leave the {EXAM_AREA}] -> clinic
