/*
- Gossip: Whitney
- Katelyn: Brown shoulder length hair, tan slacks, black button-up, long coat, lacy purple bra and panties, trimmed
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
- 1: Health     - Dress Store
- 2: Theater    - Shoe Store
- L: Cafeteria  - Food Court
- 3: Science    - Bra Store
- 4: Study Hall - Dress Store
- A: Bleachers  - Dress Store
*/
CONST GOSSIP = "Whitney"
CONST GOSSIP_TITLE = "your friend"
LIST GossipState = GossipObserved
VAR GossipMood = Friendly
VAR GossipBaseMood = Friendly

=== talk_to_gossip ===
Approach {GOSSIP}.
- (opts)
* "What's your bra size?"
    "34B."
+ [Walk away] ->->
- -> opts

=== observe_gossip ===
~ GossipState += GossipObserved
Coming soon.
->->
