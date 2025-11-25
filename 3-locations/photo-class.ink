/*

    The Photography Classroom

*/
=== photo_class ===
CONST PHOTO_CLASS = "photography classroom"
CONST PHOTO_CLASS_NAME = "photography class"
VAR PhotoClassPeople = ()
~ here = PhotoClass
-> access_restrictions ->

You are in the {PHOTO_CLASS}. The upper half of the walls are covered with oversized posters of famous photos, while the lower half are all corkboards for students to tack up their photos during the critique sessions. A door in the back of the room leads to the darkroom.

{listRoomPeopleSentence(PhotoClassPeople)}

- (photo_class_opts)
<- talkAndObserveAllCharacters(PhotoClassPeople, -> photo_class_opts)

+ [Go to the {DARKROOM}] -> darkroom
+ [Leave the {PHOTO_CLASS}] -> pass_time -> hallway
- -> photo_class_opts

= access_restrictions
{ isClassTime() and now != hasClass(PhotoClass):
    -> access_denied_photo_teacher -> hallway
- else:
    ->->
}

/*

    The Darkroom

*/
= darkroom
CONST DARKROOM = "darkroom"
VAR DarkroomPeople = ()
~ here = Darkroom

You are in the {DARKROOM}. It's very dark in here!

+ [Leave the {DARKROOM}] -> photo_class
