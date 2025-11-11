/*
- The Cafeteria
*/
=== cafeteria ===
CONST CAFETERIA = "cafeteria"
VAR CafeteriaPeople = ()
~ here = CAFETERIA

You are in the {CAFETERIA}.

{listRoomPeopleSentence(CafeteriaPeople)}

- (cafeteria_opts)
<- talkAndObserveAllCharacters(CafeteriaPeople, -> cafeteria_opts)

+ [Leave the {CAFETERIA}]
    -> pass_time -> hallway
- -> cafeteria_opts

/*
- The Storage Closet
- Sex with Nympho
*/
= storage
CONST STORAGE = "storage closet"
VAR StoragePeople = ()
~ here = STORAGE

You are in the {STORAGE}. Shelves hold supplies for the chess club and other after-school activities.

+ [Leave the {STORAGE}] -> cafeteria
