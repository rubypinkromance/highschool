/*
 * The Photography Classroom
 *
 * 1. Queen, Twin 1
 * 2. Nympho, Scientist
 * L. ---
 * 3. Rebel, Twin 2
 * 4. Believer, Photographer
 * A. Photographer
 */
=== photography ===
CONST PHOTOGRAPHY = "photography classroom"
VAR PhotographyPeople = ()
~ here = PHOTOGRAPHY

You are in the {PHOTOGRAPHY}.

Looking around, you can see {listRoomPeople(PhotographyPeople)}.

- (opts)
<- talkToAllCharacters(PhotographyPeople, -> photography.opts)

+ [Go to the {DARKROOM}]
    -> darkroom
+ [Leave the {PHOTOGRAPHY}]
    -> pass_time -> hallway
- -> opts

/*
 * =============================================
 * The Darkroom
 *
 * - Sex with Photographer
 */
= darkroom
CONST DARKROOM = "darkroom"
VAR DarkroomPeople = ()
~ here = DARKROOM

You are in the {DARKROOM}. It's very dark in here!

+ [Leave the {DARKROOM}] -> photography
