% a)
% print_n(+S, +N)
print_n(S, N) :-
    N > 0,
    write(S),
    M is N - 1,
    print_n(S, M),
    !.
print_n(_,_).

% b)
print_str([T|Text]) :-
    put_code(T),
    print_str(Text).
print_str(_).

print_text(Text, Symbol, Padding) :-
    write(Symbol),
    print_n(' ', Padding),
    print_str(Text),
    print_n(' ', Padding),
    write(Symbol),
    !.

% c)
print_banner(Text, Symbol, Padding) :-
    length(Text, TextLen),
    Whitespace is TextLen + Padding*2,
    TotalLen is Whitespace + 2,
    print_n(Symbol, TotalLen),
    nl,
    write(Symbol), print_n(' ', Whitespace), write(Symbol),
    nl,
    print_text(Text, Symbol, Padding),
    nl,
    write(Symbol), print_n(' ', Whitespace), write(Symbol),
    nl,
    print_n(Symbol, TotalLen),
    !,
    fail.

% d)
read_list_of_digits(10, L, L).
read_list_of_digits(Code, L, OutputList) :-
    get_code(NewCode),
    Digit is Code - 48,
    read_list_of_digits(NewCode, [Digit|L], OutputList).

list_of_digits_to_integer([], _, X, X).
list_of_digits_to_integer([H|L], CurrentPower, CurrentNumber,  OutputNumber) :-
    K is H * CurrentPower + CurrentNumber,
    NewPower is CurrentPower * 10,
    list_of_digits_to_integer(L, NewPower, K, OutputNumber).

read_number(X) :-
    get_code(Code),
    read_list_of_digits(Code, [], ListOfDigits),
    list_of_digits_to_integer(ListOfDigits, 1, 0, X).