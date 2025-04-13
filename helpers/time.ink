LIST Times = morning, lunch, afternoon, afterschool, evening

VAR now = morning

=== pass_time ===
~ now++
It is now { now }.
->->

=== go_to_sleep ===
~ now = morning
It is now { now }.
->->
