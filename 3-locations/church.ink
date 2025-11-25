/*

    The Church

*/
=== church ===
CONST CHURCH = "church"
VAR ChurchPeople = ()
~ here = Church

You are in the {CHURCH}.

- (church_opts)
<- character_opts(ChurchPeople, -> church_opts)

+ [Go home] -> pass_time -> bedroom
- -> church_opts
