/*

    Sister: Heather
    Looks like Jade Jones: shaggy black hair, average build, large tits, 34C, shaved
    Outfit: TBD, black with pink polkadots underwear and bra.
    Likes earnest, sweet
    Dislikes serious
    Goes to all girl school with friend
    
       Weekdays   Weekends
    ------------------------
    1: ---      - Bedroom
    2: ---      - BraStore
    L: ---      - DressStore
    3: ---      - ShoeStore
    4: ---      - Bedroom
    A: Bathroom - Bathroom
    N: Bedroom  - Bedroom

    SisObserved
    0. Peep in the shower
    0. Read her diary
    0. Saw her porn
    0. Caught fapping
    0. Saw your porn
    -> SisQuestions

    SisQuestion
    1. Ask if she likes you -> SisIsInterested
    SisIsInterested -> SisTruthOrDare
    
    SisTruthOrDare
    2. Fool around
    -> SisSex
    
    SisSex
    3. Have sex again

*/
CONST SIS = "Heather"
CONST SIS_TITLE = "your stepsister"
LIST SisState = (SisObserved), SisQuestions, SisTruthOrDare, SisSex
LIST SisFacts = ReadSisDiary, SawSisPorn, SisMightBeQueer, SisLikesFriend, SisLikesYou, SisIsBi, SawSisNaked, SisSawYourPorn, SisSawYouFapping, SisCaughtYouPeeking, SisIsInterested, FoundSisVibrator, FoundSisStrapOn
LIST SisClothes = SisPanties, SisBra, SisShorts, SisShirt
LIST SisItems = SisLacePanties, SisDiary, SisVibrator, SisStrapOn

VAR SisInPlay = true
VAR SisMood = Neutral
VAR SisBaseMood = Neutral
VAR SisCum = ()
VAR SisRejected = false
VAR SisQuestionCount = 0
VAR SisWearing = (SisPanties, SisBra, SisShorts, SisShirt)
VAR SisTops = (SisBra, SisShirt)
VAR SisBottoms = (SisPanties, SisShorts)

/*

    Talk to Sister

*/
=== talk_to_sis ===
~ last_girl = Sister

{
// If you ask to talk at the mall, she says she's busy
- not sis_is_home():
    "I can't talk right now. Catch me at home?"
    ->->
- SisMood == Hostile:
    "What do you want?"
- else:
    {~"Stepbro! What's up?"|"Hey, bro. You need something?"|"What's up, bro?"}
}

- (opts)
+ { SisBedroomItems ? Laptop }
    "I need my laptop back."
    "That's fine, I'm done with it."
    ~ move(Laptop, SisBedroomItems, BedroomItems)
+ {SisState == SisQuestions and not SisRejected}
    ["Can I ask {sis_questions:another|a} personal question?"]
    -> sis_questions ->
+ {SisState == SisTruthOrDare and not seenVeryRecently(-> sis_questions.make_this_more_interesting)}
    [“Wanna play truth or dare{sis_truth_or_dare: again}?”]
    -> sis_truth_or_dare ->
+ {SisState == SisSex and SisMood >= Aroused and newToday(-> sis_sex)}
    [“Wanna fool around again?”]
    -> sis_sex ->
+ {not seenVeryRecently(-> look_at_sis) and not SisRejected}
    [Check her out]
    -> look_at_sis ->
