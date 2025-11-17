LIST Score = cheerleaderTitjob, cheerleaderSex, sisCreampie, cheerleaderPanties
LIST Outfits = Nude, (Default), (Nice), (Athletic), Preppy

VAR Inventory = ()
VAR outfit = Default
VAR cum_today = false
VAR schedule_period_1 = Gym
VAR schedule_period_2 = HealthClass
VAR schedule_period_3 = Lab
VAR schedule_period_4 = PhotoClass
VAR permission_to_change_schedule = false

=== function scoreDetails (scoreItem)
{ scoreItem:
- cheerleaderTitjob: came on {CHEERLEADER}'s tits
- cheerleaderSex: fucked {CHEERLEADER}
- cheerleaderPanties: jerked off with {CHEERLEADER}'s panties
- sisCreampie: came inside {SIS}
}

=== check_score ===
Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
You { listPrint(Score, -> scoreDetails)}.
->->