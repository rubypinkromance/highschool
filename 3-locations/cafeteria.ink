/*
- The Cafeteria
*/
=== cafeteria ===
CONST CAFETERIA = "cafeteria"
VAR CafeteriaPeople = ()
~ here = Cafeteria

You are in the {CAFETERIA}.

{listRoomPeopleSentence(CafeteriaPeople)}

- (cafeteria_opts)
<- talkAndObserveAllCharacters(CafeteriaPeople, -> cafeteria_opts)

+ [Leave the {CAFETERIA}] -> pass_time -> hallway
- -> cafeteria_opts

/*
- The Storage Closet
- Sex with Nympho
*/
= storage
CONST STORAGE_CLOSET = "storage closet"
VAR StorageClosetPeople = ()
~ here = StorageCloset

You are in the {STORAGE_CLOSET}. Shelves hold supplies for the chess club and other after-school activities.

+ [Leave the {STORAGE_CLOSET}] -> cafeteria
