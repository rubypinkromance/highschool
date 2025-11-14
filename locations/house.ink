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
~ here = Bedroom

~ announceTime()

{
- now == Period1:
    // say nothing, the dream conclusion did it for us.    
- now > Period4:
    You return to {BEDROOM}, exhausted after a long day.
- else:
    You return to {BEDROOM}.
}
<- listHousePeople(BedroomPeople)

- (bedroom_opts)
<- talkAndObserveAllCharacters(BedroomPeople, -> bedroom_opts)

* { Inventory ? CheerleaderPanties } [Jerk off with {CHEERLEADER}'s panties]
    -> cheerleader_panties ->
* { Inventory ? SisPanties } [Jerk off with {SIS}'s panties]
    -> stepsister_panties ->
+ (jerk_off) {newToday(-> jerk_off) and now != Period1} [Jerk off]
    ~ cum_today = true
    You spank the monkey

+ [Go to {BATHROOM}] -> bathroom
+ [Go to {SIS_BEDROOM}] -> sis_bedroom
+ { now < Night } [Go to school] -> hallway
+ { now < Night } [Go to the {MALL}] -> mall
+ { now < Night } [Go to the {CHURCH}] -> church
+ { DEBUG or now >= AfterSchool } [Go to sleep]
    -> dream -> next_day ->bedroom
+ [Check your score]
    -> check_score ->
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