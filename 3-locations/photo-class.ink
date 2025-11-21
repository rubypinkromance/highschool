/*
- The Photography Classroom
*/
=== photo_class ===
CONST PHOTO_CLASS = "photography classroom"
CONST PHOTO_CLASS_NAME = "photography class"
VAR PhotoClassPeople = ()
~ here = PhotoClass
-> access_restrictions ->

You are in the {PHOTO_CLASS}.

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
- The Darkroom
- Sex with Photographer
*/
= darkroom
CONST DARKROOM = "darkroom"
VAR DarkroomPeople = ()
~ here = Darkroom

You are in the {DARKROOM}. It's very dark in here!

+ [Leave the {DARKROOM}] -> photo_class
