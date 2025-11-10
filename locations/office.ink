/*
 * The Office
 *
 * 1. Secretary
 * 2. Secretary
 * L. Secretary
 * 3. Secretary
 * 4. Secretary
 * A. ---
 */
=== office ===
CONST OFFICE = "office"
VAR OfficePeople = ()
~ here = OFFICE

You are at the {OFFICE}.

- (opts)
<- talkToAllCharacters(OfficePeople, -> office.opts)

+ [Go to the {SUPPLY_CLOSET}]
    -> supply_closet
+ [Leave the {OFFICE}]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * The Office Supply Closet
 *
 * - Sex with Secretary
 */
= supply_closet
CONST SUPPLY_CLOSET = "supply closet"
VAR SupplyClosetPeople = ()
~ here = SUPPLY_CLOSET

You are in the {SUPPLY_CLOSET}. Post-it notes galore.

+ [Leave the supply closet] -> office
