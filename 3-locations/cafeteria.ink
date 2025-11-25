/*

    The Cafeteria

*/
=== cafeteria ===
CONST CAFETERIA = "cafeteria"
VAR CafeteriaPeople = ()
~ here = Cafeteria

You are in the {CAFETERIA}.
{
- isWeekday() and now == Lunch:
    <> Rows of tables fill the room, and the chaotic noise of almost everyone in the school eating lunch together fills the air.
- isWeekday() and now == AfterSchool:
    <> Most of the lunch tables are empty, but a group of students cluster around a few tables at the back of the room, playing some sort of card game.
- else:
    <> The tables are empty, and the room is quiet.
}

{lookForRoomPeople(CafeteriaPeople)}

- (cafeteria_opts)
<- character_opts(CafeteriaPeople, -> cafeteria_opts)

+ [Leave the {CAFETERIA}] -> pass_time -> hallway
- -> cafeteria_opts

/*

    The Storage Closet

*/
= storage
CONST STORAGE_CLOSET = "storage closet"
VAR StorageClosetPeople = ()
~ here = StorageCloset

You are in the {STORAGE_CLOSET}. The walls are lined with shelves holding supplies for after-school groups and activities, extra chairs, and holiday decorations.

+ [Leave the {STORAGE_CLOSET}] -> cafeteria
