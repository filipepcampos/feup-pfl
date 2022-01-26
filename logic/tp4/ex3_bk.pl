initial(st(3-3, esq-0, 0-0)).
final(st(0-0, dir-0, 3-3)).

move(OldState, NewState):- valid_move(OldState, NewState).

play :- 
    initial(Init),
    play(Init, [Init], States),
    reverse(States, Path), 
    write(Path).

play(Curr, Path, Path) :- 
    final(Curr), !.

play(Curr, Path, States) :- 
    move(Curr, Next),
    play(Next, [Next|Path], States).


valid_move(st(ME-CE, esq-B, _MD-_CD), st(N-C, esq-V, _MD-_CD)) :- % Missionario entra no barco (esq)
    V is B + 1,
    V =< 2,
    N is M - 1,
    N >= C.

valid_move(st(M-C, esq-B, _MD-_CD), st(M-D, esq-V, _MD-_CD)) :- % Canibal entra no barco (esq)
    V is B + 1,
    V =< 2,
    D is C - 1,
    M >= C.

valid_move(st(_-_, Lado-B, M-C), st(_-_, Lado-V, N-C)) :- % Missionario sai do barco
    V is B - 1,
    V >= 0,
    N is M+1.

valid_move(st(_-_, Lado-B, M-C), st(_-_, Lado-V, M-D)) :- % Canibal sai do barco
    V is B - 1,
    V >= 0,
    D is C+1,
    D =< M.

valid_move(st(_-_, esq-B, _-_), st(_-_, dir-B, _-_)) :-
    B > 0.

valid_move(st(_-_, dir-B, _-_), st(_-_, esq-B, _-_)) :-
    B > 0.