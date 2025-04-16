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
~ current_location = -> office
Welcome to the office

- (opts)
+ [Approach {SECRETARY}]
    -> talk_to_secretary ->
+ [Go to the supply closet]
    -> supply_closet
+ [Leave the office]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * The Office Supply Closet
 *
 * - Sex with Secretary
 */
= supply_closet
~ current_location = -> supply_closet
Post-it notes galore.
+ [Leave the supply closet] -> office
