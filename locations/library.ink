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
~ current_location = -> library
The library

- (opts)
+ {now == lunch or now == afterschool} [Approach {NERD}]
    -> talk_to_nerd ->
+ {now == lunch} [Approach {SCIENTIST}]
    -> talk_to_scientist ->
+ [Leave the library]
    -> pass_time -> hallway
- -> opts
