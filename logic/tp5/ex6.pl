% a)
:-op(500, xfy, exists_in).
A exists_in B :-
    memberchk(A, B).

% b)
:-op(500, fx, append).
:-op(480, xfx, to).
:-op(460, yfx, results).

append A to B results C :-
    append(A,B,C).
