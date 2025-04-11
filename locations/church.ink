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
The church.

- (opts)
+ {now == afterschool} [Talk to {BELIEVER}] -> talk_to_believer ->
+ [Go home] -> bedroom
- -> opts
