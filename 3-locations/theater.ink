/*
- The Theater
*/
=== theater ===
CONST THEATER = "theater"
CONST THEATER_CLASS_NAME = "drama class"
VAR TheaterPeople = ()
~ here = Theater
-> access_restrictions ->

You are in the {THEATER}.

{listRoomPeopleSentence(TheaterPeople)}

- (theater_opts)
<- talkAndObserveAllCharacters(TheaterPeople, -> theater_opts)

+ [Go {BACKSTAGE}] -> backstage
+ [Leave the {THEATER}] -> pass_time -> hallway
- -> theater_opts

= access_restrictions
{ isClassTime() and now != hasClass(Theater):
    -> access_denied_theater_teacher -> hallway
}
->->

/*
- Backstage
- Sex with actor
*/
= backstage
CONST BACKSTAGE = "backstage"
VAR BackstagePeople = ()
~ here = Backstage

You are {BACKSTAGE}.

+ [Leave {BACKSTAGE}] -> theater
