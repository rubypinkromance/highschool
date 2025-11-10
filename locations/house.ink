/*
 * Your bedroom
 */
=== bedroom ===
CONST BEDROOM = "your bedroom"
VAR BedroomPeople = ()
~ here = BEDROOM

{
- now == Period1:
    You wake up in your bed with a throbbing erection.
- else:
    You return to {BEDROOM}, exhausted after a long day.
}

- (opts)
+ [Go to the {BATHROOM}]
    -> bathroom
+ { now < AfterSchool } [Go to school]
    -> hallway
TODO: add inventory system
* { cheerleaderState == has_stuff} [Jerk off with {CHEERLEADER}'s panties]
    -> cheerleader_panties -> bedroom
+ { now >= AfterSchool } [Go to sleep]
    -> go_to_sleep -> bedroom
+ [Check your score]
    Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
    You { listPrint(Score, -> scoreDetails)}.
- -> opts


/*
 * =============================================
 * The Bathroom
 *
 * A. Stepsister
 *
 * - Sex with Stepsister
 */
= bathroom
CONST BATHROOM = "bathroom"
VAR BathroomPeople = ()
~ here = BATHROOM

You are in the {BATHROOM}. Your stepsister, {STEPSISTER}, is here

- (bathroom_opts)
+ [Talk to {STEPSISTER}]
    -> talk_to_stepsister ->
+ [Look at {STEPSISTER}]
    -> look_at_stepsister ->
+ [Creampie {STEPSISTER}]
    ~ Score += stepsisterCreampie
    You shove your cock into her dripping cunt and pump her full of cream.
+ [Leave the {BATHROOM}]
    -> bedroom
- -> bathroom_opts
