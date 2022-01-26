% Defina operadores que tornem os termos abaixo sintaticamente válidos.
% a) flight tp1949 from porto to lisbon at 16:15
% b) if X then Y else Z
% Acrescente o código necessário para que os termos da alínea b) sejam não só sintaticamente válidos
% como também utilizáveis. Exemplo:
% | ?- if (3<4) then write(menor) else write(maior).
% menor
% yes

:-op(550, fy, flight).
:-op(540, yfx, from).
:-op(530, yfx, to).
:-op(520, yfx, at).

:-op(550, fy, if).
:-op(540, yfx, then).
:-op(530, yfx, else).

if X then Y else Z :-
    X,
    !,
    Y.

if X then Y else Z :-
    Z.