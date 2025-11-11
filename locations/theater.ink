/*
- The Theater
*/
=== theater ===
CONST THEATER = "theater"
VAR TheaterPeople = ()
~ here = THEATER
-> access_restrictions ->

You are in the {THEATER}.

{listRoomPeople(TheaterPeople)}

- (theater_opts)
<- talkAndObserveAllCharacters(TheaterPeople, -> theater_opts)

+ [Go {BACKSTAGE}]
    -> backstage
+ [Leave the {THEATER}]
    -> pass_time -> hallway
- -> theater_opts

= access_restrictions
{
- isClassTime():
    You're not in this class! Back to the hallway…
    -> hallway
}
->->

/*
- Backstage
- Sex with actor
*/
= backstage
CONST BACKSTAGE = "backstage"
VAR BackstagePeople = ()
~ here = BACKSTAGE

You are {BACKSTAGE}.

+ [Leave {BACKSTAGE}] -> theater
