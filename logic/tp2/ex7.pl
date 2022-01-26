% a) Implemente o predicado list_append(?L1, ?L2, ?L3) em que L3 é constituída pela
% concatenação das listas L1 e L2.

list_append([], L2, L2).
list_append([H|T], L2, [H|L3]) :-
    list_append(T, L2, L3).
    
% b) Implemente o predicado list_member(?Elem, ?List) que verifica se Elem é membro de Lista
% usando unicamente o predicado append uma só vez.

list_member(Elem, List) :-
    append(A,[Elem|T],List).

% c) Implemente o predicado list_last(+List, ?Last) que unifica Last com o último elemento de
% List, usando unicamente o predicado append uma só vez.

list_last(List, Last) :-
    append(_, [Last], List).

% d) Implemente o predicado list_nth(?N, ?List, ?Elem), que unifica Elem com o N-ésimo
% elemento de Lista, usando apenas os predicados append e length.

list_nth(N, List, Elem) :-
    length(L, N),
    append(L, [Elem|_], List).

% e) Implemente o predicado list_append(+ListOfLists, ?List) que concatena uma lista de listas.
% f) Implemente o predicado list_del(+List, +Elem, ?Res), que elimina uma ocorrência de Elem
% de List, unificando o resultado com Res, usando apenas o predicado append duas vezes.
% g) Implemente o predicado list_before(?First, ?Second, ?List) que sucede se os dois primeiros
% argumentos forem membros de List, e First ocorrer antes de Second, usando unicamente o
% predicado append duas vezes.
% h) Implemente o predicado list_replace_one(+X, +Y, +List1, ?List2) que substitui uma
% ocorrência de X em List1 por Y, daí resultando List2, usando unicamente o predicado
% append duas vezes.
% i) Implemente o predicado list_repeated(+X, +List) que sucede se X ocorrer repetidamente
% (pelo menos duas vezes) em List, usando unicamente o predicado append duas vezes.
% j) Implemente o predicado list_slice(+List1, +Index, +Size, ?List2), que extrai uma fatia de
% tamanho Size de List1 começando no índice Index, resultando em List2, usando apenas os
% predicados append e length.
% k) Implemente o predicado list_shift_rotate(+List1, +N, ?List2), que rode List1 N elementos
% para a esquerda, resultando em List2, usando apenas os predicados append e length.
% Ex: | ?- list_shift_rotate([a, b, c, d, e, f], 2, L).
% L = [c, d, e, f, a, b]