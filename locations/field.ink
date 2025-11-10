/*
 * The Athletics Field
 *
 * 1. ---
 * 2. ---
 * L. Athlete
 * 3. ---
 * 4. ---
 * A. Cheerleader
*/
=== field ===
CONST FIELD = "athletic field"
VAR FieldPeople = ()
~ here = FIELD

You are in the {FIELD}.

Looking around, you can see {listRoomPeople(FieldPeople)}.

- (opts)
<- talkToAllCharacters(FieldPeople, -> field.opts)

* {now == AfterSchool and cheerleaderState == intel} [Observe {CHEERLEADER} and {JOCK}]
    -> observe_cheerleader ->

+ [Sit on the {BLEACHERS}]
    -> bleachers
+ [Go {UNDER_BLEACHERS}]
    -> under_bleachers
+ [Go back inside]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * Bleachers
 *
 * 1. ---
 * L. Photographer (walking around)
 * 4. ---
 * A. Gossip
 */
= bleachers
CONST BLEACHERS = "bleachers"
VAR BleachersPeople = ()
~ here = BLEACHERS

You are in the {BLEACHERS} overlooking the athletic field.

Looking around, you can see {listRoomPeople(BleachersPeople)}

- (bleachers_opts)
<- talkToAllCharacters(BleachersPeople, -> bleachers_opts)

+ [Leave the {BLEACHERS}]
    -> field
- -> bleachers_opts

/*
 * =============================================
 * Under Bleachers
 *
 * 1. ---
 * L. Rebel (smoking)
 * 4. ---
 * A. empty
 *
 * - Sex with Cheerleader
 */
= under_bleachers
CONST UNDER_BLEACHERS = "under the bleachers"
VAR UnderBleachersPeople = ()
~ here = UNDER_BLEACHERS

You are {UNDER_BLEACHERS}.

- (under_opts)
<- talkToAllCharacters(UnderBleachersPeople, -> under_opts)

+ [Leave the bleachers]
    -> field
- -> under_opts
