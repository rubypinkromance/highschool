/*

    The Cafeteria

*/
=== cafeteria ===
CONST CAFETERIA = "cafeteria"
VAR CafeteriaPeople = ()
~ here = Cafeteria

TODO description
You are in the {CAFETERIA}.

{listRoomPeopleSentence(CafeteriaPeople)}

- (cafeteria_opts)
<- talkAndObserveAllCharacters(CafeteriaPeople, -> cafeteria_opts)

+ [Leave the {CAFETERIA}] -> pass_time -> hallway
- -> cafeteria_opts

/*

    The Storage Closet

*/
= storage
CONST STORAGE_CLOSET = "storage closet"
VAR StorageClosetPeople = ()
~ here = StorageCloset

You are in the {STORAGE_CLOSET}. Shelves hold supplies for the chess club and other after-school activities.

+ [Leave the {STORAGE_CLOSET}] -> cafeteria
