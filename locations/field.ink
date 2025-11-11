/*
- The Athletics Field
*/
=== field ===
CONST FIELD = "athletic field"
VAR FieldPeople = ()
~ here = FIELD

You are in the {FIELD}.

{listRoomPeople(FieldPeople)}

- (field_opts)
<- talkAndObserveAllCharacters(FieldPeople, -> field_opts)

+ [Sit on the {BLEACHERS}]
    -> bleachers
+ [Go {UNDER_BLEACHERS}]
    -> under_bleachers
+ [{isWeekday():Go back inside|Leave the {FIELD}}]
    -> pass_time -> hallway
- -> field_opts

/*
- Bleachers
*/
= bleachers
CONST BLEACHERS = "bleachers"
VAR BleachersPeople = ()
~ here = BLEACHERS

You are in the {BLEACHERS} overlooking the athletic field.

{listRoomPeople(BleachersPeople)}

- (bleachers_opts)
<- talkAndObserveAllCharacters(BleachersPeople, -> bleachers_opts)

+ [Leave the {BLEACHERS}]
    -> field
- -> bleachers_opts

/*
- Under the Bleachers
- Sex with Cheerleader
*/
= under_bleachers
CONST UNDER_BLEACHERS = "under the bleachers"
VAR UnderBleachersPeople = ()
~ here = UNDER_BLEACHERS

You are {UNDER_BLEACHERS}.

- (under_bleachers_opts)
<- talkAndObserveAllCharacters(UnderBleachersPeople, -> under_bleachers_opts)

+ [Leave the bleachers]
    -> field
- -> under_bleachers_opts
