/*
- Gossip: Gretchen
    - Mary Elizabeth Winstead: Brown shoulder length hair, tan slacks, black button-up, long coat, lacy purple bra and panties
    ? intel: she has all the good gossip, if you want to know anything
    ? recon: wants to be a detective (favorite books, movies, references)
    ? convo: ask about her multiple times, she deflects, eventually asks why you're curious, say you're interested in being a detective.
        - likes serious
        - dislikes flirty
    * Challenge: steal hall pass from office
    * Challenge: steal cigarettes from lounge
    * Challenge: steal late slips from office
    * Challenge: steal confiscated pills from nurse
    * Challenge: gives you address to surveil on your way to school, turns out to be her house, observe her getting dressed. What color are my underwear? How long are my pubes? What's my favorite movie? If you get it right, she invites you to the teacher's lounge for a final lesson.
    * Sex in empty teacher's lounge, she shows up in trenchcoat and lingerie
    - 1: Science
    - 2: Cafeteria
    - 3: Study Hall
    - 4: Bleachers
*/
CONST GOSSIP = "Gretchen"

=== talk_to_gossip ===
Talk to {GOSSIP}.
- (opts)
    * "What can you tell me about {CHEERLEADER}?"
        ~ cheerleaderState = intel
        "She's been together with {JOCK} for over a year. They're a total power couple. I heard they've been fighting lately, but I'm not sure about what. Maybe if you watch them, you can figure it out?"
    * "What's your bra size?"
        "36C."
    + [Leave her alone]
        ->->
- -> opts
