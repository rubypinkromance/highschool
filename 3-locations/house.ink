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
- SisFacts ? SisSawYourPorn and sis_is_home() and now > Period1 and chance(33) and not sis_wants_to_talk and not SisRejected:
    -> sis_wants_to_talk ->
- BathroomPeople ? Sister:
    You can dimly hear {getNameAndTitle(Sister)} singing in the shower.
- SisBedroomPeople ? (Sister, SisFriend):
    You can hear giggling from {SIS_BEDROOM}. {SIS}’s friend {SIS_FRIEND} must be sleeping over again.
- LIST_COUNT(SisBedroomPeople) > 0:
    Through the wall, you can hear music playing in {SIS_BEDROOM}.
}

- (bedroom_opts)
<- character_opts(BedroomPeople, -> bedroom_opts)

// Masturbation Actions (only show one)
TODO: use SisNudes and SisVideo in a way that supports getting nudes from other girls
{
- Inventory ? CheerleaderPanties and not use_cheerleader_panties and not cum_today:
    * [Jerk off with {CHEERLEADER}'s panties] -> use_cheerleader_panties -> bedroom_opts
- Inventory ? SisLacePanties and not use_sis_panties and not cum_today:
    * [Jerk off with {SIS}'s panties] -> use_sis_panties -> bedroom_opts
- not cum_today and (now == Period1 or now == Night):
    + [{~Jerk off|Spank the monkey|Rub one out|Wank}] -> jerk_off -> bedroom_opts
}

// Computer Actions
+ (laptop_opts){BedroomItems ? Laptop}[Use your laptop]
+ + {not cum_today} [Watch porn]
    -> watch_porn -> bedroom_opts
+ + [Check your score]
    -> print_score -> laptop_opts
+ + [Ask for a hint]
    <- hint_system(-> laptop_opts)
    -> DONE
+ + [Close your laptop]
    -> bedroom_opts

// Outfit Actions
+ {now < Night}[Change your clothes]
    What would you like to wear?
+ + [Normal clothes]
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
+ [Leave your room]
+ + {!BathroomPeople}[Go to {BATHROOM}] -> bathroom
+ + {BathroomPeople ? Sister and not SisRejected}[Sneak into {BATHROOM}] -> bathroom
+ + {!SisBedroomPeople}[Go to {SIS_BEDROOM}] -> sis_bedroom // if no one's there, no need to knock
+ + {SisBedroomPeople}[Go to {SIS_BEDROOM}]
+ + + [Knock first] -> sis_knock
+ + + [Just open the door] -> sis_bedroom
+ + + [Nevermind] -> bedroom
+ + [Go to school] -> hallway
+ + [Go to the {MALL}] -> mall
// + + [Go to the {CHURCH}] -> church
+ + [Cancel] -> bedroom

// Time Actions
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
- BathroomPeople ? Sister:
    You close {BATHROOM} door behind you as quietly as you can, trying not to alert {SIS} to your presence. The mirror is fogged with steam from the running shower. Your heart pounds with the knowledge that she’s wet and naked on the other side of the shower curtain. Her phone is on the counter, playing music that she is loudly singing along to.
- else:
    You are in {BATHROOM}. The counter is covered by a chaotic array of {SIS}'s makeup and hair products.
}

- (bathroom_opts)
+ { BathroomPeople ? Sister } [Try to peek in the shower]
    -> peep_sis_shower ->
* { BathroomPeople ? Sister } [Look at her phone]
    -> look_sis_phone ->
+ [Leave {BATHROOM}]
    -> bedroom
- -> bathroom_opts

/*

    Sister's Bedroom


*/
= sis_bedroom
CONST SIS_BEDROOM = "your stepsister’s bedroom"
VAR SisBedroomPeople = ()
VAR SisBedroomItems = (SisLacePanties)
~ here = SisBedroom

You are in {getNameAndTitle(Sister)}’s bedroom. The walls are painted pink and covered in posters for K-pop bands. Her bed has an unreasonable number of pillows and stuffed animals. On her desk you see a broken laptop and a pile of school textbooks. The floor is covered in piles of clothes, spilling out of both her dresser and her laundry basket.
{SisBedroomPeople !? Sister and SisBedroomItems ? Laptop:<> Your laptop is sitting on the bed, with the screensaver playing.}

-> sis_on_the_bed ->

- (sis_bedroom_opts)
<- character_opts(SisBedroomPeople, -> sis_bedroom_opts)

+ { SisBedroomPeople == () and SisBedroomItems ? Laptop }[Take your laptop]
    -> retrieve_laptop_from_sis ->
+ { SisBedroomPeople == () and not SisRejected } [Explore her room]
    -> explore_sis_room ->
+ [Leave {SIS_BEDROOM}]
    -> pass_time -> bedroom
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
    You wake up frustrated, with a throbbing erection.
}
->->
