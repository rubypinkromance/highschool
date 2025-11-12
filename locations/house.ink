/*
- Your bedroom
- Home is path to stepsister.
- Peep in shower, jerk off in panties, read diary, ask for viagra help.
- I’m not your little sister. We’re the same age and not related.
- Forced to share a bed?
*/
=== bedroom ===
CONST BEDROOM = "your bedroom"
VAR BedroomPeople = ()
~ here = BEDROOM

~ announceTime()

{
- now == Period1:
    You wake up in your bed with a throbbing erection.
- now > Period4:
    You return to {BEDROOM}, exhausted after a long day.
- else:
    You return to {BEDROOM}.
}
{BedroomPeople ? Stepsister:<> Your stepsister {SIS} is here}

- (bedroom_opts)
<- talkAndObserveAllCharacters(BedroomPeople, -> bedroom_opts)

* { Inventory ? CheerleaderPanties } [Jerk off with {CHEERLEADER}'s panties]
    -> cheerleader_panties ->
* { Inventory ? SisPanties } [Jerk off with {SIS}'s panties]
    -> stepsister_panties ->

+ [Go to {BATHROOM}] -> bathroom
+ [Go to {SIS_BEDROOM}] -> sis_bedroom
+ { now < Night } [Go to school] -> hallway
+ { now < Night } [Go to the {MALL}] -> mall
+ { now < Night } [Go to the {CHURCH}] -> church
+ { now >= AfterSchool } [Go to sleep] -> go_to_sleep ->
+ [Check your score]
    Score: {LIST_COUNT(Score)}/{LIST_COUNT(LIST_ALL(Score))}
    You { listPrint(Score, -> scoreDetails)}.
- -> bedroom_opts


/*
- The Bathroom
- Peep on Stepsister
*/
= bathroom
CONST BATHROOM = "the bathroom"
VAR BathroomPeople = ()
VAR BathroomItems = ()
~ here = BATHROOM

You are in the {BATHROOM}.
{BathroomPeople ? Stepsister:<> Your stepsister {SIS} is here}

- (bathroom_opts)
<- talkAndObserveAllCharacters(BathroomPeople, -> bathroom_opts)

+ [Look at {SIS}]
    -> look_at_stepsister ->
+ [Creampie {SIS}]
    ~ Score += sisCreampie
    You shove your cock into her dripping cunt and pump her full of cream.
+ { Inventory ? SisPanties } [Put {Stepsister}'s panties in the laundry]
    ~ move(SisPanties, Inventory, BathroomItems)

+ [Leave {BATHROOM}] -> pass_time -> bedroom
- -> bathroom_opts


/*
- Stepsister's Bedroom
- Sex with Stepsister
*/
= sis_bedroom
CONST SIS_BEDROOM = "your stepsister’s bedroom"
VAR SisBedroomPeople = ()
VAR SisBedroomItems = (SisPanties)
~ here = SIS_BEDROOM

You are in {SIS_BEDROOM}.
{SisBedroomPeople ? Stepsister:<> Your stepsister {SIS} is here}

- (sis_bedroom_opts)
<- talkAndObserveAllCharacters(SisBedroomPeople, -> sis_bedroom_opts)

+ { SisBedroomItems ? SisPanties } [Take her panties]
    ~ move(SisPanties, SisBedroomItems, Inventory)
    -> sis_bedroom_opts

+ [Leave {SIS_BEDROOM}] -> pass_time -> bedroom
- -> sis_bedroom_opts

