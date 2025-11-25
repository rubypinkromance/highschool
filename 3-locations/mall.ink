/*

    The Mall

*/
=== mall ===
CONST MALL = "mall"
~ here = Mall
-> access_restrictions ->
~ announceTime()

~ temp totalMallPeople = LIST_COUNT(FoodCourtPeople) + LIST_COUNT(DressStorePeople) + LIST_COUNT(ShoeStorePeople) + LIST_COUNT(BraStorePeople) + LIST_COUNT(BookStorePeople) + LIST_COUNT(MovieTheaterPeople)

You are at the {MALL}. You look around for anyone you recognize,
{
- totalMallPeople < 1:
    <> but you don't see anyone.
- today == Saturday:
    <> and you see nearly half the school.
- today == Sunday:
    <> and you see almost everyone you know.
- else:
    <> and spot a few people.
}
TODO dry up these repeated nested function calls
{ LIST_COUNT(FoodCourtPeople) > 0:
    <> {capitaliseStart(listRoomPeople(FoodCourtPeople))} {LIST_COUNT(FoodCourtPeople) > 1:are|is} sitting in {FOOD_COURT}.
}
{ LIST_COUNT(DressStorePeople) > 0:
    <> {capitaliseStart(listRoomPeople(DressStorePeople))} {LIST_COUNT(DressStorePeople) > 1:are|is} walking into {DRESS_STORE}.
}
{ LIST_COUNT(ShoeStorePeople) > 0:
    <> {capitaliseStart(listRoomPeople(ShoeStorePeople))} {LIST_COUNT(ShoeStorePeople) > 1:are|is} shopping in {SHOE_STORE}.
}
{ LIST_COUNT(BraStorePeople) > 0:
    <> {capitaliseStart(listRoomPeople(BraStorePeople))} {LIST_COUNT(BraStorePeople) > 1:are|is} entering {BRA_STORE}.
}
{ LIST_COUNT(BookStorePeople) > 0:
    <> {capitaliseStart(listRoomPeople(BookStorePeople))} {LIST_COUNT(BookStorePeople) > 1:are|is} browsing at {BOOK_STORE}.
}
{ LIST_COUNT(MovieTheaterPeople) > 0:
    <> {capitaliseStart(listRoomPeople(MovieTheaterPeople))} {LIST_COUNT(MovieTheaterPeople) > 1:are|is} buying popcorn at {MOVIE_THEATER}.
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

    The Food Court

*/
= food_court
CONST FOOD_COURT = "the food court"
VAR FoodCourtPeople = ()
~ here = FoodCourt

You are in {FOOD_COURT}. There's a vaguely Italian-looking restaurant selling pizza and pasta, a fried chicken chain promoting a new sandwich, a teriyaki joint, and a pretzel stand.

{lookForRoomPeople(FoodCourtPeople)}

- (food_court_opts)
<- character_opts(FoodCourtPeople, -> food_court_opts)

+ [Leave {FOOD_COURT}] -> pass_time -> mall
- -> food_court_opts

/*

    The Shoe Store

*/
= shoe_store
CONST SHOE_STORE = "Foot Looker"
VAR ShoeStorePeople = ()
~ here = ShoeStore

You are in {SHOE_STORE}. One wall contains displays promoting the latest sneakers, branded with the face of an athlete you don't recognize. On the opposite wall are assorted women's boots, high heels, and sandals.

{lookForRoomPeople(ShoeStorePeople)}

- (shoe_store_opts)
<- character_opts(ShoeStorePeople, -> shoe_store_opts)

+ [Leave {SHOE_STORE}] -> pass_time -> mall
- -> shoe_store_opts

/*

    The Bra Store

*/
= bra_store
CONST BRA_STORE = "Vixen’s Secret"
VAR BraStorePeople = ()
~ here = BraStore

You are in {BRA_STORE}, surrounded by satin and lace and strappy things that put your imagination into overdrive.
{
- confidence == Awkward:
    <> Your palms sweat and you avoid eye contact with any one, horrified at the thought that someone will label you a pervert and throw you out.
- confidence == Normal:
    <> You try to project confidence as you walk in, ignoring the anxiety simmering in your gut. Just look like you belong, and it'll be fine.
- confidence >= Confident:
    <> You move confidently through the store, unconcerned with what anyone thinks of your presence.
}

{lookForRoomPeople(BraStorePeople)}

- (bra_store_opts)
<- character_opts(BraStorePeople, -> bra_store_opts)

+ [Leave {BRA_STORE}] -> pass_time -> mall
- -> bra_store_opts

/*

    The Dress Store

*/
= dress_store
CONST DRESS_STORE = "Forever ’99"
VAR DressStorePeople = ()
~ here = DressStore

You are in {DRESS_STORE}. Groups of girls move between racks, holding dresses up for their friends to approve. A few bored-looking men follow behind their girlfriends, holding shopping bags.

{lookForRoomPeople(DressStorePeople)}

- (dress_store_opts)
<- character_opts(DressStorePeople, -> dress_store_opts)

+ [Leave {DRESS_STORE}] -> pass_time -> mall
- -> dress_store_opts

/*

    The Book Store

*/
= book_store
CONST BOOK_STORE = "Bards & Nobles"
VAR BookStorePeople = ()
~ here = BookStore

You are in {BOOK_STORE}. Large displays promote the newest book in a long-running series of vampire romance novels, next to a bin containing discount copies of last year's popular werewolf romance series.
{ BookStorePeople ? Scientist:
    <> {SCIENTIST} is behind the register, reading a chemistry textbook while she waits for the next customer.
}

{lookForRoomPeople(BookStorePeople)}

- (book_store_opts)
<- character_opts(BookStorePeople, -> book_store_opts)

+ [Leave {BOOK_STORE}] -> pass_time -> mall
- -> book_store_opts

/*

    The Movie Theater

*/
= movie_theater
CONST MOVIE_THEATER = "the movie theater"
VAR MovieTheaterPeople = ()
~ here = MovieTheater

You are in {MOVIE_THEATER}. The previews are playing and everyone is getting into their seats.

{lookForRoomPeople(MovieTheaterPeople)}

- (movie_theater_opts)
<- character_opts(MovieTheaterPeople, -> movie_theater_opts)

+ [Leave {MOVIE_THEATER}] -> pass_time -> mall
- -> movie_theater_opts
