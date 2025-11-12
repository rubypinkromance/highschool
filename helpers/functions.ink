/*
- Remove and returns the first item in a list.
*/
=== function pop(ref _list)
~ temp el = LIST_MIN(_list)
~ _list -= el
~ return el

/*
- Print a list with commas, "and".
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
- Move Item From One List to Another
*/
=== function move(item, ref from, ref to)
~ from -= item
~ to += item
