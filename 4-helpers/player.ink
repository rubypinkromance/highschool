VAR PLAYER = "Mike"
LIST Outfits = Nude, (Default), (Nice), (Athletic), Preppy
LIST ConfidenceLevels = Awkward, Normal, Confident, Flirty, Player
LIST PlayerItems = Laptop

// Status
VAR confidence = Awkward
VAR cum_today = false
VAR ow_my_balls = false
VAR has_black_eye = 7 // Set this to a positive number to let it slowly heal

// Inventory
VAR Inventory = ()
VAR BraSizes = ()
VAR outfit = Default

// Schedule
VAR schedule_period_1 = Gym
VAR schedule_period_2 = HealthClass
VAR schedule_period_3 = Lab
VAR schedule_period_4 = PhotoClass
VAR permission_to_change_schedule = false
VAR has_detention = 0
VAR full_day_absences = 0
VAR MissedClasses = ()
VAR has_principal_meeting = false

/*

    Hint System

*/
=== hint_system(-> return_to) ===
What do you want a hint about?
<- hint_all_characters(Students, return_to)
<- hint_all_characters(Staff, return_to)
* [Locating a girl]
    If you access the office computer while no one is there, you can print out a class schedule for all the girls.
    -> return_to
* [Why do some actions say “not confident enough”?]
    Some actions, such as asking a girl out, are restricted by your confidence level. You can increase your confidence by hooking up with girls.
    -> return_to
-> DONE

/*

    Improve your confidence.

*/
=== function improveConfidence()
{ confidence != Player:
    ~ confidence++
}

/*

    Watch porn

*/
=== watch_porn
You pull out your cock as you load one of your favorite videos, <>
{shuffle:
- of a stepbrother jerking off as his stepsister gets undressed in front of him for no apparent reason. When she notices, she pretends to be shocked, but it doesn't take long before she's riding his cock as he squeezes her tits. You imagine yourself in the scene, thrusting up into the heat of her pussy.
- of a cheerleader fucking an entire soccer team. She moans around the cock in her mouth as two players thrust into her pussy and ass. As each guy cums on her and steps away, another takes his place. You imagine joining in, how her pussy would feel around your cock.
- of a girl slowly undressing. She seems to be looking straight at you, talking in a low voice about all the things she wants you to do to her. The intensity of the fantasy escalates until her fingers are frantically rubbing her clit as she begs you to cum for her. You picture yourself standing over her, pressing your cock to her lips until she parts them for you.
- of a couple fooling around in a park. He pays her escalating amounts of money to flash him, to rub her pussy, and to suck his cock. They keep having to move when people come by, until finally she lifts her skirt and lets him fuck her against a tree. You image how it would feel, the dangerous thrill of getting caught with your cock buried in her pussy.
}
<> Before long, your erection is throbbing in your grip.
+ [Keep stroking] -> climax_or_interruption(GymTeacher)

/*

    Jerk off

*/
=== jerk_off
~ temp fantasy_girl = last_girl
You decide to take advantage of the moment of privacy. As you pull out your cock, you begin to fantasize about {getNameAndTitle(fantasy_girl)}.
+ [Keep going]
+ [Someone else]
    + + [{getNameAndTitle(Actor)}]
        ~ fantasy_girl = Actor
    + + [{getNameAndTitle(Athlete)}]
        ~ fantasy_girl = Athlete
    + + [{getNameAndTitle(Believer)}]
        ~ fantasy_girl = Believer
    + + [{getNameAndTitle(Cheerleader)}]
        ~ fantasy_girl = Cheerleader
    + + [{getNameAndTitle(Friend)}]
        ~ fantasy_girl = Friend
    + + [{getNameAndTitle(Nerd)}]
        ~ fantasy_girl = Nerd
    + + [{getNameAndTitle(Nympho)}]
        ~ fantasy_girl = Nympho
    + + [{getNameAndTitle(Photographer)}]
        ~ fantasy_girl = Photographer
    + + [{getNameAndTitle(Queen)}]
        ~ fantasy_girl = Queen
    + + [{getNameAndTitle(Rebel)}]
        ~ fantasy_girl = Rebel
    + + [{getNameAndTitle(Scientist)}]
        ~ fantasy_girl = Scientist
    + + [{getNameAndTitle(Twins)}]
        ~ fantasy_girl = LIST_RANDOM((Twin1, Twin2))
    + + [Cancel]
- (fantasy)
~ temp fantasy_name = characterData(fantasy_girl, Name)
{shuffle:
- {fantasy_name} is kneeling before you, hands on your legs as she kisses along your shaft. She teases you with small licks, her breath hot against your skin. Impatiently, you tighten your grip on her hair, until she parts her lips for you. She moans happily as you slide into the heat of her mouth. Slowly at first, but with increasing urgency, you start pumping your cock, imagining how it would feel to go deeper every time, until she's drooling and looking up at you with hunger in her eyes.
- {fantasy_name} stands in front of you, slowly gyrating as she removes her clothes. Your breath catches as her top falls to the floor. She cups her breasts in her hands, biting her lip as she squeezes her nipples. You imagine the excitement in her eyes as she watches you stroke the length of your shaft for her. She dances closer and closer, shedding clothes until she finally drops to her knees and takes your cock in her hand, whispering filthy promises as she points it at her chest and starts pumping.
- {fantasy_name} straddles you, already naked and griding against your erection. As she rocks back and forth, you squeeze her breasts, and she groans. You imagine the feel of her lips, slick with desire, sliding up and down your shaft. You lift your hips, desperate to bury yourself in her heat, but she squirms away every time, teasing you until you're groaning with frustration.
- {fantasy_name} stands before you, challenging you with her eyes, daring you to take action. She squeals with a mix of excitement and surprise as you spin her around and forcefully bend her over your desk. She pretends to struggle as you tear off her panties, and roughly push her legs apart. Your cocks throbs as you rubs it between her lips, already dripping with arousal. She laughs and dares you to do it, to bury yourself deep and claim her as your own.
}
+ [Keep going] -> climax_or_interruption(fantasy_girl)

/*

    Climax or Interruption.
    Sister might catch you jerkin' it!

*/
=== climax_or_interruption(fantasy_girl)
~ temp busted = sis_is_home() and chance(66) and not sis_catches_you_jerking_off and not SisRejected
Your cock swells in your grip as you allow the fantasy to fill your mind. The feel of her skin against yours, the heat of her body, the desire in her eyes. You feel the pressure growing. In your head, she's moaning and begging for you to cum. You're so close…
+ [Cum]
{
- busted:
    -> sis_catches_you_jerking_off ->
- else:
    ~ cum_today = true
    { fantasy_girl != GymTeacher: "Oh fuck, {characterData(fantasy_girl, Name)}!" You breathe her name as your|<> Your} cock twitches over and over, cum spurting into the tissue. At last, you collapse, gasping for breath as the intensity of your climax fades.
}
->->
