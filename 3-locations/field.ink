/*

    The Athletics Field

*/
=== field ===
CONST FIELD = "athletic field"
VAR FieldPeople = ()
~ here = Field

You are in the {FIELD}. A running track surrounds the football field, and a large covered {BLEACHERS} overlooks the field.

~ temp FieldPeopleCopy = FieldPeople
- (fieldPeopleLoop)
{
- FieldPeopleCopy ? Athlete:
    ~ FieldPeopleCopy -= Athlete
    <> {getNameAndTitle(Athlete)} is running laps around the track.
    -> fieldPeopleLoop
- FieldPeopleCopy ? Jock:
    ~ FieldPeopleCopy -= Jock
    <> {getNameAndTitle(Jock)} is playing football with the rest of the team.
    -> fieldPeopleLoop
- FieldPeopleCopy ? Cheerleader:
    ~ FieldPeopleCopy -= Cheerleader
    <> {getNameAndTitle(Cheerleader)} is cheering on the sidelines.
    -> fieldPeopleLoop
- LIST_COUNT(FieldPeopleCopy) > 0:
    {lookForRoomPeople(FieldPeople)}
}

{ LIST_COUNT(BleachersPeople) > 0:
    <> {capitaliseStart(listRoomPeople(BleachersPeople))} {LIST_COUNT(BleachersPeople) > 1:are|is} sitting on the {BLEACHERS}.
}

{ LIST_COUNT(UnderBleachersPeople) > 0:
    <> You think you can see someone moving under the {BLEACHERS}.
}

- (field_opts)
<- character_opts(FieldPeople, -> field_opts)

+ [Sit on the {BLEACHERS}] -> bleachers
+ [Go {UNDER_BLEACHERS}] -> under_bleachers
+ [{isWeekday():Go back inside|Leave the {FIELD}}] -> pass_time -> hallway
- -> field_opts

/*

    Bleachers

*/
= bleachers
CONST BLEACHERS = "bleachers"
VAR BleachersPeople = ()
~ here = Bleachers

You are in the {BLEACHERS} overlooking the {FIELD}.

{listRoomPeople(BleachersPeople)} {LIST_COUNT(BleachersPeople) > 1:are|is} here.

- (bleachers_opts)
<- character_opts(BleachersPeople, -> bleachers_opts)

+ [Leave the {BLEACHERS}] -> field
- -> bleachers_opts

/*

    Under the Bleachers

*/
= under_bleachers
CONST UNDER_BLEACHERS = "under the bleachers"
VAR UnderBleachersPeople = ()
~ here = UnderBleachers

You are {UNDER_BLEACHERS}. The back is open, but the sides have been covered in plywood to create a storage space for track and field equipment. It's dimly lit, but dry, and it has the advantage of being hidden from view of the school or {FIELD}.

{ UnderBleachersPeople ? Cheerleader:
    {CHEERLEADER} is here, {CheerleaderCum: cleaning up your cum|scrolling on her phone}.
}

- (under_bleachers_opts)
<- character_opts(UnderBleachersPeople, -> under_bleachers_opts)

+ [Leave the {BLEACHERS}]
    { UnderBleachersPeople ? Cheerleader:
        -> cheerleader_cleanup -> field
    }
    -> field
- -> under_bleachers_opts
