/*
    Remove and returns the first item in a list.
*/
=== function pop(ref _list)
~ temp el = LIST_MIN(_list)
~ _list -= el
~ return el

/*
    Print a list with commas, "and".
*/
=== function listPrint(list, -> detailFunction)
~ temp item = pop (list)
{ detailFunction(item) }
{ list:
    { LIST_COUNT(list):
        - 1: <> and <>
        - else: <>, <>
    }
    { listPrint(list, detailFunction) }
}

/*
    Similar to listPrint, but returns instead of printing.
*/
=== function listReturn(list, -> detailFunction, string)
~ temp item = pop(list)
~ string += "{ detailFunction(item) }"
{ list:
    { LIST_COUNT(list):
        - 1:
            ~ string += " and "
        - else:
            ~ string += ", "
    }
    ~ return listReturn(list, detailFunction, string)
}
~ return string

/*
    Move item from one list to another.
*/
=== function move(item, ref from, ref to)
~ from -= item
~ to += item

/*
    Determine if we've seen this target with a few turns.
*/
=== function seenVeryRecently(-> target)
   ~ return TURNS_SINCE(target) >= 0 && TURNS_SINCE(target) <= 3

/*
    Return true N percent of the time.
    e.g., chance(75) has a 75% chance of being true.
*/
=== function chance(percent)
    ~ return RANDOM(1, 100) <= percent

/*
	Tests if the flow has reached one divert more recently than another.
	If we have never reached the first divert, we return false. 
	If we have never reached the second divert, we return true. 
*/

=== function seenMoreRecentlyThan(-> link, -> marker)
{ TURNS_SINCE(link) >= 0: 
    { TURNS_SINCE(marker) == -1: 
        ~ return true 
    } 
    ~ return TURNS_SINCE(link) < TURNS_SINCE(marker) 
}
~ return false 

   
