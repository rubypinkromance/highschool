/*
- Athlete: Lindsey
- Looks like Elle Fanning: medium-length dirty blonde ponytail, slight build, small tits, 32B(34A), trimmed
- Outfit: black leggings, red sports bra, blue bikini panties, tank top during class, cute dress at mall
? intel: stays after school every day training
? recon: watch her shower and masturbate
? convo: challenge her to a race (don't have to win, just keep up)
    - likes flirty
    - dislikes sarcasm
* jerk off in locker, watch change
* Sex after discovering running make her horny, keeping up
- 1: Gym        - Field (running laps)
- 2: Science    - Bleachers / Field
- L: Field      - Bleachers / Field
- 3: Study Hall - Bleachers / Field
- 4: Health     - Field
- A: Gym        - Field

- Dislikes non-athletic clothes
- Athlete agrees to go out if you can keep up with her. Requires training. In the meantime, peep show in locker room
*/
CONST ATHLETE = "Lindsey"
CONST ATHLETE_TITLE = "the athlete"
LIST AthleteState = AthleteObserved
VAR AthleteInPlay = true
VAR AthleteMood = Neutral
VAR AthleteBaseMood = Neutral

=== talk_to_athlete ===
~ last_girl = Athlete

Approach {ATHLETE}.

- (opts)
* {AthleteMood > Friendly}"What's your bra size?"
    "32B."
+ (hypnosis){DEBUG}[Hypnotize her]
    + + [Improve her mood]
        ~ improveMood(AthleteMood)
        "Thanks, I feel {AthleteMood}"
        -> hypnosis
    + + [Worsen her mood]
        ~ worsenMood(AthleteMood)
        "Now I feel {AthleteMood}"
        -> hypnosis
    + + [Reset her mood]
        ~ AthleteMood = AthleteBaseMood
        "Normally, I feel {AthleteMood}"
        -> hypnosis
    + + [Make her permanently horny]
        ~ AthleteBaseMood = Aroused
        "From now on, I'll be {AthleteBaseMood} every day."
        -> hypnosis
    + + [Make her permanently neutral]
        ~ AthleteBaseMood = Neutral
        "From now on, I feel {AthleteBaseMood} every day."
        -> hypnosis
    + + [End the hypnosis]
        "Thanks!"
        -> opts
+ "Hello."
    "Sorry, I don't have any dialog yet."
+ [Leave]
    ->->
- -> opts

=== observe_athlete ===
~ last_girl = Athlete
~ AthleteState += AthleteObserved
Coming soon.
->->

=== dream_of_athlete ===
You have a filthy dream about {ATHLETE}.
->->

=== athlete_hints ===
Try observing {ATHLETE}.
->->
