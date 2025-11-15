/*
- The Office
*/
=== office ===
CONST OFFICE = "office"
VAR OfficePeople = ()
LIST SchoolItems = Schedule
VAR OfficeItems = (Schedule)
~ here = Office

You are at the {OFFICE}.

- (office_opts)
<- talkAndObserveAllCharacters(OfficePeople, -> office_opts)

+ {OfficePeople !? Secretary and OfficeItems ? Schedule} [Use the computer]
    Taking advantage of the unsupervised office computer, you access the confidential school records.
    + + [Change your schedule]
        -> change_schedule("") ->
    * * [Print all girl’s schedules]
        ~ OfficeItems -= Schedule
        ~ Inventory += Schedule
        You quickly print off a copy of the schedule for all the girls in school. You can tape this up in your locker as a helpful reference to locate a girl during the school day.

+ [Go to the {SUPPLY_CLOSET}] -> supply_closet
+ [Leave the {OFFICE}] -> pass_time -> hallway
- -> office_opts

/*
- The Supply Closet
- Sex with Secretary
*/
= supply_closet
CONST SUPPLY_CLOSET = "supply closet"
VAR SupplyClosetPeople = ()
~ here = SupplyCloset

You are in the {SUPPLY_CLOSET}. Post-it notes galore.

+ [Leave the supply closet] -> office

/*
- Change Schedule
*/
= change_schedule(preface)
"{preface}What period do you want to change?"
<em><small>Your current schedule: {reportSchedule(You)}</small></em>
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
{reportSchedule(You)}
->->
