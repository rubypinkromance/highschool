/*
 * The Church
 *
 * 1. ---
 * 2. ---
 * 3. ---
 * 4. Believer
 *
 * - Sex with Believer
 */
=== church ===
CONST CHURCH = "church"
~ current_location = CHURCH
You are in the {CHURCH}.

- (opts)
+ {now == afterschool} [Approach {BELIEVER}]
    -> talk_to_believer ->
+ [Go home]
    -> bedroom
- -> opts
