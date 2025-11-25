LIST Score = cheerleaderTitjob, cheerleaderSex, sisCreampie, cheerleaderPanties

/*
    Score Details
*/
=== function scoreDetails (scoreItem)
{ scoreItem:
- cheerleaderTitjob: came on {CHEERLEADER}'s tits
- cheerleaderSex: fucked {CHEERLEADER}
- cheerleaderPanties: jerked off with {CHEERLEADER}'s panties
- sisCreampie: came inside {SIS}
}

/*
    Check Score
*/
=== check_score ===
Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
{ LIST_COUNT(Score) > 0:
    You { listPrint(Score, -> scoreDetails)}.
- else:
    You haven't done anything yet.
}
->->
