LIST Score = cheerleaderTitjob, cheerleaderSex, sisCreampie, cheerleaderPanties, allStudentBraSizes

/*
    Score Information Database
*/
=== function scoreData (scoreItem)
{ scoreItem:
- allStudentBraSizes: learned the bra size of every girl in school
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

=== function checkBraScore()
{ BraSizes ^ Students == Students:
    ~ Score += allStudentBraSizes
    ACHIEVEMENT UNLOCKED: learned all bra scores # CLASS: achievement
}
