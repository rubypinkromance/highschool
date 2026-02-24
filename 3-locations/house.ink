/*

    Your bedroom

*/
=== bedroom ===
CONST BEDROOM = "your bedroom"
VAR BedroomPeople = ()
VAR BedroomItems = (Laptop)
~ here = Bedroom
~ announceTime()

// If it's morning, we don't need to say nothing, the dream text already set up the day.
{ now > Period1:
    You are in {BEDROOM}. The walls are covered with posters for your favorite video games and movies. {BedroomItems ? Laptop:Your laptop sits on your desk next to|On your desk is} a box of tissues and a bottle of lotion. Your bed is unmade, and a growing pile of laundry looms in the corner. {BedroomItems !? Laptop: Your laptop is missing. {SIS} must have borrowed it again.}
}
{
- SisFacts ? SisSawYourPorn and sis_is_home() and now > Period1 and chance(33):
    -> stepsister_wants_to_talk ->
- BathroomPeople ? Stepsister:
    You can hear {getNameAndTitle(Stepsister)} singing in the shower.
- SisBedroomPeople ? (Stepsister, SisFriend):
    You can hear giggling from {SIS_BEDROOM}. {SIS}’s friend {SIS_FRIEND} must be sleeping over again.
- LIST_COUNT(SisBedroomPeople) > 0:
    You can hear music playing in {SIS_BEDROOM}.
}

- (bedroom_opts)
<- character_opts(BedroomPeople, -> bedroom_opts)

// Inventory Actions
* (cum_in_cheerleader_panties){ Inventory ? CheerleaderPanties } [Jerk off with {CHEERLEADER}'s panties]
    -> cheerleader_panties -> bedroom_opts
* (cum_in_sis_panties){ Inventory ? SisPanties } [Jerk off with {SIS}'s panties]
    -> stepsister_panties -> bedroom_opts

// Computer Actions
+ (laptop_opts){BedroomItems ? Laptop}[Use your laptop]
+ + [Check your score]
    -> print_score -> laptop_opts
+ + [Ask for a hint]
    <- hint_system(-> laptop_opts)
    -> DONE
+ + (jerk_off) {not cum_today} [Watch porn]
    {
    // Stepsis might might catch you jerkin' it
    - sis_is_home() and chance(66):
        ~ SisFacts += SisSawYourPorn
        -> stepsister_catches_you_jerking_off -> bedroom_opts
    - else:
        ~ cum_today = true
        You watch some porn and jerk off until you finally blow your load into some tissues. As you close your laptop, you think about how bored you are of masturbating, and increase your resolve to hook up with real girls at school instead.
    }
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
+ {!BathroomPeople}[Go to {BATHROOM}] -> bathroom
+ {BathroomPeople ? Stepsister}[Sneak into {BATHROOM}] -> bathroom
+ {!SisBedroomPeople}[Go to {SIS_BEDROOM}] -> sis_bedroom(false) // if no one's there, no need to knock
+ {SisBedroomPeople}[Go to {SIS_BEDROOM}]
+ + [Knock first] -> sis_bedroom(true)
+ + [Just open the door] -> sis_bedroom(false)
+ {now < Night}[Leave home]
+ + [Go to school] -> hallway
+ + [Go to the {MALL}] -> mall
// + + [Go to the {CHURCH}] -> church
+ + [Cancel] -> bedroom
+ {now >= AfterSchool}[Go to sleep]
    -> dream -> next_day -> bedroom
+ {DEBUG} [Pass time #DEBUG]
    -> pass_time -> bedroom
- -> bedroom_opts

/*

    The Bathroom

*/
= bathroom
CONST BATHROOM = "the bathroom"
VAR BathroomPeople = ()
VAR BathroomItems = ()
~ here = Bathroom

{
- BathroomPeople ? Stepsister:
    You sneak into the bathroom as quietly as you can, trying not to alert {SIS} to your presence. The mirror is fogged with steam from the running shower. Your heart pounds with the knowledge that she’s wet and naked on the other side of the shower curtain.
- else:
    You are in the {BATHROOM}. The counter is covered by a chaotic array of {SIS}'s makeup and hair products.
}

- (bathroom_opts)
<- character_opts(BathroomPeople, -> bathroom_opts)

+ { BathroomPeople ? Stepsister } [Try to peek in the shower]
    -> peep_stepsister_shower ->
+ [Leave {BATHROOM}] -> bedroom
- -> bathroom_opts


/*

    Stepsister's Bedroom


*/
= sis_bedroom(knock)
CONST SIS_BEDROOM = "your stepsister’s bedroom"
VAR SisBedroomPeople = ()
VAR SisBedroomItems = (SisPanties)
~ here = SisBedroom

You are in {getNameAndTitle(Stepsister)}’s bedroom. The walls are painted pink and covered in posters for K-pop bands. Her bed has an unreasonable number of pillows and stuffed animals. On her desk you see a broken laptop and a pile of school textbooks. The floor is covered in piles of clothes, spilling out of both her dresser and her laundry basket.
{not SisBedroomPeople and SisBedroomItems ? Laptop:Your laptop is sitting on her bed, with the screensaver playing.}

-> sis_on_the_bed(SisBedroomPeople, knock) ->

- (sis_bedroom_opts)
<- character_opts(SisBedroomPeople, -> sis_bedroom_opts)

+ { SisBedroomPeople == () and SisBedroomItems ? Laptop }[Take your laptop]
    -> retrieve_laptop_from_stepsister ->
+ { SisBedroomPeople == () } [Explore her room]
    -> explore_stepsister_room ->
+ [Leave {SIS_BEDROOM}]
    -> bedroom
- -> sis_bedroom_opts

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