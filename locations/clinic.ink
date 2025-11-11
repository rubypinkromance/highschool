/*
- The Nurse's Office
*/
=== clinic ===
CONST CLINIC = "nurse’s office"
VAR ClinicPeople = ()
~ here = CLINIC

You are in the {CLINIC}.

- (clinic_opts)
<- talkAndObserveAllCharacters(ClinicPeople, -> clinic_opts)

+ [Go to the {EXAM_AREA}]
    -> exam_area
+ [Leave the {CLINIC}]
    -> pass_time -> hallway
- -> clinic_opts

/*
- Behind the Exam Curtain
- Sex with Nurse
*/
= exam_area
CONST EXAM_AREA = "exam area"
VAR ExamAreaPeople = ()
~ here = EXAM_AREA

You are in the {EXAM_AREA}. There is a small bed here.

+ [Leave the {EXAM_AREA}] -> clinic
