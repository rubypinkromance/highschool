LIST Score = cheerleaderTitjob, cheerleaderSex, sisCreampie, cheerleaderPanties
LIST Outfits = Nude, (Default), (Nice), (Athletic), Preppy

VAR PLAYER = "Mike"
VAR Inventory = ()
VAR outfit = Default
VAR cum_today = false
VAR ow_my_balls = false
VAR schedule_period_1 = Gym
VAR schedule_period_2 = HealthClass
VAR schedule_period_3 = Lab
VAR schedule_period_4 = PhotoClass
VAR permission_to_change_schedule = false
VAR has_detention = false

=== function scoreDetails (scoreItem)
{ scoreItem:
- cheerleaderTitjob: came on {CHEERLEADER}'s tits
- cheerleaderSex: fucked {CHEERLEADER}
- cheerleaderPanties: jerked off with {CHEERLEADER}'s panties
- sisCreampie: came inside {SIS}
}

=== check_score ===
Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
{ LIST_COUNT(Score) > 0:
You { listPrint(Score, -> scoreDetails)}.
}
->->

=== hint_system(-> return_to) ===
What do you want a hint about?
<- hintAllCharacters(Students, return_to)
<- hintAllCharacters(Staff, return_to)
* [Locating a girl]
    If you access the office computer while no one is there, you can print out a class schedule for all the girls.
    -> return_to
-> DONE
