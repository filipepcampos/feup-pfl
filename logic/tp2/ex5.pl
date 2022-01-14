%% Ex a
list_size([],0).
list_size([H | Rest],Size) :- 
    list_size(Rest, K),
    Size is 1 + K.

%% Ex b
list_sum([], 0).
list_sum([H|Rest],Sum) :-
    list_sum(Rest, K),
    Sum is H + K.

%% Ex c
list_prod([], 1).
list_prod([H|Rest],Prod) :-
    list_prod(Rest,K),
    Prod is H * K.

%% Ex d
inner_product([],[],[]).
inner_product([X|List1], [Y|List2], [K|Result]) :-
    K is X * Y,
    inner_product(List1, List2, Result).

%% Ex e
count(H, [], 0).

count(H, [H|List], N) :-
    count(H, List, M),
    N is 1 + M.

count(H, [K|List], N) :-
    count(H, List, N).