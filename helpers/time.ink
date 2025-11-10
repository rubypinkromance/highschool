LIST Times = Period1, Period2, Lunch, Period3, Period4, AfterSchool

VAR now = Period1
VAR date = 1
VAR days_remaining = 30
VAR countdown = false

// Returns the human-readable name of the time of day.
=== function nameOfTime(time)
{time:
- Period1: first period
- Period2: second period
- Lunch: lunch time
- Period3: third period
- Period4: fourth period
- AfterSchool: after school
}

// Announces the current time of day and your current class.
=== function announceTime()
{ DEBUG:
    It is { nameOfTime(now) }.
}
{now:
- Period1:
    <> You have Gym class.
- Period2:
    <> You have Health class.
- Period3:
    <> You have Science class.
- Period4:
    <> You have Photography class.
}

// Every time we leave a location, we advance the time of day.
=== pass_time ===
~ now++                // tick the clock
~ clearLocations()     // empty the rooms
~ characterScheduler() // move people to new locations
->->

// At the end of the day, update the calendar and reset
=== go_to_sleep ===
~ now = Period1        // set the clock
~ clearLocations()     // empty the rooms
~ characterScheduler() // move people to new locations
~ date++               // update the calendar
~ days_remaining--     // update the countdown
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
