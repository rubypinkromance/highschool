/*
 * The Office
 *
 * 1. Secretary
 * 2. Secretary
 * 3. Secretary
 * 4. (locked) Secretary
 */
=== office ===
VAR has_office_invite = false
CONST OFFICE = "office"
~ here = OFFICE
You are at the {OFFICE}.

- (opts)
+ [Approach {SECRETARY}]
    -> talk_to_secretary ->
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
~ here = SUPPLY_CLOSET
You are in the {SUPPLY_CLOSET}.

Post-it notes galore.
+ [Leave the supply closet] -> office
