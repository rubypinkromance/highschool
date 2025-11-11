/*
- Athlete: Lindsey
- Florence Pugh, dirty blonde, track shorts, small boobs, dark nipples, sports bra, tank top, bikini panties (wet), shaved
? intel: stays after school every day training
? recon: watch her shower and masturbate
? convo: challenge her to a race (don't have to win, just keep up)
    - likes flirty
    - dislikes sarcasm
* jerk off in locker, watch change
* Sex after discovering running make her horny, keeping up
- 1: Gym        - Field (running laps)
- 2: Science    - Bleachers
- L: Field      - Bleachers
- 3: Study Hall - Bleachers
- 4: Health     - Field (running laps)
- A: Gym        - Field (running laps)
*/
CONST ATHLETE = "Lindsey"
CONST ATHLETE_TITLE = "the athlete"
LIST AthleteState = AthleteObserved
VAR AthleteMood = Neutral
VAR AthleteBaseMood = Neutral

=== talk_to_athlete ===
Approach {ATHLETE}.
- (opts)
    * "What's your bra size?"
        "34B."
    + [Improve her mood]
        ~ improveMood(AthleteMood)
        "Thanks, I feel {AthleteMood}"
        -> opts
    + [Worsen her mood]
        ~ worseMood(AthleteMood)
        "Now I feel {AthleteMood}"
        -> opts
    + [Reset her mood]
        ~ AthleteMood = AthleteBaseMood
        "Normally, I feel {AthleteMood}"
        -> opts
    + [Make her permanently horny]
        ~ AthleteBaseMood = Aroused
        "From now on, I'll be {AthleteBaseMood} every day."
    + [Make her permanently neutral]
        ~ AthleteBaseMood = Neutral
        "From now on, I feel {AthleteBaseMood} every day."
    + [Leave her alone] ->->
- -> opts

=== observe_athlete ===
~ AthleteState += AthleteObserved
Coming soon.
->->
