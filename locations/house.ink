/*
 * Your bedroom
 */
=== bedroom ===

{ now == morning:
    You wake up in your bed with a throbbing erection.
- else:
    You return to your room, exhausted after a long day.
}

+ [Go to the bathroom] -> bathroom
+ { now < afterschool } [Go to school] -> hallway
+ { now >= afterschool } [Go to sleep] -> go_to_sleep -> bedroom

/*
 * =============================================
 * The Bathroom
 *
 * 4. Stepsister
 *
 * - Sex with Stepsister
 */
= bathroom
Your bathroom
Your stepsister, {STEPSISTER}, is here

- (opts)
+ [Talk to Claire] -> talk_to_stepsister ->
+ [Look at Claire] -> look_at_stepsister ->
+ [Leave the bathroom] -> bedroom
- -> opts
