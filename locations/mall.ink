/*
- The Mall
- Like the school, the mall is a hub full of stores
- Sex with Queen
*/
=== mall ===
CONST MALL = "mall"
VAR MallPeople = ()
~ here = MALL
-> access_restrictions ->

You are at the {MALL}. <>
~ announceTime()

- (mall_opts)
<- talkAndObserveAllCharacters(MallPeople, -> mall_opts)

+ [Go to the {FOOD_COURT}] -> food_court
+ [Go to the {DRESS_STORE}] -> dress_store
+ [Go to the {SHOE_STORE}] -> shoe_store
+ [Go to the {BRA_STORE}] -> bra_store
+ [Go to the {BOOK_STORE}] -> book_store
+ [Go to the {MOVIE_THEATER}] -> movie_theater
+ [Go home] -> bedroom
- -> mall_opts

= access_restrictions
{now == Night:
    The mall is closed. You head home.
    -> bedroom
}
->->

/*
- The Food Court
*/
= food_court
CONST FOOD_COURT = "food court"
VAR FoodCourtPeople = ()
~ here = FOOD_COURT

You are in the {FOOD_COURT}.

{listRoomPeople(FoodCourtPeople)}

- (food_court_opts)
<- talkAndObserveAllCharacters(MallPeople, -> food_court_opts)

+ [Leave the {FOOD_COURT}]
    -> pass_time -> mall
- -> food_court_opts

/*
- The Shoe Store
*/
= shoe_store
CONST SHOE_STORE = "shoe store"
VAR ShoeStorePeople = ()
~ here = SHOE_STORE

You are in the {SHOE_STORE}.

{listRoomPeople(ShoeStorePeople)}

- (shoe_store_opts)
<- talkAndObserveAllCharacters(ShoeStorePeople, -> shoe_store_opts)

+ [Leave the {SHOE_STORE}]
    -> pass_time -> mall
- -> shoe_store_opts

/*
- The Bra Store
*/
= bra_store
CONST BRA_STORE = "bra store"
VAR BraStorePeople = ()
~ here = BRA_STORE

You are in the {BRA_STORE}.

{listRoomPeople(BraStorePeople)}

- (bra_store_opts)
<- talkAndObserveAllCharacters(BraStorePeople, -> bra_store_opts)

+ [Leave the {BRA_STORE}]
    -> pass_time -> mall
- -> bra_store_opts

/*
- The Dress Store
*/
= dress_store
CONST DRESS_STORE = "dress store"
VAR DressStorePeople = ()
~ here = DRESS_STORE

You are in the {DRESS_STORE}.

{listRoomPeople(DressStorePeople)}

- (dress_store_opts)
<- talkAndObserveAllCharacters(DressStorePeople, -> dress_store_opts)

+ [Leave the {DRESS_STORE}]
    -> pass_time -> mall
- -> dress_store_opts

/*
- The Book Store
*/
= book_store
CONST BOOK_STORE = "book store"
VAR BookStorePeople = ()
~ here = BOOK_STORE

You are in the {BOOK_STORE}.

{listRoomPeople(BookStorePeople)}

- (book_store_opts)
<- talkAndObserveAllCharacters(BookStorePeople, -> book_store_opts)

+ [Leave the {BOOK_STORE}]
    -> pass_time -> mall
- -> book_store_opts

/*
- The Movie Theater
*/
= movie_theater
CONST MOVIE_THEATER = "movie theater"
VAR MovieTheaterPeople = ()
~ here = MOVIE_THEATER

You are in the {MOVIE_THEATER}.

{listRoomPeople(MovieTheaterPeople)}

- (movie_theater_opts)
<- talkAndObserveAllCharacters(MovieTheaterPeople, -> movie_theater_opts)

+ [Leave the {MOVIE_THEATER}]
    -> pass_time -> mall
- -> movie_theater_opts
