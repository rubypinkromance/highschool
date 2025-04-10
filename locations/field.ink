/*
- Athletics Field
    - 1. ---
    - 2. Athlete
    - 3. ---
    - 4. Cheerleader
*/
=== field ===
The athletic field
+ [Sit on the bleachers] -> bleachers
+ [Go under the bleachers] -> under_bleachers
+ [Go to hallway] -> hallway

/*
> Bleachers
    - 1. ---
    - 2. Rebel (smoking), Photographer, Trans
    - 3. ---
    - 4. Gossip
*/
= bleachers
The bleachers overlooking the athletic field
+ [Go to the field] -> field

/*
> Under Bleachers
    * Sex with Cheerleader
*/
= under_bleachers
Under the bleachers
+ [Go to the field] -> field
