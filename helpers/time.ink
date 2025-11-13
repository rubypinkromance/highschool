LIST Times = Period1, Period2, Lunch, Period3, Period4, AfterSchool, Night
LIST Days = Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
VAR Weekdays = (Monday, Tuesday, Wednesday, Thursday, Friday)
VAR WeekendDays = (Saturday, Sunday)
VAR ClassTimes = (Period1, Period2, Period3, Period4)

VAR now = Period1
VAR today = Monday
VAR date = 1
VAR days_remaining = 30
VAR countdown = false

/*
- Return the human-readable time of day.
*/
=== function nameOfTime(time)
{ isWeekday():
    {nameOfTimeWeekday(time)}
- else:
    {nameOfTimeWeekend(time)}
}
=== function nameOfTimeWeekday(time)
{ time:
- Period1: first period
- Period2: second period
- Lunch: lunch time
- Period3: third period
- Period4: fourth period
- AfterSchool: after school
- Night: late
}
=== function nameOfTimeWeekend(time)
{ time:
- Period1: early morning
- Period2: morning
- Lunch: lunch time
- Period3: afternoon
- Period4: late afternoon
- AfterSchool: evening
- Night: late
}

/*
- Announce the current day, time, and your current class.
*/
=== function announceTime()
<em><small>{ today }, { isHome(): {nameOfTimeWeekend(now)}|{nameOfTime(now)} }.
{ isWeekday() and not isHome():
    { now:
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
<></small></em>

/*
- Check if today is a weekday
*/
=== function isWeekday()
~ return Weekdays ? today

/*
- Check if today is a weekend
*/
=== function isWeekend()
~ return WeekendDays ? today

/*
- Check if the specified day is a weekend
*/
=== function isDayWeekend(day)
~ return WeekendDays ? day

/*
- Check if it's time for a class
*/
=== function isClassTime()
~ return isWeekday() && ClassTimes ? now

// Determine if an action has been used today
=== function didToday(-> action)
{ (not next_day and TURNS_SINCE(action) >= 0) or TURNS_SINCE(-> next_day) > TURNS_SINCE(action):
    ~ return true
}
~ return false

TODO bug: jerk off doesn't show up on successive days
// Determine if an action is new today
=== function newToday(-> action)
{ not didToday(action):
    ~ return true
}
~ return false

// Returns the next day of the week
=== function tomorrow()
{ today == Saturday:
    ~ return Sunday   // loop back around
}
~ return today + 1

/*
- Advance the time of day.
- Run this every time we leave a location.
*/
=== pass_time ===
{ now < Night:
    ~ now++                // tick the clock
}
~ clearLocations()     // empty the rooms
~ characterScheduler() // move people to new locations
->->

/*
- Advance the calendar and reset for the next day.
- Run this at the end of every day.
*/
=== next_day ===
~ now = Period1        // set the clock
~ date++               // update the calendar
~ days_remaining--     // update the countdown
~ today = tomorrow()
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
~ cum_today = false    // reset your own cum state
~ resetMoods()         // reset people to base mood
~ clearLocations()     // empty the rooms
~ characterScheduler() // move people to new locations
->->
