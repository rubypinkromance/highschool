/*
- The Church
- Sex with Believer
*/
=== church ===
CONST CHURCH = "church"
VAR ChurchPeople = ()
~ here = CHURCH

You are in the {CHURCH}.

- (church_opts)
<- talkAndObserveAllCharacters(ChurchPeople, -> church_opts)

+ [Go home] -> pass_time -> bedroom
- -> church_opts
