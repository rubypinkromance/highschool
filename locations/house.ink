/*
- Your bedroom
*/
=== bedroom ===
CONST BEDROOM = "your bedroom"
VAR BedroomPeople = ()
~ here = Bedroom
~ announceTime()

{
- now == Period1:
    // say nothing, dream text set up the day.
- now < AfterSchool:
    You return to {BEDROOM}.
- else:
    You return to {BEDROOM}, exhausted after a long day.
}
<- listHousePeople(BedroomPeople)

- (bedroom_opts)
<- talkAndObserveAllCharacters(BedroomPeople, -> bedroom_opts)

// Inventory Actions
* { Inventory ? CheerleaderPanties } [Jerk off with {CHEERLEADER}'s panties]
    -> cheerleader_panties -> bedroom_opts
* { Inventory ? SisPanties } [Jerk off with {SIS}'s panties]
    -> stepsister_panties -> bedroom_opts

// Computer Actions
+ [Use your laptop]
+ + [Check your score]
    -> check_score ->
+ + (jerk_off) {not cum_today} [Watch porn]
    ~ cum_today = true
    // This isn't a game about masturbation…
    // But it's odd to have a teenage boy with
    // a computer and no option to watch porn.
    You watch some porn and jerk off until you finally blow your load into some tissues. As you close your laptop, you think about how bored you are of masturbating, and increase your resolve to hook up with real girls at school instead.

// Navigation
+ [Go to {BATHROOM}] -> bathroom
+ [Go to {SIS_BEDROOM}] -> sis_bedroom
+ {now < Night}[Leave home]
+ + [Go to school] -> hallway
+ + [Go to the {MALL}] -> mall
+ + [Go to the {CHURCH}] -> church
+ + [Cancel] -> bedroom
+ {now >= AfterSchool}[Go to sleep]
    -> dream -> next_day ->bedroom
- -> bedroom_opts

/*
- The Bathroom
- Peep on Stepsister
*/
= bathroom
CONST BATHROOM = "the bathroom"
VAR BathroomPeople = ()
VAR BathroomItems = ()
~ here = Bathroom

You are in the {BATHROOM}.
<- listHousePeople(BathroomPeople)

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
~ here = SisBedroom

You are in {SIS_BEDROOM}.
<- listHousePeople(SisBedroomPeople)

- (sis_bedroom_opts)
<- talkAndObserveAllCharacters(SisBedroomPeople, -> sis_bedroom_opts)

+ { SisBedroomItems ? SisPanties } [Take her panties]
    ~ move(SisPanties, SisBedroomItems, Inventory)
    -> sis_bedroom_opts

+ [Leave {SIS_BEDROOM}] -> pass_time -> bedroom
- -> sis_bedroom_opts

/*
- List combinations of people in the house.
*/
= listHousePeople(roomPeople)
{
- roomPeople ? (Stepsister, SisFriend):
    <> Your stepsister {SIS} and her friend {SIS_FRIEND} are here.
- roomPeople ? Stepsister:
    <> Your stepsister {SIS} is here.
- roomPeople ? SisFriend:
    <> Your stepsister’s friend {SIS_FRIEND} is here.
}
-> DONE

= dream
{ cum_today:
    You sleep well and wake up refreshed and ready for a new day.
- else:
    ~ temp dream_about_girl = characterData(last_girl, DreamFunction)
    -> dream_about_girl ->
    You wake up with frustrated, with a throbbing erection and increased motivation.
}
->->