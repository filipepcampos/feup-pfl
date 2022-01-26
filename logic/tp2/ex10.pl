% a)
% is_ordered(+List)
is_ordered_aux(_, []).
is_ordered_aux(Last, [H|T]) :-
    H > Last,
    is_ordered_aux(H, T).
is_ordered([]).
is_ordered([H | T]) :-
    is_ordered_aux(H, T).

% b)
% insert_ordered(+Value, +List1, ?List2)


% c) 
% insert_sort(+List, ?OrderedList)