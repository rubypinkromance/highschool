/*
 * The Church
 *
 * 1-4. ---
 * A. Believer
 *
 * - Sex with Believer
 */
=== church ===
CONST CHURCH = "church"
VAR ChurchPeople = ()
~ here = CHURCH

You are in the {CHURCH}.

- (opts)
<- talkToAllCharacters(ChurchPeople, -> church.opts)

+ [Go home]
    -> bedroom
- -> opts
