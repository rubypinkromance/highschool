/*

    The Athletics Field

*/
=== field ===
CONST FIELD = "athletic field"
VAR FieldPeople = ()
~ here = Field

You are in the {FIELD}. A running track surrounds the football field, and a large set of {BLEACHERS} run along one side.

~ temp FieldPeopleCopy = FieldPeople
- (fieldPeopleLoop)
{
- FieldPeopleCopy ? Athlete:
    ~ FieldPeopleCopy -= Athlete
    <> {nameAndTitle(Athlete)} is running laps around the track.
    -> fieldPeopleLoop
- FieldPeopleCopy ? Jock:
    ~ FieldPeopleCopy -= Jock
    <> {nameAndTitle(Jock)} is playing football with the rest of the team.
    -> fieldPeopleLoop
- FieldPeopleCopy ? Cheerleader:
    ~ FieldPeopleCopy -= Cheerleader
    <> {nameAndTitle(Cheerleader)} is cheering on the sidelines.
    -> fieldPeopleLoop
- LIST_COUNT(FieldPeopleCopy) > 0:
    {listRoomPeopleSentence(FieldPeople)}
}

{ LIST_COUNT(BleachersPeople) > 0:
    <> {capitalise_start(listRoomPeople(BleachersPeople))} {LIST_COUNT(BleachersPeople) > 1:are|is} sitting on the {BLEACHERS}.
}

{ LIST_COUNT(UnderBleachersPeople) > 0:
    <> You think you can see someone moving under the {BLEACHERS}.
}

- (field_opts)
<- talkAndObserveAllCharacters(FieldPeople, -> field_opts)

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

{listRoomPeople(BleachersPeople)}

- (bleachers_opts)
<- talkAndObserveAllCharacters(BleachersPeople, -> bleachers_opts)

+ [Leave the {BLEACHERS}] -> field
- -> bleachers_opts

/*

    Under the Bleachers

*/
= under_bleachers
CONST UNDER_BLEACHERS = "under the bleachers"
VAR UnderBleachersPeople = ()
~ here = UnderBleachers

You are {UNDER_BLEACHERS}. It's fairly dark under here. Someone dragged in a couple chairs from the {CAFETERIA}, and there's an old coffee can used as an ashtray. It's not the nicest spot to hang out, but it has the advantage of being mostly hidden from view.

- (under_bleachers_opts)
<- talkAndObserveAllCharacters(UnderBleachersPeople, -> under_bleachers_opts)

+ [Leave the bleachers] -> field
- -> under_bleachers_opts
