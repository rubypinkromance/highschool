LIST Times = Period1, Period2, Lunch, Period3, Period4, AfterSchool, Night
LIST Days = Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
VAR Weekdays = (Monday, Tuesday, Wednesday, Thursday, Friday)
VAR WeekendDays = (Saturday, Sunday)
VAR ClassTimes = (Period1, Period2, Period3, Period4)

VAR now = Period1
VAR today = Sunday
VAR date = 1
VAR days_remaining = 30
VAR countdown = false

// Returns the human-readable name of the time of day.
=== function nameOfTime(time)
{ isWeekday():
    {time:
    - Period1: first period
    - Period2: second period
    - Lunch: lunch time
    - Period3: third period
    - Period4: fourth period
    - AfterSchool: after school
    - Night: late
    }
- else:
    {time:
    - Period1: early morning
    - Period2: morning
    - Lunch: lunch time
    - Period3: afternoon
    - Period4: late afternoon
    - AfterSchool: evening
    - Night: late
    }
}

// Announce the current day, time, and your current class.
=== function announceTime()
{ DEBUG:
    It is { nameOfTime(now) } on { today }.
}
{ isWeekday():
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
}

// Check if today is a weekday
=== function isWeekday()
~ return Weekdays ? today

// Check if today is a weekend
=== function isWeekend()
~ return WeekendDays ? today

// Check if it's time for a class
=== function isClassTime()
~ return isWeekday() && ClassTimes ? now

// Every time we leave a location, we advance the time of day.
=== pass_time ===
{ now < Night:
    ~ now++                // tick the clock
}
~ clearLocations()     // empty the rooms
~ characterScheduler() // move people to new locations
->->

// At the end of the day, update the calendar and reset
=== go_to_sleep ===
~ now = Period1        // set the clock
~ date++               // update the calendar
~ days_remaining--     // update the countdown
{ today == Saturday:
    ~ today = Sunday   // loop back around
- else:
    ~ today++
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
~ clearLocations()     // empty the rooms
~ characterScheduler() // move people to new locations
->->
