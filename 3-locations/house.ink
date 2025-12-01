/*

    Your bedroom

*/
=== bedroom ===
CONST BEDROOM = "your bedroom"
VAR BedroomPeople = ()
~ here = Bedroom
~ announceTime()

{
- now == Period1:
    // say nothing, dream text set up the day.
- else:
    You are in {BEDROOM}. {seenVeryRecently(-> bedroom): The walls are covered with posters for your favorite video games and movies. Your laptop sits on your desk next to a box of tissues and a bottle of lotion. Your bed is unmade, and a growing pile of laundry looms in the corner.}
}

<- list_house_people(BedroomPeople)

- (bedroom_opts)
<- character_opts(BedroomPeople, -> bedroom_opts)

// Inventory Actions
* (cum_in_cheerleader_panties){ Inventory ? CheerleaderPanties } [Jerk off with {CHEERLEADER}'s panties]
    -> cheerleader_panties -> bedroom_opts
* (cum_in_sis_panties){ Inventory ? SisPanties } [Jerk off with {SIS}'s panties]
    -> stepsister_panties -> bedroom_opts

// Computer Actions
+ (laptop_opts)[Use your laptop]
+ + [Check your score]
    -> print_score -> laptop_opts
+ + [Ask for a hint]
    <- hint_system(-> laptop_opts)
    -> DONE
+ + (jerk_off) {not cum_today} [Watch porn]
    ~ cum_today = true
    // This isn't a game about masturbation…
    // But it's odd to have a teenage boy with
    // a computer and no option to watch porn.
    You watch some porn and jerk off until you finally blow your load into some tissues. As you close your laptop, you think about how bored you are of masturbating, and increase your resolve to hook up with real girls at school instead.
+ + [Close your laptop]
    -> bedroom_opts

// Outfit Actions
+ [Change your clothes]
    What would you like to wear?
+ + [Default outfit]
    ~ outfit = Default
    You put on your normal jeans and t-shirt.
+ + [Nice clothes]
    ~ outfit = Nice
    You put on the nicest clothes you own, slacks with a button-up shirt and a tie you last wore for a funeral.
+ + [Athletic gear]
    ~ outfit = Athletic
    You put on running clothes.
+ + {Outfits ? Preppy}[Preppy clothes]
    ~ outfit = Preppy
    You put on clothes {QUEEN} would like.
+ + [Cancel]
    -> bedroom_opts

// Navigation
+ [Go to {BATHROOM}] -> bathroom
+ [Go to {SIS_BEDROOM}] -> sis_bedroom
+ {now < Night}[Leave home]
+ + [Go to school] -> hallway
+ + [Go to the {MALL}] -> mall
// + + [Go to the {CHURCH}] -> church
+ + [Cancel] -> bedroom
+ {now >= AfterSchool}[Go to sleep]
    -> dream -> next_day ->bedroom
- -> bedroom_opts

/*

    The Bathroom

*/
= bathroom
CONST BATHROOM = "the bathroom"
VAR BathroomPeople = ()
VAR BathroomItems = ()
~ here = Bathroom

You are in the {BATHROOM}. The counter is covered by a chaotic array of {SIS}'s makeup and hair products.

{ BathroomPeople ? Stepsister:
    <> The mirror is fogged with steam from the running shower. Your heart pounds with the knowledge that {SIS} is wet and naked on the other side of the shower curtain.
}

- (bathroom_opts)
<- character_opts(BathroomPeople, -> bathroom_opts)

+ [Leave {BATHROOM}] -> bedroom
- -> bathroom_opts


/*

    Stepsister's Bedroom

*/
= sis_bedroom
CONST SIS_BEDROOM = "your stepsister’s bedroom"
VAR SisBedroomPeople = ()
VAR SisBedroomItems = (SisPanties)
~ here = SisBedroom

You are in {SIS_BEDROOM}. The walls are painted pink and covered in posters for K-pop bands. Her bed has an unreasonable number of pillows and stuffed animals. On her desk you see a broken laptop and a pile of school textbooks. The floor is covered in piles of clothes, spilling out of both her dresser and her laundry basket.

<- list_house_people(SisBedroomPeople)

- (sis_bedroom_opts)
<- character_opts(SisBedroomPeople, -> sis_bedroom_opts)

+ { SisBedroomItems ? SisPanties and not cum_in_sis_panties } [Take her panties]
    ~ move(SisPanties, SisBedroomItems, Inventory)
    -> sis_bedroom_opts
+ { Inventory ? SisPanties and cum_in_sis_panties } [Put {SIS}'s panties in the laundry basket]
    ~ move(SisPanties, Inventory, SisBedroomItems)

+ [Leave {SIS_BEDROOM}] -> bedroom
- -> sis_bedroom_opts

/*

    List combinations of people in the house.

*/
= list_house_people(roomPeople)
{ LIST_COUNT(roomPeople) > 0:
<> {capitaliseStart(listRoomPeople(roomPeople))} {LIST_COUNT(roomPeople) > 1:are|is} here.
}
-> DONE

/*

    Dream

*/
= dream
{ cum_today:
    You sleep well and wake up refreshed and ready for a new day.
- else:
    ~ temp dream_about_girl = characterData(last_girl, DreamFunction)
    -> dream_about_girl ->
    You wake up with frustrated, with a throbbing erection.
}
->->