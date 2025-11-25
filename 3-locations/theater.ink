/*

    The Theater

*/
=== theater ===
CONST THEATER = "theater"
CONST THEATER_CLASS_NAME = "drama class"
VAR TheaterPeople = ()
VAR has_theater_invite = false
~ here = Theater
-> access_restrictions ->

You are in the {THEATER}. The seats in the auditorium are empty. Massive curtains frame the stage.
{ isClassTime():
    <> {THEATER_TEACHER} is organizing the students on stage to rehearse a script.
}

{listRoomPeopleSentence(TheaterPeople)}

- (theater_opts)
<- talkAndObserveAllCharacters(TheaterPeople, -> theater_opts)

+ [Go {BACKSTAGE}] -> backstage
+ [Leave the {THEATER}] -> pass_time -> hallway
- -> theater_opts

= access_restrictions
{ not has_theater_invite and isClassTime() and now != hasClass(Theater):
    -> access_denied_theater_teacher -> hallway
- else:
    ->->
}

/*

    Backstage

*/
= backstage
CONST BACKSTAGE = "backstage"
VAR BackstagePeople = ()
~ here = Backstage

You are {BACKSTAGE}. It is dark and dusty. There are chaotic boxes full of props and costumes from previous productions, as well as a small area with a ratty couch.

+ [Leave {BACKSTAGE}] -> theater
