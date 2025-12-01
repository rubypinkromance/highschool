/*

    The Nurse's Office

*/
=== clinic ===
CONST CLINIC = "nurse’s office"
VAR ClinicPeople = ()
~ here = Clinic

You are in the {CLINIC}. The walls are covered with posters showing basic first aid techniques. There are a few seats in front of {NURSE}'s desk, and a floor-to-ceiling curtain separating a small exam area.
{
- has_black_eye > 5 and not seenVeryRecently(-> nurse_treat_black_eye):
    -> nurse_treat_black_eye ->
- ow_my_balls and not seenVeryRecently(-> nurse_treat_balls):
    -> nurse_treat_balls ->
}

- (clinic_opts)
<- character_opts(ClinicPeople, -> clinic_opts)

// + [Go to the {EXAM_AREA}] -> exam_area
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

+ [Leave the {EXAM_AREA}] -> clinic
