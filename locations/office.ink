/*
- The Office
*/
=== office ===
CONST OFFICE = "office"
VAR OfficePeople = ()
~ here = OFFICE

You are at the {OFFICE}.

- (office_opts)
<- talkAndObserveAllCharacters(OfficePeople, -> office_opts)

+ [Go to the {SUPPLY_CLOSET}]
    -> supply_closet
+ [Leave the {OFFICE}]
    -> pass_time -> hallway
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
