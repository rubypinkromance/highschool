/*
- Gossip: Gretchen
    - Mary Elizabeth Winstead: Brown shoulder length hair, tan slacks, black button-up, long coat, lacy purple bra and panties
    - Gives details on schoolgirls (Nympho gives details on teachers)
    ? intel: She tells you to ask her if you need to know anything about other girls
    ? recon: wants to be a detective (favorite books, movies, references)
    ? convo: ask about her multiple times, she deflects, eventually asks why you're curious, say you're interested in being a detective.
        - likes serious
        - dislikes flirty
    * quest: Why did Rebel have to transfer schools?
    * quest: Is Scientist making meth in lab?
    * quest: Who did X make out with at the party?
    * quest: Why did X get the role instead of Y?
    * quest: Is our team lead sleeping with theirs?
    * quest: Does X have a tattoo on his dick?
    * quest: Do theater kids have a weird sex ritual?
    * quest: Is there a stash of porn in the A/V closet?
    * quest: student council: find dirt on candidate.
    * quest: (something in men's locker room)
    * quest: Graffitti in men's room
    * quest: steal hall pass from office
    * quest: steal confiscated vapes from lounge
    * quest: steal pills from nurse
    * quest: gives you address to surveil on your way to school, turns out to be her house, observe her getting dressed. What color are my underwear? How long are my pubes? What's my favorite movie? If you get it right, she invites you to the teacher's lounge for a final lesson.
    * Sex in empty teacher's lounge, she shows up in trenchcoat and lingerie
    - 1: Science
    - 2: Cafeteria
    - 3: Study Hall
    - 4: Bleachers
*/
CONST GOSSIP = "Gretchen"

=== talk_to_gossip ===
Approach {GOSSIP}.
- (opts)
    + "Can I ask you about someone{ask_gossip_for_intel: else}?"
        -> ask_gossip_for_intel ->
    * "What's your bra size?"
        "34B."
    + [Walk away]
        ->->
- -> opts

=== ask_gossip_for_intel ===
TODO: add intel purchase system
"Sure, who do you want to know about?"
- (targets)
    * "What do you know about {ACTOR}?"
        Coming soon.
        ->->
    * "What do you know about {ATHLETE}?"
        Coming soon.
        ->->
    * "What do you know about {BELIEVER}?"
        Coming soon.
        ->->
    * "What can you tell me about {CHEERLEADER}?"
        ~ cheerleaderState = intel
        "She's been together with {JOCK} for over a year. They're a total power couple. I heard they've been fighting lately, but I'm not sure about what. Maybe if you watch them, you can figure it out?"
        ->->
    * "What do you know about {NERD}?"
        Coming soon.
        ->->
    * "What do you know about {PHOTOGRAPHER}?"
        Coming soon.
        ->->
    * "What do you know about {QUEEN}?"
        Coming soon.
        ->->
    * "What do you know about {REBEL}?"
        Coming soon.
        ->->
    * "What do you know about {SCIENTIST}?"
        Coming soon.
        ->->
    * "What do you know about the twins?"
        Coming soon.
        ->->
    * {clinic} "What do you know about {NURSE}?"
        -> nothing_about_teachers ->->
    * {office} "What do you know about {SECRETARY}?"
        -> nothing_about_teachers ->->
    * {health} "What do you know about {TEACHER}?"
        -> nothing_about_teachers ->->
    * "Tell me something about you."
        "I don't like to talk about myself."
        ->->
    + "Nevermind"
        ->->
- -> targets

=== nothing_about_teachers ===
"I don't know anything about teachers or staff. You should try talking to {NYMPHO}, her dad's the principal, so she might know something."
->->