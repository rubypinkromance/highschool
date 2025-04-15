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
+ {now == lunch or now == afterschool} [Talk to {NERD}]
    -> talk_to_nerd ->
+ {now == lunch} [Talk to {SCIENTIST}]
    -> talk_to_scientist ->
+ [Leave the library]
    -> pass_time -> hallway
- -> opts
