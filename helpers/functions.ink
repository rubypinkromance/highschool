=== function pop(ref _list) 
    ~ temp el = LIST_MIN(_list) 
    ~ _list -= el
    ~ return el 

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