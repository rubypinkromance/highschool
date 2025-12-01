/*

    The Nurse's Office

*/
=== clinic ===
CONST CLINIC = "nurse’s office"
VAR ClinicPeople = ()
~ here = Clinic

You are in the {CLINIC}. The walls are covered with posters showing basic first aid techniques. There are a few seats in front of the desk, and a floor-to-ceiling curtain separating a small exam area.

- (clinic_opts)
<- character_opts(ClinicPeople, -> clinic_opts)

+ {has_black_eye > 5 and newToday(-> nurse_treat_black_eye)}“Can I get some ice for this black eye?”
    -> nurse_treat_black_eye ->

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