+ {DEBUG} [Questions #DEBUG]
    -> sis_questions ->
+ {DEBUG} [Truth or Dare #DEBUG]
    -> sis_truth_or_dare ->
+ [Leave conversation]
    ->->
- -> opts

/*

    Sister Wants To Talk
    After seeing your porn preferences, she enters without knocking. You can kick her out, or play along.

*/
=== sis_wants_to_talk ===
~ removePerson(Sister)
~ BedroomPeople += (Sister)

{SIS} opens your door without knocking. "Hey bro, can I talk to you about something kinda personal?"

+ ["Get out!" (Don't show stepsister content)]
    "Get out of my room!"
    "Ugh, forget it." {SIS} rolls her eyes and closes the door.
    ~ SisRejected = true
+ "Sure, what's up?"
    ~ last_girl = Sister
    { SisState < SisQuestions:
        ~ SisState = SisQuestions
    }
    -> questions_from_sis.q_sis_saw_your_porn ->
-
~ sis_reset()
~ removePerson(Sister)
~ SisBedroomPeople += (Sister)
- ->->

/*

    Sister Catches You Jerking Off
    She enters without knocking and catches you in the act. You can kick her out, or play along.

*/
=== sis_catches_you_jerking_off ===
~ removePerson(Sister)
~ BedroomPeople += (Sister)
~ SisFacts += SisSawYouFapping

{SIS} opens your door without knocking. "Hey bro, can I…" She trails off, eyes open wide at the sight of you jerking off.

+ ["Get out!" (Don't show stepsister content)]
    "What the fuck? Get out of my room!"
    "Your loss." {SIS} shrugs and closes the door.
    ~ SisRejected = true
+ [Cover up]
    ~ last_girl = Sister
    { SisState < SisQuestions:
        ~ SisState = SisQuestions
        ~ SisFacts += SisLikesYou
        ~ SisFacts += SisIsInterested
    }
    "{SIS}, what the fuck?" you yelp, frantically trying to cover yourself.
    "Don't stop on my account," she grins, stepping in and closing the door behind her. "I just wanted to ask you something, but this is way more interesting."
    "You want to watch me jerk off?"
    {SisFacts ? SisCaughtYouPeeking: "Why not? You watched me in the shower. Seems only fair."|"It's kinda hot," she confesses.}
    + + [Keep going]
        ~ improveMood(SisMood)
        ~ improveBaseMood(SisMood)
        "Alright," you say, "but don't get weird about this."
        -> sis_sex.you_masturbate ->
    + + [Stop]
        "I dunno[…"]," you say, "that sounds like a bad idea."
        "Boring," she frowns. "Well, if you're not gonna let me watch, then can I talk to you about something?"
        + + + "Sure, what's on your mind?"
        - - - -> questions_from_sis.q_sis_saw_you_fapping ->
+ [Keep going]
    ~ last_girl = Sister
    { SisState < SisQuestions:
        ~ SisState = SisQuestions
        ~ SisFacts += SisLikesYou
        ~ SisFacts += SisIsInterested
    }
    "Do you mind?" You ask, without slowing your stroke. "I'm a little busy."
    "I can see that," she grins, stepping in and closing the door behind her. "And while I'm flattered, do you think you could stop beating your meat for a minute so I can talk to you about something?"
    + + [Don't stop]
        ~ improveMood(SisMood)
        ~ improveBaseMood(SisMood)
        "I can't stop now," you groan, "But you can stay and watch if you want."
        -> sis_sex.you_masturbate ->
    + + [Stop]
        "Fine," you sigh, putting your cock away. "What's on your mind?"
        -> questions_from_sis.q_sis_saw_you_fapping ->
-
~ sis_reset()
~ removePerson(Sister)
~ SisBedroomPeople += (Sister)
- ->->

/*

    Sister Questions
    After 3 questions, she escalates to truth or dare

*/
=== sis_questions ===
~ last_girl = Sister
{ SisMood < Friendly:
    ~ improveMood(SisMood)
    ~ improveBaseMood(SisMood)
}
"Can I ask you {kind of a|another} personal question?"
{"Well, this sounds interesting," she grins, sitting up and giving you her full attention. "Okay. You can ask me anything you want. <em>Anything</em>," she emphasizes. "But, every time you ask me a question, I get to ask you one in return. Deal?"|"Make it a good one," she grins.}
+ {sis_questions == 1} "Deal."
    "Okay, what's your first question?"
+ ->
- (top)
{ SisQuestionCount >= 3:
    -> make_this_more_interesting ->->
}
-
-> questions_for_sis ->
{ came_from(-> questions_for_sis.no_question):
    "{~That's a shame|Too bad|Your loss}," she winks.
    ->->
}
+ "Your turn[."]," you say.
-
-> questions_from_sis ->
+ "Can I ask another question?"
    "Of course."
    -> top
+ "I'm done for now."
    "{~That's a shame|Too bad|Your loss}," she winks.
    ->->
-
->->

= make_this_more_interesting
~ SisState = SisTruthOrDare
"Actually, wait a second," {SIS} says. "Do you wanna make this more interesting?"
"What do you have in mind?"
"Let's play truth or dare."
"Really?"
"Really," she grins. "Trading questions is halfway there already, so why not?"
+ "I dunno about this."
    "What do you mean?"
    "I mean, truth and dare… that's like a game you play with someone you wanna fool around with."
    "And?" She raises an eyebrow at you.
    + + ["I'm not comfortable."]
        "…And asking questions is one thing, but I'm not comfortable going further."
        "Too bad." She looks disappointed. "Let me know if you change your mind."
        ->->
    + + ["Are you sure?"]
        "…And I want to make sure you're really cool with that."
        "Oh, I'm cool with that," she grins. "You start."
        -> sis_truth_or_dare.top
+ "I'm game if you are[."]," you grin.
    "Okay. You start."
    -> sis_truth_or_dare.top
-
->->

/*

    Sister Truth or Dare

*/
=== sis_truth_or_dare ===
~ last_girl = Sister
"Wanna play truth or dare?"
"{~I thought you'd never ask|My favorite|This'll be fun}," she grins. "You go first."
+ "Truth or dare?"
- (top)
Sis is wearing: {SisWearing}
{ Score !? sisTruthOrDare:
    ~ Score += sisTruthOrDare
}
~ temp odds = 100 - SisQuestionCount * 10
CHANCE: {odds}
{
- chance(odds):
    "Truth!"
    -> questions_for_sis ->
- else:
    "Dare!"
    -> dares_for_sis ->
}
-
{
- came_from(-> questions_for_sis.no_question) or came_from(-> dares_for_sis.no_dare):
    "{~That's a shame|Too bad|Your loss}," she winks.
    ~ sis_reset()
    ->->
- else:
    "Okay, my turn," she grins. "Truth or dare?"
}
+ {not questions_from_sis.q_final_question} "Truth"
    -> questions_from_sis ->
+ "Dare"
    -> dares_from_sis ->
-
{ dares_from_sis.d_final_dare:
    ~ sis_reset()
    ->->
}
+ "Truth or dare?"
    -> top
+ "I'm done for now."
    "{~That's a shame|Too bad|Your loss}," she winks.
    ~ sis_reset()
    ->->
-
~ sis_reset()
->->

/*

    Questions for Sis
    
    Need at least 10 ungated questions (prereqs are okay)
    More than 10-15 kinda pointless, because she'll stop choosing truth after 10 questions
    - shave
    - bra size
    - virgin
    - have you ever tasted pussy
    - spit or swallow
    - how often do you masturbate
    - ever had anal sex
    - how many people have you had sex with
    - have you ever thought about me while masturbating
    - what's your naughtiest fantasy
    - are you turned on right now
    - do you have any nudes on your phone
    - have you ever had an orgasm in public
    - what question are you secretly hoping I'll ask you
    - have you ever fucked two guys at once
    - do you like being told what to do

*/
=== questions_for_sis ===
~ temp max = 5
~ SisQuestionCount++

// Fact-Based Questions
* { SisFacts !? SawSisNaked && CHOICE_COUNT() < max }
    [Ask if she shaves]
    -> q_sis_shaved ->
* {SisFacts ? SawSisNaked and CHOICE_COUNT() < max}
    [Ask about seeing her naked]
    -> q_saw_sis_naked ->
* {SisFacts ? SawSisPorn and CHOICE_COUNT() < max}
    [Ask about her porn history]
    -> q_saw_sis_porn ->
* {SisFacts ? ReadSisDiary and CHOICE_COUNT() < max}
    [Ask about her diary]
    -> q_read_sis_diary ->
* {SisFacts ? FoundSisVibrator and CHOICE_COUNT() < max}
    [Ask about her vibrator]
    -> q_found_sis_vibrator ->
* {SisFacts ? FoundSisStrapOn and CHOICE_COUNT() < max}
    [Ask about the strap-on]
    -> q_found_sis_strapon ->
* {SisFacts ? SisMightBeQueer and SisFacts !? SisIsBi and CHOICE_COUNT() < max}
    [Ask if she's a lesbian]
    -> q_sis_might_be_queer ->
* {SisFacts ? SisLikesFriend and SisFacts ? SisIsBi and CHOICE_COUNT() < max}
    [Ask if she likes {SIS_FRIEND}]
    -> q_sis_likes_friend ->
* {SisFacts ? SisLikesYou and SisFacts ? SisIsBi and CHOICE_COUNT() < max}
    [Ask if she likes you]
    -> q_sis_likes_you ->
* {SisFacts ? SisIsInterested and not sis_questions.make_this_more_interesting and not sis_truth_or_dare and CHOICE_COUNT() < max}
    [Ask her to play truth or dare]
    -> q_sis_truth_or_dare ->

// General Questions
* { CHOICE_COUNT() < max }
    [Ask her bra size]
    -> q_sis_bra_size ->
* { CHOICE_COUNT() < max }
    [Ask if she's a virgin]
    -> q_sis_virgin ->
* { CHOICE_COUNT() < max }
    [Ask if she spits or swallows]
    -> q_sis_spit_or_swallow ->

+ (no_question) "I can't think of a question."
-
->->

TODO write dialog for questions for sis

= q_sis_bra_size
~ BraSizes += (Sister)
"What's your bra size?"
"Ugh, boring. Why are boys so obsessed with bra sizes?" She rolls her eyes. "34C."
->->

= q_sis_virgin
"Are you a virgin?"
"Nope, I lost it at age 15 with… some dude. Don't worry about it."
->->

= q_sis_spit_or_swallow
"Do you spit or swallow?"
"Neither, if I can avoid it."
->->

= q_sis_shaved
"Are you shaved or full bush?"
"I keep it clean."
->->

= q_saw_sis_naked
"So, I saw you naked."
"Did you like it?"
->->

= q_saw_sis_porn
"I saw the porn you watch"
"What about it?"
->->

= q_read_sis_diary
"I read your diary"
"What about it?"
->->

= q_found_sis_vibrator
"I found your vibrator."
"That's not a question," she grins.
->->

= q_found_sis_strapon
"I found your strap-on."
"It's a good one."
->->

= q_sis_might_be_queer
~ SisFacts += SisIsBi
"Are you gay?"
"Nah, bi."
->->

= q_sis_likes_friend
"Are you into {SIS_FRIEND}"
"And?"
->->

= q_sis_likes_you
"Are you into me?"
"I sure am."
->->

= q_sis_truth_or_dare
"Let's play truth or dare."
"Deal!"
->->

/*

    Questions from Sis
    Should escalate fairly quickly, because after the first 3, player can choose dare
    
    Need at least 15 ungated questions
    - have you ever tasted your own cum
    - do you like the taste of pussy
    - are you attracted to men
    - how many people have you fooled around with
    - have you ever been with two women at once/would you like to?
    
    - wildest place you've ever cum

    - have you ever sent a dick pic?
    - have you ever said the wrong name with a girl?
    - have you ever had a crush on someone inappropriate?
    - what would you do if there were zero consequences
    - if you could turn invisible, what would you do

    - what do you think about while masturbating?
    - have you ever thought about me while jerking off?
    - are you hard right now (if not naked)
    - are you attracted to me
    - do you want to fuck me

*/
=== questions_from_sis ===
// These first questions are ones you can skip during gameplay, so we insert them here
{
- SisFacts ? SisSawYourPorn and sis_wants_to_talk and not q_sis_saw_your_porn:
    -> q_sis_saw_your_porn ->
- SisFacts ? SisSawYouFapping and not q_sis_saw_you_fapping:
    -> q_sis_saw_you_fapping ->
- SisFacts ? SisCaughtYouPeeking and not q_sis_saw_you_peeping:
    -> q_sis_saw_you_peeping ->
- else:
    { stopping:
    - -> q_hard_now ->
    - -> q_fantasize_about_sis ->
    - -> q_final_question ->
    }
}
->->

TODO write dialog for questions from sis

// After borrowing laptop, tells you she saw stepsister porn in your browser history. Asks if you’re into that "I’m not your little sister. We’re the same age and not related."
= q_sis_saw_your_porn
"I saw your porn."
"Indeed?"
->->

= q_sis_saw_you_fapping
"I saw you jerking it."
"So you did."
->->

= q_sis_saw_you_peeping
"I saw you peeping on me."
"I sure did!"
->->

= q_hard_now
"Are you hard right now?"
+ "Yes"
    "Nice."
+ "No"
    "Liar, I can see it."
-
->->

= q_fantasize_about_sis
"Do you think about me when you're jerking off?"
+ "Yes"
    "Awesome"
+ "No"
    "Liar."
-
->->

= q_final_question
"Do you want to fuck me?"
+ "Yes"
    "Awesome."
+ "No"
    "Liar."
-
->->


/*

    Dares for Sis
    At least 15, prereqs okay
    
    - striptease
    - lap dance
    - suck on my thumb like you would suck a cock
    - show me your nudes (after asking)
    - 

    - get undressed
    - 
    - watch porn with me
    -
    - let me taste you

    -
    - show me how you masturbate
    - touch my cock
    - go down on me
    - 

*/
TODO write dares for sis, improve her mood
=== dares_for_sis ===
~ temp max = 5
*  { SisFacts !? SawSisNaked and SisWearing ? SisShirt and CHOICE_COUNT() < max }
    [Dare her to take off her top]
    -> d_remove_top ->
*  { SisFacts !? SawSisNaked and SisWearing ? SisShorts and CHOICE_COUNT() < max }
    [Dare her to take off her shorts]
    -> d_remove_shorts ->
*  { SisFacts !? SawSisNaked and SisWearing !? SisShirt and SisWearing ? SisBra and CHOICE_COUNT() < max }
    [Dare her to take off her bra]
    -> d_remove_bra ->
*  { SisFacts !? SawSisNaked and SisWearing !? SisShorts and SisWearing ? SisPanties and CHOICE_COUNT() < max }
    [Dare her to take off her panties]
    -> d_remove_panties ->
* { SisFacts ? SawSisNaked and SisWearing != () and CHOICE_COUNT() < max }
    [Dare her to get naked]
    -> d_get_naked
+ (no_dare) "I can't think of a dare." ->->
-
->->

= d_remove_top
~ SisWearing -= SisShirt
"I dare you to take off your top."
"Done."
->->

= d_remove_shorts
~ SisWearing -= SisShorts
"I dare you to take off your shorts!"
"Done!"
->->

= d_remove_bra
~ SisWearing -= SisBra
{ SisWearing == ():
    ~ SisFacts += SawSisNaked
}
"I dare you to take off your bra."
"Done."
->->

= d_remove_panties
~ SisWearing -= SisPanties
{ SisWearing == ():
    ~ SisFacts += SawSisNaked
}
"I dare you to take off your panties!"
"Done!"
->->

= d_get_naked
~ SisWearing = ()
"I dare you to get naked."
"All at once? Are you in a hurry or something?"
"Not like I haven't seen you naked before."
"Fair point."
->->

/*

    Dares from Sis
    Should be a clear escalation, building intensity until she asks you to fuck her
    How many? 5-10?
    
    - show me your dick pic/I didn't save it/show me your dick
    - take off your clothes
    - kiss me - not a sibling kiss, a proper kiss (gets heated, hand in hair, licking neck)
    - take my bra/panties off with your teeth
    - suck on my nipples
    - finger me
    - go down on me
    - rub my clit with your cock
    - put it in me

*/
TODO write dares from sis, improve her mood
=== dares_from_sis ===
{ stopping:
- -> d_remove_pants ->
- -> d_kiss_sis ->
- -> d_final_dare ->
}
->->

= d_remove_pants
"I dare you to take off your pants."
"I'm not wearing any."
->->

= d_kiss_sis
"I dare you to kiss me."
"Okay."
->->

= d_final_dare
~ SisState = SisSex
"I dare you to fuck me."
You cum all over her immediately.
->->

/*

    Look at Sister

*/
=== look_at_sis ===
~ last_girl = Sister
~ temp topless = SisWearing ^ SisTops == ()
~ temp bottomless = SisWearing ^ SisBottoms == ()

{ SisCum:
- Anal:
    {SIS} moans with your cum leaking from her asshole.
- Creampie:
    {SIS} is wiping up your cum as it drips from her pussy.
- Mouth:
    {SIS} grins and licks the last of your cum from her lips.
- Facial:
    {SIS} winks at you as she wipes your cum from her cheek and licks her finger clean.
- Tits:
    {SIS} is giggling as she rubs your cum into her tits.
- else:
    You and {SIS} are the same age, but she’s shorter than you, with pale skin and wavy black hair that falls around her shoulders when it’s not pulled back in a ponytail.
    {
    - sis_is_home():
        <> She's wearing
        {
        - bottomless:
            <> no underwear, and you can see she's fully shaved.
        - SisWearing ? SisShorts:
            <> baggy blue sleep shorts.
        - SisWearing ? SisPanties:
            <> black panties with pink polka-dots.
        }
        {
        - topless:
            <> Her bare tits are a good size, with prominent nipples.
        - SisWearing ? SisShirt:
            <> Her black tank top does little to conceal her perky nipples poking through the thin fabric and is loose enough that whenever she moves, you catch a glimpse of her {SisWearing ? SisBra:black lace bra|bare tits} through the arm holes.
        - SisWearing ? SisBra:
            <> Her black lace bra doesn't hide her prominent nipples so much as draw attention to them.
        }
    - else:
        <> She’s wearing torn black jeans, a black t-shirt with a band logo, and a green army jacket. Her shirt is low-cut enough to reveal and good amount of cleavage and a peek of her hot-pink bra.
    }
}
{
- SisMood == Hostile:
    “If you keep gawking like that, you'll regret it," she growls.
- SisMood == Neutral:
    “Um, bro? You're kinda staring a little," she says.
- SisMood == Friendly:
    “Lost in thought?” she teases.
- SisMood >= Aroused:
    “Be careful,” she winks. “The last guy who looked at me like that ended up in bed with me.”
}
->->

/*

    Knock on Sister's Door

*/
=== sis_knock ===
You knock on {SIS}'s door.
~ temp invited = true
{
- SisBedroomPeople ? (Sister, SisFriend):
    {
    - SisMood == Hostile:
        ~ invited = false
        "Go away!" {SIS} and {SIS_FRIEND} shout from the other side of the door.
    - SisMood == Desperate:
        "Ooh, it's {PLAYER}!" you hear {SIS_FRIEND} giggle. "Should we invite him in?"
        "No!" {SIS} squeals, "Don't come in!"
        At the same time, {SIS_FRIEND} calls out "Come in!"
    - SisMood == Aroused:
        A burst of loud giggles comes from the other side of the door, followed by {SIS} calling, "Come in!"
    - else:
        "Come in," she calls.
    }
- SisBedroomPeople ? Sister:
    {
    - SisMood == Hostile:
        ~ invited = false
        "Go away!" she shouts.
    - SisMood >= Aroused:
        "Come innnn," she calls in a breathy voice.
    - else:
        "Come in," she calls.
    }
- SisBedroomPeople ? SisFriend:
    {
    - SisFriendMood == Hostile:
        ~ invited = false
        "Fuck off, {PLAYER}!" {SIS_FRIEND} shouts through the door.
    - SisFriendMood >= Aroused:
        "Is that you, {PLAYER}?" {SIS_FRIEND} giggles. "Come in!"
    - SisFriendMood:
        "Come in," you hear {SIS_FRIEND} call from the other side of the door.
    }
}
+ {not invited} [Open the door anyway] -> bedroom.sis_bedroom
+ {invited} [Open the door] -> bedroom.sis_bedroom
+ [Leave] -> bedroom
->->

/*

    Describe People in Sister's Room

*/
=== sis_on_the_bed ===
~ temp has_laptop = SisBedroomItems ? Laptop
~ temp device = "her phone"
{
- has_laptop:
    ~ device = "your laptop"
- LIST_COUNT(SisBedroomPeople) > 1:
    ~ device = "their phones"
}
{
- SisBedroomPeople ? (Sister, SisFriend):
    {
    - SisMood == Hostile:
        {SIS} and {SIS_FRIEND} look up from {device} to glare at you.
    - SisMood == Desperate:
        {SIS} and {SIS_FRIEND} quickly sit up as you enter the room. {SIS} looks flushed, and tries to adjust her shirt to make her hard nipples less obvious. {has_laptop: Your laptop sits on the floor, still playing a video of two women having sex. {SIS_FRIEND} winks at you as she closes it.|{SIS_FRIEND} grins at you, clearly delighted by the tension.}
    - SisMood == Aroused:
        {SIS} and {SIS_FRIEND} {has_laptop:quickly close your laptop|look up from their phones} as you enter. "Hey, bro," {SIS} says, "Do you, uh, need something?" {SIS_FRIEND} grins and gives you a wink. "Yeah, anything we could give you a <em>hand</em> with?" They both collapse into giggles again.
    - else:
        {SIS} and {SIS_FRIEND} are lounging on the bed, looking at {device}.
    }
- SisBedroomPeople ? Sister:
    {
    - SisMood == Hostile:
        {SIS} looks up from {device} to glare at you.
    - SisMood == Desperate and SisState == SisSex:
        {SIS} is squirming on the bed. As soon as you close the door, she discards {device}, still playing a video of two women having sex. "Good timing, bro." She beckons you closer. "I could use a hand."
    - SisMood == Desperate:
        {SIS} quickly {has_laptop:closes|drops} {device} as you enter. She looks a bit flushed.
    - SisMood == Aroused:
        {SIS} is lounging on the bed. She looks up from {device} and grins at you.
    - else:
        {SIS} is lounging on the bed, looking at {device}.
    }
- SisBedroomPeople ? SisFriend:
    {
    - SisFriendMood == Hostile:
        {SIS_FRIEND} glares at you.
    - SisFriendMood == Desperate:
        {SIS_FRIEND} licks her lips and gazes at you seductively.
    - SisFriendMood == Aroused:
        {SIS_FRIEND} winks and pats the bed invitingly.
    - else:
        {SIS_FRIEND} looks up from her phone and smiles at you.
    }
- LIST_COUNT(SisBedroomPeople) > 0:
    {lookForRoomPeople(SisBedroomPeople)}
}
->->

/*

    Explore Sister’s Room
    Find diary with sex fantasies about you, vibrator, and sexy panties.

*/
=== explore_sis_room ===
- (explore_sis_bedroom_opts)
* (sis_room_drawer) [Open her bedside table drawer]
    Inside you find batteries, chapsticks, a bottle of lube, and her diary.
+ {sis_room_drawer and not read_sis_diary} [Read her diary]
    -> read_sis_diary ->
+ {read_sis_diary and not sis_diary_entries.diary_threesome} [Read another diary entry]
    -> sis_diary_entries ->
+ {read_sis_diary and sis_diary_entries.diary_threesome} [Re-read a diary entry]
    -> sis_diary_entries ->
* (sis_room_pillow) [Look under her pillow]
    ~ SisFacts += FoundSisVibrator
    You move her pillow and are rewarded by finding a vibrator wrapped in an old t-shirt you recognize as {SIS_FRIEND}'s.
* {sis_room_pillow} [Examine the vibrator]
    It has a pink body with two buttons, and a large round head. When you press the first button, the head begins rumbling loudly. When you press the other button, it cycles through increasing intensities and patterns, eventually getting so loud, you nervously switch it off and put it back under the pillow before someone hears.
* (sis_room_bed) [Look beneath the bed]
    Getting on your hands and knees, you peer under her bed. There are a handful of magazines down there, some socks, and a large black satin drawstring bag.
* (sis_room_bag) {sis_room_bed} [Open the bag]
    ~ SisFacts += FoundSisStrapOn
    You pull the black satin back out from under the bed, and open the drawstring. You're not sure what you expected to find inside, but it certainly wasn't a leather strap-on harness holding a large black dildo. Does she use this with {SIS_FRIEND}? As you put it back, you wonder {SisFacts ? SisMightBeQueer: again} if {SIS} might be a lesbian. 
    ~ SisFacts += SisMightBeQueer
* (sis_room_laundry) [Rummage through her laundry]
    The laundry basket is mostly filled with clothing you've seen {SIS} wearing: skirts, shirts, tights, jeans and hoodies. More interesting is the underwear. You discover that she mostly wears simple cotton panties in a range of colors, and soft bralettes that are either nude or black. However, near the bottom you find what can only be date-night underwear. A pair of lacy black panties entirely unlike her standard underwear.
* (examined_panties) {sis_room_laundry} [Examine the lace panties]
    They're soft, with a floral pattern and just a little pink stitching on the inside. The lace is mostly see-through, except for a tiny black fabric gusset at the bottom. Excitingly, the fabric has a bit of creamy white residue on it. When you take a sniff, you catch the unmistakable scent of pussy.
* { examined_panties and SisBedroomItems ? SisLacePanties } [Take the lace panties]
    ~ move(SisLacePanties, SisBedroomItems, Inventory)
    You quickly shove the panties into your pocket.
* { Inventory ? SisLacePanties and use_sis_panties } [Put the panties back in the laundry basket]
    ~ move(SisLacePanties, Inventory, SisBedroomItems)
    Sheepishly, you return the lace panties to her laundry basket, burying them beneath some other clothes. You pray she won't notice they're covered in your cum.
+ [Leave {SIS_BEDROOM}]
    -> pass_time -> bedroom
- -> explore_sis_bedroom_opts

/*

    Read Sister's Diary
    Sis has a diary revealing her fantasies about you and exploring bisexuality with her best friend.

*/
=== read_sis_diary ===
~ last_girl = Sister
{ SisState < SisQuestions:
    ~ SisState = SisQuestions
}
You flip through her diary, expecting to find what you imagine a typical teenage girl writes about: friend drama, makeup, boys, whatever. Instead you're shocked to find an explicit description of a wet dream.
"…taller than me, wearing a leather jacket and tight jeans. She pushed me against the wall and silenced my protests with a demanding kiss."
+ {SisFacts !? SisMightBeQueer}[She?] Wait, <em>she</em>? Is {SIS} a lesbian? You keep reading, fascinated.
    ~ SisFacts += SisMightBeQueer
    -> sis_diary_entries
+ [Keep reading]
    -> sis_diary_entries
+ [Stop reading]
    You quickly close the diary. It's none of your business what her fantasies are.
    ->->

=== sis_diary_entries
{cycle:
- -> diary_lesbian ->
- -> diary_friend_sex ->
- -> diary_bedshare ->
- -> diary_sleepwalker ->
- -> diary_threesome ->
}
->->

= diary_lesbian
~ SisFacts += SisMightBeQueer
"She pushed me against the wall and silenced my protests with a demanding kiss. I found myself melting against her body as her tongue flirted with mine. She slipped a hand under my shirt, and I felt the heat of her palm against my stomach, sliding down past the waistband of my sleep shorts."
"I squirmed and pawed at her chest, overwhelmed by a confusing mixture of desire and shame. Her fingers moved slowly but insistenly, lower and lower, until they found my slit. I shivered with need, and she did not wait for permission before one nimble digit curled effortlessly inside me."
+ [Keep reading]
+ [Stop reading] ->->
-
"I broke the kiss, gasping for breath, and desperately pulled her shirt up to expose a soft pink bralette, a surprisingly feminine contrast to her masculine frame. I pulled the cup to one side and wrapped my lips around her firm nipple, flicking my tongue against it in time with the motion of her finger inside me. She moaned quietly and rewarded me with another finger."
"As always, I woke up before the dream finished. My heart was pounding and my panties were soaked. As I finished myself off, I had to bite my pillow to keep from moaning so loud {PLAYER} could hear."
->->

= diary_friend_sex
~ SisFacts += SisLikesFriend
"I had <em>another</em> wet dream about {SIS_FRIEND}. If this keeps up, I'm going to start blushing every time she's around. I should tell her, but I'm worried how she'll react."
A different handwriting in the margin reads, "You silly lovely girl, you had nothing to worry about. I'm glad you told me to read this. Now I'm going to quit writing and kiss you."
+ [Keep reading]
+ [Stop reading] ->->
-
"She was spending the night like normal, and we went to bed. But in the middle of the night, I woke up because she was moving and murmuring something. She lay on her back, clearly still asleep, although one hand was down her shorts and the other was squeezing her tits. I leaned close, holding my ear to her lips so I could understand what she was saying."
"'{SIS},' she gasped, 'I need you.' I sat up in surprise, and watched as she squirmed and breathed my name over and over. I couldn't believe I was watching my best friend masturbate while dreaming of me. It didn't take long before I started squirming a bit, too. 'Please,' she begged, 'touch me, kiss me!'"
+ [Keep reading]
+ [Stop reading] ->->
-
"You know how dream logic is. I didn't stop to think if this was a good idea, or if I was taking advantage of her. I just kissed her. She moaned as I sucked on her bottom lip and kissed down her neck. I was so turned on, all I could think of was kissing every part of her body. I pushed up her shirt and licked circles around her nipples until she was gasping, then I kissed down to her hips."
"She gasped as I slid her shorts off and spread her thighs, allowing me to see the two fingers she had buried deep in her pussy. I pulled them out and eagerly licked up the cream that coated them before going to the source. Her lips parted for me and her taste filled my mouth. I sucked and kissed and licked until her body stiffed under me and she screamed loud enough to wake me from my dream."
"When I was done, I was so wet I had to take a shower before I could go to school."
->->

= diary_bedshare
~ SisFacts += SisLikesYou
"Well, this was a new one. I had a dream about {PLAYER}. I've never really thought about him like that. I guess technically we're only stepsiblings, but it feels so wrong to admit that ever since I can't help but wonder what it would be like…"
"In the dream, we had guests visiting. Some aunt or other. It wasn't clear, except that they needed my room, so Mom said I had to share a bed with {PLAYER}. I was annoyed, but didn't really question it. When it was time for bed, we decided we both had to sleep naked, because it was so hot in his room. I remember lying down and realizing how small his bed was. Even lying on our sides, like we were spooning, he was still pressed up against my back. His skin was so hot, and it wasn't long before I felt his erection against my butt."
+ [Keep reading]
+ [Stop reading] ->->
-
"I tried to sleep. I tried to ignore him. But every few seconds, he would move a little, and his dick would rub against me. I found myself becoming incredibly aroused, but I didn't want him to know. I squeezed my thighs together, feeling my lips were already puffy and slick. Then he threw his arm over me, cupping my breast with his hand."
"I never thought he was trying to take advantage of the situation. I was so afraid he would feel how hard my nipple was under his palm. I found myself squirming every time he moved, pushing my ass back against him. He never responded like he was aware that anything was happening, which just left me even more worked up. Somehow, his cock slipped between my thighs."
+ [Keep reading]
+ [Stop reading] ->->
-
"I was utterly lost by this point. His dick was so hard, throbbing between my legs, pressing against my lips. I started rocking my hips, rubbing along the length of him, until his shaft was slippery with my wetness. How could he not be aware of how desperate I was? Perhaps unconciously, he squeezed my breast, the pressure on my nipple sending shivers down my spine."
"I couldn't handle it anymore. As slowly as I could, I slid my hips forward, moving down the length of him until he was pressing against my opening. My heart was pounding and I bit my lip to keep from moaning as I very, very carefully rocked back, impaling myself on him. My insides clenched around his shaft and…"
"I woke up confused and desperate. If he had been there, I would have jumped him without thinking about it. Instead, I took my dildo in the shower, stuck it to the wall, and fucked myself from behind."
->->

= diary_sleepwalker
~ SisFacts += SisLikesYou
"Another dream about {PLAYER}. Maybe… No. But it's affecting things. The other day I left the bathroom after taking a shower, and he was standing outside, waiting his turn. I wondered if he'd heard me moaning through the door. Part of me hoped he did."
"Anyway, the dream was kinda funny. I was on the phone with {SIS_FRIEND} when {PLAYER} came into my room without knocking. He was just wearing boxers, and I could clearly see that he was hard. 'OMG, {SIS_FRIEND},' I squealed, '{PLAYER} just came in here with a fucking hard-on!'"
+ [Keep reading]
+ [Stop reading] ->->
-
"'Shut up,' she laughed. 'What are you gonna do?'"
"'I can't do anything,' I giggled, 'because he's sleepwalking. You know you can't wake up a sleepwalker. Oh, he's climbing on the bed and pulling his cock out!'"
"'Well, you'd better suck him off before he wakes up,' she teased."
+ [Keep reading]
+ [Stop reading] ->->
-
"I didn't hesitate at all. It seemed obvious this was just what you have to do to help a sleepwalker with a boner. I rolled onto my stomach and wrapped my lips around his head. He groaned and started pushing into my mouth."
"With every thrust, I became more turned on by the situation. He kept growing longer and longer, until he was sliding down my throat. I moaned as he fucked my mouth faster and harder. I was lying on my hand, pressing on my clit, as I felt him start to cum."
"I woke up and had to rub one out while sucking on my fingers, imagining it was {PLAYER}'s cock."
->->

= diary_threesome
~ SisFacts += SisLikesFriend
~ SisFacts += SisLikesYou
"Okay, my dreams are definitely going to get me in trouble one of these days. Last night I dreamed that {SIS_FRIEND} and {PLAYER} fucked me together."
"There was no background or reason for it. It was just happening. We were all in my my bed, naked and rolling around together. {PLAYER} was kissing {SIS_FRIEND} while I sucked on her tits. Then she was kissing me while {PLAYER} fingered her. She sat on his face while I sucked his cock. We moved together easily, languidly, drifting from position to position."
+ [Keep reading]
+ [Stop reading] ->->
-
"But the part of the dream that has stuck with me, the part I can't stop thinking about at odd moments, the part that distracts me in class… Oh my god, I'm getting flushed just thinking about it now."
"I was sandwiched between the two of them. {SIS_FRIEND} was lying on her back, and I was on top of her. She was wearing an enormous black strap-on, and I was slowly easing myself onto it. {PLAYER} was behind me, hands on my hips, encouraging me. His cock was inside {SIS_FRIEND}, but I knew where he wanted to go, as soon as I took the full length of {SIS_FRIEND}'s girlcock."
+ [Keep reading]
+ [Stop reading] ->->
-
"Sure enough, no sooner had I settled my thighs against her hips, gasping at the girth of the dildo spreading me open, I felt {PLAYER} positioning himself at my back door. Because it was a dream, there was no pain, no need to relax or go slow. He just slipped inside."
"I moaned and rocked back, taking them both as deep as I could. I felt incredible. They were filling me up. My insides seemed to ripple and clench and squeeze around them. I could feel every inch of them in me. And then they started moving. Slowly at first, and then with increasing urgency."
+ [Keep reading]
+ [Stop reading] ->->
-
"All the slow, languid, gentle lovemaking from earlier in the dream was gone. What we did now was animalistic. I felt claimed. {SIS_FRIEND} bit my lip and pinched my nipples, hard. {PLAYER} snarled in my ear, digging his fingers in my hip and fucking me like a beast from behind. They alternated thrusts, and all I could do was moan and cry and cum over and over around their relentless cocks."
"I woke up straddling my pillow, grinding and drooling. I didn't hesitate, reaching around from behind and pushing a finger deep in my ass, fucking myself to another orgasm. I had to wash all my sheets and the pillow."
->->

/*

    Retrieve Laptop from Sister
    If you take your laptop back while she's not in the room, you can discover her porn history.

*/
=== retrieve_laptop_from_sis ===
~ move(Laptop, SisBedroomItems, BedroomItems)
You pick up your laptop, brushing your finger across the trackpad. The screensaver turns off and you're surprised to see the browser open to an adult site. {SIS} must have been using your laptop to watch porn!
+ [Close the browser]
    You quickly close the browser. It's none of your business what porn she likes.
+ [Look at her history]
    ~ SisFacts += SisMightBeQueer
    ~ SisFacts += SawSisPorn
    { SisState < SisQuestions:
        ~ SisState = SisQuestions
    }
    You quickly skim through her watch history, and are surprised to find it's mostly girl-on-girl videos. The only videos with guys are threesomes with two girls and a guy. Is {SIS} a lesbian? Maybe she's just curious? You suddenly wonder just how close she and her friend {SIS_FRIEND} really are.
- ->->

/*

    Jerk Off with Sister’s Panties
    After finding a pair of her panties, you jerk off with them.

*/
=== use_sis_panties ===
~ last_girl = Sister
~ cum_today = true
~ Score += sisPanties
Heart pounding, you lift her panties to your face and take a deep breath. The scent of her pussy fills your nostrils, immediately flooding your body with lust. Urgently, you free your cock, squeezing it with one hand while holding her underwear against your nose with the other. It's not long until you are painfully erect, throbbing and twitching with need.
+ [Wrap them around your shaft]
-
Instinctively, you wrap her panties around your erection. The lace teases and stimulates as it brushes against the rim of your head. You start stroking, allowing the unfamiliar texture to caress the length of your shaft. The knowledge that what you're doing is wrong lends the moment a powerful intensity. Your cock throbs in your grip and you pump harder, faster, increasing the stimulation. A wet spot appears as some of your precum soaks through the fabric.
+ [Imagine her putting on cum-soaked panties]
-
The head of your cock strains against the gusset as you imagine her putting them on after you finish. The confusion on her face as your hot cum meets her sensitive skin. You picture her reaching down, dipping a finger into the cream and frowning as she inspects it. The surprise as she realizes what it is giving way to desire as she licks her finger clean. Her nipples instantly harden and she gasps, shoving a hand between her legs to desperately rub your spunk between her lips.
+ [Cum]
-
The image takes you over the finish line and your thick white cum spurts again and again into her panties. You reluctantly unwrap them when the stimulation becomes overwhelming. The black lace fabric is a complete mess, smeared with a shocking amount of cum. You do your best to wipe it all up with a tissue, but it's hopeless. You make a note to hide them under some other clothes when you return them to her laundry basket. Maybe you'll get lucky and she won't notice.
->->

/*

    Peep on Sister in the Shower
    SisShowerPeep
        + SawSisNaked
        + SisCaughtYouPeeking
        + SisLikesYou
        Increasingly risky behavior to jerk off while she's in the shower
        a. spy on her masturbating in shower using the shower head -> SisShowerPeep
        b. If caught -> SisShowerSex

*/
TODO add interactive shower peep scene
=== peep_sis_shower ===
~ last_girl = Sister
~ SisFacts += SawSisNaked
{ SisState < SisQuestions:
    ~ SisState = SisQuestions
}
~ SisWearing = ()
You peep on your stepsister in the shower.
+ [Leave the {BATHROOM}]
    ~ sis_reset()
    -> pass_time -> bedroom

/*

    Sister Sex
    SisSex -> Arousal++
        Hostile: see each other naked, get interrupted (+SawSisNaked)
        Neutral: masturbate together, no touch, cum in your hand (+SisMasturbate)
        Friendly: touch breast, suck nipple, finger, handjob, cum in her hand (+SisHandjob)
        Aroused: oral and blowjob, cum in mouth, on face, or tits (+SisBlowjob)
        Desperate: let's fuck (don't cum inside me), cum inside or on bush (+SisSex)
        Repeat: You can fuck her ass

*/
TODO write the sex scene, pass time after cumming
=== sis_sex ===
{ sis_sex == 1:
    ~ Score += sisSex
    ~ improveConfidence()
    ~ SisBaseMood = Aroused
}
~ SisState = SisSex
~ cum_today = true
This is it, you're finally going to fuck {SIS}.
- (sis_sex_opts)
+ {newToday(-> suck_tits)}
    “I want to suck on your tits.”
    -> suck_tits ->
+ {newToday(-> finger)}
    “I want to finger you.”
    -> finger ->
+ {newToday(-> eat_pussy) and SisMood >= Aroused}
    “I want to go down on you.”
    -> eat_pussy ->
+ {newToday(-> titjob)}
    “I want to fuck your titties.”
    -> titjob ->
+ {newToday(-> blowjob)}
    “I want you to go down me.”
    -> blowjob ->
+ {newToday(-> pussy) and SisMood >= Aroused}
    “I want to fuck you.”
    -> pussy ->
+ {newToday(-> anal) and SisMood == Desperate}
    “I want to fuck your ass.”
    -> anal ->
+ {titjob}
    “I want to cum on your tits.”
    -> cum_tits ->->
+ {titjob or blowjob}
    “I want to cum on your face.”
    -> cum_facial ->->
+ {blowjob}
    “I want to cum in your mouth.”
    -> cum_mouth ->->
+ {pussy}
    “I want to cum inside you.”
    -> cum_creampie ->->
+ {anal}
    “I want to cum in your ass.”
    -> cum_anal ->->
- -> sis_sex_opts

= you_masturbate
~ improveMood(SisMood)
~ cum_today = true
She watches as you rub one out
->->

= she_masturbates
~ improveMood(SisMood)
You watch her rub one out
->->

= suck_tits
~ improveMood(SisMood)
You pinch her nipples, making her squirm
->->

= finger
~ improveMood(SisMood)
You push two fingers into her dripping pussy
->->

= eat_pussy
~ improveMood(SisMood)
You lift her skirt and bury your tongue in her pussy
->->

= titjob
~ improveMood(SisMood)
She squeezes her tits around your cock
->->

= blowjob
~ improveMood(SisMood)
She swallows your shaft eagerly.
->->

= pussy
~ improveMood(SisMood)
You bend her over and fuck her desperately from behind
->->

= anal
You ease your cock into her ass
->->

= cum_tits
~ SisCum = Tits
You shoot your load on her tits
+ [Catch your breath] -> aftercare
->->

= cum_facial
~ SisCum = Facial
You shoot your load on her face
+ [Catch your breath] -> aftercare
->->

= cum_mouth
~ SisCum = Mouth
You cum in her hungry mouth
+ [Catch your breath] -> aftercare
->->

= cum_creampie
~ SisCum = Creampie
You shove your cock into her dripping cunt and pump her full of cream.
+ [Catch your breath] -> aftercare
->->

= cum_anal
~ SisCum = Anal
she moans as you pump your load into her tight ass.
+ [Catch your breath] -> aftercare
->->

= aftercare
“Holy shit,” you murmur, gasping for breath, “that was incredible.”
“I have to clean up.”
~ sis_reset()
->->

/*

    Sister Sex (Shower)
    If she catches you peeping, Were you watching me get off? Did you jerk off too?
    SisShowerSex -> Arousal++
        Hostile: She gets out to confront you, makes you show her yours (+SawSisNaked)
        Neutral: She lets you jerk off in shower, no touch, cum on her thigh (+SisMasturbate)
        Friendly: She lets you get behind her, grope, finger, handjob, rub cock between cheeks, cum on back (+SisHandjob)
        Aroused: She asks you to eat her, gives bj, cum in mouth or on face or tits (+SisBlowjob)
        Desperate: She braces on wall, you fuck from behind, cum inside or on asshole (+SisSex)
        Repeat: You can fuck her ass

*/
TODO write the shower sex scene, pass time after cumming
=== sis_sex_shower ===
{ sis_sex_shower == 1:
    ~ improveConfidence()
    ~ SisBaseMood = Aroused
}
~ SisState = SisSex
~ cum_today = true
This is it, you're finally going to fuck {SIS}.
- (sis_sex_shower_opts)
+ [Touch yourself]
    You start wanking to the sight of your stepsister.
+ [Turn away] ->->
- -> sis_sex_shower_opts

/*

    Sister Dreams

*/
=== dream_of_sis ===
You have {dream_of_cheerleader > 1:another|a} filthy dream about {SIS}. <>
{ shuffle:
- You sneak into the bathroom while she showers. She's unaware of your presence, as you quickly strip off your clothes and slip into the shower as quietly as you can. Your cock is hard and twitching. She squeals in surprise as you grab her by the hips and bury yourself in her dripping pussy with one thrust. She starts rubbing her clit as you roughly fuck her from behind
- You feel your blanket lift as she climbs into your bed and presses her body against your back. You're both naked, and her skin is burning hot against yours. Her stiff nipples press into your back as her hand closes around your erection. You roll onto your back and she moves to straddle you, until your cock is throbbing inside her tight pussy. She moans and starts rocking, squeezing her tits
- The two of you are watching a movie. She keeps nodding off, and eventually lays her head in your lap. Your cock seems to have a mind of its own as it stiffens and slips out of your shorts to bob in front of her face. When she yawns, it pops into her mouth. She makes a surprised sound and closes her lips around you. Is she still asleep? You can't tell and don't care, as you start pushing deeper. She moans around you
- She and {SIS_FRIEND} are naked and squirming with you. They both lower their heads to your cock. You can't tell whose mouth is whose, but as soon as you're hard, {SIS_FRIEND} moves {SIS} to sit on top of you, guiding your cock into the heat of your stepsister's pussy. {SIS_FRIEND} swings her leg to straddle your face, and you bury your tongue in her cunt as she starts kissing {SIS}. The three of you move as one
- The two of you are in the back seat of the family car. Your parents are talking in the front and paying no attention as {SIS} snuggles closer to you under a blanket. Her hand is in your lap, rubbing your cock through your shorts. She squirms and tries not to make a sound as you squeeze her tits through her top. Finally, she pulls the blanket over her head and leans down to take your cock in her mouth. You're biting your lip as she sucks you deeper
}
<>{isDayWeekend(tomorrow()):, but just as you're about to cum, she pulls away, crying "We shouldn't be doing this!"|, when the noise of your alarm rudely shatters the dream.}
->->

/*

    Sister Hints

*/
=== sis_hints ===
{
- SisState == SisTruthOrDare:
    Try playing truth or dare with her.
- SisFacts ? ReadSisDiary:
    Try talking to {SIS} about the fantasies you read in her diary.
- SisFacts ? SawSisPorn:
    Try talking to {SIS} about the porn she watched on your laptop.
- SisState == SisQuestions:
    Try asking her some personal questions.
- else:
    Try snooping around in her room, or peep on her in the shower.
}
->->

/*

    Observe Sister
    This standard knot is required, but will never be called.

*/
=== observe_sis ===
~ last_girl = Sister
~ SisState = SisObserved
You live together. You have observed her plenty.
->->

/*

    Reset Sister Clothes and Cum State
    Run this whenever she changes rooms.

*/
=== function sis_reset() ===
{
- SisWearing == ():
    ~ SisWearing = (SisPanties, SisBra, SisShorts, SisShirt)
    She gets dressed.
- SisCum != ():
    ~ SisCum = ()
    She cleans up the cum.
}

/*

    Check if your Sister is home

*/
=== function sis_is_home()
{
- SisBedroomPeople ? Sister or BathroomPeople ? Sister:
    ~ return true
- else:
    ~ return false
}

/*

    Did Sister Steal Your Laptop?
    This function runs every morning, and has a 25% chance that she took your laptop.

*/
=== function sis_stole_laptop()
{ BedroomItems ? Laptop and chance(25):
    ~ move(Laptop, BedroomItems, SisBedroomItems)
    ~ SisFacts += SisSawYourPorn
}
