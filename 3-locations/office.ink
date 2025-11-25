/*

    The Office

*/
=== office ===
CONST OFFICE = "office"
VAR OfficePeople = ()
LIST SchoolItems = Schedule
VAR OfficeItems = (Schedule)
~ here = Office

You are at the {OFFICE}. A reception desk faces the door, and a few chairs line the wall, where students can wait. Behind the desk is an open area where the teachers make their copies. You see the doors to the principal and vice principal's offices, as well as a supply closet.
{ OfficePeople ? Secretary:
    <> {SECRETARY} looks up from her computer.
    "Can I help you, {PLAYER}?"
}

- (office_opts)
<- character_opts(OfficePeople, -> office_opts)

+ {OfficePeople !? Secretary} [Use the computer]
    Taking advantage of the unsupervised office computer, you access the confidential school records.
    + + [Change your schedule]
        -> change_schedule_dialog("") ->
    * * {OfficeItems ? Schedule}[Print all girl’s schedules]
        ~ OfficeItems -= Schedule
        ~ Inventory += Schedule
        You quickly print off a copy of the schedule for all the girls in school. You can tape this up in your locker as a helpful reference to locate a girl during the school day.
    + + [Leave the computer]
        -> office_opts

+ [Go to the {SUPPLY_CLOSET}] -> supply_closet
+ [Leave the {OFFICE}] -> pass_time -> hallway
- -> office_opts

/*

    The Supply Closet

*/
= supply_closet
CONST SUPPLY_CLOSET = "supply closet"
VAR SupplyClosetPeople = ()
~ here = SupplyCloset

You are in the {SUPPLY_CLOSET}. Post-it notes galore.

+ [Leave the {SUPPLY_CLOSET}] -> office

/*

    Change Schedule

*/
= change_schedule_dialog(preface)
"{preface}What period do you want to change?"
<em><small>Your current schedule: {printSchedule(You)}</small></em>
~ temp period = Period1
~ temp class = Gym
+ [Period 1]
    ~ period = Period1
+ [Period 2]
    ~ period = Period2
+ [Period 3]
    ~ period = Period3
+ [Period 4]
    ~ period = Period4
-
"What class do you want to take?"
+ [Gym Class]
    ~ class = Gym
+ [Health Class]
    ~ class = HealthClass
+ [Science Class]
    ~ class = Lab
+ [Photography Class]
    ~ class = PhotoClass
+ [Study Hall]
    ~ class = StudyHall
+ [Theater Class]
    ~ class = Theater
-
~ changeSchedule(class, period)
"Okay, here's your new schedule."
{printSchedule(You)}
~ permission_to_change_schedule = false
->->
