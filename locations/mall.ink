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
The mall!

- (opts)
+ {now == afterschool} [Talk to {QUEEN}]
    -> talk_to_queen ->
+ {now == afterschool} [Talk to {TWIN1}]
    -> talk_to_twin1 ->
+ {now == afterschool} [Talk to {TWIN2}]
    -> talk_to_twin2 ->
+ [Go home]
    -> bedroom
- -> opts
