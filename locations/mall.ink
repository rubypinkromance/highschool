/*
 * The Mall
 *
 * 1. ---
 * 2. ---
 * 3. ---
 * 4. Queen, Twins
 *
 * - Sex with Queen
 */
=== mall ===
CONST MALL = "mall"
~ current_location = MALL
You are at the {MALL}.

- (opts)
+ {now == afterschool} [Approach {QUEEN}]
    -> talk_to_queen ->
+ {now == afterschool} [Approach {TWIN1}]
    -> talk_to_twin1 ->
+ {now == afterschool} [Approach {TWIN2}]
    -> talk_to_twin2 ->
+ [Go home]
    -> bedroom
- -> opts
