%% Ex a
invert(List1, List2) :-
    invert(List1, [], List2).

invert([H|List1], Acc, Result) :-
    invert(List1, [H|Acc], Result).

invert([],Result,Result).

%% Ex b
del_one(Elem, [Elem|List1], List1).
del_one(Elem, [], []).
del_one(Elem, [H|List1], [H|List2]) :- 
    del_one(Elem, List1, List2).

%% Ex c
del_all(Elem, [], []).

del_all(Elem, [Elem|List1], List2) :-
    del_all(Elem, List1, List2).

del_all(Elem, [H|List1], [H|List2]) :-
    del_all(Elem, List1, List2).

%% Ex d
del_all_list([], List1, List1).
del_all_list(_, [], []).
del_all_list([E|ListElem], List1, List2) :-
    del_all(E, List1, M),
    del_all_list(ListElem, M, List2).