/*
- The Office
*/
=== office ===
CONST OFFICE = "office"
VAR OfficePeople = ()
LIST SchoolItems = Schedule
VAR OfficeItems = (Schedule)
~ here = OFFICE

You are at the {OFFICE}.

- (office_opts)
<- talkAndObserveAllCharacters(OfficePeople, -> office_opts)

+ {OfficePeople !? Secretary and OfficeItems ? Schedule} [Use the computer]
    Taking advantage of the unsupervised office computer, you access the confidential school records.
    * * [Print schedule]
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
~ here = SUPPLY_CLOSET

You are in the {SUPPLY_CLOSET}. Post-it notes galore.

+ [Leave the supply closet] -> office
