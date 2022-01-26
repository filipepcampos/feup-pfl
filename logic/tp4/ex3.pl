initial(st(3-3, esq-0-0, 0-0)).
final(st(0-0, dir-0-0, 3-3)).

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


% Um missionario entra no barco (esq)
valid_move(st(ME-CE, esq-MB-CB, MD-CD), st(NME-CE, esq-NMB-CB, MD-CD)) :-
    NMB is MB+1,
    NME is ME-1,
    NME >= CE,
    TotalBoat is NMB+CB,
    TotalBoat =< 2.

% Um missionario entra no barco (dir)
valid_move(st(ME-CE, dir-MB-CB, MD-CD), st(ME-CE, dir-NMB-CB, NMD-CD)) :-
    NMB is MB+1,
    NMD is MD-1,
    NMD >= CD,
    TotalBoat is NMB+CB,
    TotalBoat =< 2.

% Um canibal entra no barco (esq)
valid_move(st(ME-CE, esq-MB-CB, MD-CD), st(ME-NCE, esq-MB-NCB, MD-CD)) :-
    NCB is CB+1,
    NCE is CE-1,
    ME >= NCE,
    TotalBoat is MB+NCB,
    TotalBoat =< 2.

% Um canibal sai no barco (esq)
valid_move(st(ME-CE, esq-MB-CB, MD-CD), st(ME-NCE, esq-MB-NCB, MD-CD)) :-
    NCB is CB+1,
    NCE is CE-1,
    ME >= NCE,
    TotalBoat is MB+NCB,
    TotalBoat =< 2.
