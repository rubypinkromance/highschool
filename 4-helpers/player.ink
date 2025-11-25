VAR PLAYER = "Mike"
LIST Outfits = Nude, (Default), (Nice), (Athletic), Preppy
LIST ConfidenceLevels = Awkward, Normal, Confident, Flirty, Player

// Status
VAR confidence = Awkward
VAR cum_today = false
VAR ow_my_balls = false
VAR has_black_eye = 0 // Set this to a positive number to let it slowly heal

// Inventory
VAR Inventory = (CheerleaderStuff)
VAR outfit = Default

// Schedule
VAR schedule_period_1 = Gym
VAR schedule_period_2 = HealthClass
VAR schedule_period_3 = Lab
VAR schedule_period_4 = PhotoClass
VAR permission_to_change_schedule = false
VAR has_detention = false

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
-> DONE
