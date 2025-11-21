/*
- The Mall
- Like the school, the mall is a hub full of stores
- Sex with Queen
*/
=== mall ===
CONST MALL = "mall"
~ here = Mall
-> access_restrictions ->
~ announceTime()

You are at the {MALL}. <>

~ temp totalMallPeople = LIST_COUNT(FoodCourtPeople) + LIST_COUNT(DressStorePeople) + LIST_COUNT(ShoeStorePeople) + LIST_COUNT(BraStorePeople) + LIST_COUNT(BookStorePeople) + LIST_COUNT(MovieTheaterPeople)

{ totalMallPeople > 1:
    You look around for anyone you recognize.
- else:
    You don't see anyone you recognize.
}

{ LIST_COUNT(FoodCourtPeople) > 0:
    <> {capitalise_start(listRoomPeople(FoodCourtPeople))} {LIST_COUNT(FoodCourtPeople) > 1:are|is} sitting in {FOOD_COURT}.
}
{ LIST_COUNT(DressStorePeople) > 0:
    <> {capitalise_start(listRoomPeople(DressStorePeople))} {LIST_COUNT(DressStorePeople) > 1:are|is} walking into {DRESS_STORE}.
}
{ LIST_COUNT(ShoeStorePeople) > 0:
    <> {capitalise_start(listRoomPeople(ShoeStorePeople))} {LIST_COUNT(ShoeStorePeople) > 1:are|is} browsing in {SHOE_STORE}.
}
{ LIST_COUNT(BraStorePeople) > 0:
    <> {capitalise_start(listRoomPeople(BraStorePeople))} {LIST_COUNT(BraStorePeople) > 1:are|is} entering {BRA_STORE}.
}
{ LIST_COUNT(BookStorePeople) > 0:
    <> {capitalise_start(listRoomPeople(BookStorePeople))} {LIST_COUNT(BookStorePeople) > 1:are|is} at {BOOK_STORE}.
}
{ LIST_COUNT(MovieTheaterPeople) > 0:
    <> {capitalise_start(listRoomPeople(MovieTheaterPeople))} {LIST_COUNT(MovieTheaterPeople) > 1:are|is} at {MOVIE_THEATER}.
}

- (mall_opts)
+ [Go to {FOOD_COURT}] -> food_court
+ [Go to {DRESS_STORE}] -> dress_store
+ [Go to {SHOE_STORE}] -> shoe_store
+ [Go to {BRA_STORE}] -> bra_store
+ [Go to {BOOK_STORE}] -> book_store
+ [Go to {MOVIE_THEATER}] -> movie_theater
+ [Go home] -> bedroom
- -> mall_opts

= access_restrictions
{ now == Night:
    The mall is closed.
    + [Go home] -> bedroom
- else:
    ->->
}

/*
- The Food Court
*/
= food_court
CONST FOOD_COURT = "the food court"
VAR FoodCourtPeople = ()
~ here = FoodCourt

You are in {FOOD_COURT}.

{listRoomPeopleSentence(FoodCourtPeople)}

- (food_court_opts)
<- talkAndObserveAllCharacters(FoodCourtPeople, -> food_court_opts)

+ [Leave {FOOD_COURT}] -> pass_time -> mall
- -> food_court_opts

/*
- The Shoe Store
*/
= shoe_store
CONST SHOE_STORE = "Foot Looker"
VAR ShoeStorePeople = ()
~ here = ShoeStore

You are in {SHOE_STORE}.

{listRoomPeopleSentence(ShoeStorePeople)}

- (shoe_store_opts)
<- talkAndObserveAllCharacters(ShoeStorePeople, -> shoe_store_opts)

+ [Leave {SHOE_STORE}] -> pass_time -> mall
- -> shoe_store_opts

/*
- The Bra Store
*/
= bra_store
CONST BRA_STORE = "Vixen’s Secret"
VAR BraStorePeople = ()
~ here = BraStore

You are in {BRA_STORE}.

{listRoomPeopleSentence(BraStorePeople)}

- (bra_store_opts)
<- talkAndObserveAllCharacters(BraStorePeople, -> bra_store_opts)

+ [Leave {BRA_STORE}] -> pass_time -> mall
- -> bra_store_opts

/*
- The Dress Store
*/
= dress_store
CONST DRESS_STORE = "Forever ’99"
VAR DressStorePeople = ()
~ here = DressStore

You are in {DRESS_STORE}.

{listRoomPeopleSentence(DressStorePeople)}

- (dress_store_opts)
<- talkAndObserveAllCharacters(DressStorePeople, -> dress_store_opts)

+ [Leave {DRESS_STORE}] -> pass_time -> mall
- -> dress_store_opts

/*
- The Book Store
*/
= book_store
CONST BOOK_STORE = "Bards & Nobles"
VAR BookStorePeople = ()
~ here = BookStore

You are in {BOOK_STORE}.

{listRoomPeopleSentence(BookStorePeople)}

- (book_store_opts)
<- talkAndObserveAllCharacters(BookStorePeople, -> book_store_opts)

+ [Leave {BOOK_STORE}] -> pass_time -> mall
- -> book_store_opts

/*
- The Movie Theater
*/
= movie_theater
CONST MOVIE_THEATER = "the movie theater"
VAR MovieTheaterPeople = ()
~ here = MovieTheater

You are in {MOVIE_THEATER}.

{listRoomPeopleSentence(MovieTheaterPeople)}

- (movie_theater_opts)
<- talkAndObserveAllCharacters(MovieTheaterPeople, -> movie_theater_opts)

+ [Leave {MOVIE_THEATER}] -> pass_time -> mall
- -> movie_theater_opts
