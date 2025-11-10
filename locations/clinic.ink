/*
 * The Nurse's Office
 *
 * 1. Nurse
 * 2. Nurse
 * L. Nurse
 * 3. Nurse
 * 4. Nurse
 * A. ---
 */
=== clinic ===
CONST CLINIC = "nurse’s office"
VAR ClinicPeople = ()
~ here = CLINIC

You are in the {CLINIC}.

- (opts)
<- talkToAllCharacters(ClinicPeople, -> clinic.opts)

+ [Go to the {EXAM_AREA}]
    -> exam_area
+ [Leave the {CLINIC}]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * Behind the Exam Curtain
 *
 * - Sex with Nurse
 */
= exam_area
CONST EXAM_AREA = "exam area"
VAR ExamAreaPeople = ()
~ here = EXAM_AREA

You are in the {EXAM_AREA}. There is a small bed here.

+ [Leave the {EXAM_AREA}] -> clinic
