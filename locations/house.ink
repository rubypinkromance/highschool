/*
- Your bedroom
*/
=== bedroom ===

{ now == morning:
    You wake up in your bed with a throbbing erection.
- else:
    You return to your room, exhausted after a long day.
}

+ [Bathroom] -> bathroom
+ { now < afterschool } [Go to school] -> hallway
+ { now == afterschool } [Go to sleep] -> go_to_sleep -> bedroom

/*
> Bathroom
    - 4. Stepsister
    * Sex with Stepsister
*/
= bathroom
Your bathroom
Your stepsister is here

- (opts)
+ [Talk to Stepsister] -> talk_to_stepsister ->
+ [Look at Stepsister] -> look_at_stepsister ->
+ [Bedroom] -> bedroom
- -> opts
