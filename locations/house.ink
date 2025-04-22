/*
 * Your bedroom
 */
=== bedroom ===
CONST BEDROOM = "your bedroom"
~ here = BEDROOM
You are in {BEDROOM}.

{
- now == morning:
    You wake up in your bed with a throbbing erection.
- else:
    You return to your room, exhausted after a long day.
}

- (opts)
+ [Go to the {BATHROOM}]
    -> bathroom
+ { now < afterschool } [Go to school]
    -> hallway
* { cheerleaderState == has_stuff} [Jerk off with {CHEERLEADER}'s panties]
    -> cheerleader_panties -> bedroom
+ { now >= afterschool } [Go to sleep]
    -> go_to_sleep -> bedroom
+ [Check your score]
    Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
    You { listPrint(Score, -> scoreDetails)}.
- -> opts


/*
 * =============================================
 * The Bathroom
 *
 * 4. Stepsister
 *
 * - Sex with Stepsister
 */
= bathroom
CONST BATHROOM = "bathroom"
~ here = BATHROOM
You are in the {BATHROOM}.

Your stepsister, {STEPSISTER}, is here

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
