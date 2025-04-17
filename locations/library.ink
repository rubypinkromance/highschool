/*
 * The Library
 *
 * 1. ---
 * 2. Nerd, Scientist
 * 3. ---
 * 4. Nerd
 *
 * - Sex with Nerd
 */
=== library ===
CONST LIBRARY = "library"
~ current_location = LIBRARY
You are in the {LIBRARY}.

- (opts)
+ {now == lunch or now == afterschool} [Approach {NERD}]
    -> talk_to_nerd ->
+ {now == lunch} [Approach {SCIENTIST}]
    -> talk_to_scientist ->
+ [Leave the {LIBRARY}]
    -> pass_time -> hallway
- -> opts
