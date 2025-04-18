/*
 * The Nurse's Office
 *
 * 1. Nurse
 * 2. Nurse
 * 3. Nurse
 * 4. (locked) Nurse
 */
=== clinic ===
VAR has_nurse_invite = false
CONST CLINIC = "nurse’s office"
~ here = CLINIC
You are in the {CLINIC}.

- (opts)
+ [Approach {NURSE}]
    -> talk_to_nurse ->
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
~ here = EXAM_AREA
You are in the {EXAM_AREA}.

There is a small bed here
+ [Leave the {EXAM_AREA}] -> clinic
