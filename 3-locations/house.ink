/*

    Your bedroom
    Flirting with Sis:
        b. Your room: She enters without knocking to borrow your laptop, catches you in the act (but doesn't see anything). She teases you, asks leading questions, is generally obnoxious. You can choose to kick her out, or play along. If she borrows your laptop, she sees your porn history (+SisSawYourPorn)
            -> SisFlirt
*/
TODO add scene where Sis enters without knocking to borrow laptop
=== bedroom ===
CONST BEDROOM = "your bedroom"
VAR BedroomPeople = ()
VAR BedroomItems = (Laptop)
~ here = Bedroom
~ announceTime()

{
- now == Period1:
    // say nothing, dream text set up the day.
- else:
    You are in {BEDROOM}. The walls are covered with posters for your favorite video games and movies. {BedroomItems ? Laptop:Your laptop sits on your desk next to|On your desk is} a box of tissues and a bottle of lotion. Your bed is unmade, and a growing pile of laundry looms in the corner.
    {BedroomItems !? Laptop: Your laptop is missing. {SIS} must have borrowed it again.}
}
{
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
+ {BathroomPeople !? Stepsister}[Go to {BATHROOM}] -> bathroom
+ {BathroomPeople ? Stepsister and SisFacts ? SisIsInterested}[Sneak into {BATHROOM}] -> bathroom
+ {now < Night and !SisBedroomPeople}[Go to {SIS_BEDROOM}] -> sis_bedroom(false)
+ {now < Night and SisBedroomPeople}[Go to {SIS_BEDROOM}]
+ + [Knock first] -> sis_bedroom(true)
+ + [Just open the door] -> sis_bedroom(false)
+ {now < Night}[Leave home]
+ + [Go to school] -> hallway
+ + [Go to the {MALL}] -> mall
// + + [Go to the {CHURCH}] -> church
+ + [Cancel] -> bedroom
+ {DEBUG} [Pass time]
    -> pass_time -> bedroom
+ {now >= AfterSchool}[Go to sleep]
    -> dream -> next_day -> bedroom
- -> bedroom_opts

/*

    The Bathroom
    If SisIsInterested, you can peep on her in the shower

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
    Flirting with Sis:
        a. Her room: She's on a video call with her friend (or talking in person), and you catch a few words about sex. She'll pretend to be upset, but not force you to leave. You can tease her, and she'll play along.
            If she has your laptop, you catch her watching porn (if alone), or eating her friend out while porn plays (if friend is over)
            -> SisFlirt

*/
= sis_bedroom(knock)
CONST SIS_BEDROOM = "your stepsister’s bedroom"
VAR SisBedroomPeople = ()
VAR SisBedroomItems = (SisPanties)
~ here = SisBedroom

You are in {getNameAndTitle(Stepsister)}’s bedroom. The walls are painted pink and covered in posters for K-pop bands. Her bed has an unreasonable number of pillows and stuffed animals. On her desk you see a broken laptop and a pile of school textbooks. The floor is covered in piles of clothes, spilling out of both her dresser and her laundry basket.

-> sis_on_the_bed(SisBedroomPeople, knock) ->

- (sis_bedroom_opts)
<- character_opts(SisBedroomPeople, -> sis_bedroom_opts)

+ { SisBedroomPeople == () } [Explore her room]
    -> explore_stepsister_room ->
+ [Leave {SIS_BEDROOM}]
    -> bedroom
- -> sis_bedroom_opts

/*

    Describe Stepsister on the Bed

*/
TODO make these more unique
TODO hostile doesn't mean hostile
TODO describe sister based on whether you knocks, whether friend is here, arousal level, etc
= sis_on_the_bed(RoomPeople, knock)
{
- RoomPeople ? (Stepsister, SisFriend):
    {SIS} and her friend {SIS_FRIEND} are
    {
    - SisMood == Hostile:
        <> glaring at you.
    - SisMood == Aroused:
        <> sitting on the bed, looking at you seductively.
    - SisMood == Desperate:
        <> making out on the bed.
    - else:
        <> lounging on the bed.
    }
- RoomPeople ? Stepsister:
    {SIS} is
    {
    - SisMood == Hostile:
        <> glaring at you.
    - SisMood == Aroused:
        <> sitting on the bed, squeezing her legs together and looking flushed.
    - SisMood == Desperate:
        <> squirming on the bed, beckoning you to come closer.
    - else:
        <> lounging on the bed.
    }
- RoomPeople ? SisFriend:
    {SIS}’s friend {SIS_FRIEND} is
    {
    - SisFriendMood == Hostile:
        <> glaring at you.
    - SisFriendMood == Friendly:
        <> sitting on the bed, smiling at you.
    - SisFriendMood == Aroused:
        <> sitting on the bed, licking her lips and winking at you.
    - SisFriendMood == Desperate:
        <> squeezing her tits, urging you to come closer.
    - SisFriendMood:
        <> lounging on the bed.
    }
- LIST_COUNT(RoomPeople) > 0:
    {lookForRoomPeople(RoomPeople)}
}
->->

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