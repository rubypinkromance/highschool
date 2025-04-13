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
Welcome to the nurse's office

- (opts)
+ [Talk to {NURSE}] -> talk_to_nurse ->
+ [Go to the exam area] -> exam_area
+ [Leave the nurse's office] -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * Behind the Exam Curtain
 *
 * - Sex with Nurse
 */
= exam_area
There is a small bed here
+ [Leave the exam area] -> clinic
