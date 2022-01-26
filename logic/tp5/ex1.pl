% a)
% example:
%   double(X, Y):- Y is X*2.
%   | ?- map(double, [2,4,8], L).
%   L = [4, 8, 16] ?
%   yes

double(X, Y) :- Y is X*2.
% map(+Pred, +List1, ?List2)
map(_, [], []).
map(Pred, [H|T], [K|R]) :-
    G =.. [Pred, H, K],
    G,
    map(Pred, T, R).

% ----------------------------------------------------
% b)
% example:
%  sum(A, B, S):- S is A+B.
%  | ?- fold(sum, 0, [2, 4, 6], F).
%  F = 12 ?
%  yes

sum(A,B,S) :- S is A + B.
% fold(+Pred, +StartValue, +List, ?FinalValue) :-
fold(_, V, [], V).
fold(Pred, StartV, [H|T], FinalV) :-
    G =.. [Pred, StartV, H, NewStartV],
    G,
    fold(Pred, NewStartV, T, FinalV).

% ----------------------------------------------------
% c)
% example
%   even(X):- 0 =:= X mod 2.
%   | ?- separate([1,2,3,4,5], even, Y, N).
%   Y = [2,4],
%   N = [1,3,5] ?
%   yes

even(X):- 0 =:= X mod 2.

% separate(+List, +Pred, -Yes, -No)
separate([], _, [], []).
separate([H|T], Pred, [H|Y], N) :-
    G =.. [Pred, H],
    G,
    separate(T, Pred, Y, N).

separate([H|T], Pred, Y, [H|N]) :-
    separate(T, Pred, Y, N).

% ----------------------------------------------------
% d)
% example:
%   | ?- ask_execute.
%   Insira o que deseja executar
%   |: map(double, [2,4,8], L).
%   yes
ask_execute :-
    write('Insira o que deseja executar\n'),
    read(T),
    call(T).