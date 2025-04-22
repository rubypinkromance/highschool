LIST Times = morning, lunch, afternoon, afterschool, evening

VAR now = morning
VAR date = 1
VAR days_remaining = 30
VAR countdown = false

=== pass_time ===
~ now++
{ DEBUG:
    It is now { now }.
}
->->

=== go_to_sleep ===
~ now = morning
~ date++
~ days_remaining--
{ DEBUG:
    It is now { now }.
}
{ countdown:
    { days_remaining < 1:
            GAME OVER
            Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
            You { listPrint(Score, -> scoreDetails) }
            -> END
    }
    This is day { date }.
    Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
    { days_remaining > 1:
        You have { days_remaining } days remaining, including today.
    - else:
        This is your last day!
    }
}
->->
