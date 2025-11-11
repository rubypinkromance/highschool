/*
- The Mall
- Like the school, the mall is a hub full of stores
- Sex with Queen
*/
=== mall ===
CONST MALL = "mall"
~ here = MALL
-> access_restrictions ->

You are at the {MALL}. <>
~ announceTime()

~ temp totalMallPeople = LIST_COUNT(FoodCourtPeople) + LIST_COUNT(DressStorePeople) + LIST_COUNT(ShoeStorePeople) + LIST_COUNT(BraStorePeople) + LIST_COUNT(BookStorePeople) + LIST_COUNT(MovieTheaterPeople)

{ totalMallPeople > 1:
    You look around for anyone you recognize.
- else:
    You don't see anyone you recognize.
}
{ LIST_COUNT(FoodCourtPeople) > 0:
    <> {listRoomPeople(FoodCourtPeople)} {LIST_COUNT(FoodCourtPeople) > 1:are|is} sitting in the food court.
}
{ LIST_COUNT(DressStorePeople) > 0:
    <> {listRoomPeople(DressStorePeople)} {LIST_COUNT(DressStorePeople) > 1:are|is} walking into the {DRESS_STORE}.
}
{ LIST_COUNT(ShoeStorePeople) > 0:
    <> {listRoomPeople(ShoeStorePeople)} {LIST_COUNT(ShoeStorePeople) > 1:are|is} browsing in the {SHOE_STORE}.
}
{ LIST_COUNT(BraStorePeople) > 0:
    <> {listRoomPeople(BraStorePeople)} {LIST_COUNT(BraStorePeople) > 1:are|is} entering the {BRA_STORE}.
}
{ LIST_COUNT(BookStorePeople) > 0:
    <> {listRoomPeople(BookStorePeople)} {LIST_COUNT(BookStorePeople) > 1:are|is} at the {BOOK_STORE}.
}
{ LIST_COUNT(MovieTheaterPeople) > 0:
    <> {listRoomPeople(MovieTheaterPeople)} {LIST_COUNT(MovieTheaterPeople) > 1:are|is} at the {MOVIE_THEATER}.
}

- (mall_opts)
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

{listRoomPeopleSentence(FoodCourtPeople)}

- (food_court_opts)
<- talkAndObserveAllCharacters(FoodCourtPeople, -> food_court_opts)

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

{listRoomPeopleSentence(ShoeStorePeople)}

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

{listRoomPeopleSentence(BraStorePeople)}

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

{listRoomPeopleSentence(DressStorePeople)}

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

{listRoomPeopleSentence(BookStorePeople)}

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

{listRoomPeopleSentence(MovieTheaterPeople)}

- (movie_theater_opts)
<- talkAndObserveAllCharacters(MovieTheaterPeople, -> movie_theater_opts)

+ [Leave the {MOVIE_THEATER}]
    -> pass_time -> mall
- -> movie_theater_opts
