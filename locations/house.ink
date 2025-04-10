/*
- Your bedroom
*/
=== bedroom ===
Your bedroom

+ [Bathroom] -> bathroom
+ [Go to school] -> hallway

/*
> Bathroom
    - 4. Stepsister
    * Sex with Stepsister
*/
= bathroom
Your bathroom
Your stepsister is here

- (opts)
+ [Stepsister] -> stepsister ->
+ [Bedroom] -> bedroom
- -> opts


=== stepsister ===
This is a tunnel representing interacting with your stepsister.
- (opts)
    * [Check her out]
        She's smoking hot, man.
    * [Feel her up]
        She's into it, bro!
    * "What's your bra size?"
        "36C, bro."
    + [Leave her alone] ->->
- -> opts