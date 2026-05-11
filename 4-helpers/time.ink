LIST Times = Nowhen, Period1, Period2, Lunch, Period3, Period4, AfterSchool, Night
LIST Days = Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
VAR Weekdays = (Monday, Tuesday, Wednesday, Thursday, Friday)
VAR WeekendDays = (Saturday, Sunday)
VAR ClassTimes = (Period1, Period2, Period3, Period4)

VAR now = Period1
VAR today = Monday
VAR date = 1
VAR days_remaining = 30
VAR days_total = 30
VAR countdown = false

/*
    Return the human-readable time of day.
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
- Lunch: noon
- Period3: afternoon
- Period4: late afternoon
- AfterSchool: evening
- Night: late
}

/*
    Announce the current day, time, and your current class.
*/
=== function announceTime()
<em><small>
<>{ today },
<>{ isSchool(): {nameOfTime(now)}| {nameOfTimeWeekend(now)}}.
{ isWeekday() and isSchool():
    { now:
    - Period1:
        <> You have {locationData(schedule_period_1, LocationClassName)}.
    - Period2:
        <> You have {locationData(schedule_period_2, LocationClassName)}.
    - Period3:
        <> You have {locationData(schedule_period_3, LocationClassName)}.
    - Period4:
        <> You have {locationData(schedule_period_4, LocationClassName)}.
    }
}
<></small></em>

/*
    Check if we're already taking a class.
*/
=== function hasClass(className)
{
- schedule_period_1 == className: ~ return Period1
- schedule_period_2 == className: ~ return Period2
- schedule_period_3 == className: ~ return Period3
- schedule_period_4 == className: ~ return Period4
}
~ return Nowhen // treat as false

/*

    classInPeriod
    Look up what class the player is scheduled for in a given period.

*/
=== function classInPeriod(period)
{ period:
- Period1: ~ return schedule_period_1
- Period2: ~ return schedule_period_2
- Period3: ~ return schedule_period_3
- Period4: ~ return schedule_period_4
}
~ return Nowhere

/*

    checkAttendance
    Record a class cut if the player isn't in their scheduled classroom.
    Called from pass_time before now advances.

*/
=== function checkAttendance()
{ isWeekday() and ClassTimes ? now and here != classInPeriod(now):
    ~ MissedClasses += now
}

/*

    printMissedPeriod
    Print the period name for a missed class (used with listPrint in attendance_notification).
    Uses nameOfTimeWeekday directly to avoid the weekend variant when called from next_day.

*/
=== function printMissedPeriod(period)
{nameOfTimeWeekday(period)}

/*
    Change what class we're taking in a given period.
*/
=== function changeSchedule(newClass, period)
// Look up what class we already have that period
~ temp oldClass = Nowhere // prime the variable type
{ period:
- Period1: ~ oldClass = schedule_period_1
- Period2: ~ oldClass = schedule_period_2
- Period3: ~ oldClass = schedule_period_3
- Period4: ~ oldClass = schedule_period_4
}
// If we're already taking this class,
// move our old class to the period we were taking it in
// so we don't have a repeat or gap in our schedule.
~ temp oldPeriod = hasClass(newClass)
{ oldPeriod:
- Period1: ~ schedule_period_1 = oldClass
- Period2: ~ schedule_period_2 = oldClass
- Period3: ~ schedule_period_3 = oldClass
- Period4: ~ schedule_period_4 = oldClass
}
// Finally, assign our new class to the requested period
{ period:
- Period1: ~ schedule_period_1 = newClass
- Period2: ~ schedule_period_2 = newClass
- Period3: ~ schedule_period_3 = newClass
- Period4: ~ schedule_period_4 = newClass
}

/*
    Check if today is a school night (you have school tomorrow)
*/
=== function isSchoolNight()
{ (Friday, Saturday) ? today:
    ~ return false
}
~ return true

/*
    Check if today is a weekday
*/
=== function isWeekday()
~ return Weekdays ? today

/*
    Check if today is a weekend
*/
=== function isWeekend()
~ return WeekendDays ? today

/*
    Check if the specified day is a weekend
*/
=== function isDayWeekend(day)
~ return WeekendDays ? day

/*
    Check if it's time for a class
*/
=== function isClassTime()
~ return isWeekday() && ClassTimes ? now

/*
    Determine if an action has been used today
*/
=== function didToday(-> action)
~ return seenMoreRecentlyThan(action, -> next_day)

/*
    Determine if an action has been used this round
*/
=== function didThisRound(-> action)
~ return seenMoreRecentlyThan(action, -> pass_time)

/*
    Determine if an action is new today
*/
=== function newToday(-> action)
{ didToday(action):
    ~ return false
}
~ return true

/*
    Determine if an action is new this round
*/
=== function newThisRound(-> action)
{ didThisRound(action):
    ~ return false
}
~ return true

/*
    Return the next day of the week
*/
=== function tomorrow()
{ today == Saturday:
    ~ return Sunday   // loop back around
}
~ return today + 1

/*
    Advance the time of day.
    Run this every time we leave a location.
*/
=== pass_time ===
{ now < Night:
    ~ checkAttendance()
    ~ now++            // tick the clock
}
~ clearLocations()     // empty the rooms
~ characterScheduler() // move people to new locations
->->

/*
    Advance the calendar and reset for the next day.
    Run this at the end of every day.
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
        You { listPrint(Score, -> scoreData) }
        -> END
    }
    <em><small>Day { date } of { days_total }.
    { days_remaining > 1:
        <> You have { days_remaining } days remaining, including today.
    - else:
        <> This is your last day!
    }
    <></small></em>
}
{ has_black_eye > 0:
    ~ has_black_eye--  // every day, your black eye gets a bit better
}
~ cum_today = false    // reset your own cum state
{ LIST_COUNT(MissedClasses) > 0:
    -> attendance_notification ->
}
~ MissedClasses = ()
~ resetMoods()         // reset people to base mood
~ sis_stole_laptop()   // see if your sister stole your laptop
~ clearLocations()     // empty the rooms
~ characterScheduler() // move people to new locations
->->

/*

    attendance_notification
    Processes any class cuts from the previous day and notifies the player via a school text.
    Called from next_day when MissedClasses is non-empty.

*/
=== attendance_notification ===
~ temp was_full_day = LIST_COUNT(MissedClasses) == 4
<em><small>Your phone buzzes. A text from the school: </small></em>
{ was_full_day:
    ~ full_day_absences++
    ~ has_detention += full_day_absences
    ~ has_principal_meeting = true
    "{PLAYER} was marked absent for the entire school day. { full_day_absences == 1: This is an unexcused absence. Please report to the principal's office upon your return.| This is unexcused absence #{full_day_absences}. The principal will see you upon your return. You have {full_day_absences} days of detention to serve.}"
- else:
    ~ has_detention++
    "{PLAYER} was marked absent from {listPrint(MissedClasses, -> printMissedPeriod)}. Detention will be served at the next opportunity."
}
->->
