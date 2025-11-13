/*
- Check if we're currently at home.
*/
=== function isHome()
{ here:
- BEDROOM: ~ return true
- BATHROOM: ~ return true
- SIS_BEDROOM: ~ return true
}
~ return false

/*
- Check if we're currently at the mall.
*/
=== function isMall()
{ here:
- MALL: ~ return true
- BRA_STORE: ~ return true
- BOOK_STORE: ~ return true
- SHOE_STORE: ~ return true
- DRESS_STORE: ~ return true
- FOOD_COURT: ~ return true
- MOVIE_THEATER: ~ return true
}
~ return false

/*
- Check if we're currently at school.
*/
=== function isSchool()
{ here == CHURCH or isHome() or isMall():
    ~ return false
}
~ return true
