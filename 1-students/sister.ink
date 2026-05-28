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

    SisObserved (Neutral)
    0. Peep in the shower
    0. Read her diary
    0. Saw her porn
    0. Caught fapping
    0. Saw your porn
    -> SisQuestions

    SisQuestion (Friendly)
    1. Ask personal questions
    -> SisTruthOrDare
    
    SisTruthOrDare (Aroused)
    2. Truth: more personal questions
    2. Dare: escalating sexuality
    -> SisSex
    
    SisSex
    3. Have sex again

*/
CONST SIS = "Heather"
CONST SIS_TITLE = "your stepsister"
LIST SisState = (SisObserved), SisQuestions, SisTruthOrDare, SisSex
LIST SisFacts = ReadSisDiary, SawSisPorn, SisMightBeQueer, SisLikesFriend, SisLikesYou, SisIsBi, SawSisNaked, SisSawYourPorn, SisSawYouFapping, SisCaughtYouPeeking, SisIsInterested, FoundSisVibrator, FoundSisStrapOn
LIST SisClothes = SisPanties, SisBra, SisShorts, SisShirt
LIST SisItems = SisLacePanties, SisDiary, SisVibrator, SisStrapOn, SisVideo

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
+ {DEBUG} [Start Questions #DEBUG]
    -> sis_questions ->
+ {DEBUG} [Start Truth or Dare #DEBUG]
    -> sis_truth_or_dare ->
+ {DEBUG} [Questions #DEBUG]
    -> sis_questions_debug ->
+ {DEBUG} [Dares #DEBUG]
    -> sis_truth_or_dare_debug ->
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

{SIS} opens your door without knocking. "Hey bro, can I ask about something kinda personal?"

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

=== sis_questions_debug ===
~ last_girl = Sister
~ improveMoodTo(SisMood, Friendly)
"Let me ask you a question."
- (top)
-> questions_for_sis ->
+ "Ask your question."
-
-> questions_from_sis ->
+ "Another question for you."
    -> top
+ [Done]
-
->->

/*

    Ask Sister Questions
    After 3 questions, she escalates to truth or dare

*/
=== sis_questions ===
~ last_girl = Sister
{ SisMood < Friendly:
    ~ improveMood(SisMood)
    ~ improveBaseMood(SisBaseMood)
}
"Can I ask you {kind of a|another} personal question?"
{"Interesting!" She sits up and regards you with a raised eyebrow. "Okay. You can ask me anything you want. <em>Anything</em>," she emphasizes. "But, every time you ask me a question, I get to ask you one in return. Deal?"|"Make it a good one," she grins.}
+ {sis_questions == 1} "Deal," you nod.
    "Okay,” she grins. “What's your first question?"
+ ->
- (top)
-> questions_for_sis ->
{ came_from(-> questions_for_sis.no_question):
    "{~That's a shame}," she winks, "but I'm still asking my question."
}
+ "What's your {top > 1: next} question?"
-
-> questions_from_sis ->
+ "Can I ask another question?"
    { SisQuestionCount >= 3:
        -> make_this_more_interesting ->->
    - else:
        "{Of course|Please do|Sure, this is fun}."
    }
    -> top
+ "I'm done for now."
    "{~That's a shame|Too bad|Your loss}," she winks.
    ->->
-
->->

= make_this_more_interesting
~ SisState = SisTruthOrDare
{ SisMood < Aroused:
    ~ improveMood(SisMood)
    ~ improveBaseMood(SisBaseMood)
}
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
        * * * "Truth or Dare?" -> sis_truth_or_dare.top ->->
+ "I'm game if you are[."]," you grin.
    "Okay. You start."
    * * "Truth or Dare?" -> sis_truth_or_dare.top ->->
-
->->

=== sis_truth_or_dare_debug ===
~ last_girl = Sister
~ improveMoodTo(SisMood, Aroused)
"Here's a dare for you, sis"
- (top)
-> dares_for_sis ->
+ "What's your dare for me?"
-
-> dares_from_sis ->
+ "Another dare for you."
    -> top
+ [Done]
-
->->

/*

    Sister Truth or Dare
    Every time she chooses truth, we shift the odds towards dare.
    She'll never choose truth more than 7 times (ten total questions).
    After that, she'll always choose dare, regardless of what the player picks.

*/
=== sis_truth_or_dare ===
~ last_girl = Sister
{ SisMood < Aroused:
    ~ improveMood(SisMood)
    ~ improveBaseMood(SisBaseMood)
}
"Wanna play truth or dare?"
"{~I thought you'd never ask|My favorite|This'll be fun}," she grins. "You go first."
+ "Truth or dare?"
- (top)
{ Score !? sisTruthOrDare:
    ~ Score += sisTruthOrDare
}
~ temp odds = 100 - SisQuestionCount * 10
#DEBUG Odds of picking Truth: {odds}%
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
    "{~That's a shame|Too bad|Your loss}," she winks, "but I'm still taking my turn. Truth or dare?"
- else:
    "…My turn!" she grins. "Truth or dare?"
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
    We show five choices at a time (in order)
    She'll stop choosing "truth" after 10 questions (including the first 3)

*/
=== questions_for_sis ===
~ temp max = 5
~ SisQuestionCount++

* {SisFacts ? SisMightBeQueer and CHOICE_COUNT() < max}
    [“Are you a lesbian?”] -> q_sis_lesbian ->
* {SisFacts ? SisIsBi and SisFacts ? SisLikesFriend and CHOICE_COUNT() < max}
    [“Are you into {SIS_FRIEND}?”] -> q_sis_likes_friend ->
* { CHOICE_COUNT() < max }
    [“How often do you masturbate?”] -> q_sis_masturbate ->
* { SisState == SisTruthOrDare and q_sis_masturbate and CHOICE_COUNT() < max }
    [“Ever thought about me while getting off?”] -> q_sis_fantasy_you ->
* {SisState == SisTruthOrDare and SisFacts ? SisLikesYou and CHOICE_COUNT() < max}
    [“Are you into me?”] -> q_sis_likes_you ->
* { SisFacts !? SawSisNaked && CHOICE_COUNT() < max }
    [“Do you shave?”] -> q_sis_shaved ->
* { CHOICE_COUNT() < max }
    [“What’s your bra size?”] -> q_sis_bra_size ->
* { CHOICE_COUNT() < max }
    [“What’s your body count?”] -> q_sis_body_count ->
* { CHOICE_COUNT() < max }
    [“Spit or swallow?”] -> q_sis_spit_or_swallow ->
* { CHOICE_COUNT() < max }
    [“Are there nudes on your phone?”] -> q_sis_nudes ->
* { CHOICE_COUNT() < max }
    [“Have you tasted pussy?”] -> q_sis_taste_pussy ->
* { CHOICE_COUNT() < max }
    [“What’s your filthiest fantasy?”] -> q_sis_fantasy ->
* { CHOICE_COUNT() < max }
    [“Are you wet right now?”] -> q_sis_wet ->
* { CHOICE_COUNT() < max }
    [“Have you had a threesome?”] -> q_sis_threesome ->
* { CHOICE_COUNT() < max }
    [“Have you had anal sex?”] -> q_sis_anal ->
* { CHOICE_COUNT() < max }
    [“Have you had an orgasm in public?”] -> q_sis_public_orgasm ->
* { CHOICE_COUNT() < max }
    [“Do you like spanking?”] -> q_sis_spanking ->
+ (no_question) { CHOICE_COUNT() < max }
    “I can't think of a question.”
-
->->

= q_sis_shaved
“Do you shave?”
“I do,” she nods. “I prefer the way it feels.”
->->

= q_sis_bra_size
~ BraSizes += (Sister)
“What’s your bra size?”
“Ugh, boring! Why are boys so obsessed with bra sizes?” She rolls her eyes at you. “34C.”
->->

= q_sis_body_count
~ SisFacts += SisMightBeQueer
“What’s your body count?”
“Hmm.” She thinks for a moment. “Depends on how you count it. Seven, I’d say.”
“What do you mean by ‘how you count it’?” you ask, confused.
She grins and wags a finger at you. “One question at a time, bro.”
->->

= q_sis_masturbate
“How often do you masturbate?”
“It depends,” she shrugs. “Sometimes it’s every night. Other times I might go a week or two without.”
->->

= q_sis_spit_or_swallow
“Do you spit or swallow?”
“Neither, if I can avoid it,” she says, scrunching up her nose. “Spunk tastes gross. I prefer to let a guy cum somewhere else.”
->->

= q_sis_nudes
“Are there nudes on your phone?”
“Yes, there are,” she grins.
* “Really?”
    “Really,” she nods. “Why, do you want to see them?”
    * * “Yes!”
    * * “No.”
        “Liar,” she laughs.
        “You got me,” you grin. “I want to see them.”
* “Let me see?”[] you ask, hopefully.
* “You’re lying[.”],” you say, hoping to bait her into proving it.
    “I’m not,” she laughs.
    “Prove it!”
-
{ SisState >= SisTruthOrDare:
    “Mmm, that sounds more like a dare, bro.”
- else:
    “Mmm, not now. Maybe later, if you behave.”
}
->->

= q_sis_taste_pussy
~ SisFacts += SisMightBeQueer
“Have you ever tasted pussy?”
“Mine, or someone else’s?”
* “Yours.”
* “Someone else.”
* “Either.”
-
“Yes.” she grins.
* “Did you like it?”
-
“Technically that’s a different question,” she winks, “but yes, I like it.”
->->

= q_sis_fantasy_you
~ SisFacts += SisLikesYou
“Have you ever thought about me while getting off?”
“Oh!” she hesitates. “Um…”
* “Tell the truth[.”],” you grin.
-
“Yes,” she answers quietly, blushing furiously.
* “Say more[.”],” you beg. “Please. You can’t stop there.”
* “And?”[] you ask. “You can’t just say yes!”
* “Nice[.”],” you grin. “Care to elaborate?”
-
{ SisMood >= Aroused:
    “Well,” she laughs, “Let’s see. I think about you touching me. How your hands feel on my body. I think about the look of hunger in your eyes as I undress for you. I imagine you pushing me down on the bed, and how hard you feel as you lower yourself between my legs…” She trails off and looks away, nervously tucking her hair behind her ear. “You know, that sort of thing.”
- else:
    “Hmm.” She bites her lip. “Maybe later. For now, you’ll just have to use your imagination.”
}
->->

= q_sis_anal
“Have you ever had anal sex?”
“Yeah, it was fine,” she shrugs.
* “You didn’t like it?”
* “Not your thing?”
-
“I didn’t say that. It’s just that they were <em>way</em> more excited about it than I was.” She looks thoughtful. “I didn’t really get the appeal until I was getting getting it in the front and back at the same time.” She shivers and bites her lip at the thought. “It was something else.”
Before you can start to ask for more details, she grins at you. “But that…”
“…is another question,” you finish for her.
->->

= q_sis_lesbian
~ SisFacts += SisIsBi
“Are you a lesbian?”
“Ooh, insightful!” she laughs. “Someone’s been paying attention. It’s true that I mostly prefer women, but no, I like guys, too. I’m bisexual.”
->->

= q_sis_threesome
“Have you had a threesome?”
“Only once,” she confesses. “And before you ask, it was two guys. It was fun, but a bit too intense.”
* “What do you mean?”
* “Is intense bad?”
-
“You know what guys are like,” she shrugs. “It was a lot. That said, I’d love to try again, with the right two people.”
->->

= q_sis_wet
“Are you wet right now?”
“Wouldn’t you like to know,” she laughs.
* “You have to answer[.”],” you remind her.
    “I suppose that is the game,” she grins. “Fine. If I’m being honest, 
* “Please?”[] you plead.
    “Well, since you asked so nicely,” she grins, “the answer is,
* “Want me to check?”[] you ask, raising one eybrow.
    “Save it for the dares,” she grins. “But, to answer your question, 
-
{ SisMood >= Aroused:
    <> yeah, I'm feeling pretty wet and tingly right now.”
}
    <> no, not yet, but I’m having a good time. Keep this up, and it won’t be long.”
->->

= q_sis_likes_friend
“Are you into {SIS_FRIEND}?”
“Oh, I get it,” she laughs. “You know she sleeps over all the time, and now that you know I’m bi, you wonder if we’re in here scissoring all night long?”
* “Something like that[.”],” you admit with a grin.
* “Yes, exactly.”
-
“Well, it’s not all topless pillow fights, but yeah,” she admits, “I’m into her, and we fool around sometimes.”
->->

= q_sis_likes_you
“Are you into me?”
“Well, if that isn't the million-dollar question,” she grins. “Pretty risky for me to answer that, don’t you think? Might change everything about our relationship.”
* “How so?”
    “What if we feel differently?” she ponders. “What if I say ‘no’ and you say ‘yes’? Or the other way around?”
    * * “What if we both say ‘yes’?”
    - -
    “That’s a big change, too.” She hesitates, biting her thumb.
* “Would that be so bad?”
    “Maybe not,” she admits, biting her lip.
* “Quit stalling[.”],” you tease.
    “Don’t pressure me, or I’ll just say ‘no,’” she laughs.
-
* “I can wait all night.”
* “The suspense is killing me.”
-
“Alright, fuck it.” She looks you in the eye. “Yes, I’m into you. There. No going back now.”
->->

= q_sis_fantasy
“What’s your filthiest fantasy?”
“Good question,” she grins. “Let’s see. The filthiest? Probably the one where <>
{
- q_sis_likes_friend and q_sis_likes_you:
    I’m straddling {SIS_FRIEND} while she’s wearing this enormous strap-on. I had to slowly ease myself onto it. And just when I finally fit it all inside me, you start fucking my ass from behind. It starts out slow, and gradually builds in intensity until I’m cumming all over your cocks.”
- q_sis_likes_you:
    I’m riding someone with a big, thick cock. I had to slowly ease myself onto it. And just when I finally fit it all inside me, you start fucking my ass from behind. It starts out slow, and gradually builds in intensity until I’m cumming all over your cocks.”
- else:
    I’m the stuffing in a sandwich between two people, and they’re fucking me at the same time. It starts out slow, and gradually builds in intensity until I’m cumming all over their cocks.”
}
->->

= q_sis_public_orgasm
“Have you had an orgasm in public?”
“Yes, three times,” she grins. “Once in a movie theater, while a date put their hand up my dress and fingered me. Another time in the backseat of a car. I was making out with someone, and the vibration of the car was just right. I was so afraid everyone in the car could tell.”
* “And the third time?”
- 
“In a dressing room at {BRA_STORE} with {q_sis_likes_friend: {SIS_FRIEND}|a girl a like}. She took all my clothes off, pushed me up against the wall, dropped to her knees and licked my clit until I came on her face.” She trails off for a moment. “It was really hot.”
->->

= q_sis_spanking
“Do you like spanking?”
“Not my thing,” she shakes her head. “No shame if you’re into it, though.”
* “No comment.”
-
->->


/*

    Questions from Sis
    Should escalate fairly quickly, because after the first 3, player can choose dare
    She always asks these in order, first 3 during questions scene, the rest during truth or dare,
    and after the final question, the player can no longer choose truth.

*/
=== questions_from_sis ===
{
// These questions are in response to your question
- seenVeryRecently(->questions_for_sis.q_sis_lesbian) and not q_you_gay:
    -> q_you_gay ->
- seenVeryRecently(->questions_for_sis.q_sis_likes_friend) and not q_you_like_friend:
    -> q_you_like_friend ->
- seenVeryRecently(->questions_for_sis.q_sis_fantasy_you) and not q_you_fantasy_sis:
    -> q_you_fantasy_sis ->
- seenVeryRecently(->questions_for_sis.q_sis_likes_you) and not q_you_like_sis:
    -> q_you_like_sis ->
- seenVeryRecently(->questions_for_sis.q_sis_nudes) and not q_you_dick_pick:
    -> q_you_dick_pick ->
- seenVeryRecently(->questions_for_sis.q_sis_taste_pussy) and not q_you_taste_cum:
    -> q_you_taste_cum ->
- seenVeryRecently(->questions_for_sis.q_sis_wet) and outfit != Nude and not q_you_hard_now:
    -> q_you_hard_now ->

// Questions she has about you
- SisFacts ? SisSawYouFapping and not q_sis_saw_you_fapping:
    -> q_sis_saw_you_fapping ->
- SisFacts ? SisCaughtYouPeeking and not q_sis_saw_you_peeping:
    -> q_sis_saw_you_peeping ->

// These are ungated questions
- else:
    { stopping:
    - -> q_you_wild_cum ->
    - -> q_you_wrong_name ->
    - -> q_you_inapproprate_crush ->
    - -> q_you_zero_consequences ->
    - -> q_you_threesome ->
    - -> q_final_question ->
    }
}
->->

= q_sis_saw_your_porn
“So, when I borrowed your laptop, I kinda saw your browser history. Like, your porn history? And, um, I saw that a lot of it was stepsister porn.”
“That’s not a question,” you reply, cautiously.
“I was just wondering if that’s what you’re into.”
* “Yeah[.”],” you admit with a shrug. “But it’s just fantasy, you know?”
* “Sometimes[.”],” you admit. “It’s taboo, so it’s kind of exciting, you know?”
* “No!”[] you protest. “It’s just like, all they make anymore. You can’t avoid it!”
-
“Look, it’s only natural to be curious,” she explains. “We’re two young, attractive people sharing the same space, and it’s not like we’re actually related.”
* “Curious about what?”
* “You think I’m attractive?”
* “What are you trying to say?”
-
“All I'm saying is that I’m happy to talk if you ever have any questions. You can always knock on my door.”
* “Okay.”
    “Okay,” she repeats.
* “Are <em>you</em> curious?”
    “A bit,” she nods. “Like I said, it’s only natural.”
* “This is weird.”
    “Only if you make it weird,” she frowns.
-
The two of you regard each other. Her cheeks are flushed, but she seems to have said all she intended to say. After a moment, she walks out the door.
->->

= q_sis_saw_you_fapping
“So, um, I saw you jerking off.”
* “Yeah, I know.”
* “I remember.”
-
“No, this was another time,” she says, blushing.
* “What?”
* “When?”
* “How?”
-
“So, one weekend when {SIS_FRIEND} was over, we were sunbathing in the backyard. We were in bikinis, and when I rolled over, I noticed you in the window. I had sunglasses on, so I don’t think you knew I could see you. You had this hungry expression in your eyes, staring down at us. You were moving in kind of a funny way, and I realized you must be jerking off.”
* “Oh, shit.”
* “Oh, my god.”
* “This is awkward.”
-
“I’m not mad,” she clarfies. “I know I should have been offended, but I was fascinated. I’d never watched a guy do that before. I watched you, watching us, until suddenly you kinda went stiff, and then you walked away. Ever since then, there’s something I’ve wondered.”
* “What is it?”
-
“Who were you jerking off to?”
“What?”
“Me and {SIS_FRIEND}. We were both there, but I couldn’t tell who you were looking at.”
* “You.”
    “I see.” She nods thoughtfully.
* “{SIS_FRIEND}.”
    “Ah.” She nods, and if you didn’t know better, you’d swear she looks disappointed.
* “Both of you.”
    “Hmm.” She nods thoughtfully.
-
<> “That’s what I thought. Thanks for telling me.” {here == Bedroom: She goes to leave, then hesitates for a moment. “You know, if there’s ever anything you want to talk about, you can always knock on my door.” With that, she turns and leaves.}
->->

= q_sis_saw_you_peeping
“Was that the first time you peeped on me?”
* “Yes.[”] I’ve thought about it before, but that was the first time I worked up the courage to do it.”
* “No.[”] I’ve done it a few times. It was exciting, knowing you might catch me.”
-
{
- SisMood >= Aroused:
    “It was kinda hot, knowing you were getting off to me. I wouldn’t mind if you did it again sometime, maybe cum on me{peep_sis_shower.cum_on_her: again}.”
- SisMood == Friendly:
    “I know I should be upset, but if I’m being honest, it was kinda hot, knowing you were getting off to me. Maybe I would’t mind if you tried again sometime.”
- else:
    “That was pretty weird, bro.”
}
->->

= q_you_gay
“Are you attracted to men?”
* “Yes.”
    “Oh,” she frowns, clearly disappointed “That’s… hmm.”
    “Just joking,” you laugh. “I like women, I just haven’t had much luck with them.”
    “Maybe you’d have more luck with girls if you quit joking around,” she grins.
* “Nope.”
    “Not even a little?” she raises an eyebrow skeptically. “What about Jason Momoa? Idris Elba? Pedro Pascal!?”
    “Not my thing,” you laugh.
    “Weird,” she grins.
-
->->

= q_you_like_friend
“What about you? Are <em>you</em> into {SIS_FRIEND}?”
* “Yeah[.”],” you nod. “She’s hot.”
    “I knew it,” she grins triumphantly.
    “You think she’s into me?”
    “I think you should ask her yourself,” she winks.
    ->->
* “Nah[.”],” you shake your head. “She’s not my type.”
* “I haven’t really thought about it[.”],” you shrug.
-
“Liar!” she teases, swatting your shoulder. “I’ve seen the way you look at her. And she has, too.”
“You think she’s into me?”
“I might have told you if you weren’t such a liar,” she grins triumphantly.
->->

= q_you_fantasy_sis
“What about you? Do <em>you</em> think about <em>me</em> when you're jerking off?”
* “Yes.”
* “Never.”
    “Liar,” she grins.
    “Alright, yes,” you laugh.
-
{ SisMood < Aroused:
“That’s hot.” ->->
}
“Well, go on!” She leans forward. “I told you mine. What do we do in your fantasies?”
* [You touch her body]
    “Well, um, I kinda sneak into your room while you’re sleeping, and I start touching you.”
    “This is a terrible start,” she frowns.
    “But you wake up turned on, and start stroking my cock while I play with your tits.”
    “That’s a little better.”
    “Then I slip a finger inside you, and you start moaning until I cum all over your chest.”
* [She gives you head]
    “You and me are watching a movie in the living room. We’re all alone, and you put your head in my lap.”
    “Hmm, I like where this is going.”
    “My cock gets really hard, and it just kinda slips into your mouth without you really noticing.”
    “Of course,” she grins.
    “And you’re just watching the movie while I'm pushing deeper and deeper until I cum.”
* [You fuck her from behind]
    “I mean, it’s not complicated. I’m fucking you from behind.”
    “Hmm, I like the sound of that.”
    “You’re moaning and pushing back against me. I reach around to squeeze your tits.”
    “I love when a guy does that,” she purrs.
    “Then I bury my cock deep in your pussy and cum so fucking hard for you.”
-
“That’s pretty hot,” she grins.
->->

= q_you_like_sis
“Your turn, now. Are <em>you</em> into <em>me</em>?”
* “No.”
    Her face falls. “You better not be fucking around.”
    “It’s too weird. You’re my sister.”
    “<em>Step</em>sister,” she reminds you. “We’re not related. It’s only weird if you make it weird.”
    * * “Sorry[.”],” you shrug.
        “You should go,” she frowns.
        * * * [Leave {SIS_BEDROOM}]
            -> pass_time -> bedroom
    * * “Alright, fine. I’m into you[.”],” you admit with a grin.
* “A bit.”
    “Just a bit?” she teases. “You have a slight interest in me? A gentle curiosity? A passing fancy?”
    “Alright,” you grin, “maybe a little more than a bit.”
* “Yes[.”],” you grin
-
“Good,” she smiles, with obvious relief. “That’s good.”
->->

= q_you_dick_pick
“Have you ever sent a dick pic?”
“Nope, never.”
“Well, that’s disappointing,” she frowns.
->->

= q_you_taste_cum
“Have you ever tasted jizz?”
“Mine, or someone else’s?”
* “Someone else.”
    “Nope.” ->->
* “Yours.”
* “Either.”
-
“I tasted mine once. I didn’t like it.”
“Yeah,” she laughs, “it’s not great, huh?”
->->

= q_you_hard_now
“Are you hard right now?”
* “Yes[.”],” you gesture at the erection tenting your shorts. “This conversation’s turning me on.”
* “No.”
    “You’re lying!” she swats your hand away from your lap and points at the erection tenting your shorts. “I can <em>see</em> it, bro.”
    “Alright, fine,” you laugh. “This conversation’s turning me on.”
-
“Nice.”
->->

= q_you_wild_cum
“What’s the wildest place you’ve ever cum?”
“In a canoe,” you laugh.
“What? When? Why?”
* [“That family vacation at the lake.”]
    “It was that family vacation we took to the lake, remember? We all stayed in that tiny little cabin, and there was no privacy. After a couple days, I was dying, so I took the canoe out by myself and rubbed one out.”
-
“Why not do it in the shower?”
* [“It would have been too obvious.”]
    “The bathroom was right off the main room, and there was barely any hot water. It would have been really obvious if it was in there too long.”
-
“Still, a canoe?” she grins and shakes her head. “Where’d you cum?”
* [“In the lake.”]
    “Over the side, in the lake.”
-
“That is so much crazier than I was expecting,” she laughs.
->->

= q_you_wrong_name
“Have you ever said the wrong name in bed with someone?”
“Nope,” you shrug.
->->

= q_you_inapproprate_crush
“Have you ever had a crush on someone inappropriate?”
“The secretary at my school.”
“{SECRETARY}? Are you serious?”
“Do you know her or something?”
“Her younger sister goes to my school,” she shrugs. “You’ve got good taste. She’s hot.”
->->

= q_you_zero_consequences
“What would you do if you knew there were zero consequences?”
“Fuck every girl in my school.”
“You answered that fast,” she laughs.
->->

= q_you_threesome
“Have you ever been with two women at the same time?”
“Nope,” you shake your head.
“Would you like to?”
“I mean, sure,” you shrug, “but where am I gonna find two girls to have a threesome with?”
“Maybe closer than you think,” she grins.
->->

= q_final_question
“Do you want to fuck me?”
+ “Yes.”
    “Nice.” She bites her lip.
+ “No.”
    “Liar,” she grins.
-
->->

/*

    Dares for Sis
    At least 15, prereqs okay
    
    o striptease
    o lap dance
    o suck on my thumb like you would suck a cock
    o show me your nudes (after asking)
    o 

    o get undressed
    o 
    o watch porn with me
    o
    o let me taste you

    o
    o show me how you masturbate
    o touch my cock
    o go down on me
    o 

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
* {questions_for_sis.q_sis_nudes and CHOICE_COUNT() < max} [Dare her to show you her nudes]
    -> d_show_nudes
+ (no_dare) "I can't think of a dare."
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

= d_show_nudes
"I dare you to show me your nudes."
“Here, check these out.”
She hands you her phone and you flip through a series of provocative selfies. She's careful to crop her face out of each pic, but as you scroll through you find her squeezing her breasts together, pinching her nipples, pulling down the waistband of her panties, and eventually removing them entirely. She's fully shaved, and the final pic is a closeup of her slipping a finger between her wet pussy lips.
“What do you think?” she asks, with a smile.
* “Fucking hot[.”],” you nod.
    “Copy them to your phone,” she grins.
    “Really?”
    “Really. You’ll appreciate them more than the person I took them for.”
    ~ Nudes += Sister
* “I've seen better.”
    “Liar,” she laughs. “Whose nudes have you seen?”
    “Ah-ah-ah!” You wag your finger at her. “One question at a time, sis.”
-
->->

/*

    Dares from Sis
    She always gives these dares in order,
    so there should be a clear escalation,
    building intensity until she asks you to fuck her.
    How many? 5-10?
    
    o show me your dick
    o take off your clothes
    o kiss me - not a sibling kiss, a proper kiss (gets heated, hand in hair, licking neck)
    o take my bra/panties off with your teeth

    o suck on my nipples
    o finger me
    o go down on me
    o rub my clit with your cock

    o put it in me

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

    Look at Sister's Phone

*/
=== look_sis_phone ===
You pick up her phone, which is unlocked and open to the music player. You swipe to the home screen, careful not to stop the music from playing.
- (sis_phone_menu)
* [Look at her messages]
    You open her messages app. Unsurprisingly, she mostly chats with {SIS_FRIEND} and a few other friends from their school. There might be something interesting, but it would be a needle in a haystack, buried under thousands of unremarkable texts.
* [Look at her insta]
    You open the photo-sharing social app, and find that she's friends with lots of girls from her school. Most of their accounts are private, but the most interesting thing you find is pics of some girls drinking beers at a park.
* [Look at her camera roll]
    ~ last_girl = Sister
    Opening her camera roll, you find hundreds of outfit selfies taken in the mirror of her bedroom or various dressing rooms at the mall. There are a lot of pics of her and {SIS_FRIEND} hanging out. You're about to give up when you strike gold. A series of provocative selfies with increasingly less clothing.
    * * [Look at the nudes]
    * * [Put her phone back]
        Feeling a sudden surge of guilt, you pull the music app back up and put her phone carefully back on the counter.
        ->->
    - -
    ~ Nudes += Sister
    She's careful to crop her face out of each pic, but as you scroll through you find her squeezing her breasts together, pinching her nipples, pulling down the waistband of her panties, and eventually removing them entirely. She's fully shaved, and the final pic is a closeup of her slipping a finger between her wet pussy lips. You quietly copy these to your phone.
    You're about to close the app when you notice there's also a video of her masturbating.
    * * (play_video) [Play the video]
        Eager to watch, you hit play without thinking, and are horrified when her music stops playing, replaced by quiet wet sounds and moaning from the video.
        "Hello?" {SIS} says from the shower, "Is someone there?"
        * * * "Shit!"
        * * * [Pause the video]
        - - -
        Frantically, you pause the video, hoping the music will come back, but it doesn't, and the silence seems deafening.
        -> peep_sis_shower.busted
    * * [Copy the video]
        ~ Inventory += SisVideo
        You copy the video to your phone, too, excited to watch it in your room.
* [Put her phone back]
    You pull the music app back up and put her phone carefully back on the counter.
    ->->
- -> sis_phone_menu

/*

    Watch Sister's Sexy Video

*/
=== watch_sis_video ===
~ last_girl = Sister
The video is a close-up shot of {SIS} masturbating. Two fingers are pushing between her dripping wet pussy lips. You can hear her loudly moaning as her fingers, coated with creamy arousal, start rubbing tight circles around her clit. Suddenly, she cries out, as her legs tense and a gush of fluid spurts over her fingers as she pushes them back inside. The video ends as she clamps her legs together and knocks her phone over.
->->

/*

    Look at Sister’s Nudes

*/
=== look_at_sis_nudes ===
~ last_girl = Sister
You managed to save a series of pics from {SIS}’s phone. She starts out squeezing her breasts together and pinching her nipples. Then she’s pulling down the waistband of her panties, and slipping them off them entirely. In the last pic you can see she's fully shaved, slipping a finger between her wet pussy lips.
->->

/*

    Peep on Sister in the Shower
    Increasingly risky behavior to jerk off while she's in the shower
    If you pull it off, you get to watch her masturbate

*/
=== peep_sis_shower ===
~ last_girl = Sister
~ SisWearing = ()
~ SisFacts += SawSisNaked
{ SisState < SisQuestions:
    ~ SisState = SisQuestions
}
The shower curtain isn't quite closed all the way. You discover that if you put your eye right up to the gap, you can just barely see a frustratingly narrow sliver of bare skin.
+ [Try to see more]
+ [Leave before you get caught]
    -> leave_safely

- (round_1)
You're pretty sure she's got her back to you, facing the spray. She's singing loudly enough that you think you might be able to slide the curtain open just a little more without her noticing.
+ [Open the curtain a little]
    You hold the shower curtain carefully and slide it very slowly, just a little bit. Just enough to let you see a bit more of her body. You're still mostly hidden.
+ [Leave before you get caught]
    -> leave_safely

- (round_2)
<> Her round hips sway as she dances in the spray. Your eyes follow the curve of her ass, and strain to catch a glimpse of sideboob.
+ [Pull your cock out]
    Even this limited view of your stepsister's ass sets your heart pumping. Almost without realizing you're doing it, you free your cock, which stiffens quickly in your grip.
+ [Leave before you get caught]
    -> leave_safely

- (round_3)
<> You peer around the edge of the curtain, gawking at what you can see of her. She's rubbing a lathered-up loofa over her body. You wish you could see more.
+ [Open the curtain a bit further]
    Heart pounding, you slip the curtain even further open, enough you give you an unobstructed view. You pray she doesn't turn around, because she would spot you immediately.
+ [Leave before you get caught]
    -> leave_safely

- (round_4)
You watch with wide eyes as she rubs her body, rinsing the soap away. It might be your imagination, but she seems to be spending a lot of time on her breasts and inner thighs. Is she getting turned on?
+ [Start stroking]
    You start slowly stroking the length of your cock. It's already alarmingly hard from the heady combination of seeing {SIS} naked and knowing how easily you could be caught in the act.
+ [Leave before you get caught]
    -> leave_safely

- (round_5)
~ improveMood(SisMood)
Your suspicions that she's getting aroused are confirmed when she turns on the handheld sprayer. She slowly moves it down her body until she parts her legs to direct the water at her pussy. She gasps at the sudden stimulation, and starts moving her hips.
+ [Keep stroking]
    You can't believe you're jerking off while watching your stepsister masturbate in the shower! It's intensely erotic. What if she catches you? How would she react?
+ [Leave before you get caught]
    -> leave_safely

- (round_6)
~ improveMood(SisMood)
Her butt clenches as she thrusts with increasing urgency against the spray. She's moaning quietly as the hand that isn't holding the sprayer roams over her body, caressing her hips and squeezing her breasts.
+ [Moan]
    Without thinking about it, you allow yourself to moan, too. {SIS} suddenly freezes.
    -> made_a_sound
+ [Keep stroking]
    You imagine slipping into the shower and slipping your cock between her wet thighs, thrusting up to rub against her. Your erection throbs in your grasp, and you feel a familiar pressure starting to build.
+ [Leave before you get caught]
    -> leave_safely

- (round_7)
~ improveMood(SisMood)
Even from behind, there's no mistaking her rapidly climbing arousal. Her other hand has slid lower, and is moving rapidly. She must be about to cum. You wish you could see more. You wish you could touch her. You wish you could suck on her nipples or shove your cock between her thighs.
+ [Say her name]
    "{SIS}," you moan, overcome by the sight. She suddenly freezes.
    -> made_a_sound
+ [Try not to cum]
    You're so close, but you hold back, desperate to see her cum first. A spurt of precum dribbles onto your fingers, increasing the lubrication of your stroke. You squeeze tightly around your head, trying not to cum.
+ [Cum in your hand]
    -> cum_in_hand
+ [Cum in the shower]
    -> cum_in_shower

- (round_8)
~ SisFacts += SisLikesYou
When the climax hits, she shudders, clamping her legs together and losing her grip on the sprayer, which falls to the end of its hose, spraying against her knees. "Ahh, {PLAYER}!" Her legs shake as she moans your name, startling you. But it quickly becomes clear she still doesn't know you're there. She must have been fantasizing about you!
+ [Answer her]
    "{SIS}," you groan in reply without thinking.
    -> busted
+ [Cum in your hand]
    -> cum_in_hand
+ [Cum in the shower]
    -> cum_in_shower
+ [Cum on her]
    -> cum_on_her
- ->->

= made_a_sound
"Hello?" she calls. "Is someone there?"
You step back, but there's no way you can open the door without her knowing.
+ [Announce yourself]
    "Uh, hey," you answer, sheepishly. "It's me."
    -> busted
+ [Flush the toilet]
    Quickly, you flush the toilet.
    "Sorry," you answer, "I had to pee real bad."
    "Ew!" She replies, noticing the gap in the curtain and pulling it closed. Why didn't you go downstairs?"
    + + ["Dad's using it."]
        "Uh, I couldn't," you quickly improvise. "Dad's using it."
        "Oh," she replies knowingly. Dad often ties up the bathroom for an hour. "Still, you could have knocked."
    + + ["I thought you wouldn't mind"]
        "Bro." She sounds skeptical. "I know we've been getting closer, but that's too close, you know?"
    - -
    "Yeah, I'm sorry, I thought I could just sneak in without bothering you."
    "Gross," she replies as you leave the bathroom.
    -> leave
+ [Stay quiet]
    You hold your breath, praying she won't notice you. No such luck.
    -> busted

= busted
~ SisFacts += SisCaughtYouPeeking
~ temp video = seenVeryRecently(-> look_sis_phone.play_video)
"{PLAYER}?" {SIS} pulls the shower curtain aside, keeping herself covered, and stares at you in confusion. "What are you doing?"
+ {video} ["Watching your video?"]
    "I, um, was watching a video of you fingering yourself?"
+ {not video} ["Jerking off?"]
    "Well," you glance at your cock, "I guess I was kinda, um, jerking off?"
+ {not video} ["Peeping on you?"]
    "Um, peeping on you?" you shrug, the truth too self-evident to lie.
-
{
- SisMood == Hostile:
    "Get the fuck out of here!"
    -> leave
- SisMood == Neutral or SisMood == Friendly:
    "Dude, get out!"
    -> leave
- SisMood >= Aroused:
    She bites her lip and hesitates for a second before turning the shower off and opening the curtain all the way. She stands before you, fully nude and dripping wet, looking at you seductively.
    {
    - video:
        -> did_you_like_video
    - else:
        -> keep_going
    }
}

= did_you_like_video
"Did you like it?"
"Um, yeah, I thought it was fucking hot."
"I can see that," she purrs, lowering her eyes to the erection tenting your shorts. "Will you show me how much?
+ "Yeah" -> sis_sex.you_masturbate -> leave
+ "I don't think so"
    "Too bad," she frowns.
    -> leave

= keep_going
"Looks like you were enjoying yourself," she purrs, lowering her eyes to your erection. "Will you show me?
+ "Yeah" -> sis_sex.you_masturbate -> leave
+ "I don't think so"
    "Too bad," she frowns.
    -> leave

= cum_in_hand
Unable to hold back any longer, you stifle a groan as your cock twitches and start pumping hot, sticky cum into your fist. Your eyes are locked on {SIS}'s ass the entire time, shaking with the intensity of your orgasm.
Unfortunately, you don't think it's a good idea to stick around to enjoy yourself. <>
-> leave_safely

= cum_in_shower
Unable to hold back any longer, you rock forward as your cock twitches and shoots spurt after spurt of thick cum into the shower. You watch as the white globs fall into the water and swirl down the drain between {SIS}'s feet.
Unfortunately, you don't think it's a good idea to stick around to enjoy yourself. <>
-> leave_safely

= cum_on_her
~ SisFacts += SisCaughtYouPeeking
No longer caring if you get caught, you throw the curtain open and thrust your hips forward as you cum, shooting your load all over her lower back and ass.
"Oh!" she gasps at the unexpected sensation of hot cum on her back. She turns around, gawking at the sight of you milking the last drops of cum from your cock. "{PLAYER}?{SisMood < Aroused: What the fuck?}" She's still breathless from her own orgasm, but you think she sounds more surprised than upset.
+ "Hey, sis[."]," you answer sheepishly. "Sorry, I got a little carried away watching you."
+ "That was [hot."]so fucking hot," you gasp. "Sorry, I got a little carried away watching you."
+ "You called?"[] You wink. "If I'd known you were fantasizing about me, I'd have let you know I was here sooner."
-
{
- SisState == SisQuestions:
    "Oh my god," she mumbles, covering her mouth and blushing furiously. "What are you doing here? Did you hear me… Oh, fuck."
    "Yeah, I heard what you said," you grin. "I'm sorry I was creeping on you, but it sounds like maybe we should talk?"
    "Okay, I, um, sure," she stares at you with a curious expression. "But not here. Let me get cleaned up first. Come to my room later?"
    "Will do."
- SisState == SisTruthOrDare:
    "Wow," she shakes her head at your audacity. "Save it for truth or dare, dummy!"
    "Good idea. Wanna play right now?"
    "Well, now I need to clean up this mess you made," she laughs. "Come to my room later?"
    "Deal."
- SisState == SisSex:
    "Bro, next time, just tell me you're here," she grins. "We could have had more fun. Now get out of here, I have to clean up this mess you made."
}
-> leave

= leave_safely
You decide to leave before you get caught.
-> leave

= leave
~ sis_reset()
+ [Go back to your room] -> pass_time -> bedroom

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
- SisState == SisSex:
    You’ve completed {SIS}’s story, but you can hook up with her again anytime.
- SisState == SisTruthOrDare:
    Try playing truth or dare with her.
- SisFacts ? ReadSisDiary:
    Try talking to her about the fantasies you read in her diary.
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
- SisCum != ():
    ~ SisCum = ()
}

/*

    Check if your Sister is home
    She dresses differently at home or the mall.

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
    #DEBUG stole laptop
    ~ move(Laptop, BedroomItems, SisBedroomItems)
    ~ SisFacts += SisSawYourPorn
- else:
    #DEBUG did not steal laptop
}
