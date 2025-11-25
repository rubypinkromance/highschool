LIST Score = cheerleaderTitjob, cheerleaderSex, sisCreampie, cheerleaderPanties

/*
    Score Information Database
*/
=== function scoreData (scoreItem)
{ scoreItem:
- cheerleaderTitjob: came on {CHEERLEADER}'s tits
- cheerleaderSex: fucked {CHEERLEADER}
- cheerleaderPanties: jerked off with {CHEERLEADER}'s panties
- sisCreampie: came inside {SIS}
}

/*
    Check Score
*/
=== print_score ===
Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
{ LIST_COUNT(Score) > 0:
    You { listPrint(Score, -> scoreData)}.
- else:
    You haven't done anything yet.
}
->->
